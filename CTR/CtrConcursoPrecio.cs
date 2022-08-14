using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;
using System.Data;

namespace CTR
{
    public class CtrConcursoPrecio
    {
        DaoConcursoPrecio objDaoConcursoPrecio;
        public CtrConcursoPrecio()
        {
            objDaoConcursoPrecio = new DaoConcursoPrecio();
        }
        public DataTable ListaPreciosByConcursos(int id)
        {
            return objDaoConcursoPrecio.ListarPrecioByConcurso(id);
        }
        public void RegistrarPreciosDeConcursos(DtoConcursoPrecio objc)
        {
            objDaoConcursoPrecio.RegistrarConcursoPrecio(objc);
        }
        public DataSet DesplegablePrecios()
        {
            return objDaoConcursoPrecio.DesplegablePrecio();
        }
    }
}
