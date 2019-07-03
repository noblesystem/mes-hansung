using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{
    public interface IPermissionDal
    {
        List<Menu> GetMenus();
        List<MenuGroup> GetMenuGroups();

        List<MenuActionPermission> GetMenuActionPermissionsByEmpId(int empId);
        List<ObjectPropertyPermission> GetObjectPropertyPermissionByEmpId(int empId);

        List<Menu> GetAvailableMenus();
        List<MenuActionPermission> SaveMenuActionPermission(MenuActionPermission menuActionPermission);
        List<MenuActionPermission> RemoveMenuActionPermission(int empId, int menuId);
    }
}
