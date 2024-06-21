using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using TPC_Equipo_8.Dominio;

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
    }
}