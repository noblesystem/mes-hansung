using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hansung.Molder
{
    public class moldes
    {
        public List<codecuctomer> codectm()
        {
            List<codecuctomer> objs = new List<codecuctomer>();
            string[] name = new string[] { "구매업체", "판매업체", "기타업체" };
            string[] ext = new string[] { "B", "S", "E" };
            int[] id = new int[] { 1,2,3};
            for (var i = 0; i < name.Length; i++) {
                codecuctomer obj = new codecuctomer();
                obj.id = id[i];
                obj.name = name[i];
                obj.ext = ext[i];
                objs.Add(obj);
            }
            return objs;
        }
        public List<statusitem> statusItem()
        {
            List<statusitem> objs = new List<statusitem>();
            string[] name = new string[] { "문제재고", "부분파손", "대채품목", "완전파손" };
            int[] id = new int[] { 1, 2, 3,4 };
            for (var i = 0; i < name.Length; i++)
            {
                statusitem obj = new statusitem();
                obj.id = id[i];
                obj.name = name[i];
                objs.Add(obj);
            }
            return objs;
        }
    }
    public class codecuctomer
    {
        public int id { get; set; }
        public string ext { get; set; }
        public string name { get; set; }
    }
    public class statusitem
    {
        public int id { get; set; }
        public string name { get; set; }
    }
}