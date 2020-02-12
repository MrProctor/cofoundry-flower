using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class SearchFlowerSummariesQuery
        : SimplePageableQuery
        , IQuery<PagedQueryResult<FlowerSummary>>
    {
        public SearchFlowerSummariesQuery() { }

        public SearchFlowerSummariesQuery(int id)
        {
            CategoryId = id;
        }

        public int CategoryId { get; set; }
    }
}
