using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3 {
    public partial class page3_2_pop:System.Web.UI.Page {
        public string saleno = string.Empty;

        protected void Page_Load (object sender,EventArgs e) {
            saleno = Request["saleno"];
        }
    }
}
