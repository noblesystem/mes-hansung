using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.UserControl
{
    public partial class Leftmenu : System.Web.UI.UserControl
    {
        public string page,subpage;
        public string userid = string.Empty;
        public string usernm = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string p = HttpContext.Current.Request.Url.AbsolutePath;
                string[] pg = p.Split('/');
                page = pg[1];
                //subpage = pg[2].Split('-')[1];

                userid = Request.GetUserCookie("userid");
                usernm = HttpUtility.UrlDecode(Request.GetUserCookie("usernm"));

            }
            catch { }
        }
    }
}