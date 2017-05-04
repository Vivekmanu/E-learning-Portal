using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class QuizList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
        protected void btnactive_Command(object sender, EventArgs e)
        {
            var button = sender as LinkButton;
            var id = int.Parse(button.CommandArgument.ToString());
            var db = new Entities();
            var test = db.Quizs.SingleOrDefault(x => x.Id == id);
            test.IsActive = !test.IsActive;
            db.SaveChanges();
            grid.DataBind();

        }
    }
}