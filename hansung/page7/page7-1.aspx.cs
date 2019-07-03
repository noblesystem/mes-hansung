using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page7
{
    public partial class page7_1 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public string[] cvdate = new string[] { };
        
        protected void Page_Load(object sender, EventArgs e)
        {
     
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            Warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");

            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            string bill = "select * from inspection";
            mainData = sql.getdatatablejoinSQL(bill);
            foreach(var i in mainData)
            {
                i["warehouse"] = cm.getdatainlist(Warehouse, i["warehouse"].ToString(), "subname");
                i["workerone"] = cm.getdatainlist(employer, i["workerone"].ToString(), "name");
                i["workertwo"] = cm.getdatainlist(employer, i["workertwo"].ToString(), "name");
            }
        }
    }
}