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
           
            if (!IsPostBack)
            {
                PublicacionesManager manager = new PublicacionesManager();
                List<Publicacion> publicaciones = manager.RecargarPublicaciones(soloActivas: true);
                dgvPublicaciones.DataSource = publicaciones;
                dgvPublicaciones.DataBind();

                if (Session["MensajeExito"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('{Session["MensajeExito"]}');", true);
                    Session.Remove("MensajeExito");
                }
            }

        }

        protected void dgvPublicaciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime fechaLimite = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "fechaLimite"));
                e.Row.Cells[6].Text = fechaLimite.ToString("dd/MM/yyyy"); 
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
            try
            {
                LinkButton btn = (LinkButton)sender;
                int idPublicacion = Convert.ToInt32(btn.CommandArgument);

                PublicacionesManager manager = new PublicacionesManager();
                manager.DesactivarPublicacion(idPublicacion);

                Session["MensajeExito"] = "Publicación eliminada con éxito.";

                Response.Redirect(Request.RawUrl);

                /*List<Publicacion> publicacionesActualizadas = manager.RecargarPublicaciones(soloActivas: true);
                dgvPublicaciones.DataSource = publicacionesActualizadas;
                dgvPublicaciones.DataBind();*/



            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}