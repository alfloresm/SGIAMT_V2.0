using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;

namespace CTR
{
    public class CtrEntrada
    {
        DaoEntrada objDaoEntrada;
        public CtrEntrada()
        {
            objDaoEntrada = new DaoEntrada();
        }

        public DataSet DesplegableConcursoNoRealizado()
        {
            return objDaoEntrada.desplegableConcursoNoRealizado();
        }

        //desplegable fechas segun concurso seleccionado
        public DataSet DesplegableFechasConcurso(int codconc)
        {
            return objDaoEntrada.desplegableFechasConcurso(codconc);
        }

        //registrar compra entrada
        public string RegistrarCompraEntrada(DtoEspectador objEsp)
        {
            return objDaoEntrada.RegistrarCompraEntrada(objEsp);
        }

        //registrar venta entrada
        public string RegistrarVentaEntrada(DtoEspectador objEsp)
        {
            return objDaoEntrada.RegistrarVentaEntrada(objEsp);
        }
    }
}
