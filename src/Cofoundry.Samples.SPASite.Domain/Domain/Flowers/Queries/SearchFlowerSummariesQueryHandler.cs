using Cofoundry.Core;
using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using Cofoundry.Samples.SPASite.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class SearchFlowerSummariesQueryHandler
        : IAsyncQueryHandler<SearchFlowerSummariesQuery, PagedQueryResult<FlowerSummary>>
        , IIgnorePermissionCheckHandler
    {
        private readonly SPASiteDbContext _dbContext;
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IImageAssetRepository _imageAssetRepository;
        private readonly IQueryExecutor _queryExecutor;

        public SearchFlowerSummariesQueryHandler(
            ICustomEntityRepository customEntityRepository,
            IImageAssetRepository imageAssetRepository,
            IQueryExecutor queryExecutor,
            SPASiteDbContext dbContext
            )
        {
            _customEntityRepository = customEntityRepository;
            _imageAssetRepository = imageAssetRepository;
            _dbContext = dbContext;
            _queryExecutor = queryExecutor;
        }

        public async Task<PagedQueryResult<FlowerSummary>> ExecuteAsync(SearchFlowerSummariesQuery query, IExecutionContext executionContext)
        {
            var customEntityQuery = new SearchCustomEntityRenderSummariesQuery();
            customEntityQuery.CustomEntityDefinitionCode = FlowerCustomEntityDefinition.DefinitionCode;
            customEntityQuery.PageSize = query.PageSize;
            customEntityQuery.PageNumber = query.PageNumber;
            customEntityQuery.PublishStatus = PublishStatusQuery.Published;
            customEntityQuery.SortBy = CustomEntityQuerySortType.PublishDate;
            var FlowerCustomEntities = await _customEntityRepository.SearchCustomEntityRenderSummariesAsync(customEntityQuery);
            var allMainImages = await GetMainImages(FlowerCustomEntities);

            return await MapFlowers(FlowerCustomEntities, allMainImages, query.CategoryId);
        }

        private Task<IDictionary<int, ImageAssetRenderDetails>> GetMainImages(PagedQueryResult<CustomEntityRenderSummary> customEntityResult)
        {
            var imageAssetIds = customEntityResult
                .Items
                .Select(i => (FlowerDataModel)i.Model)
                .Where(m => !EnumerableHelper.IsNullOrEmpty(m.ImageAssetIds))
                .Select(m => m.ImageAssetIds.First())
                .Distinct();

            return _imageAssetRepository.GetImageAssetRenderDetailsByIdRangeAsync(imageAssetIds);
        }

        private async Task<PagedQueryResult<FlowerSummary>> MapFlowers(
            PagedQueryResult<CustomEntityRenderSummary> customEntityResult,
            IDictionary<int, ImageAssetRenderDetails> images, int categoryFilter
            )
        {
            var Flowers = new List<FlowerSummary>(customEntityResult.Items.Count());

            foreach (var customEntity in customEntityResult.Items)
            {
                var model = (FlowerDataModel)customEntity.Model;

                var Flower = new FlowerSummary();
                Flower.FlowerId = customEntity.CustomEntityId;
                Flower.Name = customEntity.Title;
                Flower.Description = model.Description;
                Flower.Category = await GetCategoryAsync(model.CategoryId);
                Flower.Price = model.Price;
                Flower.Count = model.Count;
                if (!EnumerableHelper.IsNullOrEmpty(model.ImageAssetIds))
                {
                    Flower.MainImage = images.GetOrDefault(model.ImageAssetIds.FirstOrDefault());
                }

                if (categoryFilter == 0)
                {
                    Flowers.Add(Flower);

                }
                else if (Flower.Category.CategoryId == categoryFilter)
                {
                    Flowers.Add(Flower);
                }
            }

            return customEntityResult.ChangeType(Flowers);
        }

        private async Task<Category> GetCategoryAsync(int? categoryId)
        {
            if (!categoryId.HasValue) return null;
            var query = new GetCategoryByIdQuery(categoryId.Value);

            return await _queryExecutor.ExecuteAsync(query);
        }
    }
}
