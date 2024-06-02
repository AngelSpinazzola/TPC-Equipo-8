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
            /*PublicacionesManager manager = new PublicacionesManager();


            if (!IsPostBack)
            {
                repPublicaciones.DataSource = ListaPublicaciones;
                repPublicaciones.DataBind();
            }

            if (Session["ListarFiliales"] != null)
            {
                List<Filial> seleccionadas = (List<Filial>)Session["ListarFiliales"];
                int idFilial = Convert.ToInt32(Request.QueryString["idFilial"]);

                ListaPublicaciones = manager.ListarPublicaciones(idFilial);

                if (!IsPostBack)
                {
                    var filial = seleccionadas.FirstOrDefault(a => a.idFilial == idFilial);
                    var listaPublicaciones = new List<Filial>() { filial };
                    repPublicaciones.DataSource = listaPublicaciones;
                    repPublicaciones.DataBind();
                }
            }*/

            PublicacionesManager manager = new PublicacionesManager();

            if (Session["Seleccion"] != null)
            {
                List<Filial> seleccionadas = (List<Filial>)Session["Seleccion"];
                int idFilial;

                if (int.TryParse(Request.QueryString["idFilial"], out idFilial))
                {
                    ListaPublicaciones = manager.ListarPublicaciones(idFilial);

                    if (!IsPostBack)
                    {
                        Filial filial = seleccionadas.FirstOrDefault(a => a.idFilial == idFilial);

                        if (filial != null)
                        {
                            repPublicaciones.DataSource = ListaPublicaciones;
                            repPublicaciones.DataBind();
                        }
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