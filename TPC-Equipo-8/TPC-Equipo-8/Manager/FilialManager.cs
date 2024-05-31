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

                    aux.idFilial = (int)datos.Lector["IdFilial"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.horarioAtencion = (string)datos.Lector["HorarioAtencion"];

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

                    if (!Convert.IsDBNull(datos.Lector["Localidad"]))
                    {
                        aux.localidad = (string)datos.Lector["Localidad"];
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