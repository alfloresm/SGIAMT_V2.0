﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;

namespace CTR
{
    public class CtrUsuarioxModalidad
    {
        DaoUsuarioxModalidad objdaouxm;
        public CtrUsuarioxModalidad()
        {
            objdaouxm = new DaoUsuarioxModalidad();
        }
        public void registrarUXM_S(DtoUsuarioxModalidad objdtouxm)
        {
            objdaouxm.RegistrarUXM_S(objdtouxm);
        }
        public void registrarUXM_N(DtoUsuarioxModalidad objdtouxm)
        {
            objdaouxm.RegistrarUXM_N(objdtouxm);
        }
        public bool existeUXM_S(DtoUsuarioxModalidad objdtouxm)
        {
            return objdaouxm.existeUXM_Seriado(objdtouxm);
        }
        public bool existeUXM_N(DtoUsuarioxModalidad objdtouxm)
        {
            return objdaouxm.existeUXM_conPareja(objdtouxm);
        }
        public void registrarUXM_S_V(DtoUsuarioxModalidad objdtouxm)
        {
            objdaouxm.RegistrarUXM_S_V(objdtouxm);
        }
        public void registrarUXM_N_V(DtoUsuarioxModalidad objdtouxm)
        {
            objdaouxm.RegistrarUXM_N_V(objdtouxm);
        }
        public void ValidarRegistro(int id,int est)
        {
            objdaouxm.ValidarInscripcion(id,est);
        }
        public void actualizarEstadoParticipante(DtoTanda obj)
        {
            objdaouxm.actualizar_estadoParticipantes(obj);
        }
    }
}
