using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialGestionDonantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //int id = Convert.ToInt32(Session["Filialid"]);
            ProximasDonacionesManager manager = new ProximasDonacionesManager();
           
            if (!IsPostBack)
            {

                dgvFilialDonantes.DataSource = manager.ListarProximasDonaciones(1);
                dgvFilialDonantes.DataBind();

            }


        }
    }
}