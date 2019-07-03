using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3 {
    public partial class page3_1_bk:System.Web.UI.Page {
        public string now = DateTime.Now.ToString();
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        string[] cvdate = new string[] { "issuedate"};
        protected void Page_Load(object sender, EventArgs e)
        {
            //employer = sql.getdatatableSQL("employee", "where isdelete is null");
            //customer = sql.getdatatableSQL("customer", "where isdelete is null");
            //warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            //now = cm.converdate("yy.M.dd", now);
            //litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            //mainData = sql.getdatatableSQL("orderslips", "order by id desc");
            //foreach(var i in mainData)
            //{

            //    i["warehouse"] = cm.getdatainlist(warehouse, i["warehouse"].ToString(), "subname");
            //    i["customercontacts"] = cm.getdatainlist(customer, i["customercompany"].ToString(), "phonenumber");
            //    i["salesrepresentative"] = cm.getdatainlist(employer, i["salesrepresentative"].ToString(), "name");
            //    i["customercompany"] = cm.getdatainlist(customer, i["customercompany"].ToString(), "name");
                
            //    foreach (var j in cvdate)
            //    {
            //        i[j] = cm.converdate("yy.MM.dd", i[j].ToString());
            //    }
            //}
        }
    }
}