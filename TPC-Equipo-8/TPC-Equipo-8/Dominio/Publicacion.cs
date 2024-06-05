using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class Publicacion
    {
        public int idPublicacion { get; set; }
        public string filial { get; set; }
        public string nombreReceptor { get; set; }
        public string grupoSanguineo { get; set; }
        public string posiblesDonantes { get; set; }
        public string urgencia { get; set; }
        public int donantesNecesarios { get; set; }
        public string horarios { get; set; }
        public DateTime fechaLimite { get; set; }
        public bool estado { get; set; }
    }
}