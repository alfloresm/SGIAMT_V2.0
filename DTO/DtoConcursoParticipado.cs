using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoConcursoParticipado
    {
        public int PK_ICPA_Cod { get; set; }
        public string VCPA_NombreConcurso { get; set; }
        public string VCPA_Periodo { get; set; }
        public string VCPA_NombreAcademia { get; set; }
    }
}
