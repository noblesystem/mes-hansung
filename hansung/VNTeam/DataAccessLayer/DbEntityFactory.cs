using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{
    public static class DbEntityFactory
    {
        private static hansungEntities _dbEntity = null;
        public static hansungEntities DbInstance => new  hansungEntities(); /*_dbEntity ?? (_dbEntity = new hansungEntities());*/
    }
}