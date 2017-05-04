using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class SubjecctList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    var qid = Request.QueryString["id"];
                    ddlCourses.SelectedValue = qid;
                }
            }

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            //id taken from gird value indirectly
 
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var subject = db.Subjects.SingleOrDefault(x => x.Id== id);
            db.Subjects.Remove(subject);
            db.SaveChanges();
            grid.DataBind();
        }

     
        protected void btnactive_Command(object sender, CommandEventArgs e)
        {
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var subject = db.Subjects.SingleOrDefault(x => x.Id == id);
            subject.IsActive = !subject.IsActive;
            db.SaveChanges();
            grid.DataBind();



        }
    }
}