﻿using Cofoundry.Core;
using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class GetFeaturesByIdRangeQueryHandler
        : IAsyncQueryHandler<GetFeaturesByIdRangeQuery, Dictionary<int, Feature>>
        , IIgnorePermissionCheckHandler
    {
        private readonly ICustomEntityRepository _customEntityRepository;

        public GetFeaturesByIdRangeQueryHandler(
            ICustomEntityRepository customEntityRepository
            )
        {
            _customEntityRepository = customEntityRepository;
        }

        public async Task<Dictionary<int, Feature>> ExecuteAsync(GetFeaturesByIdRangeQuery query, IExecutionContext executionContext)
        {
            var customEntityQuery = new GetCustomEntityRenderSummariesByIdRangeQuery(query.FeatureIds);
            var customEntities = await _customEntityRepository.GetCustomEntityRenderSummariesByIdRangeAsync(customEntityQuery); ;

            var features = customEntities
                .Select(d => MapFeature(d.Value))
                .ToDictionary(f => f.FeatureId);

            return features;
        }

        private Feature MapFeature(CustomEntityRenderSummary customEntity)
        {
            var feature = new Feature();

            feature.FeatureId = customEntity.CustomEntityId;
            feature.Title = customEntity.Title;

            return feature;
        }
    }
}
