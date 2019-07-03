using hansung.datamoder;
using System;
using System.Collections.Generic;
using System.Linq;

//added by William 2019.06.06
namespace hansung
{
    public class EmployeeDal : IEmployeeDal
    {
        public employee Login(string username, string password)
        {
            try
            {
                if (username.IsEmptyEx() || password.IsEmptyEx())
                    return default(employee);

                var emp = DbEntityFactory.DbInstance.employees.FirstOrDefault(x => x.employeecode == username && x.Password == password);
                if (emp != null)
                {
                    emp.Department = emp.department.ToInt() > 0 ? DbEntityFactory.DbInstance.departments.FirstOrDefault(x => x.id == emp.department && (!x.isdelete.HasValue || !x.isdelete.Value)) : null;
                    emp.Position = emp.position.ToInt() > 0 ? DbEntityFactory.DbInstance.positions.FirstOrDefault(x => x.id == emp.position && (!x.isdelete.HasValue || !x.isdelete.Value)) : null;
                    emp.MenuGroups = DbEntityFactory.DbInstance.MenuGroups.ToList();
                    emp.Menus = DbEntityFactory.DbInstance.Menus.ToList();
                    emp.MenuActionPermissions = DbEntityFactory.DbInstance.MenuActionPermissions
                        .Where(x => x.EmpId == emp.id).ToList();
                    emp.ObjectPropertyPermissions = DbEntityFactory.DbInstance.ObjectPropertyPermissions
                        .Where(x => x.EmpId == emp.id).ToList();
                }

                return emp;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<employee> GetAvailableEmployees()
        {
            try
            {
                return DbEntityFactory.DbInstance.employees.Where(x => x.IsActive && (!x.isdelete.HasValue || !x.isdelete.Value)).ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}