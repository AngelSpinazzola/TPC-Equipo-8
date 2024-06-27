using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialGestionPublicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            PublicacionesManager manager = new PublicacionesManager();
            int id = Convert.ToInt32(Session["Filialid"]);

            if (!IsPostBack)
            {

                repPublicacionesFilial.DataSource = manager.ListarPublicaciones(id);
                repPublicacionesFilial.DataBind();

            }


        }

        protected void btnCrearPublicacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialAltaPublicacion.aspx",false);
        }

        protected void EditarPublicacion_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int idPublicacion = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("FilialAltaPublicacion.aspx?idPublicacion=" + idPublicacion);
        }
    }
}