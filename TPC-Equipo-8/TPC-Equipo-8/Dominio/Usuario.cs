using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public enum TipoUsuario
    {
        DONANTE = 1,
        FILIAL = 2,
        ADMIN = 3
    }
    public class Usuario
    {
        public int idUsuario { get; set; }
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