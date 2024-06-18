using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class ProximasDonaciones
    {
  
        public string NombreDonante { get; set; }
        public string ApellidoDonante { get; set; }
        public string DNI { get; set; }
        public string GrupoSanguineoDonante { get; set; }
        public string NombreReceptor { get; set; }
        public string GrupoSanguineoReceptor { get; set; }
        public int DonantesNecesarios { get; set; }
        public string Urgencia { get; set; }
        public DateTime FechaRegistro { get; set; }
        public DateTime FechaLimite { get; set; }

    }
}