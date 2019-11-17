using System;
using System.Collections.Generic;
using System.Linq;
using Cofoundry.Domain.CQS;
using Cofoundry.Web;
using Cofoundry.Samples.SPASite.Domain;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Cofoundry.Samples.SPASite
{
    [Route("api/categories")]
    public class CategoriesApiController : Controller
    {
        private readonly IQueryExecutor _queryExecutor;
        private readonly IApiResponseHelper _apiResponseHelper;

        public CategoriesApiController(
            IQueryExecutor queryExecutor,
            IApiResponseHelper apiResponseHelper
            )
        {
            _queryExecutor = queryExecutor;
            _apiResponseHelper = apiResponseHelper;
        }

        #region queries

        [HttpGet("")]
        public async Task<IActionResult> Get([FromQuery] GetAllCategoriesQuery query)
        {
            if (query == null) query = new GetAllCategoriesQuery();
            var results = await _queryExecutor.ExecuteAsync(query);
            var rootResults = results.ToLookup(x => x.RootCategory.Name, i=>i);
            var sortedResult = new List<RootCategoryWithCategories>();
            foreach (IGrouping<string, Category> groupItem in rootResults)
            {
                var el = new RootCategoryWithCategories()
                {
                    Name = groupItem.Key,
                    Categories = new List<Category>()
                };
                foreach (var listEl in groupItem)
                {
                    el.Categories.Add(listEl);
                }
                sortedResult.Add(el);
            }
            return _apiResponseHelper.SimpleQueryResponse(this, sortedResult);
        }

        [HttpGet("{categoryId:int}")]
        public async Task<IActionResult> Get(int catId)
        {
            var query = new GetCategoryByIdQuery();
            var results = await _queryExecutor.ExecuteAsync(query);

            return _apiResponseHelper.SimpleQueryResponse(this, results);
        }

        #endregion

        #region commands

        #endregion
    }
}