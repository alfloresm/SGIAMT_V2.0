using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoConcurso
    {
        public int PK_IC_IdConcurso { get; set; }
        public string VC_NombreCon { get; set; }
        public string VC_LugarCon { get; set; }
        public DateTime DTC_FechaI { get; set; }
        public DateTime DTC_FechaF { get; set; }
        public int  IC_Capacidad1 { get; set; }
        public int IC_Capacidad2 { get; set; }
        public string VC_Estado { get; set; }
        //----------------------
        public double precio_entrada { get; set; }
    }
}
