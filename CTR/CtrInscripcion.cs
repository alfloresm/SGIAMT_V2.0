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
        public void RegistrarInscripcionV(DtoInscripcion objdtoinscripcion)
        {
            objdaoinscripcion.registrarInscripcionV(objdtoinscripcion);
        }
        public void RegistrarImgVoucherInscripcion(byte[] bytes, int id)
        {
            objdaoinscripcion.RegistrarImgVoucherInscripcion(bytes, id);
        }
    }
}
