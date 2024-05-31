using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class PublicacionesManager
    {
        public AccesoDatos datos = new AccesoDatos();

        public List<Publicacion> ListarPublicacion()
        {

            List<Publicacion> lista = new List<Publicacion>();

            try
            {
                datos.setearProcedimiento("SP_ListarPublicaciones");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Publicacion aux = new Publicacion();

                    aux.idPublicacion = (int)datos.Lector["IdPublicacion"];
                    aux.filial = (string)datos.Lector["NombreFilial"];

                    if (!Convert.IsDBNull(datos.Lector["NombreReceptor"]))
                    {
                        aux.nombreReceptor = (string)datos.Lector["NombreReceptor"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Grupo"]))
                    {
                        aux.grupoSanguineo = (string)datos.Lector["Grupo"];
                    }
                    
                    aux.urgencia = (string)datos.Lector["DescripcionUrgencia"];

                    if (!Convert.IsDBNull(datos.Lector["DonantesNecesarios"]))
                    {
                        aux.donantesNecesarios = (int)datos.Lector["DonantesNecesarios"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Horario"]))
                    {
                        aux.horarios = (string)datos.Lector["Horario"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["FechaLimite"]))
                    {
                        aux.fechaLimite = (DateTime)datos.Lector["FechaLimite"];
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
    }
}