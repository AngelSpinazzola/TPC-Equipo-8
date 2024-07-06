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


            }

        }

        protected void DropDownProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(DropDownProvincia.SelectedItem.Value);
            FilialManager filialManager = new FilialManager();
            List<Ciudad> ciudads = new List<Ciudad>();

            ciudads = filialManager.listarCiudad(id);
            DropDownCiudad.DataSource = ciudads;
            DropDownCiudad.DataTextField = "Nombre";
            DropDownCiudad.DataValueField = "id";
            DropDownCiudad.DataBind();

          



        }

        protected void DropDownCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(DropDownCiudad.SelectedItem.Value);
            FilialManager filialManager = new FilialManager();
            List<Localidad> localidad = new List<Localidad>();
            localidad = filialManager.listarLocalidad(id);
            DropDownLocalidad.DataSource = localidad;
            DropDownLocalidad.DataTextField = "Nombre";
            DropDownLocalidad.DataValueField = "id";
            DropDownLocalidad.DataBind();
        }

        protected void DropDownLocalidad_SelectedIndexChanged(object sender, EventArgs e)
        {

            int id2 = int.Parse(DropDownLocalidad.SelectedItem.Value);
            FilialManager filialManager = new FilialManager();
            List<CodigoPostal> codigoPostal = new List<CodigoPostal>();
            codigoPostal = filialManager.listarCodigoPostal(id2);
            DropDownCP.DataSource = codigoPostal;
            DropDownCP.DataTextField = "Nombre";
            DropDownCP.DataBind();  


        }
    }
}