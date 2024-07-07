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

    }
}