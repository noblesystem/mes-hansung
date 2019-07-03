using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page4
{
    public partial class page4_2 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            mainData = cm.objplans("", employer);
        }
    }
}