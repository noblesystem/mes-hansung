using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_1 : System.Web.UI.Page
    {
        public string jpno = string.Empty;
        public string curtime = DateTime.Now.ToString("yyMMdd-hmmsszzz");
        protected void Page_Load(object sender, EventArgs e)
        {
            jpno = Request["jpno"];
        }
    }
}