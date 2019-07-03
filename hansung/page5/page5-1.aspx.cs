using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page5
{
    public partial class page5_1 : System.Web.UI.Page
    {
        public string stno = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            stno = Request["stno"];
        }
    }
}