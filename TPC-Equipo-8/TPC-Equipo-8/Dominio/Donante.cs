using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class Donante : Usuario
    {
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int dni { get; set; }
        public string tipoSangre { get; set; }
        public string urlFoto { get; set; }
        public bool estado { get; set; }
    }
}