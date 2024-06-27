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
    public partial class FilialAltaPublicacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["idPublicacion"] != null)
                    {
                        PublicacionesManager manager = new PublicacionesManager();
                        List<Publicacion> lista = manager.ListarUnaPublicacion(1,Int32.Parse(Request.QueryString["idPublicacion"]));
                        Publicacion seleccionada = lista[0];

                        txtNombreReceptor.Text = seleccionada.nombreReceptor;
                        DropDownTipoSangre.SelectedValue = seleccionada.grupoSanguineo;
                        DropDownUrgencia.SelectedValue = seleccionada.urgencia;
                        txtDonantesNec.Text = seleccionada.donantesNecesarios.ToString();
                        textHorarios.Text = seleccionada.horarios;
                        textFecha.Text = seleccionada.fechaLimite.ToString();

                    } 
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }



        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Publicacion nuevaPublicacion = new Publicacion();


            nuevaPublicacion.filial = Session["Filialid"].ToString();
            nuevaPublicacion.nombreReceptor = txtNombreReceptor.Text;
            nuevaPublicacion.grupoSanguineo = DropDownTipoSangre.SelectedValue;
            nuevaPublicacion.urgencia = DropDownUrgencia.SelectedValue;
            nuevaPublicacion.donantesNecesarios = int.Parse(txtDonantesNec.Text);
            nuevaPublicacion.horarios= textHorarios.Text;
            nuevaPublicacion.fechaLimite= DateTime.Parse(textFecha.Text);
            nuevaPublicacion.estado = true;

            PublicacionesManager manager = new PublicacionesManager();
            manager.AgregarPublicacion(nuevaPublicacion);

            Response.Redirect("FilialGestionPublicaciones.aspx", false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialGestionPublicaciones.aspx", false);
        }
    }
}