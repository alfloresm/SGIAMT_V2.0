using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoConcursoPrecio
    {
        public int PK_ICP_IdConcurso { get; set; }
        public int PK_ICP_CodPrecio { get; set; }
        public double DCP_Monto { get; set; }
    }
}
