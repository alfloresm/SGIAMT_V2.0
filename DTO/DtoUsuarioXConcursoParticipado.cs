using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoUsuarioXConcursoParticipado
    {
        public string PK_IUCP_Cod { get; set; }
        public int IUCP_PuntajeTotal { get; set; }
        public int IUCP_Puesto { get; set; }
        public int IUCP_Modalidad { get; set; }
        public string FK_VU_Dni { get; set; }
        public int FK_ICPA_Cod { get; set; }
    }
}
