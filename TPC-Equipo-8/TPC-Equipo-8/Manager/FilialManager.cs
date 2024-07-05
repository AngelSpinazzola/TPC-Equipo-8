using manager;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class FilialManager
    {
        AccesoDatos datos = new AccesoDatos();

        public List<Filial> ListarFiliales(int idFilial = -1, int habilitada = -1, bool soloActivas = false)
        {

            List<Filial> lista = new List<Filial>();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ListarFiliales");
                //No hace falta el if, ya que, si no recibe el ID de la filial, usa el -1 defecto que tiene en el parametro.
                datos.setearParametro("@IdFilial", idFilial);
                datos.setearParametro("@Habilitado", habilitada);
                datos.setearParametro("@SoloActivas", soloActivas);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Filial aux = new Filial();
                    aux.direccion = new Direccion();

                    aux.idUsuario = (int)datos.Lector["IdUsuario"];
                    aux.idFilial = (int)datos.Lector["IdFilial"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.direccion.calle = (string)datos.Lector["Calle"];
                    

                    if (!Convert.IsDBNull(datos.Lector["HorarioAtencion"]))
                    {
                        aux.horarioAtencion = (string)datos.Lector["HorarioAtencion"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Altura"]))
                    {
                        aux.direccion.altura = (int)datos.Lector["Altura"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Piso"]))
                    {
                        aux.direccion.piso = (int)datos.Lector["Piso"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Departamento"]))
                    {
                        aux.direccion.departamento = (string)datos.Lector["Departamento"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Localidad"]))
                    {
                        aux.direccion.localidad = (string)datos.Lector["Localidad"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["CodigoPostal"]))
                    {
                        aux.direccion.codigoPostal = (string)datos.Lector["CodigoPostal"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Ciudad"]))
                    {
                        aux.direccion.ciudad = (string)datos.Lector["Ciudad"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Provincia"]))
                    {
                        aux.direccion.provincia = (string)datos.Lector["Provincia"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Correo"]))
                    {
                        aux.correo = (string)datos.Lector["Correo"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["UrlImagen"]))
                    {
                        aux.urlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["UrlWeb"]))
                    {
                        aux.urlWeb = (string)datos.Lector["UrlWeb"];
                    }
                    aux.estado = (bool)datos.Lector["Estado"];

                    lista.Add(aux);
                }
                return lista;
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

        public List<Filial> RecargarFilialesEnAdmin(int idFilial = -1, int habilitado = 0, bool soloActivas = true)
        {
            return ListarFiliales(idFilial, habilitado, soloActivas);
        }
        public void modificarFilial(Filial filial)
        {
            try
            {
                datos.setearProcedimiento("SP_ModificarFilial");

                datos.setearParametro("IdUsuario", filial.idUsuario);
                datos.setearParametro("IdFilial", filial.idFilial);
                datos.setearParametro("Nombre", filial.nombre);
                datos.setearParametro("Telefono", filial.telefono);
                datos.setearParametro("Horario", filial.horarioAtencion);
                datos.setearParametro("Correo", filial.correo);
                datos.setearParametro("UrlImagen", filial.urlImagen);
                datos.setearParametro("UrlWeb", filial.urlWeb);
                datos.setearParametro("Calle", filial.direccion.calle);
                datos.setearParametro("Altura", filial.direccion.altura);
                datos.setearParametro("Piso", filial.direccion.piso);
                datos.setearParametro("Departamento", filial.direccion.departamento);
                datos.setearParametro("Localidad", filial.direccion.localidad);
                datos.setearParametro("CodigoPostal", filial.direccion.codigoPostal);
                datos.setearParametro("Ciudad", filial.direccion.ciudad);
                datos.setearParametro("Provincia", filial.direccion.provincia);

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

        //Función para obtener la dirección de la filial, devuelve un string con (nombre de calle, altura y provincia).
        public string ObtenerDireccion(int idFilial)
        {
            datos.comando.Parameters.Clear();
            datos.setearProcedimiento("SP_DireccionesCompletas");
            datos.setearParametro("@IdFilial", idFilial);
            datos.ejecutarLectura();

            string direccion = string.Empty;

            while (datos.Lector.Read())
            {
                string calle = datos.Lector["Calle"].ToString();
                string altura = datos.Lector["Altura"].ToString();
                string nombre = datos.Lector["Nombre"].ToString();

                direccion = calle + " " + altura + ", " + nombre + ", Argentina";
            }

            return direccion;
        }


        public int ObtenerIdFilial(int idUsuario)
        {
            int id = -1;
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ObtenerIdFilialPorIdUsuario");
                datos.setearParametro("@idUser", idUsuario);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    id = (int)datos.Lector["IdFilial"];
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

            return id;
        }

        public void DesactivarFilial(int idFilial)
        {
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_DesactivarFilial");
                datos.setearParametro("@IdFilial", idFilial);
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

        public void HabilitarFilial(int idFilial)
        {
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_HabilitarFilial");
                datos.setearParametro("@IdFilial", idFilial);
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

    }
}