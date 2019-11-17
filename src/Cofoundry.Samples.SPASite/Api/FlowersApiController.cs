using System;
using System.Collections.Generic;
using System.Linq;
using Cofoundry.Domain.CQS;
using Cofoundry.Web;
using Cofoundry.Samples.SPASite.Domain;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Cofoundry.Samples.SPASite
{
    [Route("api/flowers")]
    [AutoValidateAntiforgeryToken]
    public class FlowersApiController : Controller
    {
        private readonly IQueryExecutor _queryExecutor;
        private readonly IApiResponseHelper _apiResponseHelper;

        public FlowersApiController(
            IQueryExecutor queryExecutor,
            IApiResponseHelper apiResponseHelper
            )
        {
            _queryExecutor = queryExecutor;
            _apiResponseHelper = apiResponseHelper;
        }

        #region queries

        [HttpGet("")]
        public async Task<IActionResult> Get([FromQuery] SearchFlowerSummariesQuery query)
        {
            if (query == null) query = new SearchFlowerSummariesQuery();
            var results = await _queryExecutor.ExecuteAsync(query);

            return _apiResponseHelper.SimpleQueryResponse(this, results);
        }

        [HttpGet("{flowerId:int}")]
        public async Task<IActionResult> Get(int catId)
        {
            var query = new GetFlowerDetailsByIdQuery(catId);
            var results = await _queryExecutor.ExecuteAsync(query);

            return _apiResponseHelper.SimpleQueryResponse(this, results);
        }

        #endregion

        #region commands

        #endregion
    }
}