using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;

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
    }
}