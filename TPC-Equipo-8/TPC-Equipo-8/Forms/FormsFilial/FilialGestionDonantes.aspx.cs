using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialGestionDonantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            

            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

            ProximasDonacionesManager manager = new ProximasDonacionesManager();
           
            if (!IsPostBack)
            {

                dgvFilialDonantes.DataSource = manager.ListarProximasDonaciones(IdFilial);
                dgvFilialDonantes.DataBind();

            }


        }
    }
}