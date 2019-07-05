using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

namespace hansung
{
    /// <summary>
    /// websvc_common의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class websvc_common : System.Web.Services.WebService
    {
        #region 로그인
        //[WebMethod(enableSession:true)]
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //코드콤보
        public string login(string param)
        {
            //gbncd
            string userid = JObject.Parse(param)["userid"].ToString();
            string pwd = JObject.Parse(param)["pwd"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "20");
            fm.icnitMakeNode(dom, node, "varchar", "pwd", pwd, "50");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"SYS_LOGIN";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);

            result result = new result();
            if(dt != null && dt.Rows.Count == 1) {
                //======================================Cookie User
                HttpCookie myCookie = new HttpCookie("user");
                myCookie["userid"] = dt.Rows[0]["userid"].ToString();
                myCookie["usernm"] = HttpUtility.UrlEncode(dt.Rows[0]["usernm"].ToString());
                myCookie.Expires = DateTime.Now.AddYears(1); 
                System.Web.HttpContext.Current.Response.Cookies.Add(myCookie);
                result.code = "OK";
                result.msg = "";
                result.val = "";
            } else {
                result.code = "NO";
                result.msg = "";
                result.val = "";
            }
            return JsonConvert.SerializeObject(result);
        }
        #endregion

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //코드콤보
        public string combocode(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            //gbncd
            string gbncd = JObject.Parse(param)["gbncd"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "gbncd", gbncd, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"COMBO_CODE_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string combowhcd()
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"COMBO_WHCD_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string combogbncd()
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"COMBO_GBNCD_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //사원콤보
        public string search_user(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string usernm = JObject.Parse(param)["searchword"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "usernm", usernm, "500");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"POP_USER_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //거래처콤보
        public string search_cust(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string custnm = JObject.Parse(param)["searchword"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "custnm", custnm, "500");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"POP_CUST_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search_item(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string itemnm = JObject.Parse(param)["searchword"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "itemnm", itemnm, "500");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"POP_ITEM_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search_item_buy(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string itemnm = JObject.Parse(param)["searchword"].ToString();
            string cjpno = JObject.Parse(param)["cjpno"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "itemnm", itemnm, "500");
            fm.icnitMakeNode(dom, node, "varchar", "cjpno", cjpno, "500");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"POP_ITEM_BUY_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search_item_sale(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string itemnm = JObject.Parse(param)["searchword"].ToString();
            string csaleno = JObject.Parse(param)["csaleno"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "itemnm", itemnm, "500");
            fm.icnitMakeNode(dom, node, "varchar", "csaleno", csaleno, "500");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"POP_ITEM_SALE_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
    }
}
