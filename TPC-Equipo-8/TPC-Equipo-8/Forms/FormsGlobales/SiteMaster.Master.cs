using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Helpers;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public Usuario usuarioEnSession { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];

            if (usuario != null)
            {
                CargarAvatarDonante();

            }
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
                    imgPerfil.ImageUrl = ResolveUrl(urlImagen + "?t=" + timestamp);
                }
                else
                {
                    imgPerfil.ImageUrl = "~/Forms/FormsDonante/Content/images/imagen-perfil-usuario/placeHolderPerfilUsuario.jpg";
                }
            }
        }

        public int ObtenerRolUsuario()
        {
            if (Session["usuario"] == null)
            {
                return -1;
            }

            Usuario usuario = Session["usuario"] as Usuario;
            return (int)usuario.TipoUsuario;
        }

        public string ObtenerNombreUsuario()
        {
            Usuario usuario = Session["usuario"] as Usuario;
            return usuario != null ? usuario.Username : string.Empty;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
        }
    }
}