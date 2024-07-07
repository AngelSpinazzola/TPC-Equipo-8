using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class FilialCompleta
    {
       
        public string nombre { get; set; }
        public string telefono { get; set; }
        public string horarioAtencion { get; set; }
        public string correo { get; set; }
        public string urlImagen { get; set; }
        public string urlWeb { get; set; }
        public string calle {  get; set; }
        public int altura { get; set; }
        public int piso { get; set; }
        public string departamento { get; set; }
        public int localidad { get; set; }
        public string cp {  get; set; }
        public int ciudad { get; set; }
        public int provincia { get; set; }


    }
}