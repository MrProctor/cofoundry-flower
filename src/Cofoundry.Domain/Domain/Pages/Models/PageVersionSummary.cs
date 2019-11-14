﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Domain
{
    /// <summary>
    /// Contains version specific information about a page. This includes
    /// basic audit data intended for use in the admin area.
    /// </summary>
    public class PageVersionSummary : ICreateAudited
    {
        /// <summary>
        /// Database id of this page version.
        /// </summary>
        public int PageVersionId { get; set; }

        /// <summary>
        /// A display-friendly version number that indicates
        /// it's position in the hisotry of all verions of a specific
        /// page. E.g. the first version for a page is version 1 and 
        /// the 2nd is version 2. The display version is unique per
        /// page.
        /// </summary>
        public int DisplayVersion { get; set; }

        public string Title { get; set; }

        /// <summary>
        /// Indicates whether the page should show in the autogenerated site map
        /// that gets presented to search engine robots.
        /// </summary>
        public bool ShowInSiteMap { get; set; }

        /// <summary>
        /// A page can have many published versions, this flag indicates if
        /// it is the latest published version which displays on the live site
        /// when the page itself is published.
        /// </summary>
        public bool IsLatestPublishedVersion { get; set; }

        /// <summary>
        /// The workflow state of this version e.g. draft/published.
        /// </summary>
        public WorkFlowStatus WorkFlowStatus { get; set; }

        public PageTemplateMicroSummary Template { get; set; }
        
        public CreateAuditData AuditData { get; set; }
    }
}
