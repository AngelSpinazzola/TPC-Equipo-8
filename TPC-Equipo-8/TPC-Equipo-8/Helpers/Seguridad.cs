using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using TPC_Equipo_8.Dominio;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Helpers
{
    public static class Seguridad
    {
        public static bool sessionActiva(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            if (usuario != null && usuario.idUsuario != 0)
            {
                return true;
            }
            else
                return false;
        }

        public static bool sessionFilial(object user) 
        {
            Usuario usuario = (Usuario)user;
            if(usuario.TipoUsuario == TipoUsuario.FILIAL)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool filialHabilitada (object user) 
        { 
            Usuario usuario= (Usuario)user;
            FilialManager managerFilial = new FilialManager();

            if (usuario.TipoUsuario == TipoUsuario.FILIAL)
            {
                int IdFilial = managerFilial.ObtenerIdFilial(usuario.idUsuario);
                List <Filial> filial = new List<Filial> ();
                filial = managerFilial.ListarFiliales(idFilial:IdFilial);
                //int hab=filial[0].habilitado;
                if (filial[0].habilitado == 1)
                {
                    return true ;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }
    }
}