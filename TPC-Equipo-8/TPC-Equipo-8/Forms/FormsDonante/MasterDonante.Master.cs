using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Helpers;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsDonante
{
    public partial class MasterDonante : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];

            if (usuario != null)
            {
                CargarAvatarDonante();
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("../FormsGlobales/Default.aspx");
        }
        public string ObtenerNombreUsuario()
        {
            Usuario usuario = Session["usuario"] as Usuario;
            return usuario != null ? usuario.Username : string.Empty;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("../FormsGlobales/Default.aspx");
        }

        public void CargarAvatarDonante()
        {
            Usuario usuario = (Usuario)Session["usuario"];

            if (usuario != null && usuario.TipoUsuario == TipoUsuario.DONANTE)
            {
                DonanteManager manager = new DonanteManager();
                int IdUsuario = usuario.idUsuario;
                string nombreArchivo = manager.ObtenerUrlAvatarDonante(IdUsuario);


                if (!string.IsNullOrEmpty(nombreArchivo))
                {
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");

                    string urlImagen = "~/Forms/FormsDonante/Content/images/imagen-perfil-usuario/" + nombreArchivo;
                    imgAvatar.ImageUrl = ResolveUrl(urlImagen + "?t=" + timestamp);
                }
                else
                {
                    imgAvatar.ImageUrl = "~/Forms/FormsDonante/Content/images/imagen-perfil-usuario/placeHolderPerfilUsuario.jpg";
                }
            }
        }
    }
}