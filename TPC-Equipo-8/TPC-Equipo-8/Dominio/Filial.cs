using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class Filial
    {
        public int idFilial { get; set; }
        public string nombre { get; set; }
        public string telefono { get; set; }
        public string horarioAtencion { get; set; }
        public string mail { get; set; }
        public string urlImagen { get; set; }
        public string urlWeb { get; set; }
        public bool estado { get; set; }
    }
}
