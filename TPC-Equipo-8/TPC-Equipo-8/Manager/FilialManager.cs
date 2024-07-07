using manager;
using Microsoft.SqlServer.Server;
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
                    if (!Convert.IsDBNull(datos.Lector["Habilitado"]))
                    {
                        aux.habilitado = (int)datos.Lector["Habilitado"];
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
                //string localidad = datos.Lector["Localidad"].ToString();
                //string ciudad = datos.Lector["Ciudad"].ToString();
                string provincia = datos.Lector["Nombre"].ToString();

                direccion = calle + " " + altura + ", " + provincia + ", Argentina";
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

        public List<Provincia> listarProvincias()
        {

            List<Provincia> listaProvincias = new List<Provincia >();

            try
            { 
               datos.setearConsulta("select P.Nombre as Nombre, P.IdProvincia as id from Provincias as P");
               datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Provincia provincia = new Provincia();
                    provincia.nombre = (string)datos.Lector["Nombre"]; 
                    provincia.id = (int)datos.Lector["id"];
                    listaProvincias.Add(provincia);

                }
                return listaProvincias;
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

        public List<Ciudad> listarCiudad(int idProvincia)
        {

            List<Ciudad> listaCiudad = new List<Ciudad>();

            try
            {
                datos.setearConsulta("select c.Nombre as Nombre, c.IdCiudad as id from Ciudades as c where IdProvincia=@idProvincia");
                datos.setearParametro("@idProvincia", idProvincia);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Ciudad ciudad = new Ciudad();
                    ciudad.nombre = (string)datos.Lector["Nombre"];
                    ciudad.id = (int)datos.Lector["id"];
                    listaCiudad.Add(ciudad);

                }
                return listaCiudad;
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

        public List<Localidad> listarLocalidad(int idCiudad)
        {

            List<Localidad> listaLocalidad = new List<Localidad>();

            try
            {
                datos.setearConsulta("select l.Nombre as Nombre, l.IdLocalidad as id from Localidades as l where IdCiudad=@IdCiudad");
                datos.setearParametro("@IdCiudad", idCiudad);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Localidad localidad = new Localidad();
                    localidad.nombre = (string)datos.Lector["Nombre"];
                    localidad.id = (int)datos.Lector["id"];
                    listaLocalidad.Add(localidad);

                }
                return listaLocalidad;
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

        public List<CodigoPostal>  listarCodigoPostal(int idLocalidad)
        {

            List<CodigoPostal> codigoPostal =new List<CodigoPostal>();

            try
            {
                datos.setearConsulta("select l.CodigoPostal as Nombre from Localidades as l where IdLocalidad=@idLocalidad");
                datos.setearParametro("@idLocalidad", idLocalidad);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    CodigoPostal cp = new CodigoPostal();
                    cp.nombre = (string)datos.Lector["Nombre"];
                    //localidad.id = (int)datos.Lector["id"];
                    codigoPostal.Add(cp);

                }
                return codigoPostal;
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



        public FilialCompleta listarUnaFilialCompleta(int idFilial)
        {

           FilialCompleta aux =new FilialCompleta();

            try
            {
                datos.setearConsulta("SELECT F.Nombre, F.Telefono,F.HorarioAtencion,F.Correo,F.UrlWeb,DU.Calle, DU.Altura,DU.Piso, \r\nDU.Departamento, L.Nombre AS Localidad, L.CodigoPostal AS CP, C.Nombre AS Ciudad, P.Nombre AS Provincia \r\nFROM Filiales F \r\nINNER JOIN Direcciones_x_Usuario DU ON DU.IdUsuario = F.IdUsuario \r\nINNER JOIN Localidades L ON L.IdLocalidad=DU.IdLocalidad \r\nINNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad \r\nINNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia \r\nWHERE F.IdFilial=1");
                datos.setearParametro("@IdFilial", idFilial);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    if (!Convert.IsDBNull(datos.Lector["Nombre"]))
                    {
                        aux.nombre = (string)datos.Lector["Nombre"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Telefono"]))
                    {
                        aux.telefono = (string)datos.Lector["Telefono"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["HorarioAtencion"]))
                    {
                        aux.horarioAtencion = (string)datos.Lector["HorarioAtencion"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Correo"]))
                    {
                        aux.correo = (string)datos.Lector["Correo"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["UrlWeb"]))
                    {
                        aux.urlWeb = (string)datos.Lector["UrlWeb"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Calle"]))
                    {
                        aux.calle = (string)datos.Lector["Calle"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Altura"]))
                    {
                        aux.altura = (int)datos.Lector["Altura"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Piso"]))
                    {
                        aux.piso = (int)datos.Lector["Piso"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Departamento"]))
                    {
                        aux.departamento = (string)datos.Lector["Departamento"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Localidad"]))
                    {
                        aux.nombreLocalidad = (string)datos.Lector["Localidad"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["CP"]))
                    {
                        aux.cp = (string)datos.Lector["CP"];
                    }
                    if (!Convert.IsDBNull(datos.Lector["Ciudad"]))
                    {
                        aux.nombreCiudad = (string)(datos.Lector["Ciudad"]);
                    }
                    if (!Convert.IsDBNull(datos.Lector["Provincia"]))
                    {
                        aux.nombreProvincia = (string)(datos.Lector["Provincia"]);
                    }
                }
                return aux;
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


        public void editarFilialCompleta(FilialCompleta filial, int idFilial)
        {
            try
            {
                datos.setearConsulta("UPDATE Filiales SET Nombre = @Nombre, Telefono=@Telefono, HorarioAtencion=@HorarioAtencion, Correo=@Correo, UrlWeb=@UrlWeb WHERE IdFilial = @idFilial");
                datos.setearParametro("@Nombre", filial.nombre);
                datos.setearParametro("@Telefono", filial.telefono);
                datos.setearParametro("@HorarioAtencion", filial.horarioAtencion);
                datos.setearParametro("@Correo", filial.correo);
                datos.setearParametro("@UrlWeb", filial.urlWeb);
                datos.setearParametro("@idFilial", idFilial);

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

            public void editarDireccionDeFilialCompleta(FilialCompleta filial, int idUsuario)
            {
                try
                {
                    datos.comando.Parameters.Clear();
                    datos.setearProcedimiento("SP_UpdateDireccionFilial");
                    datos.setearParametro("@IdUsuario", idUsuario);
                    datos.setearParametro("@Calle", filial.calle);
                    datos.setearParametro("@Altura", filial.altura);
                    datos.setearParametro("@Piso", filial.piso);
                    datos.setearParametro("@Departamento", filial.departamento);
                    datos.setearParametro("@Localidad", filial.nombreLocalidad);
                    datos.setearParametro("@CodigoPostal", filial.cp);
                    datos.setearParametro("@Ciudad", filial.nombreCiudad);
                    datos.setearParametro("@Provincia", filial.nombreProvincia);
                                                                          
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