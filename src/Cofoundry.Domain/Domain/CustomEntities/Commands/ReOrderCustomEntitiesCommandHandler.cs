﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cofoundry.Domain.CQS;
using Cofoundry.Domain.Data;
using Cofoundry.Core.MessageAggregator;
using Cofoundry.Core;
using System.ComponentModel.DataAnnotations;
using Cofoundry.Core.Data;

namespace Cofoundry.Domain
{
    public class ReOrderCustomEntitiesCommandHandler 
        : IAsyncCommandHandler<ReOrderCustomEntitiesCommand>
        , IPermissionRestrictedCommandHandler<ReOrderCustomEntitiesCommand>
    {
        #region constructor

        private readonly CofoundryDbContext _dbContext;
        private readonly ICustomEntityStoredProcedures _customEntityStoredProcedures;
        private readonly ICustomEntityCache _customEntityCache;
        private readonly IMessageAggregator _messageAggregator;
        private readonly ICustomEntityDefinitionRepository _customEntityDefinitionRepository;
        private readonly ITransactionScopeManager _transactionScopeFactory;

        public ReOrderCustomEntitiesCommandHandler(
            CofoundryDbContext dbContext,
            ICustomEntityStoredProcedures customEntityStoredProcedures,
            ICustomEntityCache customEntityCache,
            IMessageAggregator messageAggregator,
            ICustomEntityDefinitionRepository customEntityDefinitionRepository,
            ITransactionScopeManager transactionScopeFactory
            )
        {
            _dbContext = dbContext;
            _customEntityStoredProcedures = customEntityStoredProcedures;
            _customEntityCache = customEntityCache;
            _messageAggregator = messageAggregator;
            _customEntityDefinitionRepository = customEntityDefinitionRepository;
            _transactionScopeFactory = transactionScopeFactory;
        }

        #endregion

        #region execution

        public async Task ExecuteAsync(ReOrderCustomEntitiesCommand command, IExecutionContext executionContext)
        {
            var definition = _customEntityDefinitionRepository.GetByCode(command.CustomEntityDefinitionCode) as IOrderableCustomEntityDefinition;

            if (definition == null || definition.Ordering == CustomEntityOrdering.None)
            {
                throw new InvalidOperationException("Cannot re-order a custom entity type with a definition that does not implement IOrderableCustomEntityDefinition (" + definition.GetType().Name + ")");
            }

            if (!definition.HasLocale && command.LocaleId.HasValue)
            {
                throw new ValidationException("Cannot order by locale because this custom entity type is not permitted to have a locale (" + definition.GetType().FullName + ")");
            }

            var affectedIds = await _customEntityStoredProcedures.ReOrderAsync(
                command.CustomEntityDefinitionCode,
                command.OrderedCustomEntityIds,
                command.LocaleId
                );

            await _transactionScopeFactory.QueueCompletionTaskAsync(_dbContext, () => OnTransactionComplete(command, affectedIds));
        }

        private Task OnTransactionComplete(ReOrderCustomEntitiesCommand command, ICollection<int> affectedIds)
        {
            foreach (var affectedId in affectedIds)
            {
                _customEntityCache.Clear(command.CustomEntityDefinitionCode, affectedId);
            }

            var messages = affectedIds.Select(i => new CustomEntityOrderingUpdatedMessage()
            {
                CustomEntityDefinitionCode = command.CustomEntityDefinitionCode,
                CustomEntityId = i
            }).ToList();

            return _messageAggregator.PublishBatchAsync(messages);
        }

        #endregion

        #region permissions

        public IEnumerable<IPermissionApplication> GetPermissions(ReOrderCustomEntitiesCommand command)
        {
            var definition = _customEntityDefinitionRepository.GetByCode(command.CustomEntityDefinitionCode);
            yield return new CustomEntityUpdatePermission(definition);
        }

        #endregion
    }
}
