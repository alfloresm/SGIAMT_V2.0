using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoPuntaje
    {

        public int PK_IP_Cod { get; set; }
        public int IP_Puntaje { get; set; }
        public int FK_JU_CodJurado { get; set; }
        public string FK_IUMT_UsuModTan { get; set; }
    }
}
