using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page7
{
    public partial class page7_3 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string bill = "select * from inspection";
            mainData = sql.getdatatablejoinSQL(bill);
        }
    }
}