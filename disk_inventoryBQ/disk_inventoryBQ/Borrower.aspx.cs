using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace disk_inventoryBQ
{
    public partial class Borrower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                lblMessage.Text = "Borrower " + txtFirstName.Text + " added.";
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtPhone.Text = "";
            }
        }
    }
}