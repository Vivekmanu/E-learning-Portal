using eLearningWebPortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLearningWebPortal
{
    public partial class MemberList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            var roleName = SessionManager.Role();

            hdnRole.Value = roleName;
            hdnCourse.Value = SessionManager.CourseId().ToString();
            
            if (roleName.Equals("student"))
                heading.InnerHtml = "Professors";
            else if (roleName.Equals("professor"))
                heading.InnerHtml = "Students";
            else
                heading.InnerHtml = "Members";

            if (!roleName.Equals("admin"))
            {
                var accessible = roleName == "student" ? "professor" : "student";
                SqlDataSource.FilterExpression = "RoleName = '" + accessible + "' AND FkProgramId=" + hdnCourse.Value;
                grid.Columns[4].Visible = false;
            }

            if(SessionManager.Role() != "Admin")
            {
                var lastColumn = grid.Columns.Count - 1;
                grid.Columns[lastColumn].Visible = false;
            }
        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {
            // delete a memeber 
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var member = db.Members.SingleOrDefault(x => x.Id == id);
            db.Members.Remove(member);
            db.SaveChanges();
            grid.DataBind();
        }

        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
        }
    }
}