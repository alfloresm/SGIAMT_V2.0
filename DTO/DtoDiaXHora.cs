using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoDiaXHora
    {
        public int FK_ID_CodDia { get; set; }
        public int FK_IH_CodHora { get; set; }
        public string VDH_Horario { get; set; }
        public int FK_IC_CodNivel { get; set; }
        public int FK_IC_CodCatAlumno { get; set; }
        public string VC_Local { get; set; }
    }
}
