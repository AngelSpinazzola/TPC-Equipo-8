using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Helpers;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class MasterFilial : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] == null || ((Usuario)Session["usuario"]).TipoUsuario != TipoUsuario.FILIAL)
                {
                    Response.Redirect("../FormsGlobales/Login.aspx");
                }
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
            //Usuario usuario = Session["usuario"] as Usuario;



            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);
            FilialManager managerFilial = new FilialManager();

            if(Seguridad.sessionActiva(usuario))
            {
                int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                FilialCompleta filial = managerFilial.listarUnaFilialCompleta(IdFilial);
                return filial.nombre;
            }
            return string.Empty;
            //return usuario != null ? usuario.Username : string.Empty;
        }
    }
}