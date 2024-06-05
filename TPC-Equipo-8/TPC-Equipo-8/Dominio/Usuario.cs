using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class Usuario
    {
        public int idUsuario { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public int rol { get; set; }
        public Direccion direccion { get; set; }
    }
}