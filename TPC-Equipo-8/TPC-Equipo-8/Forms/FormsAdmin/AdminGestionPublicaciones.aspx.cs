using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsAdmin
{
    public partial class AdminGestionPublicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PublicacionesManager manager = new PublicacionesManager();
            dgvPublicaciones.DataSource = manager.ListarPublicaciones();
            dgvPublicaciones.DataBind();
        }

        protected void dgvPublicaciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime fechaLimite = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "fechaLimite"));
                e.Row.Cells[6].Text = fechaLimite.ToString("dd-MM-yyyy"); 
            }
        }
    }
}