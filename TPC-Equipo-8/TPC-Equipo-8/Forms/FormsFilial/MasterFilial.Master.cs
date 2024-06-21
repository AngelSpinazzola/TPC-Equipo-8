using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Helpers;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class MasterFilial : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sessionActiva(Session["usuario"]))
            {
                Response.Redirect("../FormsGlobales/Login.aspx");
            }
            else
            {
                Usuario usuario = (Usuario)Session["usuario"];
                if (usuario.TipoUsuario != TipoUsuario.FILIAL)
                {
                    Response.Redirect("../FormsGlobales/FilialHome.aspx");
                }
            }
        }
    }
}