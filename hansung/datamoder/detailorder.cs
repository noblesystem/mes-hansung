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
    
    public partial class detailorder
    {
        public long id { get; set; }
        public string codebill { get; set; }
        public Nullable<int> itemid { get; set; }
        public string itemcode { get; set; }
        public string itemname { get; set; }
        public string standard { get; set; }
        public Nullable<double> qltincase { get; set; }
        public Nullable<double> qltcase { get; set; }
        public Nullable<double> price { get; set; }
        public Nullable<double> pricesupply { get; set; }
        public Nullable<double> vat { get; set; }
        public Nullable<double> totalamount { get; set; }
        public string itemremarks { get; set; }
        public string serialNo { get; set; }
        public string caseNo { get; set; }
        public string PRODNo { get; set; }
        public Nullable<System.DateTime> datecreate { get; set; }
        public Nullable<System.DateTime> lastupdate { get; set; }
        public Nullable<int> usercreate { get; set; }
        public Nullable<int> userupdate { get; set; }
        public string codeid { get; set; }
        public string history { get; set; }
    }
}