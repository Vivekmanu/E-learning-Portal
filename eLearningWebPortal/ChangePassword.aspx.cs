using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

          


        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           
            var CurrentPassword = txtCurrentPassword.Text;
            var NewPassword = txtNewPassword.Text;
            var ComparePassword = txtCPassswd.Text;
            var db = new Entities();

            var data = db.Members.SingleOrDefault(x => x.Email.Equals(User.Identity.Name, StringComparison.CurrentCultureIgnoreCase));
            if (data != null)
            {


                if (CurrentPassword != data.Password)
                {//invalid pasword : show error message
                    customValidation.IsValid = false;
                    customValidation.ErrorMessage = "Current Password do not match";
                }
                else if (NewPassword == ComparePassword)
                { //password change successfull :show message
                    customValidation.IsValid = true;
                    LblMsg.Visible = true;
                    data.Password = NewPassword;
                    LblMsg.Text = "Password changed Successfully";

                }
                else
                {//new entered password does not match :show error message
                    customValidation.IsValid = false;
                    customValidation.ErrorMessage = "New password does not match";

                }
                db.SaveChanges();
            }

            }
        }
    }

