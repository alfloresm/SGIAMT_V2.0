﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DtoUsuario
    {
        public string PK_IU_DNI { get; set; }
        public string VU_Nombre { get; set; }
        public string VU_APaterno { get; set; }
        public string VU_AMaterno { get; set; }
        public DateTime DTU_FechaNacimiento { get; set; }
        public string VU_Contrasenia { get; set; }
        public string VU_Sexo { get; set; }
        public string VU_NAcademia { get; set; }
        public string VU_Correo { get; set; }
        public string VU_Celular { get; set; }
        public string VU_Estado { get; set; }
        public string VU_AlumnoMes { get; set; }
        public string VU_Direccion { get; set; }
        public byte[] VBU_ArchivoUsuario { get; set; }
        /*------------------------------------------------*/
        public int FK_ICA_CodCat { get; set; }
        public int FK_ITU_TipoUsuario { get; set; }
        public int FK_IC_CodNivel { get; set; }
        public int FK_IC_CodCatAlumno { get; set; }
        public string FK_VC_Local { get; set; }
    }
}
