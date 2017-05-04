using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class RegisterProfessor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var qid = int.Parse(Request.QueryString["id"]);
                var db = new Entities();
                var member = db.Members.SingleOrDefault(x => x.Id == qid);
                hdnId.Value = member.Id.ToString();
                txtName1.Text = member.Name;
                txtEmail.Text = member.Email;
                txtMN.Text = member.PhoneNo;
                txtDOB.Text = member.DOB.ToString("dd/MM/yyyy");
                ddlProgram.SelectedValue = member.FkProgramId.ToString();
                ddlCourse.SelectedValue = member.FkCourseId.ToString();
                ddlRoles.SelectedValue = member.RoleName;

                pwd.Visible = false;
                cpwd.Visible = false;
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var db = new Entities();
            Member data = null;

            var memberid = 0;
            if (!string.IsNullOrEmpty(hdnId.Value))
            {
                memberid = int.Parse(hdnId.Value);
            }

            data = string.IsNullOrEmpty(hdnId.Value) ? new Member() : db.Members.SingleOrDefault(x => x.Id == memberid);

            if (db.Members.Any(x => x.Email.Equals(txtEmail.Text)))
            {
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Email id already registered.";
            }
            else
            {
                data.Name = txtName1.Text;
                data.Email = txtEmail.Text;
                data.DOB = Convert.ToDateTime(txtDOB.Text);

                if (string.IsNullOrEmpty(hdnId.Value))
                    data.Password = txtPassword.Text;

                data.PhoneNo = txtMN.Text;
                data.FkCourseId = int.Parse(ddlCourse.Text);
                data.FkProgramId = int.Parse(ddlProgram.Text);
                data.RoleName = ddlRoles.SelectedValue;
                if (string.IsNullOrEmpty(hdnId.Value))
                {
                    db.Members.Add(data);
                }
                db.SaveChanges();
                Response.Redirect("~/MemberList.aspx");
            }
        }
    }
}

              

    