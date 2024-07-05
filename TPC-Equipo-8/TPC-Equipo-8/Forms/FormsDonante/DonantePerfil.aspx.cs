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
            DonanteManager manager = new DonanteManager();

            if(usuario != null)
            {
                CargarPerfil(usuario);
                IdDonante = manager.ObtenerIdDonante(usuario);
                dgvUltimasDonaciones.DataSource = manager.ObtenerDatosDonacion(IdDonante);
                dgvUltimasDonaciones.DataBind();

                dgvProximaDonacion.DataSource = manager.ObtenerDatosProximaDonacion(IdDonante);
                dgvProximaDonacion.DataBind();
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
            txtNombreProvincia.Text = donante.direccion.provincia;
            txtNombreLocalidad.Text = donante.direccion.localidad;
            txtNombreCiudad.Text = donante.direccion.ciudad;
            txtCalle.Text = donante.direccion.calle;
            txtAltura.Text = donante.direccion.altura.ToString();
            txtCp.Text = donante.direccion.codigoPostal;

            imgNuevoPerfil.ImageUrl = CargarUrlImagenDonante();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["usuario"];
                DonanteManager manager = new DonanteManager();
                Donante donante = new Donante();

                int usuarioId = usuario.idUsuario;

                string ruta = Server.MapPath("./Content/Images/imagen-perfil-usuario/");
                txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuarioId + ".jpg");

                donante.nombre = txtNombre.Text;
                donante.apellido = txtApellido.Text;
                donante.urlFoto = "perfil-" + usuarioId + ".jpg";

                manager.EditarPerfilDonante(donante, usuarioId);

                Image img = (Image)Master.FindControl("imgAvatar");

                string timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");

                if (img != null) 
                {
                    img.ImageUrl = ResolveUrl(CargarUrlImagenDonante() + "?t=" + timestamp);
                }

                imgNuevoPerfil.ImageUrl = ResolveUrl(CargarUrlImagenDonante() + "?t=" + timestamp );

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
    }
}