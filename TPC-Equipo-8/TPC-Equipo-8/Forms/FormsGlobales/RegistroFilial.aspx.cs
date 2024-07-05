using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsGlobales
{
    public partial class RegistroFilial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinuarRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                Filial nueva = new Filial();
                nueva.direccion = new Direccion();
                UsuarioManager usuarioManager = new UsuarioManager();

                nueva.nombre = txtRegistroNombre.Text;
                nueva.telefono = txtRegistroTelefono.Text;
                nueva.direccion.provincia = txtRegistroProvincia.Text;
                nueva.direccion.ciudad = txtRegistroCiudad.Text;
                nueva.direccion.localidad = txtRegistroLocalidad.Text;
                nueva.direccion.codigoPostal = txtCodigoPostal.Text;
                nueva.direccion.calle = txtRegistroCalle.Text;  
                nueva.direccion.altura = int.Parse(txtRegistroAltura.Text);
                nueva.email = txtRegistroEmail.Text;
                nueva.pass = txtRegistroPass.Text;  

                usuarioManager.RegistrarFilial(nueva);

                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}