using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLearningWebPortal
{
    public partial class AnswerList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    var qid = Request.QueryString["id"];
                    ddlQuestions.SelectedValue = qid;
                }
            }
        }

       

        protected void data_bind(object sender, EventArgs e)
        {
            
        }

        protected void SqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            SqlDataSource.FilterExpression = " FkQuestionId=" + ddlQuestions.SelectedValue;
        }
        protected void ddlQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource.FilterExpression = " FkCourseId=" + ddlQuestions.SelectedValue;
        }
    }
}