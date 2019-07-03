using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using ClosedXML.Excel;
using Newtonsoft.Json;
namespace hansung
{
    public class common
    {
        public string[] clgetdata = new string[] { };
        public string[] cvdate = new string[] { "paymentdate", "creditduedate", "duedate", "conDuedate", "departuredate", "datebeginpayment", "dateofarrival", "dateconfirmation", "contractdate", "confirmreceiptday", "requestday", "conreturnday", "containerday", "daycertificate", "customsday", "dateclearance" };
        public string[] tdright = new string[] { "qltcase", "price", "pricesupply", "vat", "totalamount" , "rate", "tolerancemoney" };
        public List<string> moneycl =new List<string>() { "qltcase", "price", "pricesupply", "vat", "totalamount", "rate" , "tolerancemoney", "billL_C", "total", "cashT_T", "feesmoney", "sumofpayments" };
        public double parse(string a)
        {
            try
            {
                return double.Parse(a.Replace(",",""));
            }
            catch
            {
                return 0;
            }
        }
        public string converstringtomoney(string mn)
        {
            return mn.Replace(",", "");
        }
        public string newstrJson(string name,string vl)
        {
            dynamic newobj = new System.Dynamic.ExpandoObject();
            newobj.name = name; newobj.vl = vl;
            string strnew = JsonConvert.SerializeObject(newobj);
            return strnew;
        }
        public List<Dictionary<string, object>> objplans(string where, List<Dictionary<string, object>> employer)
        {
            sql sql = new sql();
            var mainData = sql.getdatatableSQL("plans", "order by id desc");
            foreach (var i in mainData)
            {
                i["worker"] = getdatainlist(employer, i["worker"].ToString(), "name");
                i["time"] = converdate("yyyy.MM", i["time"].ToString());
                i["money"] = String.Format("{0:0,0}", i["money"]);
            }
            return mainData;
        }

        public List<Dictionary<string, object>> objTable_Erorr(string where)
        {
            sql sql = new sql();
            common cm = new common();
            string[] table_erorr = new string[] { "numbercode", "poor_handling_charge", "warehouse_id", "defective_processing_type", "approved", "remark" };
            string[] item = new string[] { "itemcode", "itemname", "standard" };
            string[] table_detail = new string[] { "qltincase", "qltbox", "qltremove", "serinum", "Defect_type", "remark as remark1", "remarkremove" };
            string[] warehouse = new string[] { "name as housename"};
            string[] employer = new string[] { "name as namewk" };
            string table = getclumn(table_erorr, "Table_Erorr");
            string itemstr = getclumn(item, "ItemList");
            string employerstr = getclumn(employer, "employee");
            string warehousestr = getclumn(warehouse, "warehouse");
            string tb_detail = getclumn(table_detail, "table_detail_erorr");
            string str = "select " + table + "," + tb_detail + "," + itemstr + ","+ warehousestr + ","+ employerstr + ""+
                        " from Table_Erorr left join table_detail_erorr on Table_Erorr.codeid=table_detail_erorr.codebill "+
                        " left join ItemList on table_detail_erorr.Item_id=ItemList.id"+
                        " left join warehouse on Table_Erorr.warehouse_id=warehouse.id"+
                        " left join employee on Table_Erorr.poor_handling_charge=employee.id";
            var mainData = sql.getdatatablejoinSQL(str);
            foreach(var i in mainData)
            {
                i["approved"] = cm.converdate("yy.MM.dd", i["approved"].ToString());
                string itemcodea = itemcode(i["itemcode"].ToString(),4);
                if (itemcodea != "0000")
                    itemcodea = itemcodea + "-01";
                else
                    itemcodea = "";
                i["itemcodenew"] = itemcodea;
            }
            return mainData;
        }
        public List<Dictionary<string, object>> s_objpayment2_9(string where)
        {

            sql sql = new sql();
            string[] table_bill = new string[] { "ordernumber", "orderingemployer", "tradingmission" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance" };
            string[] payment = new string[] { "cashT_T", "billL_C", "feesmoney", "remark", "paymentdate", "paymentaccount" };
            string table = getclumn(table_bill, "billbuy");
            string employerstr = getclumn(employer, "employee");
            
            string tb_cuctomer = getclumn(cuctomer, "customer");
      
            string tb_payment = getclumn(payment, "payment");
            string str = "select " + table + "," + employerstr + "," + tb_cuctomer + "," + tb_payment + "" +
               " from billbuy " +
               " left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill" +
               " left join employee on billbuy.orderingemployer=employee.id" +
               " left join customer on billbuy.tradingmission=customer.id" +
               " left join payment on billbuy.codeid=payment.codebill " + where +
               " group by " + table + "," + tb_payment + ",employee.name,customer.name,customer.transactionbalance";
            var mainData = sql.getdatatablejoinSQL(str);
            foreach (var i in mainData)
            {
                double sumofpayments = parse(i["cashT_T"].ToString()) + parse(i["billL_C"].ToString()) + parse(i["feesmoney"].ToString());
                i["sumofpayments"] = sumofpayments;
                i["total"] = sumofpayments + parse(i["transactionbalance"].ToString());
                foreach (var j in clgetdata)
                {
                    if (cvdate.Contains(j))
                    {
                        i[j] = converdate("yy.MM.dd", i[j].ToString());
                    }
                    if (moneycl.Contains(j))
                    {
                        i[j] = convernumbertostring(i[j].ToString());
                    }
                }
            }
            return mainData;
        }
        public List<Dictionary<string, object>> s_objpayment(string where)
        {

            sql sql = new sql();
            string[] table_bill = new string[] { "ordernumber", "datebeginpayment", "paymentoption", "creditduedate", "tolerancemoney", "usance", "tolerancepercent", "note", "orderingemployer", "tradingmission", "namewarehouse", "terms", "remark", "notebill" };
            string[] item = new string[] { "itemname", "standard" };
            string[] table_detail = new string[] { "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount" };
            string[] warehouse = new string[] { "name as housename" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm","transactionbalance" };
            string[] ship = new string[] { "port", "customsday","numbership", "duedate", "departuredate", "dateofarrival" };
            string[] payment = new string[] { "cashT_T","billL_C", "feesmoney", "remark" };
            string table = getclumn(table_bill, "billbuy");
            string itemstr = getclumn(item, "ItemList");
            string employerstr = getclumn(employer, "employee");
            string warehousestr = getclumn(warehouse, "warehouse");
            string tb_detail = getclumn(table_detail, "detailbillbuy");
            string tb_cuctomer = getclumn(cuctomer, "customer");
            string tb_ship = getclumn(ship, "ship");
            string tb_payment = getclumn(payment, "payment");
            string str = "select " + table + "," + tb_detail + "," + itemstr + "," + employerstr + "," + warehousestr + "," + tb_cuctomer + "," + tb_ship + "," + tb_payment +"" +
               " from billbuy " +
               " left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill" +
                " left join ItemList on detailbillbuy.iditem=ItemList.id" +
                " left join employee on billbuy.orderingemployer=employee.id" +
                " left join customer on billbuy.tradingmission=customer.id" +
                " left join ship on billbuy.codeid=ship.codebill" +
                " left join payment on billbuy.codeid=payment.codebill" +
               " left join warehouse on billbuy.warehouse=warehouse.id " + where+
               " group by "+ table + ",ItemList.itemname,ItemList.standard,"+ tb_detail + ",employee.name,warehouse.name,customer.name,customer.transactionbalance,"+tb_ship+","+tb_payment+"";

            var mainData = sql.getdatatablejoinSQL(str);
            foreach (var i in mainData) {
                double sumofpayments= parse(i["cashT_T"].ToString()) + parse(i["billL_C"].ToString()) + parse(i["feesmoney"].ToString());
                i["sumofpayments"] = sumofpayments;
                i["total"] = sumofpayments+parse(i["transactionbalance"].ToString());
                foreach (var j in clgetdata)
                {
                    if (cvdate.Contains(j))
                    {
                        i[j] = converdate("yy.MM.dd", i[j].ToString());
                    }
                    if (moneycl.Contains(j))
                    {
                        i[j] = convernumbertostring(i[j].ToString());
                    }
                }
            }
            return mainData;
        }
        public List<Dictionary<string, object>> s_obj_buy_in_contry(string where)
        {

            sql sql = new sql();
            string[] table_bill = new string[] { "ordernumber", "orderingemployer", "tradingmission", "namewarehouse", "terms", "remark" };
            string[] item = new string[] {  "itemname", "standard" };
            string[] table_detail = new string[] { "quantityincase","qltcase","price","pricesupply","vat","totalamount"};
            string[] warehouse = new string[] { "name as housename" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm" };
            string table = getclumn(table_bill, "billbuy");
            string itemstr = getclumn(item, "ItemList");
            string employerstr = getclumn(employer, "employee");
            string warehousestr = getclumn(warehouse, "warehouse");
            string tb_detail = getclumn(table_detail, "detailbillbuy");
            string tb_cuctomer = getclumn(cuctomer, "customer");
            string str = "select "+ table + ","+ tb_detail + ","+ itemstr + ","+ employerstr + ","+ warehousestr + ","+ tb_cuctomer + " from billbuy " +
               " left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill" +
                " left join ItemList on detailbillbuy.iditem=ItemList.id" +
                " left join employee on billbuy.orderingemployer=employee.id" +
                " left join customer on billbuy.tradingmission=customer.id" +
               " left join warehouse on billbuy.warehouse=warehouse.id " + where;

            var mainData = sql.getdatatablejoinSQL(str);
            foreach (var i in mainData)
            {
                foreach (var j in clgetdata)
                {
                    if (moneycl.IndexOf(j) > -1)
                    {
                        i[j] =convernumbertostring(i[j].ToString());
                    }
                }
            }
            return mainData;
        }
        public List<Dictionary<string, object>> objpayment(string where, List<Dictionary<string, object>> employer, List<Dictionary<string, object>> customer, List<Dictionary<string, object>> litem)
        {
            sql sql = new sql();
            string str = "select billbuy.*,payment.*,detailbillbuy.*,ship.*,customer.transactionbalance from billbuy " +
               " left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill" +
                " left join payment on billbuy.codeid=payment.codebill" +
                " left join customer on billbuy.tradingmission=customer.id" +
               " left join ship on billbuy.codeid=ship.codebill " + where;
            
            var mm = sql.getdatatablejoinSQL(str);
       
            var a = sql.getdatatableSQL("billbuy", where);
           
            List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
          
            foreach (var i in a)
            {
                Dictionary<string, object> mdata = new Dictionary<string, object>();
                var o = mm.FirstOrDefault(s => s["ordernumber"].ToString() == i["ordernumber"].ToString());
                o["nameitem"] = getdatainlist(litem, o["nameitem"].ToString(), "itemname");
                foreach (var j in cvdate)
                {
                    try
                    {
                        o[j] = converdate("yy.MM.dd", o[j].ToString());
                    }
                    catch
                    {

                    }
                }
                foreach (var j in clgetdata)
                {
                    try
                    {
                        mdata[j] = o[j].ToString();
                    }
                    catch { }
                    if (moneycl.IndexOf(j) > -1)
                    {
                        try
                        {
                            mdata[j] = String.Format("{0:0,0}", o[j]);
                        }
                        catch { }

                    }
                }
                
                mdata["sumofpayments"] = parse(o["cashT_T"].ToString()) + parse(o["billL_C"].ToString()) + parse(o["feesmoney"].ToString());
                mdata["total"] = parse(o["transactionbalance"].ToString()) - parse(mdata["sumofpayments"].ToString());

                mainData.Add(mdata);
            }
            return mainData;
        }
        public List<Dictionary<string, object>> objOrderpayment(string where, List<Dictionary<string, object>> employer, List<Dictionary<string, object>> customer, List<Dictionary<string, object>> litem)
        {
            sql sql = new sql();
            string orderslips = "orderslips.*";
            string[] detailorder =new string[] { "itemname","standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount" };
            string dtail=  getclumn(detailorder, "detailorder");
            string str = "select "+orderslips+ ",paymentOrder.*,"+ dtail + ",carship.*,customer.transactionbalance from orderslips " +
               " left join paymentOrder on orderslips.codeid=paymentOrder.codebill" +
               " left join detailorder on orderslips.codeid=detailorder.codebill" +
               " left join customer on orderslips.customercompany=customer.id" +
               " left join carship on orderslips.codeid=carship.codebill";
            var mainData = new List<Dictionary<string, object>>();
            var mm = sql.getdatatablejoinSQL(str);
            var a = sql.getdatatableSQL("orderslips", where);
            foreach (var i in a)
            {
                Dictionary<string, object> mdata = new Dictionary<string, object>();
                var o = mm.FirstOrDefault(s => s["orderdate"].ToString() == i["orderdate"].ToString());
                o["itemname"] = getdatainlist(litem, o["itemname"].ToString(), "itemname");
                o["salesrepresentative"] = getdatainlist(employer, o["salesrepresentative"].ToString(), "name");
                o["customercompany"] = getdatainlist(customer, o["customercompany"].ToString(), "name");
                foreach (var j in cvdate)
                {
                    try
                    {
                        o[j] = converdate("yy.MM.dd", o[j].ToString());
                    }
                    catch
                    {

                    }
                }
                mdata["sumofpayments"] = parse(o["cashT_T"].ToString()) + parse(o["billL_C"].ToString()) + parse(o["feesmoney"].ToString());
                mdata["moneysale"] = mm.Where(s => s["orderdate"].ToString() == i["orderdate"].ToString()).Sum(s => parse(s["totalamount"].ToString()));
                string aa = mdata["moneysale"].ToString();
                var bb = o["transactionbalancectm"].ToString();
                mdata["summoney"] = parse(aa) + parse(bb);
                mdata["total"] = parse(mdata["summoney"].ToString()) - parse(mdata["sumofpayments"].ToString());
                foreach (var j in clgetdata)
                {
                    try
                    {
                          mdata[j] = o[j].ToString();
                    }
                    catch { }
                    if(moneycl.IndexOf(j)!=-1)
                        mdata[j] = String.Format("{0:0,0}", mdata[j]);
                }
                 mainData.Add(mdata);
            }
            return mainData;
        }
        public List<Dictionary<string, object>> s_objOrder(string where)
        {
            sql sql = new sql();
            string[] item = new string[] { "itemname", "standard" };
            string[] table_detail = new string[] { "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount" };
            string[] employer = new string[] { "name as namewk" };
            string[] carship = new string[] { "shippingtime" };
            string[] cuctomer = new string[] { "name as namectm" };
            string[] orderslips = new string[] {"id as idbill", "salesrepresentative", "customercompany", "warehouse" };
            string tb_cuctomer = getclumn(cuctomer, "customer");
            string table = getclumn(orderslips, "orderslips");
            string tb_item = getclumn(item, "ItemList");
            string tb_detail = getclumn(table_detail, "detailorder");
            string tb_car= getclumn(carship, "carship");
            string tb_employer = getclumn(employer, "employee");
            string bill = "select " + tb_item + "," + table + "," + tb_detail + "," + tb_detail + "," + tb_car + "," + tb_employer + ","+ tb_cuctomer + ",warehouse.subname as store" +
                " from orderslips left join detailorder on orderslips.codeid=detailorder.codebill" +
                " left join carship on orderslips.codeid=carship.codebill " +
                " left join employee on orderslips.salesrepresentative=employee.id " +
                " left join customer on orderslips.customercompany=customer.id " +
                " left join warehouse on orderslips.warehouse=warehouse.id " +
                " left join ItemList on detailorder.itemid=ItemList.id " + where+ " order by orderslips.id desc";
            var mainData = sql.getdatatablejoinSQL(bill);
           foreach(var i in mainData)
            {
                foreach (var j in clgetdata)
                {
                    if (cvdate.Contains(j))
                    {
                        i[j] = converdate("yy.MM.dd", i[j].ToString());
                    }
                    if (moneycl.Contains(j))
                    {
                        i[j] = convernumbertostring(i[j].ToString());
                    }
                }
                i["shippingtime"] = converdate("yy.MM.dd H:mm", i["shippingtime"].ToString());
            }
            return mainData;
        }
        public List<Dictionary<string, object>> s_paymentfrom3_1(string where)
        {
            sql sql = new sql();

            string[] table_bill = new string[] { "salesrepresentative", "customercompany" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance" };
            string[] payment = new string[] { "cashT_T", "billL_C", "feesmoney", "remark", "paymentdate", "paymentaccount" };

            string tb_cuctomer = getclumn(cuctomer, "customer");
            string table = getclumn(table_bill, "orderslips");
            string tb_employer = getclumn(employer, "employee");
            string tb_payment = getclumn(payment, "paymentOrder");
            string bill = "select " + table + "," + tb_employer + "," + tb_cuctomer + ","+ tb_payment + "" +
                " from orderslips " +
                " left join employee on orderslips.salesrepresentative=employee.id " +
                " left join customer on orderslips.customercompany=customer.id " +
                " left join paymentOrder on orderslips.codeid=paymentOrder.codebill " + where + " order by orderslips.id desc";
            var mainData = sql.getdatatablejoinSQL(bill);
            foreach (var i in mainData)
            {
                double sumofpayments = parse(i["cashT_T"].ToString()) + parse(i["billL_C"].ToString()) + parse(i["feesmoney"].ToString());
                i["sumofpayments"] = sumofpayments;
                i["total"] = sumofpayments + parse(i["transactionbalance"].ToString());

                foreach (var j in clgetdata)
                {
                    if (cvdate.Contains(j))
                    {
                        i[j] = converdate("yy.MM.dd", i[j].ToString());
                    }
                    if (moneycl.Contains(j))
                    {
                        i[j] = convernumbertostring(i[j].ToString());
                    }
                }
               
            }
            return mainData;
        }

        public List<Dictionary<string, object>> objOrder(string where,List<Dictionary<string, object>> employer, List<Dictionary<string, object>> customer, List<Dictionary<string, object>> litem)
        {
            sql sql = new sql();
            string strcar = stringCarship();
            string stringorded = stringordedt();
            string bill = "select " + strcar + ",orderslips.*," + stringorded + " from orderslips left join detailorder on orderslips.codeid=detailorder.codebill left join carship on orderslips.codeid=carship.codebill "+ where + " order by id desc";
            var mainData = sql.getdatatablejoinSQL(bill);
            foreach (var i in mainData)
            {
                i["company"] = getdatainlist(customer, i["company"].ToString(), "name");
                i["deliveryworker"] = getdatainlist(employer, i["deliveryworker"].ToString(), "name");
                i["salesrepresentative"] = getdatainlist(employer, i["salesrepresentative"].ToString(), "name");
                i["itemname"] = getdatainlist(litem, i["itemname"].ToString(), "itemname");
                i["codeid"] = getdatainlist(customer, i["customercompany"].ToString(), "ctmzone");
                i["customercompany"] = getdatainlist(customer, i["customercompany"].ToString(), "name");
                i["issuedate"] = converdate("yy.MM.dd",i["issuedate"].ToString());
                i["itemcode"] = getdatainlist(litem, i["itemname"].ToString(), "itemduzoncode");
                i["shippingtime"] = converdate("yy.MM.dd H:mm", i["shippingtime"].ToString());
                i["rate"] = String.Format("{0:0,0}", i["rate"]);
                i["price"] = String.Format("{0:0,0}", i["price"]);
                i["pricesupply"] = String.Format("{0:0,0}", i["pricesupply"]);
                i["vat"] = String.Format("{0:0,0}", i["vat"]);
                i["totalamount"] = String.Format("{0:0,0}", i["totalamount"]);
                if (i["verifyingacceptance"].ToString().ToLower() == "true")
                    i["verifyingacceptance"] = "OK";
                else
                    i["verifyingacceptance"] = "";
            }
            return mainData;
        }
        public string itemcode(string c,int n)
        {
            int a = c.Length;
            if(a<n)
            {
                int v = n - a;
                for(var i=0;i<v;i++)
                {
                    c = "0" + c;
                }
            }
            return c;
        }
        public string stringCarship()
        {
            string[] car = new string[] { "forwardingnumber", "company", "numberofvehicles", "rate", "verifyingacceptance", "deliveryworker", "shippingtime" };
            string strcar = getclumn(car, "carship");

            return strcar;
        }
        public string stringordedt()
        {
            string[] detail = new string[] { "itemcode", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "itemremarks", "serialNo", "caseNo", "PRODNo" };
            string str = getclumn(detail, "detailorder");

            return str;
        }
        public string getclumn(string[] a,string tb)
        {
            List<string> l = new List<string>();
            foreach(var i in a)
            {
                var b = tb + "." + i;
                l.Add(b);
            }
            return string.Join(",", l);
        }
        public string converttomoney(string vl)
        {
                return vl.Replace(",","");
        }
        public string findidobj(string table,string columncp,string vl,string clget)
        {
            sql sql = new sql();
            try
            {
                return sql.finddatasql(table, "where "+ columncp + "=N'" + vl + "'")[clget].ToString();
            }
            catch
            {
                return "-1";
            }
        }
        public string findidobj2(string table, string columncp, string vl, string clget)
        {
            sql sql = new sql();
            try
            {
                return sql.finddatasql(table, "where " + columncp)[clget].ToString();
            }
            catch
            {
                return "-1";
            }
        }
        public string savehistory(string codeid, string oldstr,string data,string act,string subcode,string inforbill)
        {
            sql sql = new sql();
            string[] htr = new string[] { "codeid", "contenold", "contennew", "actions", "subcode", "inforbill" };
            string[] vlhtr = new string[] { codeid, oldstr, data, act, subcode , inforbill };
            string cretehtr = sql.insertstr("historybillsale", htr.ToList(), vlhtr.ToList());
            return cretehtr;
        }
        public string getcodeId(string ext)
        {
            string g = ext + Guid.NewGuid().ToString().Replace("-", "");
            return g;
        }
        public string converdate(string fotmat,string value)
        {
            try
            {
                return DateTime.Parse(value).ToString("yyyy.MM.dd");
            }
            catch
            {
                return "";
            }
        }
        public string convernumbertostring(string value)
        {
            try
            {
               return String.Format("{0:0,0}", double.Parse(value));
            }
            catch
            {
                return "";
            }
        }
        public string converdateserver(string val)
        {

            if (val == null || val == "")
                return "";
            val = val.Replace(".", "/");
            try
            {
                string now = DateTime.Parse(val).ToString("MM/d/yyyy H:mm");
                return now;
            }
            catch
            {
                string[] b = val.Split('/');
                if(b[0].Length<3)
                b[0] = "20" + b[0];
                string a = b[1] + "/" + b[2] + "/" + b[0];
                 return a;
            }
        }
       
        public string getuserlogin()
        {
            HttpCookie login = HttpContext.Current.Request.Cookies["Member"];
            if (login != null)
                return login.Value.ToString();
            return "";
        }
        public string getdatainlist(List<Dictionary<string, object>> obj,string valuecp, string column2)
        {
            try {
                string name = obj.FirstOrDefault(s => s["id"].ToString() == valuecp)[column2].ToString();
                return name;
                }
            catch { return ""; }
        }
        public string getdatainlistname(List<Dictionary<string, object>> obj, string clname, string valuecp, string column2)
        {
            try
            {
                string name = obj.FirstOrDefault(s => s[clname].ToString() == valuecp)[column2].ToString();
                return name;
            }
            catch { return ""; }
        }
        public string exceldata(string[] title, string[] query, List<string> clnumber,string name,string tabledt)
        {
            sql sql = new sql();
            System.Data.DataTable table = new System.Data.DataTable();
            foreach (var i in title)
            {
                if (clnumber.IndexOf(i) != -1)
                    table.Columns.Add(i, typeof(double));
                else
                    table.Columns.Add(i, typeof(string));
            }
            var data = sql.getdatatableSQL(tabledt, "where isdelete is null");
            int order = 1;
            foreach(var i in data)
            {
                List<string> r = new List<string>();
                foreach (var j in query)
                {
                    try
                    {
                        r.Add(i[j].ToString());
                    }
                    catch
                    {
                        r.Add(order.ToString());
                    }
                }
                table.Rows.Add(
                     r.ToArray()
                 );
                order++;
            }
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(table, "sheet1");

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Buffer = true;
                HttpContext.Current.Response.Charset = "";
                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + name + ".xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(HttpContext.Current.Response.OutputStream);
                    HttpContext.Current.Response.Flush();
                    HttpContext.Current.Response.End();
                }
            }
            return "ok";
        }
        public string convertId(string table,string column,string vl)
        {
            sql cmd = new sql();
            var elm = cmd.getcolumndatatableSQL(table, "id", "where "+ column + "=N'" + vl + "'");
            if (elm.Count > 0)
                return elm[0]["id"].ToString();
            else
                return "";
        }
    }
}