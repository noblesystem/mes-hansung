using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hansung.datamoder
{
    public partial class employee
    {
        public department Department { get; set; }
        public position Position { get; set; }
        public Message Message { get; set; }

        //added by William 2019.06.06
        //After user logged, all permissions will be binding to above objects
        public List<MenuGroup> MenuGroups { get; set; }
        public List<Menu> Menus { get; set; }
        public List<ObjectPropertyPermission> ObjectPropertyPermissions { get; set; }
        public List<MenuActionPermission> MenuActionPermissions { get; set; }
    }
}