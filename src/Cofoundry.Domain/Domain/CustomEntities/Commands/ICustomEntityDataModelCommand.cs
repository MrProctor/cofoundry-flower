﻿using System;

namespace Cofoundry.Domain
{
    /// <summary>
    /// Represents a Custom Entity command that requires the
    /// dynamic data model
    /// </summary>
    public interface ICustomEntityDataModelCommand
    {
        ICustomEntityDataModel Model { get; set; }
        string CustomEntityDefinitionCode { get; set; }
    }
}
