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
        public int RegistrarCompraEntrada(DtoEspectador objEsp)
        {
            return objDaoEntrada.RegistrarCompraEntrada(objEsp);
        }

        //registrar venta entrada
        public string RegistrarVentaEntrada(DtoEspectador objEsp)
        {
            return objDaoEntrada.RegistrarVentaEntrada(objEsp);
        }
        //Listar Mis Entradas
        public DataTable ListarMisEntradas(string id)
        {
            return objDaoEntrada.ListarMisEntradas(id);
        }
        //Registrar img voucher
        public void RegistrarImgVoucherEntrada(byte[] bytes, int id)
        {
            objDaoEntrada.RegistrarImgVoucherEntrada(bytes, id);
        }
        //Listar Entradas por concurso
        public DataTable ListarEntradasbyConcurso(int id)
        {
            return objDaoEntrada.ListarEntradasByConcurso(id);
        }
        //Listar Entradas por concurso first
        public DataTable ListarEntradasbyConcurso()
        {
            return objDaoEntrada.ListarEntradasByConcurso();
        }
        //validar Entrada
        public void ValidarEntrada(int id,string op, string desc)
        {
            objDaoEntrada.ValidarEntrada(id, op, desc);
        }
        //Disponibilidad entradas
        public int disponibilidadEntradas(string fecha,int concurso)
        {
            return objDaoEntrada.EntradasDisponibles(fecha, concurso);
        }
    }
}
