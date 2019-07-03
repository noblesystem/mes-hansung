using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{
    public class PermissionBus: IPermissionBus
    {
        private IPermissionDal _permissionDal = null;
        public IPermissionDal EmployeeDal => _permissionDal ?? (_permissionDal = new PermissionDal());

        public List<Menu> GetMenus()
        {
            try
            {
                return EmployeeDal.GetMenus();
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
                return EmployeeDal.GetMenuGroups();
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

                return EmployeeDal.GetMenuActionPermissionsByEmpId(empId);
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

                return EmployeeDal.GetObjectPropertyPermissionByEmpId(empId);
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
                return EmployeeDal.GetAvailableMenus();
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