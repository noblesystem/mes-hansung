using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.UserControl
{
    public partial class Datacommon : System.Web.UI.UserControl
    {
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> items = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> warehouse = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            items = sql.getdatatableSQL("ItemList", "where isdelete is null");
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
        }
    }
}