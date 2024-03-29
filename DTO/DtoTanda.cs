﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoTanda
    {
        public int PK_IT_CodTan { get; set; }
        public int IT_GanadorA { get; set; }
        public int IT_GanadorB { get; set; }
        public int IT_GanadorC { get; set; }
        public int VT_TipoTanda { get; set; }
        public string VT_Estado { get; set; }
        public string VT_Descripcion { get; set; }
        public int IT_CodigoConcurso { get; set; }
        public int FK_IM_CodMar { get; set; }
        public DateTime DT_FechaCreacion { get; set; }
    }
}
