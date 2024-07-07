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
            FilialManager managerFilial = new FilialManager();
            usuario = (Usuario)(Session["usuario"]);
            if(usuario != null)
            {
                int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                ProximasDonacionesManager manager = new ProximasDonacionesManager();
                proximasDonaciones = manager.ListarProximasDonaciones(IdFilial);
                int idPD = Int32.Parse(Request.QueryString["id"]);
                ProximasDonaciones seleccionado = proximasDonaciones.FirstOrDefault(d => d.id == idPD);
                TexNombreDonante.Text = seleccionado.NombreDonante;
                TexNombreDonante.ReadOnly = true;
                TexApellidoDonante.Text = seleccionado.username;
                TexApellidoDonante.ReadOnly = true;
                TexDIN.Text = seleccionado.DNI;
                TexDIN.ReadOnly = true;
            }
            else
            {
                Response.Redirect("Error.aspx", false);
            }
                 

              
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            try
            {
               
                int idPD = Int32.Parse(Request.QueryString["id"]);

                ProximasDonaciones seleccionado = proximasDonaciones.FirstOrDefault(d => d.id == idPD);

                ProximasDonacionesManager manager = new ProximasDonacionesManager();

                string motivo = txtMotivo.Text;

                manager.RechazarDonacion(seleccionado, motivo);

                Response.Redirect("FilialGestionDonantes.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            
            




        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            
               
            
            Response.Redirect("FilialGestionDonantes.aspx", false);
            
            
        }
    }
}