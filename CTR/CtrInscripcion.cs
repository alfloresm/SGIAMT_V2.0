using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;
using System.Data;

namespace CTR
{
    public class CtrInscripcion
    {
        DaoInscripcion objdaoinscripcion;
        public CtrInscripcion()
        {
            objdaoinscripcion = new DaoInscripcion();
        }
        public void RegistrarInscripcionP(DtoInscripcion objdtoinscripcion)
        {
            objdaoinscripcion.registrarInscripcionP(objdtoinscripcion);
        }
        public DataTable ListarModalidadPorConcurso(int id)
        {
            return objdaoinscripcion.ListarModalidadesbyconcurso(id);
        }
        public int RegistrarInscripcionV(DtoInscripcion objdtoinscripcion)
        {
            return objdaoinscripcion.registrarInscripcionV(objdtoinscripcion);
        }
        public void RegistrarImgVoucherInscripcion(byte[] bytes, int id)
        {
            objdaoinscripcion.RegistrarImgVoucherInscripcion(bytes, id);
        }
        public DataSet DesplegableConcursoNoRealizado()
        {
            return objdaoinscripcion.desplegableConcursoNoRealizado();
        }
        //Listar inscripciones por concurso
        public DataTable ListarInscripcionesByConcurso(int id)
        {
            return objdaoinscripcion.ListarInscripcionesByConcurso(id);
        }
        //Listar inscripciones por concurso first
        public DataTable ListarInscripcionesByConcurso()
        {
            return objdaoinscripcion.ListarInscripcionesByConcurso();
        }
        //validar Inscripcion
        public void ValidarInscripcion(int id, int estado)
        {
            objdaoinscripcion.ValidarInscripcion(id, estado);
        }
        //Listar inscripciones por DNI
        public DataTable ListarInscripcionesByDni(string dni)
        {
            return objdaoinscripcion.ListarInscripcionesBydni(dni);
        }
        //Listar Concursos participados por dni
        public DataTable ListarConcursosParticipadosByDni(string dni)
        {
            return objdaoinscripcion.ListarConcursosParticipadosBydni(dni);
        }
    }
}
