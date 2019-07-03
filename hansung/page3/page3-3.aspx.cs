using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3
{
    public partial class page3_3 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public string[] cl = new string[] { "orderdate", "salesrepresentative", "customercompany", "warehouse", "itemname", "standard", "qltincase", "qltcase", "company", "numberofvehicles", "rate","remarks" };
       protected void Page_Load(object sender, EventArgs e)
        {
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            string strcar = cm.stringCarship();
            string stringordedt = cm.stringordedt();
            mainData = cm.objOrder("where carship.codebill is not null", employer, customer, litem);
            
        }
    }
}