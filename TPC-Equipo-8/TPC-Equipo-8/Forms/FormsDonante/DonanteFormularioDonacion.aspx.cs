using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsDonante
{
    public partial class DonanteFormularioDonacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] == null || ((Usuario)Session["usuario"]).TipoUsuario != TipoUsuario.DONANTE)
                {
                    Response.Redirect("../FormsGlobales/Login.aspx");
                }
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (TodosLosRequisitosConfirmados())
            {
                DonanteManager donanteManager = new DonanteManager();
                Usuario usuario = (Usuario)(Session["usuario"]);
                int verificacionTurno = donanteManager.VerificarTurnoDonacion(usuario);
                string redirectUrl = "../FormsDonante/DonantePerfil.aspx";

                if (verificacionTurno == 1)
                {
                    string script = $"mostrarMensaje('Ya tenés turno para donar.', 'info', '{redirectUrl}');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageScript", script, true);
                }
                else if (verificacionTurno == 2)
                {
                    donanteManager.nuevoProximoDonante(Int32.Parse(Request.QueryString["idPublicacion"]), usuario.idUsuario);
                    string scriptExito = $"mostrarMensaje('Te anotaste para donar correctamente. Presentate con DNI en la dirección correspondiente', 'success', '{redirectUrl}');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageExitoScript", scriptExito, true);
                }
                else
                {
                    string scriptError = "mostrarMensaje('Por favor, confirme todos los requisitos antes de continuar.', 'warning');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageErrorScript", scriptError, true);
                }
            }
            else
            {
                string scriptError = "mostrarMensaje('Por favor, confirme todos los requisitos antes de continuar.', 'warning');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageErrorScript", scriptError, true);
            }

        }

        private bool TodosLosRequisitosConfirmados()
        {
            return chkEdad.Checked && chkPeso.Checked && chkDNI.Checked &&
                   chkEmbarazo.Checked && chkAnemia.Checked && chkSueno.Checked &&
                   chkUltimaDonacion.Checked && chkDesayuno.Checked && chkTatuaje.Checked;
        }
    }

}
