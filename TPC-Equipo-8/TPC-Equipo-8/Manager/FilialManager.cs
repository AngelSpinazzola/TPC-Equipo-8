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
                datos.setearConsulta("SELECT * From Filiales");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Filial aux = new Filial();

                    aux.idFilial = (int)datos.Lector["IdFilial"];
                    aux.nombre = (string)datos.Lector["Nombre"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.horarioAtencion = (string)datos.Lector["HorarioAtencion"];
                    aux.mail = (string)datos.Lector["Mail"];
                                         
                    if (!Convert.IsDBNull(datos.Lector["UrlImagen"]))
                    {
                        aux.urlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["UrlWeb"]))
                    {
                        aux.urlWeb = (string)datos.Lector["UrlWeb"];
                    }

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
    }
}