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
                Usuario usuario = new Usuario();
                usuario = (Usuario)(Session["usuario"]);

                if (donanteManager.VerificarTurnoDonacion(usuario) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Ya tenés turno para donar.');", true);
                    return;
                }

                donanteManager.nuevoProximoDonante(Int32.Parse(Request.QueryString["idPublicacion"]), usuario.idUsuario);

                string script = @"
            alert('Te anotaste para donar correctamente. Presentate con DNI en la dirección correspondiente');
            window.location.href = '../FormsGlobales/Default.aspx';
        ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Por favor, confirme todos los requisitos antes de continuar.');", true);
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