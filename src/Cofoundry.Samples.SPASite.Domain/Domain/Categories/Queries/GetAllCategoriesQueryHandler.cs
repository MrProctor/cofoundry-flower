using Cofoundry.Core;
using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    /// <summary>
    /// This query uses IIgnorePermissionCheckHandler because the permissions
    /// are already checked by the underlying custom entity query.
    /// </summary>
    public class GetAllCategoriesQueryHandler
        : IAsyncQueryHandler<GetAllCategoriesQuery, IEnumerable<Category>>
        , IIgnorePermissionCheckHandler
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IQueryExecutor _queryExecutor;

        public GetAllCategoriesQueryHandler(
            ICustomEntityRepository customEntityRepository, IQueryExecutor queryExecutor
            )
        {
            _customEntityRepository = customEntityRepository;
            this._queryExecutor = queryExecutor;
        }

        public async Task<IEnumerable<Category>> ExecuteAsync(GetAllCategoriesQuery query, IExecutionContext executionContext)
        {
            var customEntityQuery = new GetCustomEntityRenderSummariesByDefinitionCodeQuery(CategoryCustomEntityDefinition.DefinitionCode);
            var customEntities = await _customEntityRepository.GetCustomEntityRenderSummariesByDefinitionCodeAsync(customEntityQuery); ;

            var categories = new List<Category>();
            foreach (var cat in customEntities)
            {
                categories.Add(await MapCategory(cat));
            }
            return categories;
        }

        /// <summary>
        /// For simplicity this logic is just repeated between handlers, but to 
        /// reduce repetition you could use a library like AutoMapper or break out
        /// the logic into a seperate mapper class and inject it in.
        /// </summary>
        private async Task<Category> MapCategory(CustomEntityRenderSummary customEntity)
        {
            var category = new Category();
            var model = (CategoryDataModel)customEntity.Model;
            category.CategoryId = customEntity.CustomEntityId;
            category.Name = customEntity.Title;
            category.RootCategory = await GetRootCategoryAsync(model.RootCategoryId);

            return category;
        }

        private async Task<RootCategory> GetRootCategoryAsync(int? categoryId)
        {
            if (!categoryId.HasValue) return null;
            var query = new GetRootCategoryByIdQuery(categoryId.Value);

            return await _queryExecutor.ExecuteAsync(query);
        }
    }
}
