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
    public partial class AdminGestionFiliales : System.Web.UI.Page
    {
        public List<Filial> ListaFiliales { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FilialManager manager = new FilialManager();
            dgvFiliales.DataSource = manager.ListarFiliales(habilitada: 0);
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

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idFilial = Convert.ToInt32(btn.CommandArgument);

            FilialManager manager = new FilialManager();
            ListaFiliales = manager.ListarFiliales();

            List<Filial> seleccionada;
            if (Session["FilialSeleccionada"] == null)
            {
                seleccionada = new List<Filial>();
            }
            else
            {
                seleccionada = (List<Filial>)Session["FilialSeleccionada"];
            }

            foreach (Filial item in ListaFiliales)
            {
                if(idFilial == item.idFilial)
                {
                    if(!seleccionada.Any(a => a.idFilial == item.idFilial))
                    {
                        seleccionada.Add(item);
                    }
                    break;
                }
            }

            Session["FilialSeleccionada"] = seleccionada;
            Response.Redirect("AdminEdicionFilial.aspx?idFilial=" + idFilial);
        }
    }
}