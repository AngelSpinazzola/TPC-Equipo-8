using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsAdmin
{
    public partial class AdminGestionPublicaciones : System.Web.UI.Page
    {
        public List<Publicacion> ListarPublicaciones { get; set; }
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

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idPublicacion = Convert.ToInt32(btn.CommandArgument);

            PublicacionesManager manager = new PublicacionesManager();
            ListarPublicaciones = manager.ListarPublicaciones();

            List<Publicacion> seleccionada;
            if (Session["PublicacionSeleccionada"] == null)
            {
                seleccionada = new List<Publicacion>();
            }
            else
            {
                seleccionada = (List<Publicacion>)Session["PublicacionSeleccionada"];
            }

            foreach (Publicacion item in ListarPublicaciones)
            {
                if (idPublicacion == item.idPublicacion)
                {
                    if (!seleccionada.Any(a => a.idPublicacion == item.idPublicacion))
                    {
                        seleccionada.Add(item);
                    }
                    break;
                }
            }

            Session["PublicacionSeleccionada"] = seleccionada;
            Response.Redirect("AdminEdicionPublicacion.aspx?idPublicacion=" + idPublicacion);
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {

        }
    }
}