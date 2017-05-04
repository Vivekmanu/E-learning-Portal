using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eLearningWebPortal.Models;

namespace eLearningWebPortal
{
    public partial class ProgramList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
           
        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {



        }

        

        
        

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            //id taken from gird value indirectly
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var ismember = db.Members.Any(x => x.FkProgramId == id);
            if (ismember)
            {
                lblMessage.Text = "Some members are registered under this program. Therefore it cannot be deleted.";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Visible = false;
                var program = db.Programs.SingleOrDefault(x => x.Id == id);
                db.Programs.Remove(program);
                db.SaveChanges();
                grid.DataBind();
            }


        }

        protected void btnactive_Command(object sender, CommandEventArgs e)
        { 
            //Checking if the program is active or not
         
            var id = int.Parse(e.CommandArgument.ToString());
            var db = new Entities();
            var program = db.Programs.SingleOrDefault(x => x.Id == id);
            program.IsActive = !program.IsActive;
            db.SaveChanges();
            grid.DataBind();


        }

     
    }
    }
