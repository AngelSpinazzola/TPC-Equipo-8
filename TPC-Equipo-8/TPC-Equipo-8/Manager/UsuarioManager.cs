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
                datos.setearProcedimiento("SP_Loguear");
                datos.setearParametro("@Email", usuario.email);
                datos.setearParametro("@Pass", usuario.pass);
                datos.ejecutarLectura();




                while (datos.Lector.Read())
                {
                    usuario.idUsuario = (int)datos.Lector["IdUsuario"];
                    usuario.Username = (string)datos.Lector["Username"];

                    int rol = (int)datos.Lector["IdRol"];

                    switch (rol)
                    {
                        case 1:
                            usuario.TipoUsuario = TipoUsuario.ADMIN;
                            break;

                        case 2:
                            usuario.TipoUsuario = TipoUsuario.DONANTE;
                            break;

                        case 3:
                            usuario.TipoUsuario = TipoUsuario.FILIAL;
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

        public int insertarNuevo(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_Registro");
                datos.setearParametro("@Email", nuevo.email);
                datos.setearParametro("@Pass", nuevo.pass);
                datos.setearParametro("@Dni", nuevo.dni);
                return datos.ejecutarAccionScalar();

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