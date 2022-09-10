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
        public bool selectTanda(DtoTanda objtanda)
        {
            return objDaoTanda.SelectTanda(objtanda);
        }
        public void obtenerTanda(DtoTanda objtanda)
        {
            objDaoTanda.ObtenerTanda(objtanda);
        }
        public DataTable obtenerParticipantesxTanda(DtoUsuarioModalidadTanda objUMT)
        {
            return objDaoTanda.ListarParticipantesXtanda(objUMT);
        }
        public DataTable obtenerParticipantesxTandaSeriado(int codTanda, string bloque)
        {
            return objDaoTanda.ListarParticipantesXtanda_Seriado(codTanda,bloque);
        }
        public void actualizarEstadoUMT(DtoUsuarioModalidadTanda objUMT)
        {
            objDaoTanda.actualizar_estado_umt(objUMT);
        }
    }
}
