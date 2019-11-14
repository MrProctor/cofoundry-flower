﻿using System;
using System.Collections.Generic;
using System.Linq;
using Cofoundry.Domain.CQS;
using Cofoundry.Web;
using Cofoundry.Samples.SPASite.Domain;
using System.Threading.Tasks;
using Cofoundry.Domain;
using Microsoft.AspNetCore.Mvc;

namespace Cofoundry.Samples.SPASite
{
    [AuthorizeUserArea(MemberUserArea.MemberUserAreaCode)]
    [Route("api/members/current")]
    public class CurrentMemberApiController : Controller
    {
        private readonly IQueryExecutor _queryExecutor;
        private readonly IApiResponseHelper _apiResponseHelper;
        private readonly IUserContextService _userContextService;

        public CurrentMemberApiController(
            IQueryExecutor queryExecutor,
            IApiResponseHelper apiResponseHelper,
            IUserContextService userContextService
            )
        {
            _queryExecutor = queryExecutor;
            _apiResponseHelper = apiResponseHelper;
            _userContextService = userContextService;
        }

        #region queries

        [HttpGet("cats/liked")]
        public async Task<IActionResult> GetLikedCats()
        {
            // Here we get the userId of the currently logged in member. We could have
            // done this in the query handler, but instead we've chosen to keep the query 
            // flexible so it can be re-used in a more generic fashion
            var userContext = await _userContextService.GetCurrentContextAsync();
            var query = new GetCatSummariesByMemberLikedQuery(userContext.UserId.Value);
            var results = await _queryExecutor.ExecuteAsync(query);

            return _apiResponseHelper.SimpleQueryResponse(this, results);
        }

        #endregion
    }
}