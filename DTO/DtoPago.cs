using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoPago
    {
        public int PK_IP_CodPago { get; set; }
        public DateTime DTP_Fecha { get; set; }
        public double DP_Monto { get; set; }
        public string VP_Estado { get; set; }
        public string VP_Periodo { get; set; }
        public string FK_IU_DNI { get; set; }
        public int FK_ICP_CodCP { get; set; }
    }
}
