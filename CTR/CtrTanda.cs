using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAO;
using DTO;

namespace CTR
{
    public class CtrTanda
    {
        DaoTanda objDaoTanda;
        public CtrTanda()
        {
            objDaoTanda = new DaoTanda();
        }
        public DataTable listar_Tanda_NC()
        {
            return objDaoTanda.listar_Tanda_NC();
        }
        public void regTanda(DtoTanda objtanda)
        {
            objDaoTanda.registrarTanda(objtanda);
        }
        //pasar a ctr_usuarioModalidadTanda
        public void registrarUMT(DtoUsuarioModalidadTanda objUMT)
        {
            objDaoTanda.registrarUMT(objUMT);
        }

        //update del registro de tanda
        public void updTandaMarinera(DtoTanda objtanda)
        {
            objDaoTanda.updateTandaMar(objtanda);
        }

        //obtener el nombre de la marinera
        public string devolverNombreMar(int codmar)
        {
            return objDaoTanda.ObtenerMarinera(codmar);
        }
        public string devolverCodMar(int codmar)
        {
            return objDaoTanda.ObtenerMarinera(codmar);
        }

        //listar tanda y marinera
        public DataTable listar_Tanda_Marinera()
        {
            return objDaoTanda.listar_Tanda_marinera();
        }
    }
}
