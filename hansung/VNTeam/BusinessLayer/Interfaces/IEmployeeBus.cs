using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{
    public interface IEmployeeBus
    {
        employee Login(string username, string password);
        List<employee> GetAvailableEmployees();
      
    }
}
