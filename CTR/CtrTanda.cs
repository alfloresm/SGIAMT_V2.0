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
            return objDaoTanda.ListarParticipantesXtanda_Seriado(codTanda, bloque);
        }
        public void actualizarEstadoUMT(DtoUsuarioModalidadTanda objUMT)
        {
            objDaoTanda.actualizar_estado_umt(objUMT);

        }
        public void obtenerTandaP(DtoTanda objtanda)
        {
            objDaoTanda.ObtenerTandaP(objtanda);
        }
        public string obtenerModalidad(int id)
        {
            return objDaoTanda.ObtenerModalidad(id);
        }
        //Mostrar Resultado
        public void actualizarEstadoT(DtoTanda objtanda)
        {
            objDaoTanda.actualizar_estadoT(objtanda);
        }
        public int sumaPuntajes(DtoUsuarioModalidadTanda objUMT)
        {
            return objDaoTanda.sumaPuntaje(objUMT);
        }
        public void actualizarPuntajeT(DtoUsuarioModalidadTanda objUMT)
        {
            objDaoTanda.actualizar_PuntajeT_umt(objUMT);
        }
        public void actualizarganadorT(DtoTanda objtanda)
        {
            objDaoTanda.actualizar_ganadorT(objtanda);
        }
        public DataTable ObtenertandaXBloque(int codTanda)
        {
            return objDaoTanda.ListarParticipantesXtanda_Puntaje(codTanda);
        }
        public DataTable ObtenerPuntajesPorParticipante(string id)
        {
            return objDaoTanda.puntajePorParticipante(id);
        }
        //elegir marinera
        public DataTable Listar_Tanda_NC_EM()
        {
            return objDaoTanda.listar_Tanda_EM();
        }
        public DataTable Listar_Tanda_NC_EM_By_Concurso(int cod)
        {
            return objDaoTanda.listar_Tanda_EM_By_Concurso(cod);
        }
    }
}
