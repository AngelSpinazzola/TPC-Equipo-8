using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Forms.FormsGlobales
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinuarRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario nuevo = new Usuario();

                nuevo.email = txtRegistroEmail.Text;
                nuevo.pass = txtRegistroPass.Text;
                nuevo.dni = txtRegistroDni.Text;





            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}