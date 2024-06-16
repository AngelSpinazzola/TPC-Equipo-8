using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class DonacionManager
    {
        AccesoDatos datos = new AccesoDatos();
        public List<Donacion> ListarDonaciones(int idFilial)
        {

            List<Donacion> lista = new List<Donacion>();

            try
            {
                datos.setearProcedimiento("SP_ListarDonantes");
                datos.setearParametro("@IdFilial", idFilial);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Donacion aux = new Donacion();


                    if (!Convert.IsDBNull(datos.Lector["Nombre"]))
                    {
                       aux.nombre = (string)datos.Lector["Nombre"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Apellido"]))
                    {
                        aux.apellido = (string)datos.Lector["Apellido"];

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
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}