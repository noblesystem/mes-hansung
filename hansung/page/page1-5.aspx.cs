using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page
{
    public partial class page1_5 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> notices = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            notices = sql.getdatatableSQL("notice", "");
        }
    }
}