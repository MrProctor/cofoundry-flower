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
    public class GetRootCategoryByIdQueryHandler
        : IAsyncQueryHandler<GetRootCategoryByIdQuery, RootCategory>
        , IIgnorePermissionCheckHandler
    {
        private readonly ICustomEntityRepository _customEntityRepository;

        public GetRootCategoryByIdQueryHandler(
            ICustomEntityRepository customEntityRepository
            )
        {
            _customEntityRepository = customEntityRepository;
        }

        public async Task<RootCategory> ExecuteAsync(GetRootCategoryByIdQuery query, IExecutionContext executionContext)
        {
            var customEntityQuery = new GetCustomEntityRenderSummaryByIdQuery() { CustomEntityId = query.RootCategoryId };
            var customEntity = await _customEntityRepository.GetCustomEntityRenderSummaryByIdAsync(customEntityQuery); ;
            if (customEntity == null) return null;

            return MapRootCategory(customEntity);
        }

        /// <summary>
        /// For simplicity this logic is just repeated between handlers, but to 
        /// reduce repetition you could use a library like AutoMapper or break out
        /// the logic into a seperate mapper class and inject it in.
        /// </summary>
        private RootCategory MapRootCategory(CustomEntityRenderSummary customEntity)
        {
            var category = new RootCategory();

            category.RootCategoryId = customEntity.CustomEntityId;
            category.Name = customEntity.Title;

            return category;
        }
    }
}
