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
    public partial class DonanteDetalleFilial : System.Web.UI.Page
    {
        public List<Filial> ListaFiliales { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["idFilial"] != null)
                {
                    FilialManager manager = new FilialManager();
                    ListaFiliales = manager.ListarFiliales();

                    int idFilial = Convert.ToInt32(Request.QueryString["idFilial"]);

                    var filial = ListaFiliales.FirstOrDefault(a => a.idFilial == idFilial);
                    var listaDeUnaFilial = new List<Filial> { filial };
                    repDetalle.DataSource = listaDeUnaFilial;
                    repDetalle.DataBind();
                }
            }
        }

        protected void btnVerPublicaciones_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int idFilial = Convert.ToInt32(btn.CommandArgument);

            FilialManager filialManager = new FilialManager();
            ListaFiliales = filialManager.ListarFiliales();

            List<Filial> seleccionadas;

            if (Session["Seleccion"] == null)
            {
                seleccionadas = new List<Filial>();
            }
            else
            {
                seleccionadas = (List<Filial>)Session["Seleccion"];
            }

            foreach(Filial item in ListaFiliales)
            {
                if(idFilial == item.idFilial)
                {
                    if(!seleccionadas.Any(a => a.idFilial == item.idFilial))
                    {
                        seleccionadas.Add(item);
                    }
                    break;
                }
            }

            Session["Seleccion"] = seleccionadas;
            Response.Redirect("DonantePublicaciones.aspx?idFilial=" + idFilial);

        }

        protected string ObtenerDireccionFilial(int idFilial)
        {
            FilialManager manager = new FilialManager();
            string direccion = manager.ObtenerDireccion(idFilial);

            return direccion;
        }

    }
}