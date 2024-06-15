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

        public List<Filial> ListarFiliales()
        {

            List<Filial> lista = new List<Filial>();

            try
            {
                datos.setearProcedimiento("SP_ListarFiliales");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Filial aux = new Filial();
                    aux.direccion = new Direccion();

                    aux.idUsuario = (int)datos.Lector["IdUsuario"];
                    aux.idFilial = (int)datos.Lector["IdFilial"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.horarioAtencion = (string)datos.Lector["HorarioAtencion"];
                    aux.direccion.calle = (string)datos.Lector["Calle"];

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


        public List<Filial> ListarFilial (int idFilial)
        {

            Filial aux = new Filial();
            List<Filial> lista = new List<Filial>();

            try
            {
                datos.setearProcedimiento("SP_ListarFilial");
                datos.setearParametro("@IdFilial", idFilial);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    
                    aux.direccion = new Direccion();

                    aux.idUsuario = (int)datos.Lector["IdUsuario"];
                    aux.idFilial = (int)datos.Lector["IdFilial"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.horarioAtencion = (string)datos.Lector["HorarioAtencion"];
                    aux.direccion.calle = (string)datos.Lector["Calle"];

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


        //Función para obtener la dirección de la filial, devuelve un string con (nombre de calle, altura y provincia).
        public string ObtenerDireccion(int idFilial)
        {
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



    }
}