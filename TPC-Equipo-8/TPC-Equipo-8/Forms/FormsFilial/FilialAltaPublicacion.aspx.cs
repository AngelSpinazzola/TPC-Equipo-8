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
        private Dictionary<string, string> tipoSangreValores = new Dictionary<string, string>
        {
            { "A+", "1" },
            { "A-", "2" },
            { "B+", "3" },
            { "B-", "4" },
            { "AB+", "5" },
            { "AB-", "6" },
            { "O+", "7" },
            { "O-", "8" }
        };
        protected string ObtenerValorTipoSangre(string tipoSangre)
        {
            if (tipoSangreValores.ContainsKey(tipoSangre))
            {
                return tipoSangreValores[tipoSangre];
            }
            else
            {
                return string.Empty;
            }
        }

        private Dictionary<string, string> tipoUrgenciaValores = new Dictionary<string, string>
        {
            { "Baja", "1" },
            { "Media", "2" },
            { "Alta", "3" },
        };
        protected string ObtenerValorTipoUrgencia(string tipoUrgencia)
        {
            if (tipoUrgenciaValores.ContainsKey(tipoUrgencia))
            {
                return tipoUrgenciaValores[tipoUrgencia];
            }
            else
            {
                return string.Empty;
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    Usuario usuario = new Usuario();
                    usuario = (Usuario)(Session["usuario"]);

                    FilialManager managerFilial = new FilialManager();
                    int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

                    if (Request.QueryString["idPublicacion"] != null)
                    {
                        PublicacionesManager manager = new PublicacionesManager();
                        List<Publicacion> lista = manager.ListarUnaPublicacion(IdFilial,Int32.Parse(Request.QueryString["idPublicacion"]));
                        Publicacion seleccionada = lista[0];

                        txtNombreReceptor.Text = seleccionada.nombreReceptor;
                        DropDownTipoSangre.SelectedValue = ObtenerValorTipoSangre(seleccionada.grupoSanguineo); ;
                        DropDownUrgencia.SelectedValue = ObtenerValorTipoUrgencia(seleccionada.urgencia);
                        txtDonantesNec.Text = seleccionada.donantesNecesarios.ToString();
                        textHorarios.Text = seleccionada.horarios;
                        textFecha.Text = seleccionada.fechaLimite.ToString("yyyy-MM-dd");

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

            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);


            nuevaPublicacion.filial = IdFilial.ToString();
            nuevaPublicacion.nombreReceptor = txtNombreReceptor.Text;
            nuevaPublicacion.grupoSanguineo = DropDownTipoSangre.SelectedValue;
            nuevaPublicacion.urgencia = DropDownUrgencia.SelectedValue;
            nuevaPublicacion.donantesNecesarios = int.Parse(txtDonantesNec.Text);
            nuevaPublicacion.horarios= textHorarios.Text;
            nuevaPublicacion.fechaLimite= DateTime.Parse(textFecha.Text);
            nuevaPublicacion.estado = true;

            PublicacionesManager manager = new PublicacionesManager();

            if(Request.QueryString["idPublicacion"] != null)
            {
                nuevaPublicacion.idPublicacion = (Convert.ToInt32(Request.QueryString["idPublicacion"]));
                manager.ModificarPublicacion(nuevaPublicacion);
            }
            else
            {
                manager.AgregarPublicacion(nuevaPublicacion);
            }
            

            Response.Redirect("FilialGestionPublicaciones.aspx", false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialGestionPublicaciones.aspx", false);
        }
    }
}