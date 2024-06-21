using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class UsuarioManager
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select C.IdUsuario, U.IdRol from Cuentas C JOIN Usuarios U on U.IdUsuario = C.IdUsuario Where C.Email = @Email and C.Pass = @Pass");
                datos.setearParametro("@Email", usuario.email);
                datos.setearParametro("@Pass", usuario.pass);

                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    usuario.idUsuario = (int)datos.Lector["IdUsuario"];
                    int rol = (int)datos.Lector["IdRol"];

                    switch (rol)
                    {
                        case 1:
                            usuario.TipoUsuario = TipoUsuario.DONANTE;
                            break;

                        case 2:
                            usuario.TipoUsuario = TipoUsuario.FILIAL;
                            break;

                        case 3:
                            usuario.TipoUsuario = TipoUsuario.ADMIN;
                            break;
                    }


                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}