using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manager;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Helpers;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                usuario = (Usuario)(Session["usuario"]);
                FilialManager managerFilial = new FilialManager();
                DonacionManager manager = new DonacionManager();
                if (Seguridad.sessionActiva(usuario) && Seguridad.sessionFilial(usuario))
                {
                    int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                    rptFilialDetails.DataSource = managerFilial.ListarFiliales(idFilial:IdFilial);
                    rptFilialDetails.DataBind();
                    dgvHomeFilialDonantes.DataSource = manager.ListarDonaciones(IdFilial);
                    dgvHomeFilialDonantes.DataBind();

                }
                else
                {
                    Response.Redirect("Error.aspx", false);
                }


            }
           


        }

       
        protected void dgvHomeFilial_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            DonacionManager manager = new DonacionManager();

            if(Seguridad.sessionActiva(usuario) && Seguridad.sessionFilial(usuario))
            {
                int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                string direccion = managerFilial.ObtenerDireccion(IdFilial);
                Label lblDireccion = (Label)e.Row.FindControl("lblDireccion");
                if (lblDireccion != null)
                {
                    lblDireccion.Text = direccion;
                }
            }
            else
            {
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialPerfil.aspx");
        }
    }
}