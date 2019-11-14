﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Cofoundry.Core.DependencyInjection;
using Microsoft.EntityFrameworkCore;

namespace Cofoundry.Domain.Data
{
    public class DataDependencyRegistration : IDependencyRegistration
    {
        public void Register(IContainerRegister container)
        {
            container
                .Register<CofoundryDbContext>(new Type[] { typeof(CofoundryDbContext), typeof(DbContext) }, RegistrationOptions.Scoped())
                .Register<IFileStoreService, FileSystemFileStoreService>()
                .Register<IDbUnstructuredDataSerializer, DbUnstructuredDataSerializer>()
                .Register<ICustomEntityStoredProcedures, CustomEntityStoredProcedures>()
                .Register<IPageStoredProcedures, PageStoredProcedures>()
                .Register<IAssetStoredProcedures, AssetStoredProcedures>()
                ;
        }
    }
}
