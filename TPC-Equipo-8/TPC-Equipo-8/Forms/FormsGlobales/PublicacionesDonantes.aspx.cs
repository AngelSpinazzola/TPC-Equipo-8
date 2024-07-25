using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsGlobales
{
    public partial class PublicacionesDonantes : System.Web.UI.Page
    {
        public AccesoDatos datos = new AccesoDatos();
        public List<Publicacion> ListaPublicaciones { get; set; }
        public Filial filialSeleccionada { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PublicacionesManager manager = new PublicacionesManager();
            int idFilial;

            if (Request.QueryString["idFilial"] != null && int.TryParse(Request.QueryString["idFilial"], out idFilial))
            {
                ListaPublicaciones = manager.ListarPublicaciones(idFilial, true);
            }
            else
            {
                ListaPublicaciones = manager.ListarPublicaciones(soloActivas: true);
            }

            if (ListaPublicaciones != null && ListaPublicaciones.Count > 0)
            {
                repPublicaciones.DataSource = ListaPublicaciones;
                repPublicaciones.DataBind();
            }
        }

        protected string GetUrgencyCardClass(object urgencyObj)
        {
            string urgency = urgencyObj.ToString();
            switch (urgency)
            {
                case "Alta":
                    return "urgency-high"; 
                case "Media":
                    return "urgency-medium";
                case "Baja":
                    return "urgency-low";
                default:
                    return ""; 
            }
        }
        protected void btnDonar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Button btn = (Button)sender;
                int idPublicacion = Convert.ToInt32(btn.CommandArgument);

                Response.Redirect("../FormsDonante/DonanteFormularioDonacion.aspx?idPublicacion=" + idPublicacion);

            }

        }

    }
}