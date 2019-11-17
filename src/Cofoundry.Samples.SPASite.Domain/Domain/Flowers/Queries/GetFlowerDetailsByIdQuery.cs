﻿using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    public class GetFlowerDetailsByIdQuery : IQuery<FlowerDetails>
    {
        public GetFlowerDetailsByIdQuery() {}

        public GetFlowerDetailsByIdQuery(int id)
        {
            FlowerId = id;
        }

        public int FlowerId { get; set; }
    }
}
