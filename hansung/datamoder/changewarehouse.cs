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
    
    public partial class changewarehouse
    {
        public long id { get; set; }
        public string codedate { get; set; }
        public Nullable<int> worker { get; set; }
        public Nullable<int> sendwarehouse { get; set; }
        public Nullable<int> rcvwarehouse { get; set; }
        public Nullable<int> company { get; set; }
        public string carnum { get; set; }
        public Nullable<double> transportfee { get; set; }
        public Nullable<System.DateTime> verificatio { get; set; }
        public Nullable<System.DateTime> datecheck { get; set; }
        public Nullable<System.DateTime> datecreate { get; set; }
        public Nullable<System.DateTime> lastupdate { get; set; }
        public Nullable<int> usercreate { get; set; }
        public Nullable<int> userupdate { get; set; }
        public string remark { get; set; }
        public string codeid { get; set; }
        public Nullable<System.DateTime> ordate { get; set; }
    }
}