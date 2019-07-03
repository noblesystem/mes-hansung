using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hansung
{
   
    public class datafrom2_1
    {
       
        public List<Dictionary<string, object>> s_obj_2_2(string where)
        {
            common cm = new common();
            var cvdate = cm.cvdate;
            sql sql = new sql();
            string[] table_bill = new string[] { "ordernumber", "terms","contractdate", "datebeginpayment", "notebill" };
            string[] item = new string[] { "itemname", "standard" };
            string[] table_detail = new string[] { "quantityincase", "qltcase", "qltcase","vat", "totalamount"};
            string[] warehouse = new string[] { "name as housename" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance", "transactionaccountnumber" };
            string[] ship = new string[] { "dateclearance","dateclearance", "customsday", "confirmreceiptday", "numbership", "sizefit","containerday", "conreturnday", "requestday", "confirmreceiptday", "remark" };
            string tb_bill = cm.getclumn(table_bill, "billbuy");
            string tb_item = cm.getclumn(item, "ItemList");
            string tb_detail = cm.getclumn(table_detail, "detailbillbuy");
            string tb_warehouse = cm.getclumn(warehouse, "warehouse");
            string tb_employer = cm.getclumn(employer, "employee");
            string tb_cuctomer = cm.getclumn(cuctomer, "customer");
            string tb_ship = cm.getclumn(ship, "ship");
            string str = "select " + tb_bill + "," + tb_detail + "," + tb_item + "," + tb_warehouse + "," + tb_employer + "," + tb_cuctomer + "," + tb_ship + "" +
                        " from billbuy left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill " +
                        " left join warehouse on billbuy.warehouse=warehouse.id " +
                        " left join employee on billbuy.orderingemployer=employee.id" +
                        " left join customer on billbuy.tradingmission=customer.id" +
                        " left join ship on billbuy.codeid=ship.codebill" +
                        " left join ItemList on detailbillbuy.iditem=ItemList.id "+
                        " group by " + tb_bill + "," + tb_detail + "," + tb_item + ",warehouse.name,employee.name,customer.name,customer.transactionbalance,customer.transactionaccountnumber," + tb_ship + "" + where;
            var mainObj = sql.getdatatablejoinSQL(str);
            foreach(var i in mainObj)
            {
                foreach(var j in cvdate)
                {
                    try
                    {
                        i[j] = cm.converdate("", i[j].ToString());
                    }
                    catch { }
                }
            }
            return mainObj;
        }

        public List<Dictionary<string, object>> s_obj_2_4(string where)
        {
            common cm = new common();
            var cvdate = cm.cvdate;
            var cvmoney = cm.moneycl;
            sql sql = new sql();
            string[] table_bill = new string[] { "ordernumber", "terms", "contractdate", "datebeginpayment", "notebill", "note", "paymentoption" };
            string[] item = new string[] { "itemname", "standard" };
            string[] table_detail = new string[] { "qltcontainer", "quantityincase", "qltcase", "qltcase", "vat", "totalamount", "sqm", "price", "pricesupply", "vat", "totalamount" };
            string[] warehouse = new string[] { "name as housename" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance", "transactionaccountnumber" };
            string[] ship = new string[] { "dateclearance", "departuredate", "customsday", "confirmreceiptday", "numbership", "sizefit", "containerday", "conreturnday", "requestday", "confirmreceiptday", "remark", "duedate", "dateofarrival", "conDuedate", "port", "nameshipname", "daycertificate", "sizefit" };
            string tb_bill = cm.getclumn(table_bill, "billbuy");
            string tb_item = cm.getclumn(item, "ItemList");
            string tb_detail = cm.getclumn(table_detail, "detailbillbuy");
            string tb_warehouse = cm.getclumn(warehouse, "warehouse");
            string tb_employer = cm.getclumn(employer, "employee");
            string tb_cuctomer = cm.getclumn(cuctomer, "customer");
            string tb_ship = cm.getclumn(ship, "ship");
            string str = "select " + tb_bill + "," + tb_detail + "," + tb_item + "," + tb_warehouse + "," + tb_employer + "," + tb_cuctomer + "," + tb_ship + "" +
                        " from billbuy left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill " +
                        " left join warehouse on billbuy.warehouse=warehouse.id " +
                        " left join employee on billbuy.orderingemployer=employee.id" +
                        " left join customer on billbuy.tradingmission=customer.id" +
                        " left join ship on billbuy.codeid=ship.codebill" +
                        " left join ItemList on detailbillbuy.iditem=ItemList.id " + where+
                        " group by " + tb_bill + "," + tb_detail + "," + tb_item + ",warehouse.name,employee.name,customer.name,customer.transactionbalance,customer.transactionaccountnumber," + tb_ship + "";
            var mainObj = sql.getdatatablejoinSQL(str);
            foreach (var i in mainObj)
            {
                foreach (var j in cvdate)
                {
                    try
                    {
                        i[j] = cm.converdate("", i[j].ToString());
                    }
                    catch { }
                }
               
            }
            return mainObj;
        }
    }
}