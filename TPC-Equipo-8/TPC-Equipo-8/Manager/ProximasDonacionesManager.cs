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
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ListarProximasDonaciones");
                datos.setearParametro("@IdFilial", idFilial);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ProximasDonaciones aux = new ProximasDonaciones();

                    if (!Convert.IsDBNull(datos.Lector["IdProximoDonante"]))
                    {
                        aux.id = (int)datos.Lector["IdProximoDonante"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["IdFilial"]))
                    {
                        aux.idFilial = (int)datos.Lector["IdFilial"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["IdDonante"]))
                    {
                        aux.idDonante = (int)datos.Lector["IdDonante"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["IdPublicacion"]))
                    {
                        aux.idPublicacion = (int)datos.Lector["IdPublicacion"];
                    }


                    if (!Convert.IsDBNull(datos.Lector["Nombre"]))
                    {
                        aux.NombreDonante = (string)datos.Lector["Nombre"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Apellido"]))
                    {
                        aux.ApellidoDonante = (string)datos.Lector["Apellido"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["DNI"]))
                    {
                        aux.DNI = (string)datos.Lector["DNI"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["GrupoDonante"]))
                    {
                        aux.GrupoSanguineoDonante = (string)datos.Lector["GrupoDonante"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["NombreReceptor"]))
                    {
                        aux.NombreReceptor = (string)datos.Lector["NombreReceptor"];
                    }

                    /*if (!Convert.IsDBNull(datos.Lector["GrupoReceptor"]))
                    {
                        aux.GrupoSanguineoReceptor = (string)datos.Lector["GrupoReceptor"];
                    }*/

                    if (!Convert.IsDBNull(datos.Lector["DonantesNecesarios"]))
                    {
                        aux.DonantesNecesarios = (int)datos.Lector["DonantesNecesarios"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Urgencia"]))
                    {
                        aux.Urgencia = (string)datos.Lector["Urgencia"];
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