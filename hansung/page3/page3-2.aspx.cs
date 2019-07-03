using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3
{
    public partial class page3_2 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public List<string> tdright = new List<string>();
        public string[] cl = new string[] { "orderdate", "salesrepresentative", "customercompany", "warehouse", "issuedate", "verifyingacceptance", "deliveryworker", "itemname", "standard", "qltincase", "qltcase", "company", "numberofvehicles", "rate", "remarks" };
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}