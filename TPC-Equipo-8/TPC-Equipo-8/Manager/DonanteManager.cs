using manager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;


namespace TPC_Equipo_8.Manager
{
    public class DonanteManager
    {
        AccesoDatos datos = new AccesoDatos();

        public Donante ListarDonante(int idUsuario)
        {
            Donante donante = new Donante();
            donante.direccion = new Direccion();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ListarDonante");
                datos.setearParametro("@IdUsuario", idUsuario);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    donante.nombre = (string)datos.Lector["Nombre"];
                    donante.apellido = (string)datos.Lector["Apellido"];
                    donante.dni = (string)datos.Lector["Dni"];
                    donante.email = (string)datos.Lector["Email"];
                    donante.fechaAlta = (DateTime)datos.Lector["FechaAlta"];
                    donante.tipoSangre = (string)datos.Lector["Grupo"];

                    donante.direccion.provincia = datos.Lector["nombreProvincia"] != DBNull.Value ? (string)datos.Lector["nombreProvincia"] : null;
                    donante.direccion.ciudad = datos.Lector["nombreCiudad"] != DBNull.Value ? (string)datos.Lector["nombreCiudad"] : null;
                    donante.direccion.localidad = datos.Lector["nombreLocalidad"] != DBNull.Value ? (string)datos.Lector["NombreLocalidad"] : null;
                    donante.direccion.codigoPostal = datos.Lector["CodigoPostal"] != DBNull.Value ? (string)datos.Lector["CodigoPostal"] : null;
                    donante.direccion.calle = datos.Lector["Calle"] != DBNull.Value ? (string)datos.Lector["Calle"] : null;
                    donante.direccion.altura = (int)datos.Lector["Altura"];
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return donante;
        }

        public string ObtenerUrlAvatarDonante(int IdUsuario)
        {
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearConsulta("SELECT UrlFoto FROM Donantes WHERE IdUsuario = @IdUsuario");
                datos.setearParametro("IdUsuario", IdUsuario);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    return datos.Lector["UrlFoto"].ToString();
                }

                return "??";
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

        public void EditarPerfilDonante(Donante donante, int IdUsuario)
        {

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ActualizarDatosDonante");
                datos.setearParametro("@IdUsuario", IdUsuario);
                datos.setearParametro("@Nombre", donante.nombre);
                datos.setearParametro("@Apellido", donante.apellido);
                datos.setearParametro("@UrlFoto", donante.urlFoto);
                datos.ejecutarAccion();

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

        public int ObtenerIdDonante(Usuario usuario)
        {
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_RecibirIdDonante");
                datos.setearParametro("@IdUsuario", usuario.idUsuario);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    return (int)datos.Lector["IdDonante"];
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return 0;

        }

        public List<Donacion> ObtenerDatosDonacionesRealizadas(int idDonante)
        {
            List<Donacion> lista = new List<Donacion>();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_RecibirDatosDonacionDonante");
                datos.setearParametro("@IdDonante", idDonante);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Donacion aux = new Donacion();

                    if (!Convert.IsDBNull(datos.Lector["Nombre"]))
                    {
                        aux.nombreFilial = (string)datos.Lector["Nombre"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["FechaDonacion"]))
                    {
                        aux.fechaRealizada = (DateTime)datos.Lector["FechaDonacion"];

                    }
                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<ProximasDonaciones> ObtenerDatosProximaDonacion(int idDonante)
        {
            List<ProximasDonaciones> lista = new List<ProximasDonaciones>();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_RecibirDatosProximaDonacion");
                datos.setearParametro("@IdDonante", idDonante);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ProximasDonaciones aux = new ProximasDonaciones();

                    if (!Convert.IsDBNull(datos.Lector["NombreReceptor"]))
                    {
                        aux.NombreReceptor = (string)datos.Lector["NombreReceptor"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["FechaRegistro"]))
                    {
                        aux.FechaRegistro = (DateTime)datos.Lector["FechaRegistro"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Nombre"]))
                    {
                        aux.nombreFilial = (string)datos.Lector["Nombre"];
                    }
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}