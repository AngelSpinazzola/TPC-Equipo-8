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
         
                if (int.TryParse(Request.QueryString["idFilial"], out idFilial))
                {
                    ListaPublicaciones = manager.ListarPublicaciones(idFilial);
                }
                else
                {
                    ListaPublicaciones = manager.ListarPublicaciones(-1);
                    idFilial = -1; 
                }

                if (!IsPostBack)
                {
                    Filial filial = seleccionadas.FirstOrDefault(a => a.idFilial == idFilial);

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