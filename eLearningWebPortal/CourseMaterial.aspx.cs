using eLearningWebPortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace eLearningWebPortal
{
    public partial class CourseMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                var roleName = SessionManager.Role();
                hdnUsername.Value= roleName;
                hdnUserId.Value = SessionManager.UserId().ToString();
                hdnCourse.Value = SessionManager.CourseId().ToString();
                if (roleName.Equals("professor"))
                {
                    var accessible = roleName == "professor";
                    SqlDataSourceCourseMaterial.FilterExpression = "CreatedBy=" + hdnUserId.Value;

                }
                else if (roleName.Equals("student"))
                {
                    var accessible = roleName == "student";
                    SqlDataSourceCourseMaterial.FilterExpression = "FkCourseId=" + hdnCourse.Value;

                }
                else
                {

                }

            }
        

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    var qid = Request.QueryString["id"];
                    ddlSubject.SelectedValue = qid;

                }
            }
            
        }
        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            //id taken from gird value indirectly

            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var coursematerial = db.CourseMaterials.SingleOrDefault(x => x.Id == id);
            db.CourseMaterials.Remove(coursematerial);
            db.SaveChanges();
            grid.DataBind();
        }


        protected void UploadFile(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                //Title
                var fileName = fileUpload.FileName;
                var extention = Path.GetExtension(fileName);
                var guid = Guid.NewGuid().ToString();
                //Name
                var realName = string.Format("{0}{1}", guid, extention);
                var path = Server.MapPath("~/uploads");
                fileUpload.SaveAs(string.Format("{0}/{1}", path, realName));

                //course
                var db = new Entities();
                var coursematerial = new eLearningWebPortal.Models.CourseMaterial()
                {
                    Name = realName,
                    Title = fileName,
                    CreatedBy = SessionManager.UserId(),
                    CreationDate = DateTime.Now,
                    FkCourseId = int.Parse(ddlSubject.SelectedValue)
                };
                db.CourseMaterials.Add(coursematerial);
                db.SaveChanges();
            }

            else
            {
                // custom validation message: no file selected
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "No file selected.";
            }

            grid.DataBind();
        }

    }
}
