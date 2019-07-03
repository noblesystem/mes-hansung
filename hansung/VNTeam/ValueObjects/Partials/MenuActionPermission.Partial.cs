using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hansung.datamoder
{
    public partial class MenuActionPermission
    {
        public Menu Menu { get; set; }
        public MenuGroup MenuGroup { get; set; }

        public Message Message { get; set; }
    }
}