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
    
    public partial class container_location
    {
        public int id { get; set; }
        public Nullable<int> warehouse_location_id { get; set; }
        public string location { get; set; }
        public string description { get; set; }
        public Nullable<System.DateTime> reg_date { get; set; }
        public string reg_user { get; set; }
        public string del_yn { get; set; }
    }
}