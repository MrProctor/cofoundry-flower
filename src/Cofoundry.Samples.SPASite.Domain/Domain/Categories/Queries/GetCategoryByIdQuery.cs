using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class GetCategoryByIdQuery : IQuery<Category>
    {
        public GetCategoryByIdQuery() {}

        public GetCategoryByIdQuery(int id)
        {
            CategoryId = id;
        }

        public int CategoryId { get; set; }
    }
}
