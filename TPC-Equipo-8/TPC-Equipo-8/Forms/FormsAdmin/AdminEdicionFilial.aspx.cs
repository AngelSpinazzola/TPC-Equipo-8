using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsAdmin
{
    public partial class AdminEdicionFilial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["idFilial"] != null)
                {
                    FilialManager manager = new FilialManager();
                    List<Filial> lista = manager.ListarFiliales(Int32.Parse(Request.QueryString["idFilial"]));
                    Filial seleccionada = lista[0];

                    txtIdUsuario.Text = seleccionada.idUsuario.ToString();
                    txtIdFilial.Text = seleccionada.idFilial.ToString();
                    txtNombre.Text = seleccionada.nombre;
                    txtTelefono.Text = seleccionada.telefono;
                    txtHorario.Text = seleccionada.horarioAtencion;
                    txtCorreo.Text = seleccionada.correo;
                    txtFoto.Text = seleccionada.urlImagen;
                    txtWeb.Text = seleccionada.urlWeb;

                    txtCalle.Text = seleccionada.direccion.calle;
                    txtAltura.Text = seleccionada.direccion.altura.ToString();

                    if(seleccionada.direccion.piso != 0)
                    {
                        txtPiso.Text = seleccionada.direccion.piso.ToString();
                    }
                    else
                    {
                        txtPiso.Text = "";
                    }
                    
                    txtDepartamento.Text = seleccionada.direccion.departamento;
                    txtLocalidad.Text = seleccionada.direccion.localidad;
                    txtCiudad.Text = seleccionada.direccion.ciudad;
                    txtCodigoPostal.Text = seleccionada.direccion.codigoPostal;
                    txtProvincia.Text = seleccionada.direccion.provincia;
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
                Filial filial = new Filial();
                FilialManager manager = new FilialManager();

                filial.idUsuario = int.Parse(txtIdUsuario.Text);
                filial.idFilial = int.Parse(txtIdFilial.Text);
                filial.nombre = txtNombre.Text;
                filial.telefono = txtTelefono.Text;
                filial.horarioAtencion = txtHorario.Text;
                filial.correo = txtCorreo.Text;
                filial.urlImagen = txtFoto.Text;
                filial.urlWeb = txtWeb.Text;
                filial.direccion.calle = txtCalle.Text;
                filial.direccion.altura = int.Parse(txtAltura.Text);
                if(txtPiso.Text != "")
                {
                    filial.direccion.piso = int.Parse(txtPiso.Text);
                }
                filial.direccion.departamento = txtDepartamento.Text;
                filial.direccion.localidad = txtLocalidad.Text;
                filial.direccion.ciudad = txtCiudad.Text;
                filial.direccion.codigoPostal = txtCodigoPostal.Text;
                filial.direccion.provincia = txtProvincia.Text;

                manager.modificarFilial(filial);

                Response.Redirect("AdminGestionFiliales.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                throw;
            }
        }
    }
}