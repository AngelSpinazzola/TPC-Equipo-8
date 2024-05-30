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
    }
}