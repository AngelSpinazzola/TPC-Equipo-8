using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;
using TPC_Equipo_8.Helpers;


namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FilialManager filialManager = new FilialManager();
            List <Provincia> provincias = new List <Provincia>();
            if(!IsPostBack)
            {
                provincias = filialManager.listarProvincias();
                DropDownProvincia.DataSource = provincias;
                DropDownProvincia.DataTextField = "Nombre";
                DropDownProvincia.DataValueField = "id";
                DropDownProvincia.DataBind();
                
               
               

                Usuario usuario = new Usuario();
                usuario = (Usuario)(Session["usuario"]);
                FilialManager managerFilial = new FilialManager();
                if (Seguridad.sessionActiva(usuario) && Seguridad.sessionFilial(usuario))
                {
                    int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                    FilialCompleta filial = managerFilial.listarUnaFilialCompleta(IdFilial);
                    txtNombreFilial.Text = filial.nombre;
                    txtTelefono.Text = filial.telefono;
                    txtHorarioAtencion.Text = filial.horarioAtencion;
                    txtCorreo.Text = filial.correo;
                    txtUrlWeb.Text = filial.urlWeb;
                    TextCalle.Text = filial.calle;
                    TextAltura.Text = filial.altura.ToString();
                    TextPiso.Text = filial.piso.ToString();
                    TextDep.Text = filial.departamento;

                    DropDownProvincia.SelectedValue = filial.provincia.ToString();
                    LlenarCiudades(filial.provincia);
                    DropDownCiudad.SelectedValue = filial.ciudad.ToString();
                    LlenarLocalidades(filial.ciudad);
                    DropDownLocalidad.SelectedValue = filial.localidad.ToString();
                    LlenarCodigoPostal(filial.localidad);
                    DropDownCP.SelectedValue = filial.cp;

                }
            }

        }

        protected void DropDownProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {

            
                int id = int.Parse(DropDownProvincia.SelectedItem.Value);
                //FilialManager filialManager = new FilialManager();
                //List<Ciudad> ciudads = new List<Ciudad>();

                //ciudads = filialManager.listarCiudad(id);
                //DropDownCiudad.DataSource = ciudads;
                //DropDownCiudad.DataTextField = "Nombre";
                //DropDownCiudad.DataValueField = "id";
                //DropDownCiudad.DataBind();
                LlenarCiudades(id);
            //DropDownCP.Items.Clear();
            //Page.Validate();
            int id1 = int.Parse(DropDownCiudad.SelectedItem.Value);
            LlenarLocalidades(id1);

            int id2 = int.Parse(DropDownLocalidad.SelectedItem.Value);
            LlenarCodigoPostal(id2);





        }

        protected void DropDownCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
                int id = int.Parse(DropDownCiudad.SelectedItem.Value);
                //FilialManager filialManager = new FilialManager();
                //List<Localidad> localidad = new List<Localidad>();
                //localidad = filialManager.listarLocalidad(id);
                //DropDownLocalidad.DataSource = localidad;
                //DropDownLocalidad.DataTextField = "Nombre";
                //DropDownLocalidad.DataValueField = "id";
                //DropDownLocalidad.DataBind();
                LlenarLocalidades(id);
                //Page.Validate();
            
           
        }

        protected void DropDownLocalidad_SelectedIndexChanged(object sender, EventArgs e)
        {

           
                int id2 = int.Parse(DropDownLocalidad.SelectedItem.Value);
                //FilialManager filialManager = new FilialManager();
                //List<CodigoPostal> codigoPostal = new List<CodigoPostal>();
                //codigoPostal = filialManager.listarCodigoPostal(id2);
                //DropDownCP.DataSource = codigoPostal;
                //DropDownCP.DataTextField = "Nombre";
                //DropDownCP.DataBind();  
                LlenarCodigoPostal(id2);

            
            
           

        }

        private void LlenarCiudades(int idProvincia)
        {
            FilialManager filialManager = new FilialManager();
            List<Ciudad> ciudads = new List<Ciudad>();

            ciudads = filialManager.listarCiudad(idProvincia);
            DropDownCiudad.DataSource = ciudads;
            DropDownCiudad.DataTextField = "Nombre";
            DropDownCiudad.DataValueField = "id";
            DropDownCiudad.DataBind();
        }

        private void LlenarLocalidades(int idCiudad)
        {
            FilialManager filialManager = new FilialManager();
            List<Localidad> localidad = new List<Localidad>();
            localidad = filialManager.listarLocalidad(idCiudad);
            DropDownLocalidad.DataSource = localidad;
            DropDownLocalidad.DataTextField = "Nombre";
            DropDownLocalidad.DataValueField = "id";
            DropDownLocalidad.DataBind();
        }

        private void LlenarCodigoPostal(int idLocalidad)
        {
            FilialManager filialManager = new FilialManager();
            List<CodigoPostal> codigoPostal = new List<CodigoPostal>();
            codigoPostal = filialManager.listarCodigoPostal(idLocalidad);
            DropDownCP.DataSource = codigoPostal;
            DropDownCP.DataTextField = "Nombre";
            DropDownCP.DataBind();
        }

        protected void btnCancelarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialHome.aspx", false);
        }

        protected void btnAceparPerfil_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);
            FilialManager managerFilial = new FilialManager();
            if (Seguridad.sessionActiva(usuario))
            {
                int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                FilialCompleta filialCompleta = new FilialCompleta();
                filialCompleta.nombre= txtNombreFilial.Text;
                filialCompleta.telefono= txtTelefono.Text;
                filialCompleta.horarioAtencion= txtHorarioAtencion.Text;
                filialCompleta.correo= txtCorreo.Text; 
                filialCompleta.urlWeb= txtUrlWeb.Text;

                managerFilial.editarFilialCompleta(filialCompleta, IdFilial);

                Response.Redirect("FilialHome.aspx", false);
            }
        }

        protected void btnCancelarDireccion_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialHome.aspx", false);
        }

        protected void btnAceptarDireccion_Click(object sender, EventArgs e)
        {

            try
            {
                Usuario usuario = new Usuario();
                usuario = (Usuario)(Session["usuario"]);
                FilialManager managerFilial = new FilialManager();
                if (Seguridad.sessionActiva(usuario))
                {
                    FilialCompleta filialCompleta = new FilialCompleta();
                    filialCompleta.calle = TextCalle.Text;
                    if (string.IsNullOrEmpty(TextAltura.Text))
                    {
                        filialCompleta.altura = 0;
                    }
                    else
                    {
                        filialCompleta.altura = int.Parse(TextAltura.Text);
                    }

                    if (string.IsNullOrEmpty(TextPiso.Text))
                    {
                        filialCompleta.piso = 0;
                    }
                    else
                    {
                        filialCompleta.piso = int.Parse(TextPiso.Text);
                    }
                    filialCompleta.departamento = TextDep.Text;
                    filialCompleta.localidad = Convert.ToInt32(DropDownLocalidad.SelectedValue);
                    filialCompleta.ciudad = Convert.ToInt32(DropDownCiudad.SelectedValue);
                    filialCompleta.provincia = Convert.ToInt32(DropDownProvincia.SelectedValue);


                    managerFilial.editarDireccionDeFilialCompleta(filialCompleta, usuario.idUsuario);

                    Response.Redirect("FilialHome.aspx", false);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            

        }
    }
}