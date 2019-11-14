﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cofoundry.Domain.CQS;
using Cofoundry.Core.DependencyInjection;

namespace Cofoundry.Domain.Bootstrap
{
    public class SharedDependencyRegistration : IDependencyRegistration
    {
        public void Register(IContainerRegister container)
        {
            var replacementRegistraionOptions = new RegistrationOptions() { ReplaceExisting = true };

            container
                .Register<EntityAuditHelper, EntityAuditHelper>()
                .Register<EntityTagHelper, EntityTagHelper>()
                .Register<EntityOrderableHelper, EntityOrderableHelper>()
                .Register<IContentRouteLibrary, ContentRouteLibrary>()
                .Register<IViewFileReader, ViewFileReader>()
                .Register<IAuditDataMapper, AuditDataMapper>()
                ;
        }
    }
}
