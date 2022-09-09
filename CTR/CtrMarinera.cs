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
        public string devolverMarineraAleatoria(int dific)
        {
            return objDaoMarinera.Elegir_Marinera(dific);
        }
    }
}
