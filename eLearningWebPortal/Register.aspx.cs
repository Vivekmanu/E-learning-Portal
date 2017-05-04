using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var db = new Entities();
            if (db.Members.Any(x => x.Email.Equals(txtEmail.Text)))
            {
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Email id already registered.";
            }
            else
            {
                var user = new Member()
                {
                    Name = txtName.Text,
                    Email = txtEmail.Text,
                    Password = txtPassword.Text,
                    PhoneNo = txtMN.Text,
                    DOB = Convert.ToDateTime(txtDOB.Text),
                    FkProgramId = int.Parse(ddlProgram.Text),
                    FkCourseId= int.Parse(ddlCourse.Text),
                    RoleName = "student"
                };

                db.Members.Add(user);
                db.SaveChanges();

                Response.Redirect("~/RegistrationConfirmation.aspx");
            }
        }
      
    }
}