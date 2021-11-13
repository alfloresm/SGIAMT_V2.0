using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoClase
    {
        public int FK_IC_CodNivel { get; set; }
        public int FK_IC_CodCatAlumno { get; set; }
        public string VC_Descripcion { get; set; }
        public int IC_TotalClase { get; set; }
        public string VC_Local { get; set; }
        public string FK_VP_Dni { get; set; }

    }
}
