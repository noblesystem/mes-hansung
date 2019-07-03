using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung {
    public partial class logout:System.Web.UI.Page {
        protected void Page_Load(object sender,EventArgs e) {
            //== 쿠키 삭제 ==
            HttpCookie myCookie = new HttpCookie("user");
            myCookie.Expires = DateTime.Now.AddHours(-900d);
            Response.Cookies.Add(myCookie);

            //HttpCookie myCookie2 = new HttpCookie("openMenu");
            //myCookie2.Expires = DateTime.Now.AddHours(-900d);
            //Response.Cookies.Add(myCookie2);

            //== 세션 삭제 ==
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            Response.Redirect("/login.aspx");
        }
    }
}