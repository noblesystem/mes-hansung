using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//added by William 2019.06.06
namespace hansung
{           
    public class LeftMenuDto
    {
        //Group
        public int MenuGrpId { get; set; }
        public string GrpDescr { get; set; }
        public string GrpHref { get; set; }
        public string Class { get; set; }
        public int GrpIndex { get; set; }

        //Menu
        public int MenuId { get; set; }
        public string MenuHref { get; set; }
        public string MenuDescr { get; set; }
        public int MenuIndexInGrp { get; set; }

        //Menu Permission
        public bool IsAllowRetrieve { get; set; }
        public bool IsAllowCreate { get; set; }
        public bool IsAllowUpdate { get; set; }
        public bool IsAllowDelete { get; set; }

        public bool IsAllowUpload { get; set; }
        public bool IsAllowPrint { get; set; }
        public bool IsAllowExport { get; set; }
        
    }
}