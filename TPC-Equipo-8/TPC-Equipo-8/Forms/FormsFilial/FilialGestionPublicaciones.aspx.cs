using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialGestionPublicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

            PublicacionesManager managerPublicaciones = new PublicacionesManager();

            if (!IsPostBack)
            {

                repPublicacionesFilial.DataSource = managerPublicaciones.ListarPublicaciones(IdFilial);
                repPublicacionesFilial.DataBind();

            }

        }

        protected void btnCrearPublicacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilialAltaPublicacion.aspx",false);
        }

        protected void EditarPublicacion_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int idPublicacion = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("FilialAltaPublicacion.aspx?idPublicacion=" + idPublicacion);
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario = (Usuario)(Session["usuario"]);

            FilialManager managerFilial = new FilialManager();
            int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);

            Button btn = (Button)sender;
            int idPublicacion = Convert.ToInt32(btn.CommandArgument);

            PublicacionesManager manager = new PublicacionesManager();
           
            List<Publicacion> lista = manager.ListarUnaPublicacion(IdFilial, idPublicacion);

            Publicacion seleccionada = lista[0];
            seleccionada.idPublicacion = idPublicacion;
            seleccionada.filial=IdFilial.ToString();
            seleccionada.posiblesDonantes = "1";
            seleccionada.grupoSanguineo = "1";
            seleccionada.urgencia = "1";
            seleccionada.estado=false;

            manager.ModificarPublicacion(seleccionada);











            //PublicacionesManager manager = new PublicacionesManager();
            //Publicacion nuevaPublicacion = new Publicacion();
            //FilialManager managerFilial = new FilialManager();


            //nuevaPublicacion.filial = "1";
            //nuevaPublicacion.nombreReceptor = "alguien";
            //nuevaPublicacion.grupoSanguineo = "1";
            //nuevaPublicacion.urgencia = "1";
            //nuevaPublicacion.donantesNecesarios = 1;
            //nuevaPublicacion.horarios = "";
            //nuevaPublicacion.fechaLimite = DateTime.Parse("1/1/1753 12:00:00 AM ");
            //nuevaPublicacion.estado = false;

            //Button btn = (Button)sender;
            //int idPublicacion = Convert.ToInt32(btn.CommandArgument);
            //nuevaPublicacion.idPublicacion = (idPublicacion);
            //manager.ModificarPublicacion(nuevaPublicacion);


            Response.Redirect("FilialGestionPublicaciones.aspx", false);

        }
    }
}