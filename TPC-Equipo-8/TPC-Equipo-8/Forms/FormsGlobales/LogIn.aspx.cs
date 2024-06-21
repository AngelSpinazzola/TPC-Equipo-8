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
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            UsuarioManager usuarioManager = new UsuarioManager();

            try
            {
                Usuario usuario = new Usuario(txtEmail.Text, txtPass.Text);
                if (usuarioManager.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    if (usuario.TipoUsuario == TipoUsuario.FILIAL)
                    {
                        Response.Redirect("../FormsFilial/FilialHome.aspx", false);
                    }
                    else if (usuario.TipoUsuario == TipoUsuario.DONANTE)
                    {
                        Response.Redirect("Default.aspx", false);
                    }
                    else if (usuario.TipoUsuario == TipoUsuario.ADMIN)
                    {
                        Response.Redirect("../FormsAdmin/AdminGestionFiliales.aspx", false);
                    }
                    else
                    {
                        Response.Redirect("../FormsGlobales/Default.aspx", false);
                    }
                }
                else
                {
                    Session.Add("Error", "Email o Contraseña incorrectos.");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}