using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;

namespace CTR
{
    public class CtrMarinera
    {
        DaoMarinera objDaoMarinera;
        public CtrMarinera()
        {
            objDaoMarinera = new DaoMarinera();
        }
        public void devolverMarineraAleatoria(int dific, int tanda)
        {
            objDaoMarinera.Elegir_Marinera(dific,tanda);
        }

        public string devolverCodMar(int tanda)
        {
            return objDaoMarinera.obtenerMarinera(tanda);
        }
    }
}
