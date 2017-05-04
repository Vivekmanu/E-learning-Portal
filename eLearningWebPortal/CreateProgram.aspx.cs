using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class CreateProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                var qid = int.Parse(Request.QueryString["id"]);
                var db = new Entities();
                var prograam = db.Programs.SingleOrDefault(x => x.Id == qid);
                hdnId.Value = qid.ToString();
                txtName.Text = prograam.Name;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProgramList.aspx");
        }


        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            var db = new Entities();
           
            //Checking weather the id is new or already present inthe database
            Program data = null;

            var programid = 0;
            if (!string.IsNullOrEmpty(hdnId.Value))
            {
                programid = int.Parse(hdnId.Value);
            }

                data = string.IsNullOrEmpty(hdnId.Value) ? new Program() : db.Programs.SingleOrDefault(x => x.Id == programid);

            if (db.Programs.Any(x => x.Name.Equals(txtName.Text) && x.Id != programid))
            {
                customValidation.IsValid = false;
                customValidation.ErrorMessage = "Program  id already registered.";
            }
            else
            {

           

            data.Name = txtName.Text;

            if (string.IsNullOrEmpty(hdnId.Value))
            {
                db.Programs.Add(data);
            }
            db.SaveChanges();

            // CODE FOR PAGE IF WE DO NOT HAVE EDIT OPTION

            //if (string.IsNullOrEmpty(hdnId.Value))
            //{
            //    program = new eLearningWebPortal.Models.Program()
            //    {

            //        Name = txtName.Text,
            //    };
            //}
            //else
            //{
            //    if (db.Programs.Any(x => x.Name.Equals(txtName.Text)))
            //    {
            //        customValidation.IsValid = false;
            //        customValidation.ErrorMessage = "Program  id already registered.";
            //    }
            //    else
            //    {
            //        var program = new Program()
            //        {
            //            Name = txtName.Text,


            //        };
            //    }
            //}
            //if (string.IsNullOrEmpty(hdnId.Value))
            //{
            //    db.Programs.Add(program);
            //}
            //db.SaveChanges();

            Response.Redirect("~/ProgramList.aspx");
        }
    }
}
}













