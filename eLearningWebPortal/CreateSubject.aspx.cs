using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class CreateSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var qid = int.Parse(Request.QueryString["id"]);
                var db = new Entities();
                var subject = db.Subjects.SingleOrDefault(x => x.Id == qid);
                hdnId.Value = qid.ToString();
                if (subject!=null)
                {
                    txtName.Text = subject.Name;

                }

            }
            }
        
      
        protected void btnSubmit_Ccrsublick1(object sender, EventArgs e)
        {
            var db = new Entities();
            Subject data = null;

            var subjectid = 0;
            if (!string.IsNullOrEmpty(hdnId.Value))
            {
                subjectid = int.Parse(hdnId.Value);
            }

            data = string.IsNullOrEmpty(hdnId.Value) ? new Subject() : db.Subjects.SingleOrDefault(x => x.Id == subjectid);

            if (db.Subjects.Any(x => x.Name.Equals(txtName.Text) && x.Id != subjectid))
            {
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Course  is already registered.";
            }
            else
            {
                    
          

            data.Name = txtName.Text;
            data.FkCourseId = int.Parse(ddlCourses.SelectedValue);

            if (string.IsNullOrEmpty(hdnId.Value))
            {
                db.Subjects.Add(data);
            }
            db.SaveChanges();





            //if (db.Subjects.Any(x => x.Name.Equals(txtName.Text)))
            //{
            //    customValidation.IsValid = false;
            //    customValidation.ErrorMessage = "Subject  id already registered.";
            //}
            //else
            //{
            //    var subject = new Subject()
            //    {
            //        Name = txtName.Text,
            //        FkCourseId=int.Parse(ddlCourses.SelectedValue)

            //    };
            //    db.Subjects.Add(subject);
            //    db.SaveChanges();

            Response.Redirect("~/SubjecctList.aspx");

            }
        }
    }
}

