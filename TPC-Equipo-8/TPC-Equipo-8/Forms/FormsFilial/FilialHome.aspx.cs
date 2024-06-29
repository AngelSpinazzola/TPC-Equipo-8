using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manager;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            DonacionManager manager = new DonacionManager();

            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

            if (!IsPostBack)
            {
                dgvHomeFilial.DataSource = managerFilial.ListarFiliales(IdFilial);
                dgvHomeFilial.DataBind();
                dgvHomeFilialDonantes.DataSource = manager.ListarDonaciones(IdFilial);
                dgvHomeFilialDonantes.DataBind();

            }


        }

        protected void ButtonPrueba_Click(object sender, EventArgs e)
        {
            //int id = Convert.ToInt32(Session["Filialid"]);

            ////FilialManager manager = new FilialManager();
            //FilialManager managerFilial = new FilialManager();
            //DonacionManager manager = new DonacionManager();

            //dgvHomeFilial.DataSource = managerFilial.ListarFiliales(id);
            //dgvHomeFilial.DataBind();

            //dgvHomeFilialDonantes.DataSource = manager.ListarDonaciones(id);
            //dgvHomeFilialDonantes.DataBind();


        }

        protected void dgvHomeFilial_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            DonacionManager manager = new DonacionManager();

            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);


            string direccion = managerFilial.ObtenerDireccion(IdFilial);

            Label lblDireccion = (Label)e.Row.FindControl("lblDireccion");
            if (lblDireccion != null)
            {
                lblDireccion.Text = direccion;
            }

        }
    }
}