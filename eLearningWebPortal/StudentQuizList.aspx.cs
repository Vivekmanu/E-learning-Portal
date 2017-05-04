using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;
using System.Data;

namespace eLearningWebPortal
{
    public partial class StudentQuizList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MemberId.Value = SessionManager.UserId().ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
        }

      protected void lbTakeQuiz_Click(object sender, EventArgs e)
        {
            
        }

        protected void pending_Click(object sender, EventArgs e)
        {
        }

        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (DataRowView)e.Row.DataItem;
                var status = data["Status"].ToString();
                var column = e.Row.Cells.Count - 1;
                var linkButton = e.Row.Cells[column].FindControl("lbTakeQuiz") as LinkButton;
                linkButton.Visible = status == "pending";
            }
        }


        protected void lbTakeQuiz_Command1(object sender, CommandEventArgs e)
        {
            var qid = int.Parse(e.CommandArgument.ToString());
            var aid = int.Parse(e.CommandName);

            if(aid == 0)
            {
                var db = new Entities();

                //create a student quiz
                var studentQuiz = new eLearningWebPortal.Models.StudentQuiz() { FkQuizId = qid, FkStudentId = SessionManager.UserId(), LastAttendedQuestion = 0, Status = "pending" , TotalMarks  =0};
                db.StudentQuizs.Add(studentQuiz);
                db.SaveChanges();

                var questions = db.QuizQuestions.Where(x => x.FkQuizId == qid).ToList();
                foreach (var ques  in questions)
                {
                    var question = new eLearningWebPortal.Models.StudentQuizQuestion() { Attended = false, Marks = 0, QId = ques.Id, AId = 0, FkStudentQuizId = studentQuiz.StudentQuizId };
                    db.StudentQuizQuestions.Add(question);
                }
                db.SaveChanges();

                aid = studentQuiz.StudentQuizId;
            }
            Response.Redirect("~/StudentQuiz.aspx?id=" + aid.ToString());
        }
    }







        }
