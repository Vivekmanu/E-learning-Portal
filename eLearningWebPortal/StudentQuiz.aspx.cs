using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class StudentQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
                StudentQuizId.Value = Request.QueryString["id"];

            //grid.DataBind();
        }


        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            foreach (GridViewRow gvRow in grid.Rows)
            {
                GridView childGrid = (GridView)gvRow.FindControl("childGrid");

                foreach (GridViewRow row in childGrid.Rows)
                {
                    var radio = row.FindControl("chk") as RadioButton;
                    if (radio.Checked)
                    {
                        var hdnAId = row.FindControl("hdnAId") as HiddenField;
                        var hdnSQId = row.FindControl("hdnSQId") as HiddenField;
                        var aid = int.Parse(hdnAId.Value);
                        var sqid = int.Parse(hdnSQId.Value);

                        var db = new Entities();
                        var sq = db.StudentQuizQuestions.SingleOrDefault(x => x.SQId == sqid);
                        if (sq != null)
                            sq.AId = aid;
                        db.SaveChanges();
                    }
                }
            }




            //var childGrid = grid.Rows[0].Cells[0].FindControl("childGrid") as GridView;

            //foreach (GridViewRow row in childGrid.Rows)
            //{
            //    var radio = row.FindControl("chk") as RadioButton;
            //    if (radio.Checked)
            //    {
            //        var hdnAId = row.FindControl("hdnAId") as HiddenField;
            //        var hdnSQId = row.FindControl("hdnSQId") as HiddenField;
            //        var aid = int.Parse(hdnAId.Value);
            //        var sqid = int.Parse(hdnSQId.Value);

            //        var db = new Entities();
            //        var sq = db.StudentQuizQuestions.SingleOrDefault(x => x.SQId == sqid);
            //        if (sq != null)
            //            sq.AId = aid;
            //        db.SaveChanges();
            //    }
            //}
        }
        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = e.Row.DataItem as DataRowView;
                var qid = int.Parse(data["Id"].ToString());

                SqlDataQuizQuestionAnswer.FilterExpression = " FkQuestionId = " + data["Id"].ToString();

                //var childGride = e.Row.FindControl("childGrid") as GridView;
                //childGride.DataBind();


            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //update in data base Status ='Completed '

            //var status = new eLearningWebPortal.Models.StudentQuiz();

            //status.Status = 'Completed';

        }
    }
}