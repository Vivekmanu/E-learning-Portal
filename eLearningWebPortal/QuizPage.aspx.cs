using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class QuizPage : System.Web.UI.Page
    {
        int[] selectedQuestions = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var quizid = int.Parse(Request.QueryString["id"]);
                hdnId.Value = quizid.ToString();
                var db = new Entities();
                var test = db.Quizs.SingleOrDefault(x => x.Id == quizid);
                txtTitle.Text = test.Title;
                txtStart.Text = test.From.ToString("dd/MM/yyyy");
                txtEnd.Text = test.To.ToString("dd/MM/yyyy");

                if (test.QuizQuestions.Any())
                {
                    selectedQuestions = db.QuizQuestions.Where(x => x.FkQuizId == quizid).Select(x => x.FkQuestionId).ToArray();
                   
                }
            }
        }


        protected void btnCreate_Click(object sender, EventArgs e)
        {

            var db = new Entities();
            Quiz data = null;
            var Testid = 0;
            if (!string.IsNullOrEmpty(hdnId.Value))
            {
                Testid = int.Parse(hdnId.Value);
            }
            data = string.IsNullOrEmpty(hdnId.Value) ? new Quiz() : db.Quizs.SingleOrDefault(x => x.Id == Testid);
            if (db.Quizs.Any(x => x.Title.Equals(txtTitle.Text) && x.Id != Testid))
            {
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Quiz title already exist !";
            }
            else
            {
                data.Title = txtTitle.Text;
                data.From = Convert.ToDateTime(txtStart.Text);
                data.To = Convert.ToDateTime(txtEnd.Text);

                if (string.IsNullOrEmpty(hdnId.Value))
                {
                    db.Quizs.Add(data);
                }
                else
                {
                    var oldSelection = db.QuizCandidates;
                    db.QuizCandidates.RemoveRange(oldSelection);
                }

                foreach (ListItem item in chkQuestions.Items)
                {
                    if (item.Selected)
                    {
                        var qid = int.Parse(item.Value);
                        data.QuizQuestions.Add(new QuizQuestion() { FkQuizId = data.Id, FkQuestionId = qid });
                    }
                }

                db.SaveChanges();
                Response.Redirect("~/QuizList.aspx");
            }
        }
        protected void chkQuestions_DataBound(object sender, EventArgs e)
        {
            var checkboxlist = sender as CheckBoxList;
            foreach (ListItem item in checkboxlist.Items)
            {
                if (selectedQuestions != null)
                {
                    var q = int.Parse(item.Value);
                    item.Selected = selectedQuestions.Contains(q);
                }

            }

        }
        } }


 