using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hansung
{
    public class getdatapage8
    {
        public List<string> moneycl = new List<string>() { "sum_amount_order", "sum_amount_buy", "total_buy", "total_order" };

        public List<Dictionary<string, object>> objpage8_5(string where)
        {
            sql sql = new sql();
            common cm = new common();
            string[] table_bill = new string[] { "salesrepresentative", "customercompany" };
            string[] employer = new string[] { "name as namewk" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance" };
            string[] paymentbuy = new string[] { "sum(payment.cashT_T) as cashT_T_buy", "sum(payment.billL_C) as billL_C_buy", "sum(payment.feesmoney) as feesmoney_buy" };
            string[] paymentsale = new string[] { "sum(paymentOrder.cashT_T) as cashT_T_sale", "sum(paymentOrder.billL_C) as billL_C_sale", "sum(paymentOrder.feesmoney) as feesmoney_sale" };

            string tb_cuctomer = cm.getclumn(cuctomer, "customer");
            string tb_employer = cm.getclumn(employer, "employee");
            string tb_paymentsale =string.Join(",",paymentsale);
            string tb_paymentbuy = string.Join(",", paymentbuy);
            string str = "select " + tb_cuctomer + "," + tb_employer + "," + tb_paymentsale + "," + tb_paymentbuy + "" +
                    "   from customer " +
                    " left join employee on customer.salesemployee=employee.id" +
                    " left join paymentOrder on customer.id=paymentOrder.customer" +
                    " left join payment on customer.id=payment.customer where customer.isdelete is null" +
                    " group by customer.name,customer.transactionbalance,employee.name";
            var mainData = sql.getdatatablejoinSQL(str);
            foreach(var i in mainData)
            {
                i["sum_amount_order"] = cm.parse(i["transactionbalance"].ToString()) - (cm.parse(i["cashT_T_sale"].ToString()) + cm.parse(i["billL_C_sale"].ToString()) + cm.parse(i["feesmoney_sale"].ToString()));
                i["sum_amount_buy"] = cm.parse(i["transactionbalance"].ToString()) + (cm.parse(i["cashT_T_buy"].ToString()) + cm.parse(i["billL_C_buy"].ToString()) + cm.parse(i["feesmoney_buy"].ToString()));
                i["Unpaid_order"] = 0;
                i["Unpaid_buy"] = 0;
                i["total_buy"] = cm.parse(i["sum_amount_buy"].ToString())+cm.parse(i["Unpaid_buy"].ToString());
                i["total_order"] = cm.parse(i["sum_amount_order"].ToString()) + cm.parse(i["Unpaid_order"].ToString());
                i["balance"] = "";
                foreach(var j in moneycl)
                {
                    i[j] = cm.convernumbertostring(i[j].ToString());
                }
            }
            return mainData;
        }
        public List<Dictionary<string, object>> objpage8_4(string where)
        {
            sql sql = new sql();
            common cm = new common();
            string[] table_bill_buy = new string[] { "ordernumber", "tradingmission", "warehouse" };
            string[] Items = new string[] { "itemname", "standard", "quantityincase" };
            string[] table_detail_bill_buy = new string[] { "quantityincase" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance" };

            string[] table_bill_sale = new string[] { "orderdate", "warehouse as warehouse_sale" };
            string[] table_detail_bill_sale = new string[] { "qltincase" };
            string tb_bill_sale = cm.getclumn(table_bill_sale, "orderslips");
            string tb_detail_bill_sale = cm.getclumn(table_detail_bill_sale, "detailorder");

            string tb_cuctomer = cm.getclumn(cuctomer, "customer");
            string tb_bill_buy = cm.getclumn(table_bill_buy, "billbuy");
            string tb_Items = cm.getclumn(Items, "ItemList");
            string tb_detail_bill_buy = cm.getclumn(table_detail_bill_buy, "detailbillbuy");
            string str = "select " + tb_bill_buy + ","+ table_bill_sale + ","+ table_detail_bill_sale + "," + tb_detail_bill_buy + "," + tb_cuctomer + "," + tb_Items + "" +
                    " from ItemList " +
                    " left join detailbillbuy on ItemList.id=detailbillbuy.iditem" +
                    " left join detailorder on ItemList.id=detailorder.itemid" +


                    " left join customer on billbuy.tradingmission=customer.id" +
                  
                    " left join ItemList on detailbillbuy.iditem=ItemList.id " +
                    " left join orderdate on billbuy.warehouse=orderdate.warehouse" +
                    " left join detailorder on orderdate.codeid=detailorder.codebill" +
                    " group by " + tb_bill_buy + "," + tb_detail_bill_buy + "," + tb_Items + ","+ table_bill_sale + ",customer.name,customer.transactionbalance";
            var mainData = sql.getdatatablejoinSQL(str);
            //foreach (var i in mainData)
            //{
            //    i["sum_amount_order"] = cm.parse(i["transactionbalance"].ToString()) - (cm.parse(i["cashT_T_sale"].ToString()) + cm.parse(i["billL_C_sale"].ToString()) + cm.parse(i["feesmoney_sale"].ToString()));
            //    i["sum_amount_buy"] = cm.parse(i["transactionbalance"].ToString()) + (cm.parse(i["cashT_T_buy"].ToString()) + cm.parse(i["billL_C_buy"].ToString()) + cm.parse(i["feesmoney_buy"].ToString()));
            //    i["Unpaid_order"] = 0;
            //    i["Unpaid_buy"] = 0;
            //    i["total_buy"] = cm.parse(i["sum_amount_buy"].ToString()) + cm.parse(i["Unpaid_buy"].ToString());
            //    i["total_order"] = cm.parse(i["sum_amount_order"].ToString()) + cm.parse(i["Unpaid_order"].ToString());
            //    i["balance"] = "";
            //    foreach (var j in moneycl)
            //    {
            //        i[j] = cm.convernumbertostring(i[j].ToString());
            //    }
            //}
            return mainData;
        }
        public List<Dictionary<string, object>> objpage8_4_buy(string where)
        {
            sql sql = new sql();
            common cm = new common();
            string[] table_bill_buy = new string[] { "ordernumber", "tradingmission", "warehouse" };
            string[] Items = new string[] { "itemname", "standard", "quantityincase" };
            string[] table_detail_bill_buy = new string[] { "quantityincase"};
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance" };

            string[] table_bill_sale = new string[] { "orderdate"};
            string tb_cuctomer = cm.getclumn(cuctomer, "customer");
            string tb_bill_buy = cm.getclumn(table_bill_buy, "billbuy");
            string tb_Items = cm.getclumn(Items, "ItemList");
            string tb_detail_bill_buy = cm.getclumn(table_detail_bill_buy, "detailbillbuy");
            string str = "select " + tb_bill_buy + "," + tb_detail_bill_buy + "," + tb_cuctomer + "," + tb_Items + "" +
                    " from billbuy " +
                    " left join customer on billbuy.tradingmission=customer.id" +
                    " left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill" +
                    " left join ItemList on detailbillbuy.iditem=ItemList.id " +
                    " group by "+ tb_bill_buy + ","+ tb_detail_bill_buy + ","+ tb_Items + ",customer.name,customer.transactionbalance";
            var mainData = sql.getdatatablejoinSQL(str);
            double bginvtr1 =0;
            double bginvtr2 = 0;
            foreach (var i in mainData)
            {
                var quantityincase1 = i["quantityincase"].ToString();
                if (i["warehouse"].ToString() == "1")
                       bginvtr1 = bginvtr1 + cm.parse(i["quantityincase"].ToString());
                else
                    bginvtr2 = bginvtr2 + cm.parse(i["quantityincase"].ToString());
                i["inventory1"] = bginvtr1 - 0;
                i["inventory2"] = bginvtr2 - 0;
            }
            return mainData;
        }
        public List<Dictionary<string, object>> objpage8_4_sale(string where)
        {
            sql sql = new sql();
            common cm = new common();
            string[] table_bill = new string[] { "orderdate", "customercompany", "warehouse" };
            string[] Items = new string[] { "itemname", "standard", "quantityincase" };
            string[] table_detail_bill= new string[] { "qltincase" };
            string[] cuctomer = new string[] { "name as namectm", "transactionbalance" };

            string[] table_bill_sale = new string[] { "orderdate" };
            string tb_cuctomer = cm.getclumn(cuctomer, "customer");
            string tb_bill_buy = cm.getclumn(table_bill, "orderslips");
            string tb_Items = cm.getclumn(Items, "ItemList");
            string tb_detail_bill_buy = cm.getclumn(table_detail_bill, "detailorder");
            string str = "select " + tb_bill_buy + "," + tb_detail_bill_buy + "," + tb_cuctomer + "," + tb_Items + "" +
                    " from orderslips " +
                    " left join customer on orderslips.customercompany=customer.id" +
                    " left join detailorder on orderslips.codeid=detailorder.codebill" +
                    " left join ItemList on detailorder.itemid=ItemList.id " +
                    " group by " + tb_bill_buy + "," + tb_detail_bill_buy + "," + tb_Items + ",customer.name,customer.transactionbalance";
            var mainData = sql.getdatatablejoinSQL(str);
            //foreach (var i in mainData)
            //{
            //    i["sum_amount_order"] = cm.parse(i["transactionbalance"].ToString()) - (cm.parse(i["cashT_T_sale"].ToString()) + cm.parse(i["billL_C_sale"].ToString()) + cm.parse(i["feesmoney_sale"].ToString()));
            //    i["sum_amount_buy"] = cm.parse(i["transactionbalance"].ToString()) + (cm.parse(i["cashT_T_buy"].ToString()) + cm.parse(i["billL_C_buy"].ToString()) + cm.parse(i["feesmoney_buy"].ToString()));
            //    i["Unpaid_order"] = 0;
            //    i["Unpaid_buy"] = 0;
            //    i["total_buy"] = cm.parse(i["sum_amount_buy"].ToString()) + cm.parse(i["Unpaid_buy"].ToString());
            //    i["total_order"] = cm.parse(i["sum_amount_order"].ToString()) + cm.parse(i["Unpaid_order"].ToString());
            //    i["balance"] = "";
            //    foreach (var j in moneycl)
            //    {
            //        i[j] = cm.convernumbertostring(i[j].ToString());
            //    }
            //}
            return mainData;
        }
    }

}