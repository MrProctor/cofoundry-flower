using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cofoundry.Domain;
using System.ComponentModel.DataAnnotations;

namespace Cofoundry.Samples.SPASite.Domain
{
    /// <summary>
    /// Data model classes can use data annotations to describe the data
    /// and provide hints to the admin UI as to how the property should be 
    /// displayed.
    /// 
    /// In this data model we link out to images and other custom entities.
    /// Although the data model serialized as json in the database, the
    /// relationships are stored separately which allows us to provide a certain
    /// amount of data integrity.
    /// </summary>
    public class CategoryDataModel : ICustomEntityDataModel
    {
        [Display(Description = "A root flower category")]
        public string Description { get; set; }

        [Display(Name = "Root Category", Description = "Choose root category of flower")]
        [CustomEntity(RootCategoryCustomEntityDefinition.DefinitionCode)]
        public int? RootCategoryId { get; set; }
    }
}
