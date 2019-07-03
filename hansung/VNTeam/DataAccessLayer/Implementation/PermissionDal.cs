using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Web;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{
    [SuppressMessage("ReSharper", "RedundantCatchClause")]
    public class PermissionDal : IPermissionDal
    {
        public List<Menu> GetMenus()
        {
            try
            {
                return DbEntityFactory.DbInstance.Menus.ToList();
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<MenuGroup> GetMenuGroups()
        {
            try
            {
                return DbEntityFactory.DbInstance.MenuGroups.ToList();
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<MenuActionPermission> GetMenuActionPermissionsByEmpId(int empId)
        {
            try
            {
                if (empId <= 0)
                    throw new Exception($"PARAM_ERROR: Invalid value of parameter '{nameof(empId)}', value must be greater than zero.");

                var menuActionPermissions =  DbEntityFactory.DbInstance.MenuActionPermissions.Where(x => x.EmpId == empId).ToList();
                if (menuActionPermissions != null)
                {
                    var menus = GetMenus();
                    var groups = GetMenuGroups();

                    menuActionPermissions.ForEach(p =>
                    {
                        var menu = menus.Find(m => m.Id == p.MenuId);
                        p.Menu = menu;
                        p.MenuGroup = groups.Find(g => g.Id == menu.MenuGrpId);
                    });
                }

                return menuActionPermissions;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<ObjectPropertyPermission> GetObjectPropertyPermissionByEmpId(int empId)
        {
            try
            {
                if (empId <= 0)
                    throw new Exception($"PARAM_ERROR: Invalid value of parameter {nameof(empId)}, value must be greater than zero.");

                return DbEntityFactory.DbInstance.ObjectPropertyPermissions.Where(x => x.EmpId == empId).ToList();
            }
            catch (Exception e)
            {
                throw;
            }
        }
        public List<Menu> GetAvailableMenus()
        {
            try
            {
                return DbEntityFactory.DbInstance.Menus.Where(x => x.IsActive).ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<MenuActionPermission> SaveMenuActionPermission(MenuActionPermission menuActionPermission)
        {
            throw new NotImplementedException();
        }

        public List<MenuActionPermission> RemoveMenuActionPermission(int empId, int menuId)
        {
            throw new NotImplementedException();
        }
    }
}