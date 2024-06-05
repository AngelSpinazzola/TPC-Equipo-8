using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class Direccion
    {
        public string calle { get; set; }
        public int altura { get; set; }
        public int piso { get; set; }
        public string departamento { get; set; }
        public string localidad { get; set; }
        public string codigoPostal { get; set; }
        public string ciudad { get; set; }
        public string provincia { get; set; }
    }
}