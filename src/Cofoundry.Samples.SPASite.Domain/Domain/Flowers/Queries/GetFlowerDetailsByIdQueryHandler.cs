using Cofoundry.Core;
using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using Cofoundry.Samples.SPASite.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class GetFlowerDetailsByIdQueryHandler
        : IAsyncQueryHandler<GetFlowerDetailsByIdQuery, FlowerDetails>
        , IIgnorePermissionCheckHandler
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IImageAssetRepository _imageAssetRepository;
        private readonly IQueryExecutor _queryExecutor;
        private readonly SPASiteDbContext _dbContext;

        public GetFlowerDetailsByIdQueryHandler(
            ICustomEntityRepository customEntityRepository,
            IImageAssetRepository imageAssetRepository,
            IQueryExecutor queryExecutor,
            SPASiteDbContext dbContext
            )
        {
            _customEntityRepository = customEntityRepository;
            _imageAssetRepository = imageAssetRepository;
            _queryExecutor = queryExecutor;
            _dbContext = dbContext;
        }

        public async Task<FlowerDetails> ExecuteAsync(GetFlowerDetailsByIdQuery query, IExecutionContext executionContext)
        {
            var customEntityQuery = new GetCustomEntityRenderSummaryByIdQuery(query.FlowerId);
            var customEntity = await _customEntityRepository.GetCustomEntityRenderSummaryByIdAsync(customEntityQuery); ;
            if (customEntity == null) return null;

            return await MapFlower(customEntity);
        }

        private async Task<FlowerDetails> MapFlower(CustomEntityRenderSummary customEntity)
        {
            var model = customEntity.Model as FlowerDataModel;
            var cat = new FlowerDetails();

            cat.FlowerId = customEntity.CustomEntityId;
            cat.Name = customEntity.Title;
            cat.Description = model.Description;
            cat.Category = await GetCategoryAsync(model.CategoryId);
            cat.Images = await GetImagesAsync(model.ImageAssetIds);
            return cat;
        }

        private async Task<Category> GetCategoryAsync(int? categoryId)
        {
            if (!categoryId.HasValue) return null;
            var query = new GetCategoryByIdQuery(categoryId.Value);

            return await _queryExecutor.ExecuteAsync(query);
        }

        private async Task<ICollection<ImageAssetRenderDetails>> GetImagesAsync(ICollection<int> imageAssetIds)
        {
            if (EnumerableHelper.IsNullOrEmpty(imageAssetIds)) return Array.Empty<ImageAssetRenderDetails>();

            var images = await _imageAssetRepository.GetImageAssetRenderDetailsByIdRangeAsync(imageAssetIds);

            return images
                .FilterAndOrderByKeys(imageAssetIds)
                .ToList();
        }
    }
}
