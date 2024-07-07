using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Helpers;

namespace TPC_Equipo_8.Forms.FormsGlobales
{
    public partial class RecuperacionContraseña : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperarContraseña_Click(object sender, EventArgs e)
        {

            EnvioEmail emailService = new EnvioEmail();
            emailService.armarCorreoRecuperacion(txtEmail.Text);

            string mensajeExito = "Se envió un correo de recuperación al email ingresado. " +
                              "Podría tardar unos minutos. Por favor revisa tu bandeja de entrada.";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            $"alert('{mensajeExito}');", true);

            try
            {
                emailService.enviarEmail();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}