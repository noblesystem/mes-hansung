using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_2 : System.Web.UI.Page
    {
        datafrom2_1 data = new datafrom2_1();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //mainData = data.s_obj_2_2("");


        }
    }
}