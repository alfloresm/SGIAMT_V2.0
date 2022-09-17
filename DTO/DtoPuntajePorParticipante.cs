using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoPuntajePorParticipante
    {
        public string PK_IUMT_CodUsuModTan { get; set; }
        public int FK_IUM_CodUM { get; set; }
        public string IUMT_Pista { get; set; }
        public string Nombre_Jurado { get; set; }
        public int IP_Puntaje { get; set; }
    }
}
