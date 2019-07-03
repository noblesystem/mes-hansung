using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.popup {
    public partial class pop_item_sale:System.Web.UI.Page {
        public string searchword = string.Empty;
        public string csaleno = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            searchword = Request["searchword"];
            csaleno = Request["csaleno"].Trim();
        }
    }
}