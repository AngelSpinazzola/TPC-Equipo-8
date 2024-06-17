using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsDonante
{
    public partial class DonantePublicaciones : System.Web.UI.Page
    {
        public AccesoDatos datos = new AccesoDatos();
        public List<Publicacion> ListaPublicaciones { get; set; }
        public Filial filialSeleccionada {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            PublicacionesManager manager = new PublicacionesManager();

            if (Session["Seleccion"] != null)
            {
                List<Filial> seleccionadas = (List<Filial>)Session["Seleccion"];
                int idFilial;

                // Verificar si idFilial está presente en el QueryString
                if (int.TryParse(Request.QueryString["idFilial"], out idFilial))
                {
                    // Cargar publicaciones para el idFilial especificado en la URL
                    ListaPublicaciones = manager.ListarPublicaciones(idFilial);
                }
                else
                {
                    // Cargar todas las publicaciones de donantes si no se especifica idFilial en la URL
                    ListaPublicaciones = manager.ListarPublicaciones(-1);
                    idFilial = -1; // Establecer idFilial en -1 para asegurar la vinculación de datos
                }

                if (!IsPostBack)
                {
                    Filial filial = seleccionadas.FirstOrDefault(a => a.idFilial == idFilial);

                    // Asegurarse de que las publicaciones se vinculen incluso si idFilial es -1
                    if (filial != null || idFilial == -1)
                    {
                        repPublicaciones.DataSource = ListaPublicaciones;
                        repPublicaciones.DataBind();
                    }
                }
            }
        }

        public string ObtenerPosiblesDonantes(int grupoReceptor)
        {
            datos.setearProcedimiento("SP_PosiblesDonantes");
            datos.setearParametro("@IdGrupoSanguineo", grupoReceptor);
            datos.ejecutarLectura();

            List<string> gruposDonantes = new List<string>();

            while (datos.Lector.Read())
            {
                gruposDonantes.Add(datos.Lector["Grupo"].ToString());

            }

            string concat = string.Join(", ", gruposDonantes);

            return concat;
        }

    }
}