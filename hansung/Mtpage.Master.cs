using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Text;
using System.Data.Entity;


namespace hansung
{
    public partial class Mtpage : System.Web.UI.MasterPage
    {
        public string ActiveMenuCode { get; set; }
                public string curtime = DateTime.Now.ToString("yyMMdd-hmmsszzz");
        protected void Page_Load(object sender, EventArgs e)
        {
        //        if (Session[GlobalSettings.UserSession] == null)
        //{
        //    Response.Redirect("/Login");
        //}
            string userid = Request.GetUserCookie("userid");

            //string userid = System.Web.HttpContext.Current.Request.Cookies["ss_user"].Value.ToString();
            if(userid == null || userid == "") {
               Response.Redirect("/Login.aspx");
            }
        }
    }
}