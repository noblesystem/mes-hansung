using System;
using System.Collections.Generic;
using System.Linq;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{

    public class EmployeeBus : IEmployeeBus
    {
        private IEmployeeDal _employeeDal = null;
        public IEmployeeDal EmployeeDal => _employeeDal ?? (_employeeDal = new EmployeeDal());

        public employee Login(string username, string password /*password will be decrypted later, now still plan text in database*/)
        {
            try
            {
                if (username.IsEmptyEx() || password.IsEmptyEx())
                    return default(employee);

                Message message = null;
                var emp = EmployeeDal.Login(username, password);
                if (emp != null)
                {

                    if (emp.isdelete.ToBoolean())
                    {
                        message = new Message
                        {
                            MessageType = MessageType.Error, MessageContent = "Your account has been deleted."
                        };
                    }
                    else
                    {
                        if (!emp.IsActive)
                        {
                            message = new Message
                            {
                                MessageType = MessageType.Error, MessageContent = "Your account has been disabled."
                            };
                        }
                        else
                        {
                            message = new Message
                            {
                                MessageType = MessageType.Success, MessageContent = ""
                            };
                        }
                    }
                }
                else
                {
                    message = new Message
                    {
                        MessageType = MessageType.Error, MessageContent = "The Username or Password is incorrect"
                    };
                }
                if (emp == null)
                    emp = new employee();

                emp.Message = message;
                emp.Password = string.Empty; //Remove password before back to UI
                return emp;

            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<employee> GetAvailableEmployees()
        {
            try
            {
                return EmployeeDal.GetAvailableEmployees();
            }
            catch (Exception)
            {
                throw;
            }
        }

      
    }
}