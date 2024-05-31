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

        protected string ObtenerDireccionFilial(int idFilial)
        {
            FilialManager manager = new FilialManager();
            string direccion = manager.ObtenerDireccion(idFilial);

            return direccion;
        }

    }
}