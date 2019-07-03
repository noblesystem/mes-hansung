using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.popup {
    public partial class pop_item_buy:System.Web.UI.Page {
        public string searchword = string.Empty;
        public string cjpno = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            searchword = Request["searchword"];
            cjpno = Request["cjpno"].Trim();
        }
    }
}