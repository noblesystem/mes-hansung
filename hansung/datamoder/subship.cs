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
    
    public partial class subship
    {
        public long id { get; set; }
        public Nullable<long> idbill { get; set; }
        public string codebill { get; set; }
        public string numbership { get; set; }
        public Nullable<System.DateTime> duedate { get; set; }
        public Nullable<System.DateTime> departuredate { get; set; }
        public Nullable<System.DateTime> dateofarrival { get; set; }
        public Nullable<System.DateTime> conDuedate { get; set; }
        public string shipname { get; set; }
        public string remark { get; set; }
        public Nullable<System.DateTime> datecreate { get; set; }
        public Nullable<System.DateTime> lastupdate { get; set; }
        public Nullable<int> usercreate { get; set; }
        public Nullable<int> userupdate { get; set; }
    }
}
