//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace hansung.datamoder
{
    using System;
    using System.Collections.Generic;
    
    public partial class table_detail_erorr
    {
        public int id { get; set; }
        public Nullable<int> Item_id { get; set; }
        public string Defect_type { get; set; }
        public string remark { get; set; }
        public string serinum { get; set; }
        public string Documents_attach { get; set; }
        public Nullable<System.DateTime> datecreate { get; set; }
        public Nullable<System.DateTime> lastupdate { get; set; }
        public Nullable<int> usercreate { get; set; }
        public Nullable<int> userupdate { get; set; }
        public Nullable<double> qltincase { get; set; }
        public Nullable<double> qltbox { get; set; }
        public Nullable<double> qltremove { get; set; }
        public string remarkremove { get; set; }
        public string codebill { get; set; }
    }
}
