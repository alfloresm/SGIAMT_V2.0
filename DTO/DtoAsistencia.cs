﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoAsistencia
    {
        public int PK_IA_CodAsi { get; set; }
        public DateTime DTA_Fecha { get; set; }
        public string VA_EstadoAsistencia { get; set; }
        public string VA_Periodo { get; set; }
        public string FK_VU_DNI { get; set; }
    }
}
