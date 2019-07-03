﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page6
{
    public partial class page6_4 : System.Web.UI.Page
    {
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public double sumbox;
        public string[] clumn = new string[] { "numbercode", "namewk", "housename", "approved","itemcodenew","itemname","standard","qltremove","qltbox","serinum","remarkremove"};
        common cm = new common();
        sql sql = new sql();
        protected void Page_Load(object sender, EventArgs e)
        {
            mainData = cm.objTable_Erorr("");
            mainData = mainData.Where(s => s["qltremove"].ToString() != "").ToList();
            sumbox = mainData.Sum(s => cm.parse(s["qltbox"].ToString()));
        }
    }
}