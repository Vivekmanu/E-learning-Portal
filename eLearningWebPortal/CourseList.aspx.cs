using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class CourseList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    var qid = Request.QueryString["id"];
                    ddlPrograms.SelectedValue = qid;
                    lblMsg.Visible = false;

                }

            }
            //lblMsg.Visible = false;
        }



        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {//id taken from gird value indirectly
            //Checking if any member is associated with the Course thn show error msg 
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var ismember = db.Members.Any(x => x.FkCourseId == id);
            if (ismember)
            {
                lblMsg.Text = "Some members are registered under this program. Therefore it cannot be deleted.";
                lblMsg.Visible = true;
            }
            else
            {
                // else check if any Course Material is associated with course then show error message
                var iscoursematerial = db.CourseMaterials.Any(x => x.FkCourseId == id);
                if (iscoursematerial)
                {
                    lblMsg.Text = "Some course material  are uploaded under this program. Therefore it cannot be deleted.";
                    lblMsg.Visible = true;
                }

                else
                {// else delete the course
                    lblMsg.Visible = false;
                    var course = db.Courses.SingleOrDefault(x => x.Id == id);
                    db.Courses.Remove(course);
                    db.SaveChanges();
                    grid.DataBind();
                }
                
            }
        }

        protected void btnactive_Command(object sender, CommandEventArgs e)
        {
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
             var course = db.Courses.SingleOrDefault(x => x.Id == id);
            course.IsActive = !course.IsActive;
            db.SaveChanges();
            grid.DataBind();

            }
        }
    }
       