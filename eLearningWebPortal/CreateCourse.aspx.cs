using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class CreateCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var qid = int.Parse(Request.QueryString["id"]);
                var db = new Entities();
                var course = db.Courses.SingleOrDefault(x => x.Id == qid);
                hdnId.Value = qid.ToString();
                txtName.Text = course.Name;
            }
        }


        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            var db = new Entities();

            Cours data = null;

            var courseid = 0;
            if (!string.IsNullOrEmpty(hdnId.Value))
            {
                courseid = int.Parse(hdnId.Value);
            }

            data = string.IsNullOrEmpty(hdnId.Value) ? new Cours() : db.Courses.SingleOrDefault(x => x.Id == courseid);

            if (db.Courses.Any(x => x.Name.Equals(txtName.Text) && x.Id != courseid))
            {
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Course  is already registered.";
            }
            else
            {
                data.Name = txtName.Text;
                data.FkProgramId = int.Parse(ddlPrograms.SelectedValue);

                if (string.IsNullOrEmpty(hdnId.Value))
                {
                    db.Courses.Add(data);
                }
                db.SaveChanges();

          

            //if (db.Courses.Any(x => x.Name.Equals(txtName.Text)))
            //{
            //    customValidation.IsValid = false;
            //    customValidation.ErrorMessage = "Course  id already registered.";
            //}
            //else
            //{
            //    var course = new eLearningWebPortal.Models.Cours()
            //    {
            //        Name = txtName.Text,
            //  FkProgramId = int.Parse(ddlPrograms.SelectedValue)

            //    };
            //    db.Courses.Add(course);
            //    db.SaveChanges();

            Response.Redirect("~/CourseList.aspx");

        }
        }

    }
      

    }

