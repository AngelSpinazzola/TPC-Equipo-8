using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public enum TipoUsuario
    {
        ADMIN = 1,
        DONANTE = 2,
        FILIAL = 3,
    }
    public class Usuario
    {
        public int idUsuario { get; set; }
        public string Username { get; set; }
        public string dni { get; set; }
        public string email { get; set; }
        public string pass { get; set; }
        public Direccion direccion { get; set; }
        public TipoUsuario TipoUsuario { get; set; }
        
        public Usuario()
        {

        }
        public Usuario(string _email, string _pass)
        {
            email = _email;
            pass = _pass;
        }


    }
}