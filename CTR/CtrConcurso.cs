﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;

namespace CTR
{
    public class CtrConcurso
    {
        DaoConcurso objDaoConcurso;
        public CtrConcurso()
        {
            objDaoConcurso = new DaoConcurso();
        }
        public DataTable ListaConcursos_()
        {
            return objDaoConcurso.ListarConcursos();
        }
        public int RegistrarConcurso(DtoConcurso objc)
        {
            return objDaoConcurso.RegistrarConcurso(objc);
        }
        public void ActualizarConcurso(DtoConcurso objc)
        {
            objDaoConcurso.ActualizarConcurso(objc);
        }
        public void ObtenerConcurso(DtoConcurso objc)
        {
            objDaoConcurso.ObtenerConcurso(objc);
        }
        public DataSet DesplegableConcurso()
        {
            return objDaoConcurso.desplegableConcurso();
        }
        public DataSet DesplegableModalidades()
        {
            return objDaoConcurso.desplegableModalidades();
        }
        public DataSet DesplegableConcursoEnProceso()
        {
            return objDaoConcurso.desplegableConcursoEnProceso();
        }
        public void ActualizarConcursoEstado(int id,string Tipo)
        {
            objDaoConcurso.ActualizarEstadoConcursoEnProceso(id,Tipo);
        }
        public void ObtenerDatosConcurso(DtoConcurso objc)
        {
            objDaoConcurso.ObtenerDatosConcurso(objc);
        }
        public Boolean ExistePrecioEntrada(int id)
        {
            return objDaoConcurso.existePrecioEntrada(id);
        }
    }
}
