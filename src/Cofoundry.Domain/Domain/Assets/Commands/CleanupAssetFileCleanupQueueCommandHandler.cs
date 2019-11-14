﻿using Cofoundry.Domain.CQS;
using Cofoundry.Domain.Data;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Domain
{
    /// <summary>
    /// Removes old completed entries from the AssetFileCleanupQueueItem
    /// table.
    /// </summary>
    public class CleanupAssetFileCleanupQueueCommandHandler 
        : IAsyncCommandHandler<CleanupAssetFileCleanupQueueCommand>
        , ICofoundryUserPermissionCheckHandler
    {
        private readonly IAssetStoredProcedures _assetStoredProcedures;

        public CleanupAssetFileCleanupQueueCommandHandler(
            IAssetStoredProcedures assetStoredProcedures
            )
        {
            _assetStoredProcedures = assetStoredProcedures;
        }

        public Task ExecuteAsync(CleanupAssetFileCleanupQueueCommand command, IExecutionContext executionContext)
        {
            return _assetStoredProcedures.CleanupAssetFileCleanupQueueItemAsync(command.CompletedItemRetentionTime.TotalSeconds, command.DeadLetterRetentionTime.TotalSeconds);
        }
    }
}
