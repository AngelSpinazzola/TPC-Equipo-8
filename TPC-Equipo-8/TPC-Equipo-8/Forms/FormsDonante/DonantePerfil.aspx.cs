using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;
using TPC_Equipo_8.Helpers;
using System.IO;
using manager;


namespace TPC_Equipo_8.Forms.FormsDonante
{
    public partial class DonantePerfil : System.Web.UI.Page
    {
        public int IdDonante { get; set; }
        public int cantPersonasAyudadas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];

            if (!IsPostBack)
            {
                if (Session["usuario"] == null || ((Usuario)Session["usuario"]).TipoUsuario != TipoUsuario.DONANTE)
                {
                    Response.Redirect("../FormsGlobales/Login.aspx");
                }
                //if(usuario != null)
                //{
                //    CargarPerfil(usuario);
                //}
            }

            if (usuario != null)
            {
                CargarPerfil(usuario);
                CargarProximaDonacion(usuario);
                CargarUltimasDonaciones(usuario);
                CargarCantidadPersonasAyudadas(usuario);
            }
        }

        private void CargarPerfil(Usuario usuario)
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
            txtProvincia.Text = donante.direccion.provincia;
            txtLocalidad.Text = donante.direccion.localidad;
            txtCiudad.Text = donante.direccion.ciudad;
            txtCalle.Text = donante.direccion.calle;
            txtAltura.Text = donante.direccion.altura.ToString();
            txtCp.Text = donante.direccion.codigoPostal;

            imgNuevoPerfil.ImageUrl = CargarUrlImagenDonante();
        }

        private void CargarProximaDonacion(Usuario usuario)
        {
            DonanteManager manager = new DonanteManager();
            List<ProximasDonaciones> proximaDonacion = new List<ProximasDonaciones>();
            IdDonante = manager.ObtenerIdDonante(usuario);

            proximaDonacion = manager.ObtenerDatosProximaDonacion(IdDonante);

            if (proximaDonacion.Count() > 0)
            {
                dgvProximaDonacion.DataSource = proximaDonacion;
                dgvProximaDonacion.DataBind();
            }
            else
            {
                tituloProximaDonacion.Visible = false;
                dgvProximaDonacion.Visible = false;
            }
        }

        private void CargarUltimasDonaciones(Usuario usuario)
        {
            DonanteManager manager = new DonanteManager();
            IdDonante = manager.ObtenerIdDonante(usuario);

            dgvUltimasDonaciones.DataSource = manager.ObtenerDatosDonacionesRealizadas(IdDonante);
            dgvUltimasDonaciones.DataBind();
        }

        private void CargarCantidadPersonasAyudadas(Usuario usuario)
        {
            DonanteManager manager = new DonanteManager();
            IdDonante = manager.ObtenerIdDonante(usuario);
            cantPersonasAyudadas = manager.ObtenerDatosDonacionesRealizadas(IdDonante).Count();
            lblCantidadPersonasAyudadas.Text = cantPersonasAyudadas.ToString();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["usuario"];
                int usuarioId = usuario.idUsuario;

                DonanteManager manager = new DonanteManager();

                Donante donante = new Donante();

                donante.nombre = txtNombre.Text;
                donante.apellido = txtApellido.Text;

                if (txtImagen.PostedFile != null && txtImagen.PostedFile.ContentLength > 0)
                {
                    string ruta = Server.MapPath("./Content/Images/imagen-perfil-usuario/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuarioId + ".jpg");

                    donante.urlFoto = "perfil-" + usuarioId + ".jpg";
                }
                else
                {
                    donante.urlFoto = "perfil-" + usuarioId + ".jpg";
                }

                donante.direccion = new Direccion();

                donante.direccion.provincia = txtProvincia.Text;
                donante.direccion.calle = txtCalle.Text;
                donante.direccion.altura = int.Parse(txtAltura.Text);
                donante.direccion.codigoPostal = txtCp.Text;
                donante.direccion.localidad = txtLocalidad.Text;
                donante.direccion.ciudad = txtCiudad.Text;

                manager.EditarPerfilDonante(donante, usuarioId);

                Image img = (Image)Master.FindControl("imgAvatar");

                string timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");

                if (img != null)
                {
                    img.ImageUrl = ResolveUrl(CargarUrlImagenDonante() + "?t=" + timestamp);
                }

                imgNuevoPerfil.ImageUrl = ResolveUrl(CargarUrlImagenDonante() + "?t=" + timestamp);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }

        public string CargarUrlImagenDonante()
        {
            Usuario usuario = (Usuario)Session["usuario"];
            string url = "~/Forms/FormsDonante/Content/images/imagen-perfil-usuario/placeHolderPerfilUsuario.jpg";

            if (usuario != null && usuario.TipoUsuario == TipoUsuario.DONANTE)
            {
                DonanteManager manager = new DonanteManager();
                int IdUsuario = usuario.idUsuario;
                string nombreArchivo = manager.ObtenerUrlAvatarDonante(IdUsuario);

                if (!string.IsNullOrEmpty(nombreArchivo))
                {
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                    url = "~/Forms/FormsDonante/Content/images/imagen-perfil-usuario/" + nombreArchivo + "?t=" + timestamp;

                    return url;
                }
            }
            return url;
        }

        protected void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["usuario"];
                DonanteManager donanteManager = new DonanteManager();


                donanteManager.ActualizarPassword(usuario, txtContrasenaNueva.Text);
                string scriptExito = "mostrarMensaje('Contraseña actualizada correctamente.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageExitoScript", scriptExito, true);
            }
            catch (Exception ex)
            {

                string scriptError = $"mostrarMensaje('Error al actualizar la contraseña: {ex.Message}');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageErrorScript", scriptError, true);
            }
            finally
            {
                
            }
        }
    }
}