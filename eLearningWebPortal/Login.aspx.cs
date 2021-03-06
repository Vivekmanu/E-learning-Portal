﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            var email = txtEmail.Text;
            var password = txtPwd.Text;

            var db = new Entities();
            var user = db.Members.SingleOrDefault(x=> x.Email == email && x.Password == password);

            if(user != null)
            {
                //valid user : redirect to default page
                Session["User"] = user;
                FormsAuthentication.RedirectFromLoginPage(email, true);
            }
            else
            {
                //invalid user : show error message
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Please enter correct details";
            }
        }
    }
}