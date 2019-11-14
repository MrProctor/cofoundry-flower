﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cofoundry.Core.DependencyInjection;

namespace Cofoundry.Domain.CQS
{
    public class CQSDependencyRegistration : IDependencyRegistration
    {
        public void Register(IContainerRegister container)
        {
            container
                .Register<ICommandExecutor, CommandExecutor>()
                .RegisterAllGenericImplementations(typeof(IAsyncCommandHandler<>))
                .Register<ICommandHandlerFactory, CommandHandlerFactory>()
                .Register<IQueryExecutor, QueryExecutor>()
                .RegisterAllGenericImplementations(typeof(IAsyncQueryHandler<,>))
                .Register<IQueryHandlerFactory, QueryHandlerFactory>()
                .Register<ICommandLogService, DebugCommandLogService>()
                .Register<IExecutionContextFactory, ExecutionContextFactory>()
                ; 
        }
    }
}
