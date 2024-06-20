using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            if (TextBoxLogin.Text == "")
            {
                id = 1;

            }
            else
            {
                id = Convert.ToInt32(TextBoxLogin.Text);
            }
            Session.Add("Filialid", id);

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            int id;
            if (TextBoxLogin.Text == "")
            {
                id = 1;

            }
            else
            {
                id = Convert.ToInt32(TextBoxLogin.Text);
            }
            Session.Add("Filialid", id);

        }
    }
}