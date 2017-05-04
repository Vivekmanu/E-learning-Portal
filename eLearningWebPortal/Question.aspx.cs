using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class Question : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var qid = int.Parse(Request.QueryString["id"]);
                var db = new Entities();
                var questioon = db.Questions.SingleOrDefault(x => x.Id == qid);
                hdnId.Value = qid.ToString();
                txtQuestion.Text = questioon.Title;
                txtMarks.Text = questioon.Marks.ToString();
            

                if (questioon.Answers.Any())
                {
                    for (int i = 0; i < questioon.Answers.Count; i++)
                    {
                        var ans = questioon.Answers.Skip(i).Take(1);
                        if (i == 0)
                        {
                            var answer = ans.SingleOrDefault();
                            txtAnswerOne.Text = answer.Title;
                            radioAnsOne.Checked = answer.IsCorrect;
                        }

                        if (i == 1)
                        {
                            var answer = ans.SingleOrDefault();
                            txtAnswerTwo.Text = answer.Title;
                            radioAnsTwo.Checked = answer.IsCorrect;
                        }

                        if (i == 2)
                        {
                            var answer = ans.SingleOrDefault();
                            txtAnswerThree.Text = answer.Title;
                            radioAnsThree.Checked = answer.IsCorrect;
                        }

                        if (i == 3)
                        {
                            var answer = ans.SingleOrDefault();
                            txtAnswerFour.Text = answer.Title;
                            radioAnsFour.Checked = answer.IsCorrect;
                        }
                    }
                }
            }
        }
            protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var db = new Entities();
            eLearningWebPortal.Models.Question question = null;

            if (string.IsNullOrEmpty(hdnId.Value))
            {
                question = new eLearningWebPortal.Models.Question()
                {
                    Title = txtQuestion.Text,
                    Marks = Convert.ToInt16(txtMarks.Text),
                     CreatedBy = SessionManager.UserId(),
                    CreationDate = DateTime.Now,
                    FkCourseId = SessionManager.CourseId()
                
            };
            }
            else
            {
                var qid = int.Parse(hdnId.Value);
                question = db.Questions.SingleOrDefault(x => x.Id == qid);
                question.Title = txtQuestion.Text;
                question.Marks = int.Parse(txtMarks.Text);
                question.CreatedBy = SessionManager.UserId();
                question.CreationDate = DateTime.Now;
                question.FkCourseId = SessionManager.CourseId();
                var answers = db.Answers.Where(x => x.FkQuestionId == qid);
                db.Answers.RemoveRange(answers);
            }

            var answer1 = new eLearningWebPortal.Models.Answer()
            {
                Title = txtAnswerOne.Text,
                IsCorrect = radioAnsOne.Checked,
                FkQuestionId = question.Id
            };
            question.Answers.Add(answer1);

            var answer2 = new eLearningWebPortal.Models.Answer()
            {
                Title = txtAnswerTwo.Text,
                IsCorrect = radioAnsTwo.Checked,
                FkQuestionId = question.Id
            };
            question.Answers.Add(answer2);

            var answer3 = new eLearningWebPortal.Models.Answer()
            {
                Title = txtAnswerThree.Text,
                IsCorrect = radioAnsThree.Checked,
                FkQuestionId = question.Id
            };
            question.Answers.Add(answer3);

            var answer4 = new eLearningWebPortal.Models.Answer()
            {
                Title = txtAnswerFour.Text,
                IsCorrect = radioAnsFour.Checked,
                FkQuestionId = question.Id
            };
            question.Answers.Add(answer4);

            if (string.IsNullOrEmpty(hdnId.Value))
            {
                question.CreatedBy = SessionManager.UserId();
                question.CreationDate = DateTime.Now;
                db.Questions.Add(question);
            }

            db.SaveChanges();
            Response.Redirect("~/QuestionList.aspx");
        }
    }
}