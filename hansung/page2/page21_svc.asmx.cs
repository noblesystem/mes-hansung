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

namespace hansung.page2
{
    /// <summary>
    /// page21_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class page21_svc : System.Web.Services.WebService
    {
        #region ==master page==
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //선택된 발주전표 내역
        public string search(string param)
        {
            string jpno = JObject.Parse(param)["jpno"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //선택된 발주전표 내역
        public string search3(string param)
        {
            string jpno = JObject.Parse(param)["jpno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_SEARCH3";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        #endregion

        #region == popup balju ==
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string balju_selone(string param)
        {
            string jpno = JObject.Parse(param)["jpno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_BALJU_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string balju_detail_search(string param)
        {
            string jpno = JObject.Parse(param)["jpno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_BALJU_DETAIL_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
       [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string balju_del(string param)
        {
            string jpno     = JObject.Parse(param)["jpno"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno"    , jpno    , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "inuser"  , inuser  , "20");	
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_BALJU_DEL";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string balju_save(string param, string param2)
        {
            //===========================================================================master
            string jpno     = JObject.Parse(param)["jpno"    ].ToString();
            string chasu    = JObject.Parse(param)["chasu"   ].ToString();
            string cjpno    = JObject.Parse(param)["cjpno"   ].ToString();
            string gucd     = JObject.Parse(param)["gucd"    ].ToString();
            string jpdt     = JObject.Parse(param)["jpdt"    ].ToString();
            string termcd   = JObject.Parse(param)["termcd"  ].ToString();
            string pidt     = JObject.Parse(param)["pidt"    ].ToString();
            string userid   = JObject.Parse(param)["userid"  ].ToString();
            string custcd   = JObject.Parse(param)["custcd"  ].ToString();
            string whcd     = JObject.Parse(param)["whcd"    ].ToString();
            string janamt   = JObject.Parse(param)["janamt"  ].ToString();
            string pino     = JObject.Parse(param)["pino"    ].ToString();
            string bcheckdt = JObject.Parse(param)["bcheckdt"].ToString();
            string paycd    = JObject.Parse(param)["paycd"   ].ToString();
            string paydt    = JObject.Parse(param)["paydt"   ].ToString();
            string lcno     = JObject.Parse(param)["lcno"    ].ToString();
            string amt      = JObject.Parse(param)["amt"     ].ToString();
            string tolper   = JObject.Parse(param)["tolper"  ].ToString();
            string tolamt   = JObject.Parse(param)["tolamt"  ].ToString();
            string usance   = JObject.Parse(param)["usance"  ].ToString();
            string mandt    = JObject.Parse(param)["mandt"   ].ToString();
            string blno     = JObject.Parse(param)["blno"    ].ToString();
            string shipdt   = JObject.Parse(param)["shipdt"  ].ToString();
            string chuldt   = JObject.Parse(param)["chuldt"  ].ToString();
            string ipdt     = JObject.Parse(param)["ipdt"    ].ToString();
            string conbandt = JObject.Parse(param)["conbandt"].ToString();
            string shipnm   = JObject.Parse(param)["shipnm"  ].ToString();
            string rmk      = JObject.Parse(param)["rmk"     ].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno"    , jpno    , "20");	
            fm.icnitMakeNode(dom, node, "numeric", "chasu"   , chasu   , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "cjpno"   , cjpno   , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "gucd"    , gucd    , "1" );	
            fm.icnitMakeNode(dom, node, "varchar", "jpdt"    , jpdt    , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "termcd"  , termcd  , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "pidt"    , pidt    , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "userid"  , userid  , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "custcd"  , custcd  , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "whcd"    , whcd    , "20");	
            fm.icnitMakeNode(dom, node, "numeric", "janamt"  , janamt  , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "pino"    , pino    , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "bcheckdt", bcheckdt, "10");	
            fm.icnitMakeNode(dom, node, "varchar", "paycd"   , paycd   , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "paydt"   , paydt   , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "lcno"    , lcno    , "50");	
            fm.icnitMakeNode(dom, node, "numeric", "amt"     , amt     , "20");	
            fm.icnitMakeNode(dom, node, "numeric", "tolper"  , tolper  , "20");	
            fm.icnitMakeNode(dom, node, "numeric", "tolamt"  , tolamt  , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "usance"  , usance  , "200");	
            fm.icnitMakeNode(dom, node, "varchar", "mandt"   , mandt   , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "blno"    , blno    , "50");	
            fm.icnitMakeNode(dom, node, "varchar", "shipdt"  , shipdt  , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "chuldt"  , chuldt  , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "ipdt"    , ipdt    , "10");	
            fm.icnitMakeNode(dom, node, "varchar", "conbandt", conbandt, "10");	
            fm.icnitMakeNode(dom, node, "varchar", "shipnm"  , shipnm  , "200");	
            fm.icnitMakeNode(dom, node, "varchar", "rmk"     , rmk     , "2000");
            fm.icnitMakeNode(dom, node, "varchar", "inuser"  , inuser  , "20");	
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_BALJU_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            //return JsonConvert.SerializeObject(result);
            //===========================================================================detail
            fm = new FormManager();
            dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            //JObject json = JObject.Parse(param2);
            //JObject json = new JObject();//  JObject.Parse(param2);
            dynamic dynJson = JsonConvert.DeserializeObject(param2);
            if(dynJson == null || dynJson.Count == 0) {
                return JsonConvert.SerializeObject(result);
            }
            foreach(var item in dynJson) {
                string mode        = item.mode       .ToString();
                jpno = result.val;
                string jpseq       = item.jpseq      .ToString();
                string scd         = item.scd        .ToString();
                string itemcd      = item.itemcd     .ToString();
                string qty         = item.qty        .ToString();
                string boxqty      = item.boxqty     .ToString();
                string curcd       = item.curcd      .ToString();
                string unitprice   = item.unitprice  .ToString();
                string supplyamt   = item.supplyamt  .ToString();
                string vat         = item.vat        .ToString();
                string totamt      = item.totamt     .ToString();
                string conqty      = item.conqty     .ToString();
                string sqm         = item.sqm        .ToString();
                       rmk         = item.rmk        .ToString();
                string tongdt      = item.tongdt     .ToString();
                string passdt      = item.passdt     .ToString();
                string port        = item.port       .ToString();
                string conno       = item.conno      .ToString();
                string docno       = item.docno      .ToString();
                string ckcd        = item.ckcd       .ToString();
                string ftdt        = item.ftdt       .ToString();
                       conbandt    = item.conbandt   .ToString();
                string inyodt      = item.inyodt     .ToString();
                string incheckdt   = item.incheckdt  .ToString();
                string sno         = item.sno        .ToString();
                string prodcd      = item.prodcd     .ToString();
                string casenom     = item.casenom    .ToString();
                string proddt      = item.proddt     .ToString();
                inuser = "100";

                node = dom.CreateNode(XmlNodeType.Element,"zrow","");
                fm.icnitMakeNode(dom, node, "varchar", "mode", mode       , "1");
                fm.icnitMakeNode(dom, node, "varchar",  "jpno", jpno       , "20");     
                fm.icnitMakeNode(dom, node, "int",      "jpseq", jpseq      , "20");      
                fm.icnitMakeNode(dom, node, "varchar",	"scd", scd        , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "itemcd", itemcd     , "20");     
                fm.icnitMakeNode(dom, node, "numeric", "qty", qty        , "20");   
                fm.icnitMakeNode(dom, node, "numeric", "boxqty", boxqty     , "20");   
                fm.icnitMakeNode(dom, node, "varchar", "curcd", curcd      , "10");     
                fm.icnitMakeNode(dom, node, "numeric", "unitprice", unitprice  , "20");   
                fm.icnitMakeNode(dom, node, "numeric", "supplyamt", supplyamt  , "20");   
                fm.icnitMakeNode(dom, node, "numeric", "vat", vat        , "20");   
                fm.icnitMakeNode(dom, node, "numeric", "totamt", totamt     , "20");   
                fm.icnitMakeNode(dom, node, "numeric", "conqty", conqty     , "20");   
                fm.icnitMakeNode(dom, node, "numeric", "sqm", sqm        , "20");   
                fm.icnitMakeNode(dom, node, "varchar", "rmk", rmk        , "2000");  
                fm.icnitMakeNode(dom, node, "varchar", "tongdt", tongdt     , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "passdt", passdt     , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "port", port       , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "conno", conno      , "50");     
                fm.icnitMakeNode(dom, node, "varchar", "docno", docno      , "200");    
                fm.icnitMakeNode(dom, node, "varchar", "ckcd", ckcd       , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "ftdt", ftdt       , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "conbandt", conbandt   , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "inyodt", inyodt     , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "incheckdt", incheckdt  , "10");     

                fm.icnitMakeNode(dom, node, "varchar", "sno", sno        , "50");     
                fm.icnitMakeNode(dom, node, "varchar", "prodcd", prodcd     , "200");    
                fm.icnitMakeNode(dom, node, "varchar", "casenom", casenom    , "200");    
                fm.icnitMakeNode(dom, node, "varchar", "proddt", proddt     , "10");     
                fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser     , "20");     
                dom.SelectSingleNode("//xmldata").AppendChild(node);
            }
            query = @"PAGE21_BALJU_DETAIL_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result = CallDB.getXmlTrans(dom);

            return JsonConvert.SerializeObject(result);
        }
        #endregion

        #region == popup 통관 ==
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string tong_selone(string param)
        {
            string tongno = JObject.Parse(param)["tongno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "tongno", tongno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_TONG_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string tong_detail_search(string param)
        {
            string tongno = JObject.Parse(param)["tongno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "tongno", tongno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_TONG_DETAIL_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string tong_detail_search_new(string param)
        {
            string jpno = JObject.Parse(param)["jpno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_TONG_DETAIL_NEW";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string tong_search(string param)
        {
            string jpno = JObject.Parse(param)["jpno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_TONG_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string tong_save(string param, string param2)
        {
            //===========================================================================master
            string tongno = JObject.Parse(param)["tongno"].ToString();
            string jpno  = JObject.Parse(param)["jpno"].ToString();
            string paycd  = JObject.Parse(param)["paycd"].ToString();
            string lcno  = JObject.Parse(param)["lcno"].ToString();
            string amt  = JObject.Parse(param)["amt"].ToString(); 
            string tolper  = JObject.Parse(param)["tolper"].ToString();
            string tolamt  = JObject.Parse(param)["tolamt"].ToString();
            string usane  = JObject.Parse(param)["usane"].ToString();
            string paydt  = JObject.Parse(param)["paydt"].ToString();
            string mandt  = JObject.Parse(param)["mandt"].ToString();
            string blno  = JObject.Parse(param)["blno"].ToString();
            string shipdt  = JObject.Parse(param)["shipdt"].ToString();
            string chuldt  = JObject.Parse(param)["chuldt"].ToString();
            string ipdt  = JObject.Parse(param)["ipdt"].ToString();
            string conbandt  = JObject.Parse(param)["conbandt"].ToString();
            string shipnm  = JObject.Parse(param)["shipnm"].ToString();

            string inuser = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "tongno", tongno, "20");
            fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
            fm.icnitMakeNode(dom, node, "varchar", "paycd", paycd, "10");
            fm.icnitMakeNode(dom, node, "varchar", "lcno", lcno, "50");
            fm.icnitMakeNode(dom, node, "numeric", "amt", amt, "100");
            fm.icnitMakeNode(dom, node, "numeric", "tolper", tolper, "100");
            fm.icnitMakeNode(dom, node, "numeric", "tolamt", tolamt, "100");
            fm.icnitMakeNode(dom, node, "varchar", "usane", usane, "200");
            fm.icnitMakeNode(dom, node, "varchar", "paydt", paydt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "mandt", mandt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "blno", blno, "10");
            fm.icnitMakeNode(dom, node, "varchar", "shipdt", shipdt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "chuldt", chuldt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "ipdt", ipdt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "conbandt", conbandt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "shipnm", shipnm, "200");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE21_TONG_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            //===========================================================================detail
            fm = new FormManager();
            dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            //JObject json = JObject.Parse(param2);
            //JObject json = new JObject();//  JObject.Parse(param2);
            dynamic dynJson = JsonConvert.DeserializeObject(param2);
            if (dynJson == null || dynJson.Count == 0) {
                return JsonConvert.SerializeObject(result);
            }
            foreach (var item in dynJson)
            {
                //Console.WriteLine("{0} {1} {2} {3}\n", item.id, item.displayName,
                //    item.slug, item.imageUrl);
                tongno = result.val;
                string tongseq = item.tongseq.ToString();
                jpno = item.jpno.ToString();
                string jpnoseq = item.jpnoseq.ToString();
                string tongdt = item.tongdt.ToString();
                string passdt = item.passdt.ToString();
                string port = item.port.ToString();
                string conno = item.conno.ToString();
                string docno = item.docno.ToString();
                string ckcd = item.ckcd.ToString();
                string ftcd = item.ftcd.ToString();
                string inyodt = item.inyodt.ToString();
                string indt = item.indt.ToString();
                string sno = item.sno.ToString();
                string prodcd = item.prodcd.ToString();
                string casenom = item.casenom.ToString();
                string proddt = item.proddt.ToString();
                inuser = "100";

                node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
                fm.icnitMakeNode(dom, node, "varchar", "tongno", tongno, "20");
                fm.icnitMakeNode(dom, node, "int", "tongseq", tongseq, "100");
                fm.icnitMakeNode(dom, node, "varchar", "jpno", jpno, "20");
                fm.icnitMakeNode(dom, node, "int", "jpnoseq", jpnoseq, "100");
                fm.icnitMakeNode(dom, node, "varchar", "tongdt", tongdt, "10");
                fm.icnitMakeNode(dom, node, "varchar", "passdt", passdt, "10");
                fm.icnitMakeNode(dom, node, "varchar", "port", port, "10");
                fm.icnitMakeNode(dom, node, "varchar", "conno", conno, "50");
                fm.icnitMakeNode(dom, node, "varchar", "docno", docno, "200");
                fm.icnitMakeNode(dom, node, "varchar", "ckcd", ckcd, "10");
                fm.icnitMakeNode(dom, node, "varchar", "ftcd", ftcd, "10");
                fm.icnitMakeNode(dom, node, "varchar", "conbandt", conbandt, "10");
                fm.icnitMakeNode(dom, node, "varchar", "inyodt", inyodt, "10");
                fm.icnitMakeNode(dom, node, "varchar", "indt", indt, "10");
                fm.icnitMakeNode(dom, node, "varchar", "sno", sno, "50");
                fm.icnitMakeNode(dom, node, "varchar", "prodcd", prodcd, "200");
                fm.icnitMakeNode(dom, node, "varchar", "casenom", casenom, "200");
                fm.icnitMakeNode(dom, node, "varchar", "proddt", proddt, "10");
                fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "100");
                dom.SelectSingleNode("//xmldata").AppendChild(node);
            }
            query = @"PAGE21_TONG_DETAIL_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
        #endregion
    }
}
