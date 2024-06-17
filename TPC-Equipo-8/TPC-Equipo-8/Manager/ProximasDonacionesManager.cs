using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class ProximasDonacionesManager
    {
        AccesoDatos datos = new AccesoDatos();

        public List<ProximasDonaciones> ListarProximasDonaciones(int idFilial)
        {
            List<ProximasDonaciones> lista = new List<ProximasDonaciones>();

            try
            {
                datos.setearProcedimiento("SP_ListarProximasDonaciones");
                datos.setearParametro("@IdFilial", idFilial);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ProximasDonaciones aux = new ProximasDonaciones();

                    if (!Convert.IsDBNull(datos.Lector["Nombre"]))
                    {
                        aux.NombreDonante = (string)datos.Lector["Nombre"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Apellido"]))
                    {
                        aux.ApellidoDonante = (string)datos.Lector["Apellido"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["dni"]))
                    {
                        aux.DIN = (string)datos.Lector["dni"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Grupo"]))
                    {
                        aux.GrupoSanguineoDonante = (string)datos.Lector["Grupo"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["NombreReceptor"]))
                    {
                        aux.NombreReceptor = (string)datos.Lector["NombreReceptor"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Grupo"]))
                    {
                        aux.GrupoSanguineoReceptor = (string)datos.Lector["Grupo"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["DonantesNecesarios"]))
                    {
                        aux.DonantesNecesarios = (int)datos.Lector["DonantesNecesarios"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Descripcion"]))
                    {
                        aux.Urgencia = (string)datos.Lector["Descripcion"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["FechaRegistro"]))
                    {
                        aux.FechaRegistro = (DateTime)datos.Lector["FechaRegistro"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["FechaLimite"]))
                    {
                        aux.FechaLimite = (DateTime)datos.Lector["FechaLimite"];
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