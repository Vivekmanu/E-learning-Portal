using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLearningWebPortal
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

          

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            var PasswdCurr = txtcurrentpasswd.Text;
            var PasswdNew = txtNewpasswd.Text;
            var PasswdCon = txtconfrmpassswd.Text;

            if (PasswdCurr != "yspl2009")
            {//invalid pasword : show error message
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Please enter correct password";
            }
            else if (PasswdCurr == "yspl2009" &&  PasswdNew == PasswdCon)
            { //password change successfull :show message
                customValidation.IsValid = true;
             customValidation.ErrorMessage = "your password has been updated";
            }
            else
            {//new entered password does not match :show error message
                customValidation.IsValid = false; 
                customValidation.ErrorMessage = "New password does not match";

            }
        }
        }
        }
    