using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Helpers;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialGestionDonantes : System.Web.UI.Page
    {

        public List<ProximasDonaciones> proximasDonaciones { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           
                Usuario usuario = new Usuario();
                usuario = (Usuario)(Session["usuario"]);
                FilialManager managerFilial = new FilialManager();

                if (Seguridad.sessionActiva(usuario) && Seguridad.sessionFilial(usuario))
                {
                    int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

                    ProximasDonacionesManager manager = new ProximasDonacionesManager();
                    proximasDonaciones = manager.ListarProximasDonaciones(IdFilial);
                    dgvFilialDonantes.DataSource = proximasDonaciones;
                    dgvFilialDonantes.DataBind();

                }
                else
                {
                    Response.Redirect("Error.aspx", false);
                }

            

        }

        protected void btnDono_Click(object sender, EventArgs e)
        {

           try
            {
                LinkButton btn = (LinkButton)sender;
                int id = Convert.ToInt32(btn.CommandArgument);

                ProximasDonaciones seleccionado = proximasDonaciones.FirstOrDefault(d => d.id == id);

                ProximasDonacionesManager manager = new ProximasDonacionesManager();

                manager.AgregarDonacion(seleccionado);

                Response.Redirect("FilialHome.aspx", false);
            }
           catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
            
            
            

        }

        protected void btnNoDono_Click(object sender, EventArgs e)
        {

            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("FilialRechazoDonacion.aspx?id=" +id);
        }
    }
}