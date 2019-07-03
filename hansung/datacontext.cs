using hansung.Molder;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hansung
{
    public class datacontext
    {

       List<string> cvdate = new List<string>() { "dateofarrival", "conDuedate", "datebeginpayment", "creditduedate", "duedate", "departuredate", "orderdate", "contractdate", "dateconfirmation" };
        List<string> cvnumber = new List<string>() { "paymoney" };
        private string connectsql(string[] column, string[] columnclient, string data,int idrecord,string table)
        {
            sql cmd = new sql();
            dynamic Lobj = JsonConvert.DeserializeObject<dynamic>(data);
            List<string> value = new List<string>();
            foreach (var i in columnclient)
            {
                string vl = "";
                for (var j = 0; j < Lobj.Count; j++)
                {
                    if (Lobj[j]["name"].ToString() == i)
                    {
                        vl = Lobj[j]["vl"];
                        break;
                    }
                }
                value.Add(vl);
            }
            if (idrecord == -1)
            {
                string strsql = cmd.insertstr(table, column.ToList(), value.ToList());
                return strsql;
            }
            else
            {
                string strsql = cmd.updatesqlOneItemstr(table, column.ToList(), value.ToList(), idrecord);
                return strsql;
            }
        }
        public string sqlstrupdatecolum(string table, string clandvl, string where)
        {
            string a = "UPDATE " + table + " SET " + clandvl + " " + where;
            return a;
        }
        public string updatecolumndelete(string id, string obj)
        {
            sql cmd = new sql();
            string str = sqlstrupdatecolum(obj,"isdelete=1","where id='"+id+"'");
            cmd.Executesql(str);
            return "ok";
        }
        public string customer(string data,int id)
        {
            sql cmd = new sql();
            moldes md = new moldes();
            string[] column = new string[] { "code", "salesemployee", "zonecode", "name", "registrationnumber", "representative", "phonenumber", "fax", "mobilephone", "email", "headofficeaddress", "destinationphone", "destinationaddress", "transactionbalance", "creditlimit", "transactionaccountnumber", "idcode", "icondola", "iconwon" };
            string[] columnclient = new string[] { "input_code_ctm", "worker", "ctmzone", "namectm", "companyregistration", "representative", "phonenumber", "fax", "mobilePhone", "email", "mainaddress", "destinationphone", "destinationaddress", "transactionbalance", "creditlimit", "transactionaccountnumber", "idcode", "icondola", "iconwon" };
            List<string> columnnumber =new List<string>() {"creditlimit", "transactionaccountnumber", "idcode", "transactionbalance" };

            dynamic Lobj = JsonConvert.DeserializeObject<dynamic>(data);
           
            for (var j = 0; j < Lobj.Count; j++)
            {
                if(columnnumber.IndexOf(Lobj[j]["name"].ToString())!=-1)
                {
                    string v = Lobj[j]["vl"].ToString();
                    Lobj[j]["vl"] = v.Replace(",", "");
                }
                if (Lobj[j]["name"].ToString() == "worker")
                {
                    string vl = Lobj[j]["vl"];
                    if (vl != "")
                    {
                        var elm = cmd.getcolumndatatableSQL("employee", "id", "where name=N'" + vl + "' AND isdelete is null");
                        if (elm.Count > 0)
                            Lobj[j]["vl"] = elm[0]["id"].ToString();
                        else
                            Lobj[j]["vl"] = "";
                    }
           
                }
            }
            string rs = connectsql(column, columnclient, JsonConvert.SerializeObject(Lobj), id,"customer");
            string item = "-1";
            if (rs != "")
            {
                if (id==-1)
                    item = cmd.ExecutesqlAndgetId(rs, "customer").ToString();
                else
                {
                    cmd.Executesql(rs);
                    item = id.ToString();
                }
            }
            return item;
        }
        public string itemlist(string data, int id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "itemcode", "itemduzoncode", "itemname", "quantityincase", "specifiedarea", "safetystockquantity", "manufacturer", "status", "itembrief", "unitprice1", "unitprice2", "unitprice3" ,"standard", "width", "height" };
            string[] columnclient = new string[] { "itemcode", "itemduzoncode", "itemname", "quantityincase", "specifiedarea", "safetystockquantity", "manufacturer", "status", "itembrief", "unitprice1", "unitprice2", "unitprice3", "standard", "width", "height" };
            List<string> columnnumber = new List<string>() {"unitprice1", "unitprice2", "unitprice3" };
            dynamic Lobj = JsonConvert.DeserializeObject<dynamic>(data);
            moldes md = new moldes();
            List<statusitem> statusItem = md.statusItem();
            string[] vlsize = new string[] { };
            for (var j = 0; j < Lobj.Count; j++)
            {
                if (columnnumber.IndexOf(Lobj[j]["name"].ToString()) != -1)
                {
                    string v = Lobj[j]["vl"].ToString();
                    Lobj[j]["vl"] = v.Replace(",", "");
                }
                if (Lobj[j]["name"].ToString() == "itemcode")
                {
                    if (id == -1)
                    {
                        string n = cmd.getNewcode("ItemList", "id", "", 4, "");
                        if (n.Length < 4)
                        {
                            int lcode = 4 - n.Length;
                            for (var p = 0; p < lcode; p++)
                                n = "0" + n;
                        }
                        Lobj[j]["vl"] = n;
                    }
                }
                else if (Lobj[j]["name"].ToString() == "status")
                {
                    foreach (var k in statusItem)
                    {
                        if (k.name == Lobj[j]["vl"].ToString())
                        {
                            Lobj[j]["vl"] = k.id.ToString();
                            break;
                        }
                    }

                }
                else if (Lobj[j]["name"].ToString() == "manufacturer")
                {
                    Lobj[j]["vl"] = cm.convertId("customer", "name", Lobj[j]["vl"].ToString());
                }
                if (Lobj[j]["name"].ToString() == "standard")
                {
                    string ext = Lobj[j]["vl"].ToString();
                    vlsize = ext.Split('*');
                }
                else if (Lobj[j]["name"].ToString() == "width")
                {
                    Lobj[j]["vl"] = vlsize[0];
                }
                else if (Lobj[j]["name"].ToString() == "height")
                {
                    Lobj[j]["vl"] = vlsize[1];
                }
            }
            string strdata = JsonConvert.SerializeObject(Lobj);
            string rs = connectsql(column, columnclient, strdata, id, "ItemList");
            string item = "-1";
            if (rs != "")
            {
                if (id == -1)
                    item = cmd.ExecutesqlAndgetId(rs, "ItemList").ToString();
                else
                {
                    cmd.Executesql(rs);
                    item = id.ToString();
                }
            }
            return item;
        }
        public string styleItem(string data, int id)
        {
            sql cmd = new sql();
            string[] column = new string[] { "name", "size", "code"};
            string[] columnclient = new string[] { "name", "size", "code" };
            dynamic Lobj = JsonConvert.DeserializeObject<dynamic>(data);
            string name = Lobj[0]["name"].ToString();
            string size = Lobj[0]["size"].ToString();
            var lookat = cmd.finddatasql("styleItem", "where name='" + name + "' AND size='" + size + "' AND isdelete is null");
            if (lookat.Count > 0)
                return "-1";
            string rs = connectsql(column, columnclient, data, id, "styleItem");
            string item = "-1";
            if (rs != "")
            {
                if (id == -1)
                    item = cmd.ExecutesqlAndgetId(rs, "styleItem").ToString();
                else
                {
                    cmd.Executesql(rs);
                    item = id.ToString();
                }
            }
            return item;
        }
        public string standards(string data, int id)
        {
            sql cmd = new sql();
            string[] column = new string[] { "name", "width", "height" };
            string[] columnclient = new string[] { "name", "width", "height" };
            string rs = connectsql(column, columnclient, data, id, "standards");
            string item = "-1";
            if (rs != "")
            {
                if (id == -1)
                    item = cmd.ExecutesqlAndgetId(rs, "standards").ToString();
                else
                {
                    cmd.Executesql(rs);
                    item = id.ToString();
                }
            }
            return item;
        }
        public string warehouse(string data, int id)
        {
            sql cmd = new sql();
            string[] column = new string[] { "warehousecode", "name", "brief", "telephone", "address" };
            string[] columnclient = new string[] { "warehousecode", "name", "brief", "telephone", "address" };
            string rs = connectsql(column, columnclient, data, id, "warehouse");
            string item = "-1";
            if (rs != "")
            {
                if (id == -1)
                    item = cmd.ExecutesqlAndgetId(rs, "warehouse").ToString();
                else
                {
                    cmd.Executesql(rs);
                    item = id.ToString();
                }
            }
            return item;
        }
        public string employee(string data, int id)
        {
            sql cmd = new sql();
            string[] column = new string[] { "employeecode", "name", "email", "phonenumber", "position", "department", "address", "attachments" };
            string[] columnclient = new string[] { "employeecode", "name", "email", "phonenumber", "position", "department", "address", "attachments" };
            dynamic Lobj = JsonConvert.DeserializeObject<dynamic>(data);
            for (var j = 0; j < Lobj.Count; j++)
            {
           
                if (Lobj[j]["name"].ToString() == "position")
                {
                    string vl = Lobj[j]["vl"];
                    if (vl != "")
                    {
                        var elm = cmd.getcolumndatatableSQL("position", "id", "where name=N'" + vl + "'");
                        if (elm.Count > 0)
                            Lobj[j]["vl"] = elm[0]["id"].ToString();
                        else
                            Lobj[j]["vl"] = "";
                    }
                }
                if (Lobj[j]["name"].ToString() == "department")
                {
                    string vl = Lobj[j]["vl"];
                    if (vl != "")
                    {
                        var elm = cmd.getcolumndatatableSQL("department", "id", "where name=N'" + vl + "'");
                        if (elm.Count > 0)
                            Lobj[j]["vl"] = elm[0]["id"].ToString();
                        else
                            Lobj[j]["vl"] = "";
                    }
                }

            }

            string rs = connectsql(column, columnclient, JsonConvert.SerializeObject(Lobj), id, "employee");
            string item = "-1";

            if (rs != "")
            {
                if (id == -1)
                    item = cmd.ExecutesqlAndgetId(rs, "employee").ToString();
                else
                {
                    cmd.Executesql(rs);
                    item = id.ToString();
                }
            }
            return item;
        }
        public string codeid(dynamic o,string str)
        {
            common cm = new common();
            string c = "";
            try
            {
                c = o.codeid;
                if (c == "" || c==null)
                    c = cm.getcodeId(str);
                else
                    o.statusEdit = 1;
            }
            catch
            {
                c = cm.getcodeId(str);
            }
            return c;
        }
        private string autosql(string[] column, string[] columnclient, string data, int status, string table,string key)
        {
            sql cmd = new sql();
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> value = new List<string>();
            foreach (var i in columnclient)
            {
                string vl = Lobj.FirstOrDefault(s=>s.name==i).vl.ToString();
                
                value.Add(vl);
            }
            if (status == -1)
            {
                string strsql = cmd.insertstr(table, column.ToList(), value.ToList());
                return strsql;
            }
            else
            {
                string code= Lobj.FirstOrDefault(s => s.name == key).vl.ToString();
                string strsql = cmd.updatesqlOneItemstrfollowkey(table, column.ToList(), value.ToList(),key, code);
                return strsql;
            }
        }
        private string autosql_dynamic(string[] column, string[] columnclient, string data, int status, string table, string key)
        {
            sql cmd = new sql();
            dynamic Lobj = JsonConvert.DeserializeObject<dynamic>(data);
            List<string> value = new List<string>();
            foreach (var i in columnclient)
            {
                string vl = Lobj[i].ToString();

                value.Add(vl);
            }
                 string strsql = cmd.insertstr(table, column.ToList(), value.ToList());
                return strsql;
           
        }
        public string buybill(string data, string codeid)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "notebill", "tradingmission", "terms", "contractdate", "orderingemployer", "phone", "warehouse", "paymoney", "ordernumber", "dateconfirmation", "remark", "codeid" };
            string[] columnclient = new string[] { "notebill", "tradingmission", "terms", "orderdate", "employer", "phone", "warehouse", "paymoney", "ordernumber", "dateconfirmation", "remark", "codeid" };
            string[] cvdate = new string[] { "orderdate", "dateconfirmation" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            string strcode = cm.newstrJson("codeid", codeid);
            Lobj.Add(JsonConvert.DeserializeObject(strcode));
            List<string> lw = new List<string>();
            int id = 1;
            Dictionary<string, object> objrturn = new Dictionary<string, object>();
            foreach (var n in columnclient)
            {
                objrturn[n] = Lobj.FirstOrDefault(s => s.name == n).vl.ToString();
            }
            var paymoney = Lobj.FirstOrDefault(s => s.name == "paymoney");
            var warehouse = Lobj.FirstOrDefault(s => s.name == "warehouse");
            warehouse.vl = cm.findidobj2("warehouse", "subname=N'" + warehouse.vl.ToString() + "'", "", "id");
            if (paymoney == null)
            {
                string pm = cm.newstrJson("paymoney", "0");
                Lobj.Insert(0, JsonConvert.DeserializeObject(pm));
            }
            paymoney.vl = paymoney.vl.ToString().Replace(",", "");
            if (codeid == "")
            {
                id = -1;
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = cm.getcodeId("order");
            }
            else
            {
                List<string> c = new List<string>() { "A", "B", "C", "D", "E", "F", "G" };
                var ordernumber = Lobj.FirstOrDefault(s => s.name == "ordernumber");
                string x = ordernumber.vl.ToString();
                int len = x.Length;
                for (var k = 0; k < len; k++)
                {
                    int g = c.IndexOf(x[k].ToString());
                    if (g != -1)
                    {
                        Char gg = Char.Parse(c[g]);
                        string[] s = x.Split(gg);
                        string newnum = (int.Parse(s[1]) + 1).ToString();
                        if (int.Parse(newnum) < 10)
                            newnum = "0" + newnum;
                        ordernumber.vl = s[0] + gg + newnum;
                    }
                }
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = codeid;

                var olddata = cmd.getdatatableSQL("billbuy", "where codeid='" + codeid + "'");
                string htr = cm.savehistory(codeid, JsonConvert.SerializeObject(olddata), data, "edit orderslips","","");
                lw.Add(htr);
            }

            var dateconfirmation = Lobj.FirstOrDefault(s => s.name == "dateconfirmation");
            dateconfirmation.vl = cm.converdateserver(dateconfirmation.vl.ToString());
            var orderdate2 = Lobj.FirstOrDefault(s => s.name == "orderdate");
            orderdate2.vl = cm.converdateserver(orderdate2.vl.ToString());
            var tradingmission = Lobj.FirstOrDefault(s => s.name == "tradingmission");
            var employer = Lobj.FirstOrDefault(s => s.name == "employer");
            tradingmission.vl = cmd.finddatasql("customer", "where name=N'" + tradingmission.vl + "'")["id"].ToString();
            employer.vl = cmd.finddatasql("employee", "where name=N'" + employer.vl + "'")["id"].ToString();

            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, id, "billbuy", "codeid");
            lw.Add(rs);
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturn);
        }
        public List<string> buybill_str(string data, string codeid,int status)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "notebill","tradingmission", "terms", "contractdate", "orderingemployer", "phone", "warehouse", "paymoney", "ordernumber", "dateconfirmation", "remark", "currency", "codeid" };
            string[] columnclient = new string[] { "notebill", "tradingmission", "terms", "orderdate", "employer", "phone", "warehouse", "paymoney", "ordernumber", "dateconfirmation", "remark", "currency", "codeid" };
            string[] cvdate = new string[] { "orderdate", "dateconfirmation" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            string strcode = cm.newstrJson("codeid", codeid);
            Lobj.Add(JsonConvert.DeserializeObject(strcode));
            List<string> lw = new List<string>();
            int id = 1;
            Dictionary<string, object> objrturn = new Dictionary<string, object>();
            foreach (var n in columnclient)
            {
                objrturn[n] = Lobj.FirstOrDefault(s => s.name == n).vl.ToString();
            }
            var paymoney= Lobj.FirstOrDefault(s => s.name == "paymoney");
            var warehouse = Lobj.FirstOrDefault(s => s.name == "warehouse");
            warehouse.vl = cm.findidobj2("warehouse", "subname=N'" + warehouse.vl.ToString() + "'","", "id");
            if (paymoney == null)
            {
                string pm = cm.newstrJson("paymoney", "0");
                Lobj.Insert(0, JsonConvert.DeserializeObject(pm));
            }
            paymoney.vl = paymoney.vl.ToString().Replace(",", "");
            if (status != -1)
            { 
                List<string> c = new List<string>() { "A", "B", "C", "D", "E", "F", "G" };
                var ordernumber = Lobj.FirstOrDefault(s => s.name == "ordernumber");
                string x = ordernumber.vl.ToString();
                int len = x.Length;
                for (var k = 0; k < len; k++)
                {
                    int g = c.IndexOf(x[k].ToString());
                    if (g != -1)
                    {
                        Char gg = Char.Parse(c[g]);
                        string[] s = x.Split(gg);
                        string newnum = (int.Parse(s[1]) + 1).ToString();
                        if (int.Parse(newnum) < 10)
                            newnum = "0" + newnum;
                        ordernumber.vl = s[0] + gg + newnum;
                    }
                }
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = codeid;
            
                var olddata = cmd.getdatatableSQL("billbuy", "where codeid='" + codeid + "'");
                string htr = cm.savehistory(codeid, JsonConvert.SerializeObject(olddata), data, "edit bill","","");
                lw.Add(htr);
            }
            
            var dateconfirmation = Lobj.FirstOrDefault(s => s.name == "dateconfirmation");
            dateconfirmation.vl = cm.converdateserver(dateconfirmation.vl.ToString());
            var orderdate2 = Lobj.FirstOrDefault(s => s.name == "orderdate");
            orderdate2.vl = cm.converdateserver(orderdate2.vl.ToString());
            var tradingmission = Lobj.FirstOrDefault(s => s.name == "tradingmission");
            var employer = Lobj.FirstOrDefault(s => s.name == "employer");
            tradingmission.vl = cmd.finddatasql("customer", "where name=N'" + tradingmission.vl + "'")["id"].ToString();
            employer.vl = cmd.finddatasql("employee", "where name=N'" + employer.vl + "'")["id"].ToString();
            
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, status, "billbuy", "codeid");
            lw.Add(rs);
            return lw;
        }
        public string detailbuybill(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codeid", "codeitem", "nameitem", "standard", "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "qltcontainer", "sqm", "remark", "codebill", "iditem" };
            string[] columnclient = new string[] { "codeid", "codeitem", "nameitem", "standard", "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "qltcontainer", "sumpake", "remark", "codebill", "iditem" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            var htrdt = cmd.getdatatableSQL("detailbillbuy", "where codebill='" + id + "'");
            List<string> locode = htrdt.Select(s => s["codeid"].ToString()).ToList();
            List<string> lexp = new List<string>();

            foreach (var i in Lobj)
            {

                var ids = -1;
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                var codeid = sLobj.FirstOrDefault(s => s.name == "codeid");

                if (codeid.vl.ToString() == "")
                    codeid.vl = cm.getcodeId("dtbuy");
                else
                {
                    ids = 1;
                    lexp.Add(codeid.vl.ToString());
                }

                string newcode = cm.newstrJson("codebill", id);
                string newprice = cm.newstrJson("price", "");
                string newsubprice = cm.newstrJson("pricesupply", "");
                string newvat = cm.newstrJson("vat", id);
                string newsumpake = cm.newstrJson("sumpake", "");

                sLobj.Insert(0, JsonConvert.DeserializeObject(newcode));
                sLobj.Insert(6, JsonConvert.DeserializeObject(newprice));
                sLobj.Insert(7, JsonConvert.DeserializeObject(newsubprice));
                sLobj.Insert(8, JsonConvert.DeserializeObject(newvat));
                sLobj.Insert(11, JsonConvert.DeserializeObject(newsumpake));
                var itemcode = sLobj.FirstOrDefault(s => s.name == "codeitem").vl.ToString();
                var itemname = sLobj.FirstOrDefault(s => s.name == "nameitem");

                string stand = sLobj.FirstOrDefault(s => s.name == "standard").vl.ToString();
                var totalamount = sLobj.FirstOrDefault(s => s.name == "totalamount");
                double qltcase = double.Parse(sLobj.FirstOrDefault(s => s.name == "qltcase").vl.ToString().Replace(",", ""));
                double totalmn = double.Parse(totalamount.vl.ToString().Replace(",", ""));
                double vat = Math.Floor(totalmn / 11);
                double sp = vat * 10;
                string qltincase = sLobj.FirstOrDefault(s => s.name == "quantityincase").vl.ToString();
                double b = double.Parse(qltincase.Replace(",", ""));
                string[] sizes = stand.Split('*');
                double size1 = double.Parse(sizes[0].Replace(",", "")) / 1000;
                double size2 = double.Parse(sizes[1].Replace(",", "")) / 1000;
                double ttsize = size1 * size2;
                double end = ttsize * b * 10.764;
                double price = Math.Floor(sp / end);
                double sump = Math.Floor(ttsize * b * qltcase);
                sLobj.FirstOrDefault(s => s.name == "vat").vl = vat.ToString();
                sLobj.FirstOrDefault(s => s.name == "pricesupply").vl = sp.ToString();
                sLobj.FirstOrDefault(s => s.name == "price").vl = price.ToString();
                sLobj.FirstOrDefault(s => s.name == "sumpake").vl = sump.ToString();
                totalamount.vl = totalmn;
                string iditem = cm.findidobj2("ItemList", "itemname=N'" + itemname.vl + "' AND standard=N'" + stand + "'", itemcode, "id");
                string itemid = cm.newstrJson("iditem", iditem);
                sLobj.Add(JsonConvert.DeserializeObject(itemid));
                Dictionary<string, object> objrturn = new Dictionary<string, object>();
                foreach (var n in columnclient)
                {
                    objrturn[n] = sLobj.FirstOrDefault(s => s.name == n).vl.ToString();
                }
                objrturns.Add(objrturn);
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, ids, "detailbillbuy", "codeid");
                lw.Add(rs);
            }
            if (htrdt.Count > 0)
            {
                string htr = cm.savehistory(id, JsonConvert.SerializeObject(htrdt), JsonConvert.SerializeObject(objrturns), "edit fetail order","","");
                lw.Insert(0, htr);
                var ldelete = locode.Except(lexp).ToList();
                foreach (var k in ldelete)
                {
                    string dl = "DELETE FROM detailbillbuy WHERE codeid='" + k + "'";
                    lw.Insert(1, dl);
                }
            }


            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturns);
        }
        public List<string> detailbuybill_str(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codeid","codeitem", "nameitem", "standard", "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "qltcontainer", "sqm", "remark", "codebill", "iditem" };
            string[] columnclient = new string[] { "codeid", "codeitem", "nameitem", "standard", "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "qltcontainer", "sumpake", "remark", "codebill", "iditem" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            var htrdt = cmd.getdatatableSQL("detailbillbuy", "where codebill='" + id + "'");
            List<string> locode = htrdt.Select(s => s["codeid"].ToString()).ToList();
            List<string> lexp = new List<string>();
          
            foreach (var i in Lobj)
            {
                
                var ids = -1;
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                var codeid = sLobj.FirstOrDefault(s => s.name == "codeid");

                if (codeid.vl.ToString() == "")
                    codeid.vl = cm.getcodeId("dtbuy");
                else
                {
                    ids = 1;
                    lexp.Add(codeid.vl.ToString());
                }
             
                string newcode = cm.newstrJson("codebill", id);
                string newprice = cm.newstrJson("price", "");
                string newsubprice = cm.newstrJson("pricesupply", "");
                string newvat = cm.newstrJson("vat", id);
                string newsumpake = cm.newstrJson("sumpake", "");
            
                sLobj.Insert(0, JsonConvert.DeserializeObject(newcode));
                sLobj.Insert(6, JsonConvert.DeserializeObject(newprice));
                sLobj.Insert(7, JsonConvert.DeserializeObject(newsubprice));
                sLobj.Insert(8, JsonConvert.DeserializeObject(newvat));
                sLobj.Insert(11, JsonConvert.DeserializeObject(newsumpake));
                var itemcode = sLobj.FirstOrDefault(s => s.name == "codeitem").vl.ToString();
                var itemname = sLobj.FirstOrDefault(s => s.name == "nameitem");
                string stand = sLobj.FirstOrDefault(s => s.name == "standard").vl.ToString();
                string iditem = cm.findidobj2("ItemList", "itemname=N'" + itemname.vl + "' AND standard=N'" + stand + "'", itemcode, "id");
                if (iditem == "-1")
                    continue;
                string itemid = cm.newstrJson("iditem", iditem);
                
                
                var totalamount = sLobj.FirstOrDefault(s => s.name == "totalamount");
                double qltcase = double.Parse(sLobj.FirstOrDefault(s => s.name == "qltcase").vl.ToString().Replace(",", ""));
                double totalmn = double.Parse(totalamount.vl.ToString().Replace(",", ""));
                double vat = Math.Floor(totalmn / 11);
                double sp = vat * 10;
                string qltincase = sLobj.FirstOrDefault(s => s.name == "quantityincase").vl.ToString();
                double b = double.Parse(qltincase.Replace(",", ""));
                string[] sizes = stand.Split('*');
                double size1 = double.Parse(sizes[0].Replace(",", "")) / 1000;
                double size2 = double.Parse(sizes[1].Replace(",", "")) / 1000;
                double ttsize = size1 * size2;
                double end = ttsize * b * 10.764;
                double price = Math.Floor(sp / end);
                double sump = Math.Floor(ttsize * b * qltcase);
                sLobj.FirstOrDefault(s => s.name == "vat").vl = vat.ToString();
                sLobj.FirstOrDefault(s => s.name == "pricesupply").vl = sp.ToString();
                sLobj.FirstOrDefault(s => s.name == "price").vl = price.ToString();
                sLobj.FirstOrDefault(s => s.name == "sumpake").vl = sump.ToString();
                totalamount.vl = totalmn;
               
                sLobj.Add(JsonConvert.DeserializeObject(itemid));
                Dictionary<string, object> objrturn = new Dictionary<string, object>();
                foreach (var n in columnclient)
                {
                    objrturn[n] = sLobj.FirstOrDefault(s => s.name == n).vl.ToString();
                }
                objrturns.Add(objrturn);
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, ids, "detailbillbuy", "codeid");
                lw.Add(rs);
            }
            if (htrdt.Count > 0)
            {
                var billhtr = cmd.finddatasql("billbuy", "where codeid='" + id + "'");
                string htr = cm.savehistory(id, JsonConvert.SerializeObject(htrdt), JsonConvert.SerializeObject(objrturns), "edit detail buy", billhtr["ordernumber"].ToString(), JsonConvert.SerializeObject(billhtr));
                lw.Insert(0, htr);
                var ldelete = locode.Except(lexp).ToList();
               foreach (var k in ldelete)
                {
                    string dl = "DELETE FROM detailbillbuy WHERE codeid='" + k + "'";
                    lw.Insert(1, dl);
                }
            }
            return lw;
        }
        private string newwork(string[] column, string[] columnclient, string data, int idrecord, string table,string key,string keycode)
        {
            sql cmd = new sql();
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            foreach(var m in Lobj)
            {
                List<string> value = new List<string>();
                foreach (var i in columnclient)
                {
                    string aa = m[i].ToString();
                   value.Add(aa);
                }
                idrecord = m.statusEdit;
                if (idrecord == -1)
                {
                    string strsql = cmd.insertstr(table, column.ToList(), value.ToList());
                    lw.Add(strsql);
                }
                else
                {
                    string c = m[keycode].ToString();
                    string strsql = cmd.updatesqlOneItemstrfollowkey(table, column.ToList(), value.ToList(),key, c);
                    lw.Add(strsql);
                }
            }
            return string.Join(";", lw);
        }
        public string ship(string data, string codeb)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill","codeid", "orderbill", "paymentoption", "note", "numbership", "money", "tolerancepercent", "tolerancemoney", "usance", "datebeginpayment", "creditduedate", "duedate", "departuredate", "dateofarrival", "conDuedate", "nameshipname", "remark"};
            string[] columnclient = new string[] { "codebill","codeid", "orderbill", "paymentoption", "note", "numbership", "money", "tolerancepercent", "tolerancemoney", "usance", "datebeginpayment", "creditduedate", "duedate", "departuredate", "dateofarrival", "conDuedate", "nameshipname", "remark"};
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            
            double money =double.Parse(Lobj.FirstOrDefault(s => s.name == "money").vl.ToString().Replace(",", ""));
            double tlcnumber = double.Parse(Lobj.FirstOrDefault(s => s.name == "tolerancepercent").vl.ToString());
            double tlcmoney =(money*tlcnumber)/100;
            Lobj.FirstOrDefault(s => s.name == "tolerancemoney").vl = tlcmoney.ToString();
            Lobj.FirstOrDefault(s => s.name == "money").vl = money.ToString();
            var codeid = Lobj.FirstOrDefault(s => s.name == "codeid").vl;
            if (codeid == "")
                codeid = cm.getcodeId("ship");
            string cbill = cm.newstrJson("codebill", codeb);
            Lobj.Insert(0, JsonConvert.DeserializeObject(cbill));
            var ship = cmd.finddatasql("ship", "where codebill='" + codeb + "'");
            if (ship.Count > 0)
                codeid = ship["codeid"].ToString();
            Lobj.FirstOrDefault(s => s.name == "codeid").vl = codeid;
            for (var i=0;i <column.Length;i++)
            {

                if (cvdate.IndexOf(column[i]) != -1)
                {
                    var l = Lobj.FirstOrDefault(s => s.name == columnclient[i]);
                    if (l != null)
                        l.vl = cm.converdateserver(l.vl.ToString());
                }
            }
          
            int idd = -1;
            List<string> lw = new List<string>();
            if(ship.Count>0)
            {
                idd = int.Parse(ship["id"].ToString());
                string htr = cm.savehistory(idd.ToString(), JsonConvert.SerializeObject(ship), data, "Edit ship","","");
                lw.Add(htr);
                string[] obill = ship["orderbill"].ToString().Split('-');
                string orbill = obill[1];
                int newor = int.Parse(orbill)+1;
                orbill = newor.ToString();
                if (newor<10)
                    orbill = "0" + orbill;
                Lobj.FirstOrDefault(s => s.name == "orderbill").vl = obill[0]+"-"+orbill;
            }
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, idd, "ship","codeid");
            lw.Add(rs);
            cmd.Executesql(string.Join(";",lw));
            return d;
        }
        public List<string> ship_STR_itn(string data, string codebill, string inforbill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] columnupdate = new string[] { "codeid", "orderbill"};
            string strhtr = cm.getclumn(columnupdate, "billbuy");
            string[] column = new string[] { "codebill", "codeid", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "shipnum", "qltbox", "indexbox", "serinumber" };
            string[] columnclient = new string[] { "codebill", "codeid", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "ship", "qltBox", "indexbox", "serinumber" };
            List<string> lw = new List<string>();
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<dynamic> Lobjinfo = JsonConvert.DeserializeObject<List<dynamic>>(inforbill);
            string cbilledit = cm.newstrJson("codeid", codebill);
            Lobjinfo.Insert(0, JsonConvert.DeserializeObject(cbilledit));
            //double money = double.Parse(Lobjinfo.FirstOrDefault(s => s.name == "money").vl.ToString().Replace(",", ""));
            //Lobjinfo.FirstOrDefault(s => s.name == "money").vl = money.ToString();

            var ship = cmd.getdatatableSQL("ship", "where codebill='" + codebill + "'");
            if (ship.Count > 0)
            {
                var htrbill = cmd.finddatasql("billbuy", "where codeid='" + codebill + "'");
                var orderbill = Lobjinfo.FirstOrDefault(s => s.name == "orderbill");
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(ship), data, "Edit ship", orderbill.vl.ToString(), JsonConvert.SerializeObject(htrbill));
                var suborderbill = orderbill.vl.ToString().Split('-');
                string s1 = (int.Parse(suborderbill[1]) + 1).ToString();
                if (int.Parse(s1) < 10)
                    s1 = "0" + s1;
                orderbill.vl = suborderbill[0] + "-" + s1;

                lw.Add(htr);
                string dl = "DELETE FROM ship WHERE codebill='" + codebill + "'";
                lw.Insert(0, dl);
            }
            string dd = JsonConvert.SerializeObject(Lobjinfo);
            string rsd = autosql(columnupdate, columnupdate, dd, 1, "billbuy", "codeid");
            lw.Add(rsd);
            foreach (var obj in Lobj)
            {
                string jsstr = JsonConvert.SerializeObject(obj);
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(jsstr);
                string cbill = cm.newstrJson("codebill", codebill);
                sLobj.Insert(0, JsonConvert.DeserializeObject(cbill));
                for (var i = 0; i < column.Length; i++)
                {

                    if (cvdate.IndexOf(column[i]) != -1)
                    {
                        var l = sLobj.FirstOrDefault(s => s.name == columnclient[i]);
                        if (l != null)
                            l.vl = cm.converdateserver(l.vl.ToString());
                    }
                }
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, -1, "ship", "codebill");
                lw.Add(rs);
            }
            return lw;
        }
        public List<string> ship_car_itn(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
         
            string[] column = new string[] { "codebill", "codeid", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime", "numbill", "qltBox", "ship", "indexbox" };
            string[] columnclient = new string[] { "codebill", "codeid", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime", "numbill", "qltBox", "ship", "indexbox" };
            List<string> lw = new List<string>();
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
         
            var ship = cmd.getdatatableSQL("carship", "where codebill='" + codebill + "'");
            if (ship.Count > 0)
            {
              
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(ship), data, "Edit car", codebill, "");
                lw.Add(htr);
                string dl = "DELETE FROM carship WHERE codebill='" + codebill + "'";
                lw.Insert(0, dl);
            }
             foreach (var obj in Lobj)
            {
                string jsstr = JsonConvert.SerializeObject(obj);
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(jsstr);
                string cbill = cm.newstrJson("codebill", codebill);
                sLobj.Insert(0, JsonConvert.DeserializeObject(cbill));
                var rate = sLobj.FirstOrDefault(s => s.name == "rate");
                if (rate.vl == "")
                    rate.vl = "0";
                 rate.vl = cm.converstringtomoney(rate.vl.ToString());
                var indexbox = sLobj.FirstOrDefault(s => s.name == "indexbox");
                string aaa = indexbox.vl.ToString().Replace(" ","");
                indexbox.vl = aaa;
                var company = sLobj.FirstOrDefault(s => s.name == "company");
                company.vl= cm.findidobj2("customer", "name=N'" + company.vl + "'", "", "id");
                var deliveryworker = sLobj.FirstOrDefault(s => s.name == "deliveryworker");
                deliveryworker.vl = cm.findidobj2("employee", "name=N'" + deliveryworker.vl + "'", "", "id");
                for (var i = 0; i < column.Length; i++)
                {

                    if (cvdate.IndexOf(column[i]) != -1)
                    {
                        var l = sLobj.FirstOrDefault(s => s.name == columnclient[i]);
                        if (l != null)
                            l.vl = cm.converdateserver(l.vl.ToString());
                    }
                }
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, -1, "carship", "codebill");
                lw.Add(rs);
            }
            return lw;
        }
        public List<string> ship_STR(string data,string codebill,string inforbill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] columnupdate = new string[] { "codeid", "orderbill", "paymentoption", "note","money", "tolerancepercent", "tolerancemoney", "usance", "datebeginpayment", "creditduedate" };
            string strhtr=cm.getclumn(columnupdate, "billbuy");
            string[] column = new string[] { "codebill", "codeid", "numbership", "duedate", "departuredate", "dateofarrival", "conDuedate", "nameshipname", "dateclearance", "customsday", "port", "containernumber", "daycertificate", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "shipnum", "qltbox", "indexbox", "serinumber" };
            string[] columnclient = new string[] { "codebill", "codeid","numbership",  "duedate", "departuredate", "dateofarrival", "conDuedate", "nameshipname", "dateclearance", "customsday", "port", "containernumber", "daycertificate", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "ship" , "qltBox", "indexbox", "serinumber" };
            List<string> lw = new List<string>();
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<dynamic> Lobjinfo = JsonConvert.DeserializeObject<List<dynamic>>(inforbill);
            string cbilledit = cm.newstrJson("codeid", codebill);
            Lobjinfo.Insert(0, JsonConvert.DeserializeObject(cbilledit));
            double money = double.Parse(Lobjinfo.FirstOrDefault(s => s.name == "money").vl.ToString().Replace(",", ""));
            double tlcnumber = double.Parse(Lobjinfo.FirstOrDefault(s => s.name == "tolerancepercent").vl.ToString());
            double tlcmoney = (money * tlcnumber) / 100;
            Lobjinfo.FirstOrDefault(s => s.name == "tolerancemoney").vl = tlcmoney.ToString();
            Lobjinfo.FirstOrDefault(s => s.name == "money").vl = money.ToString();
            
            var ship = cmd.getdatatableSQL("ship", "where codebill='" + codebill + "'");
            if (ship.Count > 0)
            {
                var htrbill = cmd.finddatasql("billbuy", "where codeid='"+codebill+"'");
                var orderbill = Lobjinfo.FirstOrDefault(s => s.name == "orderbill");
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(ship), data, "Edit ship", orderbill.vl.ToString(), JsonConvert.SerializeObject(htrbill));
                var suborderbill = orderbill.vl.ToString().Split('-');
                string s1 =(int.Parse(suborderbill[1])+1).ToString();
                if (int.Parse(s1) < 10)
                    s1 = "0" + s1;
                orderbill.vl = suborderbill[0]+"-"+ s1;
               
                lw.Add(htr);
                string dl = "DELETE FROM ship WHERE codebill='" + codebill + "'";
                lw.Insert(0, dl);
            }
            string dd = JsonConvert.SerializeObject(Lobjinfo);
            string rsd = autosql(columnupdate, columnupdate, dd, 1, "billbuy", "codeid");
            lw.Add(rsd);
            foreach (var obj in Lobj) {
                string jsstr =JsonConvert.SerializeObject(obj);
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(jsstr);
                string cbill = cm.newstrJson("codebill", codebill);
                sLobj.Insert(0, JsonConvert.DeserializeObject(cbill));
                for (var i = 0; i < column.Length; i++)
                {

                    if (cvdate.IndexOf(column[i]) != -1)
                    {
                        var l = sLobj.FirstOrDefault(s => s.name == columnclient[i]);
                        if (l != null)
                            l.vl = cm.converdateserver(l.vl.ToString());
                    }
                }
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, -1, "ship", "codebill");
                lw.Add(rs);
            }
            return lw;
        }
        public List<string> ship_STR_buy(string data, string codebill, string inforbill)
        {
            int id = -1;
            sql cmd = new sql();
            common cm = new common();
            List<string> lw = new List<string>();
            string[] column = new string[] { "orderdate", "salesrepresentative", "customercompany", "customercontacts", "terms", "transactionbalancectm", "warehouse", "issuedate", "contactphone", "frame", "destinationaddress", "remarks", "codeid" };
            string[] columnclient = new string[] { "orderdate", "salesrepresentative", "customercompany", "customercontacts", "terms", "transactionbalancectm", "warehouse", "issuedate", "contactphone", "frame", "destinationaddress", "remark", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(inforbill);
            string cid = cm.newstrJson("codeid", codebill);
            Lobj.Add(JsonConvert.DeserializeObject(cid));
            var warehouse = Lobj.FirstOrDefault(s => s.name == "warehouse");
            warehouse.vl = cm.findidobj2("warehouse", "subname=N'" + warehouse.vl.ToString() + "'", "", "id");

            if (codebill == "")
            {
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = cm.getcodeId("order");
            }
            else
            {
                List<string> c = new List<string>() { "A", "B", "C", "D", "E", "F", "G" };
                var orderdate = Lobj.FirstOrDefault(s => s.name == "orderdate");
                string x = orderdate.vl.ToString();
                int len = x.Length;
                for (var k = 0; k < len; k++)
                {
                    int g = c.IndexOf(x[k].ToString());
                    if (g != -1)
                    {
                        Char gg = Char.Parse(c[g]);
                        string[] s = x.Split(gg);
                        string newnum = (int.Parse(s[1]) + 1).ToString();
                        if (int.Parse(newnum) < 10)
                            newnum = "0" + newnum;
                        orderdate.vl = s[0] + gg + newnum;
                    }
                }
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = codebill;
                id = 1;
                var olddata = cmd.getdatatableSQL("orderslips", "where codeid='" + codebill + "'");
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(olddata), data, "edit orderslips", "", "");
                lw.Add(htr);
            }

            var transactionbalancectm = Lobj.FirstOrDefault(s => s.name == "transactionbalancectm");
            if (transactionbalancectm.vl.ToString() == "")
                transactionbalancectm.vl = 0;
            else
                transactionbalancectm.vl = transactionbalancectm.vl.ToString().Replace(",", "");
            var salesrepresentative = Lobj.FirstOrDefault(s => s.name == "salesrepresentative");
            var issuedate = Lobj.FirstOrDefault(s => s.name == "issuedate");
            issuedate.vl = cm.converdateserver(issuedate.vl.ToString());
            var customercompany = Lobj.FirstOrDefault(s => s.name == "customercompany");
            salesrepresentative.vl = cmd.finddatasql("employee", "where name=N'" + salesrepresentative.vl + "'")["id"].ToString();
            customercompany.vl = cmd.finddatasql("customer", "where name=N'" + customercompany.vl + "'")["id"].ToString();

            var remark = Lobj.FirstOrDefault(s => s.name == "remark");
            remark.vl = remark.vl.ToString();


            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, id, "orderslips", "codeid");
            lw.Add(rs);
            return lw;
        }
        public string payment(string data,string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill", "codeorder", "paymentdate", "employer", "customer", "transactionterms", "cashT_T", "billL_C", "paymentaccount", "feesmoney", "remark", "employerstr" };
            string[] columnclient = new string[] { "codebill", "codeorder", "paymentdate", "employer", "customer", "transactionterms", "cashT_T", "billL_C", "paymentaccount", "feesmoney", "remark", "employerstr" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            double moneyT_T = double.Parse(Lobj.FirstOrDefault(s => s.name == "cashT_T").vl.ToString().Replace(",", ""));
            double moneyL_C = double.Parse(Lobj.FirstOrDefault(s => s.name == "billL_C").vl.ToString().Replace(",", ""));
            double fees = double.Parse(Lobj.FirstOrDefault(s => s.name == "feesmoney").vl.ToString().Replace(",", ""));
            dynamic newobj = new System.Dynamic.ExpandoObject();
            newobj.name = "codebill"; newobj.vl = codebill;
            string strnew = JsonConvert.SerializeObject(newobj);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(strnew));
            var epl = Lobj.FirstOrDefault(s => s.name == "employer").vl.ToString();
            string newa = cm.newstrJson("employerstr", epl);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(newa));
            Lobj.FirstOrDefault(s => s.name == "cashT_T").vl = moneyT_T.ToString();
            Lobj.FirstOrDefault(s => s.name == "billL_C").vl = moneyL_C.ToString();
            Lobj.FirstOrDefault(s => s.name == "feesmoney").vl = fees.ToString();
 
            var elm = cmd.getcolumndatatableSQL("employee", "id", "where name=N'" + epl + "' AND isdelete is null");
            if (elm.Count > 0)
                epl = elm[0]["id"].ToString();
            else
                epl = -1;
            Lobj.FirstOrDefault(s => s.name == "employer").vl = epl;
            var customer = Lobj.FirstOrDefault(s => s.name == "customer").vl.ToString();
            var elms = cmd.getcolumndatatableSQL("customer", "id", "where name=N'" + customer + "' AND isdelete is null");
            if (elms.Count > 0)
                elms = elms[0]["id"].ToString();
            Lobj.FirstOrDefault(s => s.name == "customer").vl = elms;
            var paymentdate = Lobj.FirstOrDefault(s => s.name == "paymentdate").vl.ToString();
            Lobj.FirstOrDefault(s => s.name == "paymentdate").vl = cm.converdateserver(paymentdate);
           

            int idd = -1;
            List<string> lw = new List<string>();
               string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, idd, "payment", "codeid");
            lw.Add(rs);
            cmd.Executesql(string.Join(";", lw));
            return d;
        }
        public string editpayment(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill", "codeorder", "paymentdate", "employer", "customer", "transactionterms", "cashT_T", "billL_C", "paymentaccount", "feesmoney", "remark", "employerstr" };
            string[] columnclient = new string[] { "codebill", "codeorder", "paymentdate", "employer", "customer", "transactionterms", "cashT_T", "billL_C", "paymentaccount", "feesmoney", "remark", "employerstr" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            double moneyT_T = double.Parse(Lobj.FirstOrDefault(s => s.name == "cashT_T").vl.ToString().Replace(",", ""));
            double moneyL_C = double.Parse(Lobj.FirstOrDefault(s => s.name == "billL_C").vl.ToString().Replace(",", ""));
            double fees = double.Parse(Lobj.FirstOrDefault(s => s.name == "feesmoney").vl.ToString().Replace(",", ""));
            dynamic newobj = new System.Dynamic.ExpandoObject();
            newobj.name = "codebill"; newobj.vl = codebill;
            string strnew = JsonConvert.SerializeObject(newobj);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(strnew));
            var epl = Lobj.FirstOrDefault(s => s.name == "employer").vl.ToString();
            string newa = cm.newstrJson("employerstr", epl);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(newa));
            Lobj.FirstOrDefault(s => s.name == "cashT_T").vl = moneyT_T.ToString();
            Lobj.FirstOrDefault(s => s.name == "billL_C").vl = moneyL_C.ToString();
            Lobj.FirstOrDefault(s => s.name == "feesmoney").vl = fees.ToString();

            var elm = cmd.getcolumndatatableSQL("employee", "id", "where name=N'" + epl + "' AND isdelete is null");
            if (elm.Count > 0)
                epl = elm[0]["id"].ToString();
            else
                epl = -1;
            Lobj.FirstOrDefault(s => s.name == "employer").vl = epl;
            var customer = Lobj.FirstOrDefault(s => s.name == "customer").vl.ToString();
            var elms = cmd.getcolumndatatableSQL("customer", "id", "where name=N'" + customer + "' AND isdelete is null");
            if (elms.Count > 0)
                elms = elms[0]["id"].ToString();
            else
                elms = -1;
            Lobj.FirstOrDefault(s => s.name == "customer").vl = elms;
            var paymentdate = Lobj.FirstOrDefault(s => s.name == "paymentdate").vl.ToString();
            Lobj.FirstOrDefault(s => s.name == "paymentdate").vl = cm.converdateserver(paymentdate);


            int idd =1;
            List<string> lw = new List<string>();
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, idd, "payment", "codebill");
            lw.Add(rs);
            cmd.Executesql(string.Join(";", lw));
            return d;
        }
        public string plans(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "worker", "time", "money", "remark", "codeid" };
            string[] columnclient = new string[] { "worker", "time", "money", "remark", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            int id = -1;
            if (codebill == "")
                codebill = cm.getcodeId("plan");
            else
                id = 1;
            string codeid = cm.newstrJson("codeid", codebill);
            Lobj.Add(JsonConvert.DeserializeObject(codeid));
            var worker = Lobj.FirstOrDefault(s => s.name == "worker");
            worker.vl = cmd.finddatasql("employee", "where name=N'" + worker.vl + "'")["id"].ToString();
            var time = Lobj.FirstOrDefault(s => s.name == "time");
            time.vl = DateTime.Parse(time.vl.ToString());
            var money = Lobj.FirstOrDefault(s => s.name == "money");
            money.vl =cm.converstringtomoney(money.vl.ToString());
            string rs = autosql(column, columnclient, JsonConvert.SerializeObject(Lobj), id, "plans", "codeid");
            cmd.Executesql(rs);
            return data;
        }
        public string changehouse(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
         
            string[] column = new string[] { "codedate", "worker", "sendwarehouse", "rcvwarehouse", "company", "carnum", "transportfee", "verificatio","remark","codeid" };
            string[] columnclient = new string[] { "codedate", "worker", "sendwarehouse", "rcvwarehouse", "company", "carnum", "transportfee", "verificatio", "remark", "codeid" };
        List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            int id = -1;
            if (codebill == "")
                codebill = cm.getcodeId("chang");
            else
                id = 1;
            string codeid = cm.newstrJson("codeid", codebill);
            Lobj.Add(JsonConvert.DeserializeObject(codeid));
            var worker = Lobj.FirstOrDefault(s => s.name == "worker"); 
            worker.vl = cmd.finddatasql("employee", "where name=N'" + worker.vl + "'")["id"].ToString();
            var sendwarehouse = Lobj.FirstOrDefault(s => s.name == "sendwarehouse");
            sendwarehouse.vl = cmd.finddatasql("warehouse", "where subname=N'" + sendwarehouse.vl + "'")["id"].ToString();
            var rcvwarehouse = Lobj.FirstOrDefault(s => s.name == "rcvwarehouse");
            rcvwarehouse.vl = cmd.finddatasql("warehouse", "where subname=N'" + rcvwarehouse.vl + "'")["id"].ToString();
            var company = Lobj.FirstOrDefault(s => s.name == "company");
            company.vl = cmd.finddatasql("customer", "where name=N'" + company.vl + "'")["id"].ToString();
            var transportfee = Lobj.FirstOrDefault(s => s.name == "transportfee");
            transportfee.vl = cm.converstringtomoney(transportfee.vl.ToString());
            string rs = autosql(column, columnclient, JsonConvert.SerializeObject(Lobj), id, "changewarehouse", "codeid");
            cmd.Executesql(rs);
            return data;
        }
        public string paymentorder(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill", "codeorder", "paymentdate", "employer", "customer", "transactionterms", "cashT_T", "billL_C", "paymentaccount",  "remark"};
            string[] columnclient = new string[] { "codebill", "codeorder", "paymentdate", "employer", "customer", "transactionterms", "cashT_T", "billL_C", "paymentaccount", "remark"};
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            double moneyT_T = double.Parse(Lobj.FirstOrDefault(s => s.name == "cashT_T").vl.ToString().Replace(",", ""));
            double moneyL_C = double.Parse(Lobj.FirstOrDefault(s => s.name == "billL_C").vl.ToString().Replace(",", ""));
            dynamic newobj = new System.Dynamic.ExpandoObject();
            newobj.name = "codebill"; newobj.vl = codebill;
            string strnew = JsonConvert.SerializeObject(newobj);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(strnew));
            var epl = Lobj.FirstOrDefault(s => s.name == "employer").vl.ToString();
            
            Lobj.FirstOrDefault(s => s.name == "cashT_T").vl = moneyT_T.ToString();
            Lobj.FirstOrDefault(s => s.name == "billL_C").vl = moneyL_C.ToString();
            
            var elm = cmd.getcolumndatatableSQL("employee", "id", "where name=N'" + epl + "' AND isdelete is null");
            if (elm.Count > 0)
                epl = elm[0]["id"].ToString();
            else
                epl = -1;
            Lobj.FirstOrDefault(s => s.name == "employer").vl = epl;
            var customer = Lobj.FirstOrDefault(s => s.name == "customer").vl.ToString();
            var elms = cmd.getcolumndatatableSQL("customer", "id", "where name=N'" + customer + "' AND isdelete is null");
            if (elms.Count > 0)
                elms = elms[0]["id"].ToString();
            Lobj.FirstOrDefault(s => s.name == "customer").vl = elms;
            var paymentdate = Lobj.FirstOrDefault(s => s.name == "paymentdate").vl.ToString();
            Lobj.FirstOrDefault(s => s.name == "paymentdate").vl = cm.converdateserver(paymentdate);


            int idd = -1;
            List<string> lw = new List<string>();
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, idd, "paymentOrder", "codeid");
            lw.Add(rs);
            var objo = cmd.finddatasql("paymentOrder", "where codebill='" + codebill + "'");
            if(objo.Count>0)
            {
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(objo), JsonConvert.SerializeObject(Lobj), "edit order pay", "", "");
                lw.Insert(0, htr);
                string dl = "DELETE FROM paymentOrder WHERE codebill='" + codebill + "'";
                lw.Insert(1, dl);
            }
            cmd.Executesql(string.Join(";", lw));
            return d;
        }
        public string subship(string data, int id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "idbill", "codebill", "numbership", "duedate", "departuredate", "dateofarrival", "conDuedate", "shipname", "remark"};
            string[] columnclient = new string[] { "idbill", "codebill", "numbership", "Duedate", "DepartureDate", "Dateofarrival", "containerdate", "shipname", "remark" };
            var bill = cmd.finddatasql("billbuy", "where id='" + id + "'");
            string codebill = bill["codebill"].ToString();
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            dynamic newobj = new System.Dynamic.ExpandoObject();
            newobj.name = "codebill"; newobj.vl = codebill;
            string strnew = JsonConvert.SerializeObject(newobj);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(strnew));

            dynamic idbill = new System.Dynamic.ExpandoObject();
            idbill.name = "idbill"; idbill.vl = id;
            string idbillnew = JsonConvert.SerializeObject(idbill);
            Lobj.Add(JsonConvert.DeserializeObject<dynamic>(idbillnew));
           

            foreach (var i in cvdate)
            {
                var l = Lobj.FirstOrDefault(s => s.name == i);
                if (l != null)
                    l.vl = cm.converdateserver(l.vl.ToString());
            }
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = connectsql(column, columnclient, d, -1, "subship");
            cmd.Executesql(rs);
            return d;
        }
        public string subdetailbuybill(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "dateclearance", "customsday", "port", "containernumber", "daycertificate", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "codeid" };
            string[] columnclient = new string[] { "dateclearance", "customsday", "port", "containernumber", "daycertificate", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            foreach (var i in Lobj)
            {
                string codeid = "";
                i.statusEdit = -1;
                try
                {
                    codeid = i.codeid.ToString();
                    if (codeid == "")
                        codeid = cm.getcodeId("sdt");
                    else
                        i.statusEdit = 1;
                }
                catch
                {
                    codeid = cm.getcodeId("sdt");
                }
                i.codeid = codeid;

            }

            string d = JsonConvert.SerializeObject(Lobj);
            string rs = newwork(column, columnclient, d, 1, "detailbillbuy", "codeid", "codeid");
            cmd.Executesql(rs);
            return "";
        }
        public List<string> subdetailbuybill_Str(string data, string id,string codeship)
        {
            sql cmd = new sql();
             common cm = new common();
            string[] column = new string[] { "dateclearance", "customsday", "port", "containernumber", "daycertificate", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday",  "prodcode", "casenom", "proddate", "codeid", "codeship" };
            string[] columnclient = new string[] { "dateclearance", "customsday", "port", "containernumber", "daycertificate", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday", "prodcode", "casenom", "proddate", "codeid", "codeship" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            
            foreach (var i in Lobj)
            {
                string d = JsonConvert.SerializeObject(i);
                var obj = JsonConvert.DeserializeObject<List<dynamic>>(d);
                var cship = cm.newstrJson("codeship", codeship);
                obj.Add(JsonConvert.DeserializeObject(cship));
                string dd = JsonConvert.SerializeObject(obj);
                string rs =autosql(column, columnclient,dd, 1, "detailbillbuy", "codeid");
                lw.Add(rs);
            }

            return lw;
        }
        public string orderbill(string data, string codebill)
        {
            int id = -1;
            sql cmd = new sql();
            common cm = new common();
            List<string> lw = new List<string>();
            string[] column = new string[] { "orderdate", "salesrepresentative", "customercompany", "customercontacts", "terms", "transactionbalancectm", "warehouse", "issuedate", "contactphone", "frame", "destinationaddress", "remarks", "codeid" };
            string[] columnclient = new string[] { "orderdate", "salesrepresentative", "customercompany", "customercontacts", "terms", "transactionbalancectm", "warehouse", "issuedate", "contactphone", "frame", "destinationaddress", "remark", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            string cid = cm.newstrJson("codeid", "");
            Lobj.Add(JsonConvert.DeserializeObject(cid));
            Dictionary<string, object> objrturn = new Dictionary<string, object>();
            foreach (var n in columnclient)
            {
                objrturn[n] = Lobj.FirstOrDefault(s => s.name == n).vl.ToString();
            }
            var warehouse = Lobj.FirstOrDefault(s => s.name == "warehouse");
            warehouse.vl = cm.findidobj2("warehouse", "subname=N'" + warehouse.vl.ToString() + "'", "", "id");

            if (codebill == "")
            {
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = cm.getcodeId("order");
            }
            else
            {
                List<string> c = new List<string>() { "A", "B", "C", "D", "E", "F", "G" };
                var orderdate = Lobj.FirstOrDefault(s => s.name == "orderdate");
                string x = orderdate.vl.ToString();
                int len = x.Length;
                for(var k=0;k<len;k++)
                {
                    int g = c.IndexOf(x[k].ToString());
                    if (g!=-1)
                    {
                        Char gg =Char.Parse(c[g]);
                        string[] s = x.Split(gg);
                        string newnum =(int.Parse(s[1])+1).ToString();
                        if (int.Parse(newnum) < 10)
                            newnum = "0" + newnum;
                        orderdate.vl = s[0]+ gg + newnum;
                    }
                }
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = codebill;
                id = 1;
                var olddata = cmd.getdatatableSQL("orderslips", "where codeid='" + codebill + "'");
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(olddata), data, "edit orderslips","","");
                lw.Add(htr);
            }
            
            var transactionbalancectm = Lobj.FirstOrDefault(s => s.name == "transactionbalancectm");
            if (transactionbalancectm.vl.ToString() == "")
                transactionbalancectm.vl = 0;
            else
                transactionbalancectm.vl = transactionbalancectm.vl.ToString().Replace(",", "");
            var salesrepresentative = Lobj.FirstOrDefault(s => s.name == "salesrepresentative");
            var issuedate = Lobj.FirstOrDefault(s => s.name == "issuedate");
            issuedate.vl = cm.converdateserver(issuedate.vl.ToString());
            var customercompany = Lobj.FirstOrDefault(s => s.name == "customercompany");
            salesrepresentative.vl = cmd.finddatasql("employee", "where name=N'" + salesrepresentative.vl + "'")["id"].ToString();
            customercompany.vl = cmd.finddatasql("customer", "where name=N'" + customercompany.vl + "'")["id"].ToString();
            
            var remark = Lobj.FirstOrDefault(s => s.name == "remark");
            remark.vl = remark.vl.ToString();
            
            
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, id, "orderslips", "codeid");
            lw.Add(rs);
            cmd.Executesql(string.Join(";",lw));
            return JsonConvert.SerializeObject(objrturn);
        }
        public List<string> orderbill_str(string data, string codebill,int status)
        {
            int id = -1;
            sql cmd = new sql();
            common cm = new common();
            List<string> lw = new List<string>();
            string[] column = new string[] { "orderdate", "salesrepresentative", "customercompany", "terms", "transactionbalancectm", "warehouse", "issuedate", "contactphone", "frame", "destinationaddress", "remarks", "codeid" };
            string[] columnclient = new string[] { "orderdate", "salesrepresentative", "customercompany",  "terms", "transactionbalancectm", "warehouse", "issuedate", "customercontacts", "frame", "destinationaddress", "remark", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            string cid = cm.newstrJson("codeid", codebill);
            Lobj.Add(JsonConvert.DeserializeObject(cid));
          
            var warehouse = Lobj.FirstOrDefault(s => s.name == "warehouse");
            warehouse.vl = cm.findidobj2("warehouse", "subname=N'" + warehouse.vl.ToString() + "'", "", "id");

            if (status == 1)
            {
                List<string> c = new List<string>() { "A", "B", "C", "D", "E", "F", "G" };
                var orderdate = Lobj.FirstOrDefault(s => s.name == "orderdate");
                string x = orderdate.vl.ToString();
                int len = x.Length;
                for (var k = 0; k < len; k++)
                {
                    int g = c.IndexOf(x[k].ToString());
                    if (g != -1)
                    {
                        Char gg = Char.Parse(c[g]);
                        string[] s = x.Split(gg);
                        string newnum = (int.Parse(s[1]) + 1).ToString();
                        if (int.Parse(newnum) < 10)
                            newnum = "0" + newnum;
                        orderdate.vl = s[0] + gg + newnum;
                    }
                }
                Lobj.FirstOrDefault(s => s.name == "codeid").vl = codebill;
                id = 1;
                var olddata = cmd.getdatatableSQL("orderslips", "where codeid='" + codebill + "'");
                string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(olddata), data, "edit orderslips", "", "");
                lw.Add(htr);
            }

            var transactionbalancectm = Lobj.FirstOrDefault(s => s.name == "transactionbalancectm");
            if (transactionbalancectm.vl.ToString() == "")
                transactionbalancectm.vl = 0;
            else
                transactionbalancectm.vl = transactionbalancectm.vl.ToString().Replace(",", "");
            var salesrepresentative = Lobj.FirstOrDefault(s => s.name == "salesrepresentative");
            var issuedate = Lobj.FirstOrDefault(s => s.name == "issuedate");
            issuedate.vl = cm.converdateserver(issuedate.vl.ToString());
            var customercompany = Lobj.FirstOrDefault(s => s.name == "customercompany");
            salesrepresentative.vl = cmd.finddatasql("employee", "where name=N'" + salesrepresentative.vl + "'")["id"].ToString();
            customercompany.vl = cmd.finddatasql("customer", "where name=N'" + customercompany.vl + "'")["id"].ToString();


            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, status, "orderslips", "codeid");
            lw.Add(rs);

            return lw;
        }
        public string carship(string data, string codebill)
        {
            int id = -1;
            sql cmd = new sql();
            common cm = new common();
            List<string> lw = new List<string>();
            string[] column = new string[] { "codebill", "codeid", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime", "forwardingnumber" };
            string[] columnclient = new string[] { "codebill", "codeid", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime", "forwardingnumber" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            string nn = cm.newstrJson("codeid","");
            Lobj.Add(JsonConvert.DeserializeObject(nn));
            Lobj.FirstOrDefault(s => s.name == "codeid").vl = cm.getcodeId("order");
            string getcodebill = cm.newstrJson("codebill", codebill);
            Lobj.Insert(0, JsonConvert.DeserializeObject(getcodebill));
            Dictionary<string, object> objrturn = new Dictionary<string, object>();
            foreach (var n in columnclient)
            {
                objrturn[n] = Lobj.FirstOrDefault(s => s.name == n).vl.ToString();
            }
            var company = Lobj.FirstOrDefault(s => s.name == "company");
            var deliveryworker = Lobj.FirstOrDefault(s => s.name == "deliveryworker");
            company.vl = cm.findidobj("customer", "name", company.vl.ToString(), "id");
            deliveryworker.vl =cm.findidobj("employee", "name",deliveryworker.vl.ToString(), "id");
            if (company.vl == "-1")
                return "company not exited";
            if (deliveryworker.vl == "-1")
                return "employee not exited";
            var verifyingacceptance = Lobj.FirstOrDefault(s => s.name == "verifyingacceptance");
            if (verifyingacceptance.vl.ToString().ToLower() == "true")
                verifyingacceptance.vl = 1;
            else
                verifyingacceptance.vl = 0;
            var rate = Lobj.FirstOrDefault(s => s.name == "rate");
            rate.vl = cm.converttomoney(rate.vl.ToString());
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, id, "carship", "codeid");
            lw.Add(rs);
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturn);
        }
        public string Editcarship(string data, string codebill)
        {
       
            sql cmd = new sql();
            common cm = new common();
            List<string> lw = new List<string>();
            string[] column = new string[] { "codeid", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime", "forwardingnumber" };
            string[] columnclient = new string[] { "codeid", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime", "forwardingnumber" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            string nn = cm.newstrJson("codeid", codebill);
            Lobj.Add(JsonConvert.DeserializeObject(nn));
            var olddata = cmd.getdatatableSQL("carship", "where codeid='" + codebill + "'");
            string htr = cm.savehistory(codebill, JsonConvert.SerializeObject(olddata), data, "edit carship","","");
            lw.Add(htr);
            Dictionary<string, object> objrturn = new Dictionary<string, object>();
            foreach (var n in columnclient)
            {
                objrturn[n] = Lobj.FirstOrDefault(s => s.name == n).vl.ToString();
            }
            var forwardingnumber = Lobj.FirstOrDefault(s => s.name == "forwardingnumber");
            string[] forwardingnumberl = forwardingnumber.vl.ToString().Split('-');
            string k = forwardingnumberl[1];
            if (int.Parse(k) < 10)
                k = "0" + (int.Parse(k) + 1);
            forwardingnumber.vl = forwardingnumberl[0] +"-"+ k;
            var company = Lobj.FirstOrDefault(s => s.name == "company");
            var deliveryworker = Lobj.FirstOrDefault(s => s.name == "deliveryworker");
            company.vl = cm.findidobj("customer", "name", company.vl.ToString(), "id");
            deliveryworker.vl = cm.findidobj("employee", "name", deliveryworker.vl.ToString(), "id");
            if (company.vl == "-1")
                return "company not exited";
            if (deliveryworker.vl == "-1")
                return "employee not exited";
            var verifyingacceptance = Lobj.FirstOrDefault(s => s.name == "verifyingacceptance");
            if (verifyingacceptance.vl.ToString().ToLower() == "true")
                verifyingacceptance.vl = 1;
            else
                verifyingacceptance.vl = 0;
            var rate = Lobj.FirstOrDefault(s => s.name == "rate");
            rate.vl = cm.converttomoney(rate.vl.ToString());
            string d = JsonConvert.SerializeObject(Lobj);
            string rs = autosql(column, columnclient, d, 1, "carship", "codeid");
            lw.Add(rs);
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturn);
        }
        public string detailorder(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill", "itemcode", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "itemremarks", "serialNo", "caseNo", "PRODNo", "itemid" };
            string[] columnclient = new string[] { "codebill", "itemcode", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "itemremarks", "serialNo", "caseNo", "PRODNo", "itemid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            foreach (var i in Lobj)
            {
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                string newcode = cm.newstrJson("codebill", id);
                string newprice = cm.newstrJson("price", "");
              
                string newsubprice = cm.newstrJson("pricesupply", "");
                string newvat = cm.newstrJson("vat", id);
                sLobj.Insert(0, JsonConvert.DeserializeObject(newcode));
                sLobj.Insert(6, JsonConvert.DeserializeObject(newprice));
                sLobj.Insert(7, JsonConvert.DeserializeObject(newsubprice));
                sLobj.Insert(8, JsonConvert.DeserializeObject(newvat));
              
                var itemcode = sLobj.FirstOrDefault(s => s.name == "itemcode").vl.ToString();
                var itemname = sLobj.FirstOrDefault(s => s.name == "itemname");

                string stand = sLobj.FirstOrDefault(s => s.name == "standard").vl.ToString();
                var totalamount = sLobj.FirstOrDefault(s => s.name == "totalamount");
                double totalmn = double.Parse(totalamount.vl.ToString().Replace(",", ""));
                double vat = Math.Floor(totalmn / 11);
                double sp = vat * 10;
                string qltincase = sLobj.FirstOrDefault(s => s.name == "qltincase").vl.ToString();
                double b = double.Parse(qltincase.Replace(",", ""));
                string[] sizes = stand.Split('*');
                double size1 = double.Parse(sizes[0].Replace(",", "")) / 1000;
                double size2 = double.Parse(sizes[1].Replace(",", "")) / 1000;
                double ttsize = size1 * size2;
                double end = ttsize * b * 10.764;
                double price = Math.Floor(sp / end);
                sLobj.FirstOrDefault(s => s.name == "vat").vl = vat.ToString();
                sLobj.FirstOrDefault(s => s.name == "pricesupply").vl = sp.ToString();
                sLobj.FirstOrDefault(s => s.name == "price").vl = price.ToString();
                string iditem = cm.findidobj2("ItemList", "itemname=N'" + itemname.vl + "' AND standard=N'" + stand + "'", itemcode, "id");
                string itemid = cm.newstrJson("itemid", iditem);
                sLobj.Add(JsonConvert.DeserializeObject(itemid));
                totalamount.vl = totalmn.ToString();
                Dictionary<string, object> objrturn = new Dictionary<string, object>();
                foreach (var n in columnclient)
                {
                    objrturn[n] = sLobj.FirstOrDefault(s => s.name == n).vl.ToString();
                }
                objrturns.Add(objrturn);
                
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, -1, "detailorder", "codebill");
                lw.Add(rs);
            }
            var htrdt = cmd.getdatatableSQL("detailorder", "where codebill='" + id + "'");
            if (htrdt.Count > 0)
            {
                string htr = cm.savehistory(id, JsonConvert.SerializeObject(htrdt), JsonConvert.SerializeObject(objrturns), "edit fetail order","","");
                lw.Insert(0, htr);
                string dl = "DELETE FROM detailorder WHERE codebill='" + id + "'";
                lw.Insert(1, dl);
            }
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturns);
        }
        public List<string> detailorder_str(string data, string id,int status)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill", "itemcode", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "itemremarks", "serialNo", "caseNo", "PRODNo", "itemid","codeid" };
            string[] columnclient = new string[] { "codebill", "itemcode", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "itemremarks", "serialNo", "caseNo", "PRODNo", "itemid", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            foreach (var i in Lobj)
            {
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                string newcode = cm.newstrJson("codebill", id);
                string newprice = cm.newstrJson("price", "");
   
                string newsubprice = cm.newstrJson("pricesupply", "");
                string newvat = cm.newstrJson("vat", id);
                sLobj.Insert(0, JsonConvert.DeserializeObject(newcode));
                sLobj.Insert(6, JsonConvert.DeserializeObject(newprice));
                sLobj.Insert(7, JsonConvert.DeserializeObject(newsubprice));
                sLobj.Insert(8, JsonConvert.DeserializeObject(newvat));
                
                var itemcode = sLobj.FirstOrDefault(s => s.name == "itemcode");
                var itemname = sLobj.FirstOrDefault(s => s.name == "itemname");
                if(status==-1)
                {
                    var codeid = sLobj.FirstOrDefault(s => s.name == "codeid");
                    codeid.vl = cm.getcodeId("dtorder");
                }
                string stand = sLobj.FirstOrDefault(s => s.name == "standard").vl.ToString();
                var totalamount = sLobj.FirstOrDefault(s => s.name == "totalamount");
                double totalmn = double.Parse(totalamount.vl.ToString().Replace(",", ""));
                double vat = Math.Floor(totalmn / 11);
                double sp = vat * 10;
                string qltincase = sLobj.FirstOrDefault(s => s.name == "qltincase").vl.ToString();
                double b = double.Parse(qltincase.Replace(",", ""));
                string[] sizes = stand.Split('*');
                double size1 = double.Parse(sizes[0].Replace(",", "")) / 1000;
                double size2 = double.Parse(sizes[1].Replace(",", "")) / 1000;
                double ttsize = size1 * size2;
                double end = ttsize * b * 10.764;
                double price = Math.Floor(sp / end);
                sLobj.FirstOrDefault(s => s.name == "vat").vl = vat.ToString();
                sLobj.FirstOrDefault(s => s.name == "pricesupply").vl = sp.ToString();
                sLobj.FirstOrDefault(s => s.name == "price").vl = price.ToString();
                string iditem = cm.findidobj2("ItemList", "itemname=N'" + itemname.vl.ToString() + "' AND standard=N'" + stand + "'", itemcode.vl.ToString(), "id");
                string itemid = cm.newstrJson("itemid", iditem);
                sLobj.Add(JsonConvert.DeserializeObject(itemid));
                totalamount.vl = totalmn.ToString();
        
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, -1, "detailorder", "codebill");
                lw.Add(rs);
            }
            if (status == 1)
            {
                var htrdt = cmd.getdatatableSQL("detailorder", "where codebill='" + id + "'");
                if (htrdt.Count > 0)
                {
                    string htr = cm.savehistory(id, JsonConvert.SerializeObject(htrdt), JsonConvert.SerializeObject(objrturns), "edit fetail order", "", "");
                    lw.Insert(0, htr);
                    string dl = "DELETE FROM detailorder WHERE codebill='" + id + "'";
                    lw.Insert(1, dl);
                }
            }
            return lw;
        }
        public string detailchange(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "codebill", "itemcode", "nameitem", "standard", "qltincase", "qltbox", "serinum", "proplem", "remark","itemid"};
            string[] columnclient = new string[] { "codebill", "itemcode", "itemname", "standard", "qltincase", "qltbox", "serinum", "proplem", "remark", "itemid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lw = new List<string>();
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            foreach (var i in Lobj)
            {
                List<dynamic> sLobj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                string newcode = cm.newstrJson("codebill", id);
                string itemid = cm.newstrJson("itemid", "");
              
                sLobj.Insert(0, JsonConvert.DeserializeObject(newcode));
                sLobj.Add(JsonConvert.DeserializeObject(itemid));
             
                var itemcode = sLobj.FirstOrDefault(s => s.name == "itemcode").vl.ToString();
                var itemname = sLobj.FirstOrDefault(s => s.name == "itemname");
                string stand = sLobj.FirstOrDefault(s => s.name == "standard").vl.ToString();
                var itemids = sLobj.FirstOrDefault(s => s.name == "itemid");
                Dictionary<string, object> objrturn = new Dictionary<string, object>();
                foreach (var n in columnclient)
                {
                    objrturn[n] = sLobj.FirstOrDefault(s => s.name == n).vl.ToString();
                }
                objrturns.Add(objrturn);
                itemids.vl = cm.findidobj2("ItemList", "itemname=N'" + itemname.vl + "' AND standard=N'" + stand + "'", itemcode, "id");
               
                string d = JsonConvert.SerializeObject(sLobj);
                string rs = autosql(column, columnclient, d, -1, "detailchangewarehouse", "codebill");
                lw.Add(rs);
            }
            var htrdt = cmd.getdatatableSQL("detailchangewarehouse", "where codebill='" + id + "'");
            if (htrdt!=null)
            {
                string htr = cm.savehistory(id, JsonConvert.SerializeObject(htrdt), JsonConvert.SerializeObject(objrturns), "edit fetail order","","");
                lw.Insert(0, htr);
                string dl = "DELETE FROM detailchangewarehouse WHERE codebill='" + id + "'";
                lw.Insert(1, dl);
            }
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturns);
        }
        public string serinumber(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "serinumber"};
            string[] columnclient = new string[] { "serinumber"};
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lwcode = new List<string>();
            foreach (var i in Lobj)
            {
                lwcode.Add(i.vl.ToString());
            }
            string str = string.Join(",", lwcode);
            string rs = cmd.updatesqlOneItemstrfollowkey("ship", new List<string>() { "serinumber" }, new List<string>() { str }, "id", id);
            cmd.Executesql(rs);
            return JsonConvert.SerializeObject(data);
        }
        public string inspection(string data, string id)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "inspnumber", "warehouse", "workerone", "workertwo", "remarks" };
            string[] columnclient = new string[] { "inspnumber", "warehouse", "worker1", "worker2", "remarks" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<string> lwcode = new List<string>();
            var warehouse = Lobj.FirstOrDefault(s => s.name == "warehouse");
            var workerone = Lobj.FirstOrDefault(s => s.name == "worker1");
            var workertwo = Lobj.FirstOrDefault(s => s.name == "worker2");
            warehouse.vl = cmd.finddatasql("warehouse", "where subname=N'" + warehouse.vl + "'")["id"].ToString();
            workerone.vl = cmd.finddatasql("employee", "where name=N'" + workerone.vl + "'")["id"].ToString();
            workertwo.vl = cmd.finddatasql("employee", "where name=N'" + workertwo.vl + "'")["id"].ToString();
            string str = autosql(column, columnclient,JsonConvert.SerializeObject(Lobj), -1, "inspection", "codeid");
            cmd.Executesql(str);
            return JsonConvert.SerializeObject(data);
        }
        public string tberorr(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "numbercode", "poor_handling_charge", "warehouse_id", "defective_processing_type", "approved", "remark","codeid" };
            string[] columnclient = new string[] { "numbercode", "poor_handling_charge", "warehouse_id", "defective_processing_type", "approved", "remark", "codeid" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            int id = -1;
            if (codebill == "")
                codebill = cm.getcodeId("plan");
            else
                id = 1;
            string codeid = cm.newstrJson("codeid", codebill);
            Lobj.Add(JsonConvert.DeserializeObject(codeid));
            Dictionary<string, object> objrturn = new Dictionary<string, object>();
            foreach (var n in columnclient)
            {
                objrturn[n] = Lobj.FirstOrDefault(s => s.name == n).vl.ToString();
            }

            var warehouse_id = Lobj.FirstOrDefault(s => s.name == "warehouse_id");
            warehouse_id.vl = cmd.finddatasql("warehouse", "where subname=N'" + warehouse_id.vl + "'")["id"].ToString();
            var poor_handling_charge = Lobj.FirstOrDefault(s => s.name == "poor_handling_charge");
            poor_handling_charge.vl = cmd.finddatasql("employee", "where name=N'" + poor_handling_charge.vl + "'")["id"].ToString();
            string rs = autosql(column, columnclient, JsonConvert.SerializeObject(Lobj), id, "Table_Erorr", "codeid");
            cmd.Executesql(rs);
            return JsonConvert.SerializeObject(objrturn);
        }

        public string table_detail_erorr(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "Item_id", "Defect_type", "remark", "Documents_attach", "qltincase", "qltbox", "codebill" };
            string[] columnclient = new string[] { "Item_id", "proplem", "remark", "Documents_attach", "qltincase", "qltbox", "codebill" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            List<string> lw = new List<string>();
            foreach (var i in Lobj)
            {
                List<dynamic> obj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                string newcode = cm.newstrJson("codebill", codebill);
                obj.Insert(0, JsonConvert.DeserializeObject(newcode));
                Dictionary<string, object> objrturn = new Dictionary<string, object>();
                string nameIt = obj.FirstOrDefault(s => s.name == "itemname").vl.ToString();
                string standar = obj.FirstOrDefault(s => s.name == "standard").vl.ToString();
                
                string idItem = cm.findidobj2("ItemList", "itemname=N'" + nameIt + "' AND standard=N'" + standar + "'", "", "id");
              
                objrturn["Item_id"] = idItem;
                foreach (var j in columnclient)
                {
                    try
                    {
                        objrturn[j] = obj.FirstOrDefault(s => s.name == j).vl.ToString();
                    }
                    catch
                    {

                    }
                }
                string d = JsonConvert.SerializeObject(objrturn);
                string rs = autosql_dynamic(column, columnclient, d, -1, "table_detail_erorr", "codebill");
                lw.Add(rs);
                
                objrturns.Add(objrturn);
            }
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturns);
        }
        public string table_detail_erorr_qlt(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "Item_id", "Defect_type","qltincase", "qltbox", "serinum", "remark",  "codebill" };
            string[] columnclient = new string[] { "Item_id", "proplem","qltincase", "qltbox", "serinum", "remark",  "codebill" };
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            List<string> lw = new List<string>();
            foreach (var i in Lobj)
            {
                List<dynamic> obj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                string newcode = cm.newstrJson("codebill", codebill);
                obj.Insert(0, JsonConvert.DeserializeObject(newcode));
                Dictionary<string, object> objrturn = new Dictionary<string, object>();
                string nameIt = obj.FirstOrDefault(s => s.name == "itemname").vl.ToString();
                string standar = obj.FirstOrDefault(s => s.name == "standard").vl.ToString();

                string idItem = cm.findidobj2("ItemList", "itemname=N'" + nameIt + "' AND standard=N'" + standar + "'", "", "id");

                objrturn["Item_id"] = idItem;
                foreach (var j in columnclient)
                {
                    try
                    {
                        objrturn[j] = obj.FirstOrDefault(s => s.name == j).vl.ToString();
                    }
                    catch
                    {

                    }
                }
                if (idItem != "-1")
                {
                    string d = JsonConvert.SerializeObject(objrturn);
                    string rs = autosql_dynamic(column, columnclient, d, -1, "table_detail_erorr", "codebill");
                    lw.Add(rs);

                    objrturns.Add(objrturn);
                }
            }
            string dl = "DELETE FROM table_detail_erorr WHERE codebill='" + codebill + "'";
            lw.Insert(0, dl);
            if (lw.Count>0)
            cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturns);
        }
        public string update_table_detail_erorr_qlt(string data, string codebill)
        {
            sql cmd = new sql();
            common cm = new common();
            string[] column = new string[] { "remarkremove", "qltremove"};
            string[] columnclient = new string[] {"remarkremove", "qltremove"};
            List<dynamic> Lobj = JsonConvert.DeserializeObject<List<dynamic>>(data);
            List<Dictionary<string, object>> objrturns = new List<Dictionary<string, object>>();
            List<string> lw = new List<string>();
            foreach (var i in Lobj)
            {
                List<dynamic> obj = JsonConvert.DeserializeObject<List<dynamic>>(JsonConvert.SerializeObject(i));
                string newcode = cm.newstrJson("codebill", codebill);
                obj.Insert(0, JsonConvert.DeserializeObject(newcode));
                string d = JsonConvert.SerializeObject(i);
                string rs = autosql(column, columnclient, d, 1, "table_detail_erorr", "id");
                lw.Add(rs);
            }
            if (lw.Count > 0)
                cmd.Executesql(string.Join(";", lw));
            return JsonConvert.SerializeObject(objrturns);
        }
    }
    }