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
    
    public partial class inspection
    {
        public long id { get; set; }
        public string inspnumber { get; set; }
        public string codebill { get; set; }
        public Nullable<int> warehouse { get; set; }
        public Nullable<int> workerone { get; set; }
        public Nullable<int> workertwo { get; set; }
        public string remarks { get; set; }
        public Nullable<System.DateTime> datecreate { get; set; }
        public Nullable<System.DateTime> lastupdate { get; set; }
        public Nullable<int> usercreate { get; set; }
        public Nullable<int> userupdate { get; set; }
        public string warehousename { get; set; }
        public string employeeone { get; set; }
        public string employeetwo { get; set; }
    }
}