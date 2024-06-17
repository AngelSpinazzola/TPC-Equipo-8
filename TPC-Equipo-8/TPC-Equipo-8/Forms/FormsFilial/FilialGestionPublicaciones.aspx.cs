using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    }
}