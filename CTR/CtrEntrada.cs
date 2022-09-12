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
    }
}
