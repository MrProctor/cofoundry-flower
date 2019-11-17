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
    public class GetCategoryByIdQueryHandler
        : IAsyncQueryHandler<GetCategoryByIdQuery, Category>
        , IIgnorePermissionCheckHandler
    {
        private readonly ICustomEntityRepository _customEntityRepository;

        public GetCategoryByIdQueryHandler(
            ICustomEntityRepository customEntityRepository
            )
        {
            _customEntityRepository = customEntityRepository;
        }

        public async Task<Category> ExecuteAsync(GetCategoryByIdQuery query, IExecutionContext executionContext)
        {
            var customEntityQuery = new GetCustomEntityRenderSummaryByIdQuery() { CustomEntityId = query.CategoryId };
            var customEntity = await _customEntityRepository.GetCustomEntityRenderSummaryByIdAsync(customEntityQuery); ;
            if (customEntity == null) return null;

            return MapCategory(customEntity);
        }

        /// <summary>
        /// For simplicity this logic is just repeated between handlers, but to 
        /// reduce repetition you could use a library like AutoMapper or break out
        /// the logic into a seperate mapper class and inject it in.
        /// </summary>
        private Category MapCategory(CustomEntityRenderSummary customEntity)
        {
            var category = new Category();

            category.CategoryId = customEntity.CustomEntityId;
            category.Name = customEntity.Title;

            return category;
        }
    }
}
