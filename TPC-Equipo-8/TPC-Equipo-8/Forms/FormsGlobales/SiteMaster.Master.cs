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

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
        }
    }
}