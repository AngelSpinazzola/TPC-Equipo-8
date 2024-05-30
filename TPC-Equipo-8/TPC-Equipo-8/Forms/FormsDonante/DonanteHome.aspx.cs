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
    public partial class DonanteHome : System.Web.UI.Page
    {
        public List<Filial> ListaFiliales { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FilialManager manager = new FilialManager();
            ListaFiliales = manager.ListarFiliales();

            if (!IsPostBack)
            {
                repFiliales.DataSource = ListaFiliales;
                repFiliales.DataBind();
            }

        }

        //Función para la barra de búsqueda
        public List<Filial> BuscarFiliales(string textoBusqueda)
        {
            FilialManager manager = new FilialManager();
            List<Filial> listaFiliales = manager.ListarFiliales();
            List<Filial> filialesEncontradas = listaFiliales

                .Where(a => a.nombre.ToLower().Contains(textoBusqueda.ToLower()))
                .GroupBy(a => a.nombre) // Agrupamos por nombre de artículo
                .Select(group => group.First()) // Tomamos el primer artículo de cada grupo
                .ToList();

            return filialesEncontradas;
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string textoBusqueda = txtBuscar.Text;

            List<Filial> filialesEncontradas = BuscarFiliales(textoBusqueda);

            repFiliales.DataSource = filialesEncontradas;
            repFiliales.DataBind();
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int IDFilial = Convert.ToInt32(btn.CommandArgument);

            FilialManager manager = new FilialManager();
            ListaFiliales = manager.ListarFiliales();

            List<Filial> seleccionados;
            if (Session["Seleccion"] == null)
            {
                seleccionados = new List<Filial>();
            }
            else
            {
                seleccionados = (List<Filial>)Session["Seleccion"];
            }

            foreach (Filial item in ListaFiliales)
            {
                if (IDFilial == item.idFilial)
                {

                    if (!seleccionados.Any(a => a.idFilial == item.idFilial))
                    {
                        seleccionados.Add(item);

                    }

                    break;
                }
            }
            Session["ListaArticulos"] = seleccionados;
            Response.Redirect("DonanteDetalleFilial.aspx?idFilial=" + IDFilial);
        }
    }
}