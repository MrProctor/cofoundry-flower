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
    public class FlowerDataModel : ICustomEntityDataModel
    {
        [Display(Description = "About flower")]
        public string Description { get; set; }

        [Display(Name = "Category", Description = "Choose a category of flower")]
        [CustomEntity(CategoryCustomEntityDefinition.DefinitionCode)]
        public int? CategoryId { get; set; }

        [Display(Description = "Amount flowers")]
        public string Count { get; set; }

        [Display(Name = "Images", Description = "The top image will be the main image that displays in the grid")]
        [ImageCollection]
        public ICollection<int> ImageAssetIds { get; set; }
    }
}
