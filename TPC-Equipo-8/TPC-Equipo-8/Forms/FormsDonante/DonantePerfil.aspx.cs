using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;
using TPC_Equipo_8.Helpers;


namespace TPC_Equipo_8.Forms.FormsDonante
{
    public partial class DonantePerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] == null || ((Usuario)Session["usuario"]).TipoUsuario != TipoUsuario.DONANTE)
                {
                    Response.Redirect("../FormsGlobales/Login.aspx");
                }
            }

            Usuario usuario = (Usuario)Session["usuario"];

            if (usuario != null)
            {
                Donante donante = new Donante();
                DonanteManager manager = new DonanteManager();
                
                int usuarioId = usuario.idUsuario;

                donante = manager.ListarDonante(usuarioId);


                txtNombre.Text = donante.nombre;
                txtApellido.Text = donante.apellido;
                txtDni.Text = donante.dni;
                txtEmail.Text = donante.email;
                txtFechaAlta.Text = donante.fechaAlta.ToString();
                txtNombreGrupoSanguineo.Text = donante.tipoSangre;
                txtNombreProvincia.Text = donante.direccion.provincia;
                txtNombreLocalidad.Text = donante.direccion.localidad;
                txtNombreCiudad.Text = donante.direccion.ciudad;
                txtCalle.Text = donante.direccion.calle;
                txtAltura.Text = donante.direccion.altura.ToString();
                txtCp.Text = donante.direccion.codigoPostal;

            }

        }
    }
}