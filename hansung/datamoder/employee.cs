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
    
    public partial class employee
    {
        public int id { get; set; }
        public string employeecode { get; set; }
        public string name { get; set; }
        public string permission { get; set; }
        public string email { get; set; }
        public string phonenumber { get; set; }
        public Nullable<int> position { get; set; }
        public Nullable<int> department { get; set; }
        public string address { get; set; }
        public string attachments { get; set; }
        public Nullable<System.DateTime> datecreate { get; set; }
        public Nullable<System.DateTime> lastupdate { get; set; }
        public Nullable<int> usercreate { get; set; }
        public Nullable<int> userupdate { get; set; }
        public Nullable<bool> isdelete { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
    }
}