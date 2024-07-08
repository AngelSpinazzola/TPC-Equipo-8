using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace TPC_Equipo_8.Helpers
{
    public class EmailService
    {
        AccesoDatos datos = new AccesoDatos();

        private MailMessage email;
        private SmtpClient server;


        public EmailService()
        {
            server = new SmtpClient("smtp.mailtrap.io", 2525)
            {
                Credentials = new NetworkCredential("8c4eda6efd2e7d", "2bd4f97f9975cb"),
                EnableSsl = true,
            };
        }

        public class EmailNotFoundException : Exception
        {
            public EmailNotFoundException(string message) : base(message) { }
        }
        public void armarCorreoRecuperacion(string correoDestino)
        {
            string contrasena = ObtenerContrasena(correoDestino);
            if (string.IsNullOrEmpty(contrasena))
            {
                throw new EmailNotFoundException("El email ingresado no es correcto. Por favor, ingrese nuevamente.");
            }
            email = new MailMessage
            {
                From = new MailAddress("noresponder@sanguis.com"),
                Subject = "Recuperación de tu contraseña",
                IsBodyHtml = true,
                Body = $@"
                <h3>Recuperación de contraseña</h3>
                <p>Has solicitado recuperar tu contraseña.</p>
                <p>Tu contraseña es: <strong>{contrasena}</strong></p>
                <p>Por razones de seguridad, te recomendamos cambiar esta contraseña después de iniciar sesión.</p>
                <p>Si no has solicitado esta recuperación, por favor contacta con nuestro soporte técnico inmediatamente.</p>"
            };
            email.To.Add(correoDestino);
        }

        private string ObtenerContrasena(string correoDestino)
        {
            string contrasena = null;
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_RecuperarContraseña");
                datos.setearParametro("@Email", correoDestino);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    if (!datos.Lector.IsDBNull(datos.Lector.GetOrdinal("Pass")))
                    {
                        contrasena = datos.Lector["Pass"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener la contraseña", ex);

            }
            finally
            {
                datos.cerrarConexion();
            }
            return contrasena;
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (SmtpException smtpEx)
            {
                throw new Exception($"Error al enviar el email: {smtpEx.StatusCode} - {smtpEx.Message}", smtpEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al enviar el email", ex);
            }
        }
    }
}