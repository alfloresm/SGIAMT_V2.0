using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoEspectador
    {
        public int PK_VES_Dni { get; set; }
        public string VES_NombreCompleto { get; set; }
        public string VES_Email { get; set; }
        public int FK_IC_IdConcurso { get; set; }
        public int IES_NumEntrada { get; set; }
        public string VES_Estado { get; set; }
        public string VES_TipoFecha { get; set; }

    }
}
