using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Helpers;
using static TPC_Equipo_8.Helpers.EnvioEmail;

namespace TPC_Equipo_8.Forms.FormsGlobales
{
    public partial class RecuperacionContraseña : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperarContraseña_Click(object sender, EventArgs e)
        {
            string correoDestino = txtEmail.Text; // 
            EnvioEmail emailService = new EnvioEmail();

            try
            {
                emailService.armarCorreoRecuperacion(correoDestino);
                emailService.enviarEmail(); 
                string scriptExito = "mostrarMensaje('Se ha enviado un correo con tu contraseña.', 'success');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageExitoScript", scriptExito, true);
            }
            catch (EmailNotFoundException ex)
            {
                string scriptError = $"mostrarMensaje('{ex.Message}', 'error');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageErrorScript", scriptError, true);
            }
            catch (Exception ex)
            {
                
                string scriptError = $"mostrarMensaje('Ocurrió un error inesperado: {ex.Message}', 'error');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageErrorScript", scriptError, true);
            }
        }
    }
}