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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinuarRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                Donante nuevoDonante = new Donante();
                UsuarioManager usuarioManager = new UsuarioManager();
                nuevoDonante.Username = txtRegistroNombre.Text;
                nuevoDonante.email = txtRegistroEmail.Text;
                nuevoDonante.pass = txtRegistroPass.Text;
                nuevoDonante.dni = txtRegistroDni.Text;
                usuarioManager.RegistrarDonante(nuevoDonante);

                string script = @"
                Swal.fire({
                    icon: 'success',
                    text: 'Tu cuenta se creó correctamente. Por favor, ingresá tus datos para continuar.',
                    showCancelButton: false,
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'Login.aspx';
                    }
                });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showMessageAndRedirect", script, true);
            }
            catch (Exception ex)
            {
                // Manejo de errores
                string errorScript = $@"
        Swal.fire({{
            icon: 'error',
            title: 'Error',
            text: 'Error al crear la cuenta: {ex.Message}',
            showCancelButton: false,
            confirmButtonText: 'OK'
        }});";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorMessage", errorScript, true);
                Session.Add("error", ex.ToString());
            }
        }
    }
}