using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class QuizCandidates : System.Web.UI.Page
    {
       int [] selectedStudents = null;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //fetch selected candidate information from database
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var quizid = int.Parse(Request.QueryString["id"]);
                hdnId.Value = quizid.ToString();
                var db = new Entities();
                selectedStudents = db.QuizCandidates.Where(x => x.FkQuizId == quizid).Select(x=> x.FkMemberId).ToArray();
                chkStudents.DataBind();
            }
        }
    

        protected void chkStudents_DataBinding(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var db = new Entities();
            var quizid = int.Parse(hdnId.Value);
            //remove old candidates, if any
            var oldCandidates = db.QuizCandidates.Where(x=> x.Id == quizid);
            if (oldCandidates.Any())
                db.QuizCandidates.RemoveRange(oldCandidates);

            //add only selected candidates
            foreach (ListItem item in chkStudents.Items)
            {
                if (item.Selected)
                {
                    var candidate = new eLearningWebPortal.Models.QuizCandidate();
                    candidate.FkMemberId = int.Parse(item.Value);
                    candidate.FkQuizId = quizid;
                    db.QuizCandidates.Add(candidate);
                }
            }
            //save selection to database and redirect to quiz list
            db.SaveChanges();
            Response.Redirect("~/QuizList.aspx");
        }

        protected void SqlDataCandidates_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
           
        }

        protected void chkStudents_DataBound(object sender, EventArgs e)
        {
            var checkboxlist = sender as CheckBoxList;
            //bind selected candidates to list
            foreach (ListItem item in checkboxlist.Items)
            {
                if (selectedStudents != null)
                {
                    var q = int.Parse(item.Value);
                    item.Selected = selectedStudents.Contains(q);
                }
            }
        }
    }
}
   