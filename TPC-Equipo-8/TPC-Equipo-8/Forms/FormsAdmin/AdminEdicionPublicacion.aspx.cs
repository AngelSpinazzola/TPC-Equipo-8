using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsAdmin
{
    public partial class AdminEdicionPublicacion : System.Web.UI.Page
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
                        List<Publicacion> lista = manager.ListarPublicaciones(int.Parse(Request.QueryString["idPublicacion"]));
                        Publicacion seleccionada = lista[0];

                        txtIdPublicacion.Text = seleccionada.idPublicacion.ToString();
                        txtFilial.Text = seleccionada.filial;
                        txtNombreReceptor.Text = seleccionada.nombreReceptor;
                        txtGrupoSanguineo.Text = seleccionada.grupoSanguineo;
                        txtDonantesNecesarios.Text = seleccionada.donantesNecesarios.ToString();
                        txtHorarios.Text = seleccionada.horarios;
                        txtFechaLimite.Text = seleccionada.fechaLimite.ToString("dd/MM/yyyy");
                        txtEstado.Text = seleccionada.estado.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Publicacion publicacion = new Publicacion();
                PublicacionesManager manager = new PublicacionesManager();

                publicacion.idPublicacion = int.Parse(txtIdPublicacion.Text);
                publicacion.filial = txtFilial.Text;
                publicacion.nombreReceptor = txtNombreReceptor.Text;
                publicacion.grupoSanguineo = txtGrupoSanguineo.Text;
                publicacion.donantesNecesarios = int.Parse(txtDonantesNecesarios.Text);
                publicacion.horarios = txtHorarios.Text;
                publicacion.fechaLimite = DateTime.ParseExact(txtFechaLimite.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                publicacion.estado = bool.Parse(txtEstado.Text);

                manager.ModificarPublicacion(publicacion);

                string script = "alert('La modificación fue exitosa.'); window.location='AdminGestionPublicaciones.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}