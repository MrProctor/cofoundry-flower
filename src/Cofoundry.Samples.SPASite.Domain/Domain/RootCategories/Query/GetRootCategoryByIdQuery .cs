using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class GetRootCategoryByIdQuery : IQuery<RootCategory>
    {
        public GetRootCategoryByIdQuery() {}

        public GetRootCategoryByIdQuery(int id)
        {
            RootCategoryId = id;
        }

        public int RootCategoryId { get; set; }
    }
}
