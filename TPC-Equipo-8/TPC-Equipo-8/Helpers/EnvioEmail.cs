using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace TPC_Equipo_8.Helpers
{
    public class EnvioEmail
    {
        AccesoDatos datos = new AccesoDatos();

        private MailMessage email;
        private SmtpClient server;

        public EnvioEmail()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("sanguis.donaciones@gmail.com", "sanguis123");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarCorreoRecuperacion(string correoDestino)
        {

            string contrasena = ObtenerContrasena(correoDestino);

            if (string.IsNullOrEmpty(contrasena))
            {
                throw new ApplicationException("No se encontró una contraseña para este correo.");
            }

            email = new MailMessage();
            email.From = new MailAddress("noresponder@sanguis.com");
            email.To.Add(correoDestino);
            email.Subject = "Recuperación de tu contraseña";
            email.IsBodyHtml = true;
            email.Body = $@"
                <h3>Recuperación de contraseña</h3>
                <p>Has solicitado recuperar tu contraseña.</p>
                <p>Tu contraseña es: <strong>{contrasena}</strong></p>
                <p>Por razones de seguridad, te recomendamos cambiar esta contraseña después de iniciar sesión.</p>
                <p>Si no has solicitado esta recuperación, por favor contacta con nuestro soporte técnico inmediatamente.</p>";

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

                if (datos.Lector.HasRows)
                {
                    if (datos.Lector.Read())
                    {
                        if (!datos.Lector.IsDBNull(datos.Lector.GetOrdinal("Pass")))
                        {
                            contrasena = datos.Lector["Pass"].ToString();
                        }
                        else
                        {
                            Console.WriteLine("La contraseña es NULL en la base de datos.");
                        }
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron filas para el email proporcionado.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al obtener la contraseña: {ex.Message}");
                Console.WriteLine($"StackTrace: {ex.StackTrace}");
                throw;
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
            catch (Exception ex)
            {
                Console.WriteLine($"Error al enviar el email: {ex.Message}");
                Console.WriteLine($"StackTrace: {ex.StackTrace}");
                throw;
            }
        }
    }
}