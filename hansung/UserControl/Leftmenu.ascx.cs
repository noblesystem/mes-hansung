using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Services;
using hansung.datamoder;
using System.Xml;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace hansung.UserControl
{
    public partial class Leftmenu : System.Web.UI.UserControl
    {
        public string page,subpage;
        public string userid = string.Empty;
        public string usernm = string.Empty;
        public string menulist = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string p = HttpContext.Current.Request.Url.AbsolutePath;
                string[] pg = p.Split('/');
                page = pg[1];
                if(pg.Length > 2) subpage = pg[2].Split('-')[1];
                else subpage = "";
                userid = Request.GetUserCookie("userid");
                usernm = HttpUtility.UrlDecode(Request.GetUserCookie("usernm"));

                FormManager fm = new FormManager();
                XmlDocument dom = new XmlDocument();
                dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
                dom.SelectSingleNode("//act").InnerText = "proc";
                XmlNode node;
                node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
                fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "100");
                dom.SelectSingleNode("//xmldata").AppendChild(node);

                string query = @"MENU_SEARCH";
                dom.SelectSingleNode("//proc").InnerText = query;
                DataTable dt = CallDB.getExecuteDataTable(dom);
                StringBuilder sb = new StringBuilder();

                for(int i = 0;i < dt.Rows.Count;i++) { 
                    DataRow dr = dt.Rows[i];
                    string menugroup = dr["menugroup"].ToString();
                    string pagenum = dr["pagenum"].ToString();
                    if(menugroup == "2") pagenum = "";

                    if(dr["orderseq"].ToString() != "0") continue;
                    sb.Append("\n<li class='page" + pagenum + "'>");
                    sb.Append("\n<a href='javescript:void(0)'><i class='fa fa-th-large'></i><span class='nav-label'>" + dr["menunm"].ToString() + "</span> <span class='fa arrow'></span></a>");
                    sb.Append("\n<ul class='nav nav-second-level collapse'>");

                    for(int k = 0;k < dt.Rows.Count;k++) {
                        DataRow dr2 = dt.Rows[k];
                        if(menugroup == dr2["menugroup"].ToString() && dr2["orderseq"].ToString() != "0") {
                            sb.Append("\n<li><a href='" + dr2["menuurl"].ToString() + "' aria-expanded='false'><span class='educate-icon educate-event icon-wrap sub-icon-mg' aria-hidden='true'></span> <span class='mini-click-non'>" + dr2["menunm"].ToString() + "</span></a></li>");
                        }
                    }

                    if (dr["orderseq"].ToString() == "0") {
                        sb.Append("\n</ul>");
                        sb.Append("\n\n</li>");
                    }
                } //for
                menulist = sb.ToString();
            }
            catch { }
        }
    }
}