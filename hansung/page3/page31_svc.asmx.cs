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

namespace hansung.page3 {
    /// <summary>
    /// page31_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class page31_svc:System.Web.Services.WebService {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //선택된 발주전표 내역
        public string search(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            string saleno = JObject.Parse(param)["saleno"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "saleno", saleno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            string saleno = JObject.Parse(param)["saleno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "saleno", saleno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string detail_search(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            string saleno = JObject.Parse(param)["saleno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "saleno", saleno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_DETAIL_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone_init(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            string csaleno = JObject.Parse(param)["csaleno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "csaleno", csaleno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_SELONE_INIT";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string detail_search_init(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            string csaleno = JObject.Parse(param)["csaleno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "csaleno", csaleno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_DETAIL_SEARCH_INIT";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string del(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            string saleno   = JObject.Parse(param)["saleno"].ToString();
            string inuser   = ss_userid;

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "saleno"  , saleno  , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "inuser"  , inuser  , "20");	
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_DEL";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param, string param2)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
            string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

            //===========================================================================master
            string saleno   = JObject.Parse(param)["saleno"     ].ToString();
            string chasu    = JObject.Parse(param)["chasu"      ].ToString();
            string csaleno  = JObject.Parse(param)["csaleno"    ].ToString();
            string gucd     = JObject.Parse(param)["gucd"       ].ToString();
            string scd      = JObject.Parse(param)["scd"        ].ToString();
            string saledt   = JObject.Parse(param)["saledt"     ].ToString();
            string userid   = JObject.Parse(param)["userid"     ].ToString();
            string custcd   = JObject.Parse(param)["custcd"     ].ToString();
            string termcd   = JObject.Parse(param)["termcd"     ].ToString();
            string janamt   = JObject.Parse(param)["janamt"     ].ToString();
            string whcd     = JObject.Parse(param)["whcd"       ].ToString();
            string ydt      = JObject.Parse(param)["ydt"        ].ToString();
            string dotel    = JObject.Parse(param)["dotel"      ].ToString();
            string framecd  = JObject.Parse(param)["framecd"    ].ToString();
            string doaddr   = JObject.Parse(param)["doaddr"     ].ToString();
            string rmk      = JObject.Parse(param)["rmk"        ].ToString();
            string carnm    = JObject.Parse(param)["carnm"      ].ToString();
            string carno    = JObject.Parse(param)["carno"      ].ToString();
            string carpayamt= JObject.Parse(param)["carpayamt"  ].ToString();
            string checkdt  = JObject.Parse(param)["checkdt"    ].ToString();
            string outdt    = JObject.Parse(param)["outdt"      ].ToString();
            string outtime  = JObject.Parse(param)["outtime"    ].ToString();
            string useyn    = JObject.Parse(param)["useyn"      ].ToString();
            string inuser   = ss_userid;

            //== 전표번호 가져오기 ==================================================
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";

            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element,"zrow","");
            fm.icnitMakeNode(dom,node,"varchar","csaleno",csaleno,"20");
            fm.icnitMakeNode(dom,node,"varchar","saledt" ,saledt ,"10");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE31_GET_SALENO";
            dom.SelectSingleNode("//proc").InnerText = query;
            
            object no = new object();
            if(saleno == "") {
                no = CallDB.getExcuteScalar(dom);
                saleno = (no ?? "").ToString();
            }

            List<XmlDocument> domList = new List<XmlDocument>();
            //=== master data ==============================================================     
            fm = new FormManager();
            dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "saleno"     , saleno    , "20"  );
            fm.icnitMakeNode(dom, node, "numeric", "chasu"      , chasu     , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "csaleno"    , csaleno   , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "gucd"       , gucd      , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "scd"        , scd       , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "saledt"     , saledt    , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "userid"     , userid    , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "custcd"     , custcd    , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "termcd"     , termcd    , "10"  );
            fm.icnitMakeNode(dom, node, "numeric", "janamt"     , janamt    , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "whcd"       , whcd      , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "ydt"        , ydt       , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "dotel"      , dotel     , "100" );
            fm.icnitMakeNode(dom, node, "varchar", "framecd"    , framecd   , "20"  );
            fm.icnitMakeNode(dom, node, "numeric", "doaddr"     , doaddr    , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "rmk"        , rmk       , "2000");
            fm.icnitMakeNode(dom, node, "varchar", "carnm"      , carnm     , "1000");
            fm.icnitMakeNode(dom, node, "varchar", "carno"      , carno     , "200" );
            fm.icnitMakeNode(dom, node, "numeric", "carpayamt"  , carpayamt , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "checkdt"    , checkdt   , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "outdt"      , outdt     , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "outtime"    , outtime   , "20"  );
            fm.icnitMakeNode(dom, node, "varchar", "useyn"      , useyn     , "10"  );
            fm.icnitMakeNode(dom, node, "varchar", "inuser"     , inuser    , "20"  );

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            query = @"PAGE31_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            domList.Add(dom);

            //===========================================================================detail
            fm = new FormManager();
            dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            dynamic dynJson = JsonConvert.DeserializeObject(param2);
            foreach(var item in dynJson) {
                       saleno       = saleno;
                string saleseq      = (item.saleseq   ?? "").ToString();
                string itemcd       = (item.itemcd    ?? "").ToString();
                string qty          = (item.qty       ?? "").ToString();
                string boxqty       = (item.boxqty    ?? "").ToString();
                string curcd        = (item.curcd     ?? "").ToString();
                string unitprice    = (item.unitprice ?? "").ToString();
                string supplyamt    = (item.supplyamt ?? "").ToString();
                string vat          = (item.vat       ?? "").ToString();
                string totamt       = (item.totamt    ?? "").ToString();
                       rmk          = (item.rmk       ?? "").ToString();
                string sno          = (item.sno       ?? "").ToString();
                string prodno       = (item.prodno    ?? "").ToString();
                string caseno       = (item.caseno    ?? "").ToString();
                       inuser       = ss_userid; 

                node = dom.CreateNode(XmlNodeType.Element,"zrow","");
                fm.icnitMakeNode(dom, node, "varchar", "saleno"     , saleno    , "20");
                fm.icnitMakeNode(dom, node, "numeric", "saleseq"    , saleseq   , "20");
                fm.icnitMakeNode(dom, node, "varchar", "itemcd"     , itemcd    , "20");
                fm.icnitMakeNode(dom, node, "numeric", "qty"        , qty       , "20");
                fm.icnitMakeNode(dom, node, "numeric", "boxqty"     , boxqty    , "20");
                fm.icnitMakeNode(dom, node, "varchar", "curcd"      , curcd     , "10");
                fm.icnitMakeNode(dom, node, "numeric", "unitprice"  , unitprice , "20");
                fm.icnitMakeNode(dom, node, "numeric", "supplyamt"  , supplyamt , "20");
                fm.icnitMakeNode(dom, node, "numeric", "vat"        , vat       , "20");
                fm.icnitMakeNode(dom, node, "numeric", "totamt"     , totamt    , "20");
                fm.icnitMakeNode(dom, node, "varchar", "rmk"        , rmk       , "2000");
                fm.icnitMakeNode(dom, node, "varchar", "sno"        , sno       , "50");
                fm.icnitMakeNode(dom, node, "varchar", "prodno"     , prodno    , "200");
                fm.icnitMakeNode(dom, node, "varchar", "caseno"     , caseno    , "200");
                fm.icnitMakeNode(dom, node, "varchar", "inuser"     , inuser    , "20");
                dom.SelectSingleNode("//xmldata").AppendChild(node);
            }
            query = @"PAGE31_DETAIL_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            domList.Add(dom);

            //=== jan 전표 ==============================================================            
            fm = new FormManager();
            dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "saleno" , saleno    , "20"   );	
            fm.icnitMakeNode(dom, node, "varchar", "inuser" , inuser    , "20"   );	
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            query = @"PAGE31_SAVE_JAN";
            dom.SelectSingleNode("//proc").InnerText = query;
            domList.Add(dom);

            result result = CallDB.getXmlTransAll(domList);
            return JsonConvert.SerializeObject(result);
        }
    }
}
