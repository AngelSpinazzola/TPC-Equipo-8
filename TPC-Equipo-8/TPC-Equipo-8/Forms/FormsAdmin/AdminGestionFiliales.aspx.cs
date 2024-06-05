using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsAdmin
{
    public partial class AdminGestionFiliales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FilialManager manager = new FilialManager();
            dgvFiliales.DataSource = manager.ListarFiliales();
            dgvFiliales.DataBind();
        }

        protected void dgvFiliales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                FilialManager filialManager = new FilialManager();

                int idFilial = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "idFilial"));
                string direccion = filialManager.ObtenerDireccion(idFilial);

                Label lblDireccion = (Label)e.Row.FindControl("lblDireccion");
                if (lblDireccion != null)
                {
                    lblDireccion.Text = direccion;
                }
            }
        }

        
    }
}