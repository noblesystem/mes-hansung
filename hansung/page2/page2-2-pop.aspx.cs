using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2 {
    public partial class page2_2_pop:System.Web.UI.Page {
        public string jpno = string.Empty;

        protected void Page_Load (object sender,EventArgs e) {
            jpno = Request["jpno"];
        }
    }
}