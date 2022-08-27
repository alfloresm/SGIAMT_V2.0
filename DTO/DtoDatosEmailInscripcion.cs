using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoDatosEmailInscripcion
    {
        public string NombrePrincipal { get; set; }
        public string CorreoPrincipal { get; set; }
        public string NombrePareja { get; set; }
        public string CorreoPareja { get; set; }
        public string NombreConcurso { get; set; }
        public string Lugar { get; set; }
        public double Monto { get; set; }
        public DateTime FechaInscripcion { get; set; }
        public string NombreModalidad { get; set; }
        public int CodigoParticipante { get; set; }
        public DateTime FechaConcurso { get; set; }
    }
}
