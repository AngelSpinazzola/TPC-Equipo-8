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
    public partial class FilialRechazoDonacion : System.Web.UI.Page
    {
        public List<ProximasDonaciones> proximasDonaciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();


            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

            ProximasDonacionesManager manager = new ProximasDonacionesManager();
            proximasDonaciones = manager.ListarProximasDonaciones(IdFilial);

            int idPD = Int32.Parse(Request.QueryString["id"]);

            ProximasDonaciones seleccionado = proximasDonaciones.FirstOrDefault(d => d.id == idPD);

            TexNombreDonante.Text = seleccionado.NombreDonante;
            TexApeliidoDonante.Text = seleccionado.ApellidoDonante;
            TexDIN.Text = seleccionado.DNI;
            




        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            int idPD = Int32.Parse(Request.QueryString["id"]);

            ProximasDonaciones seleccionado = proximasDonaciones.FirstOrDefault(d => d.id == idPD);

            ProximasDonacionesManager manager = new ProximasDonacionesManager();

            string motivo = txtMotivo.Text;

            manager.RechazarDonacion(seleccionado,motivo);

            Response.Redirect("FilialGestionDonantes.aspx", false);




        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialGestionDonantes.aspx", false);
        }
    }
}