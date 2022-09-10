using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;

namespace CTR
{
    public class CtrPuntaje
    {
        DaoPuntaje objDaoPuntaje;
        public CtrPuntaje()
        {
            objDaoPuntaje = new DaoPuntaje();
        }
        public void RegistrarPuntaje(DtoPuntaje objpuntaje)
        {
            objDaoPuntaje.registrar_Puntaje(objpuntaje);
        }
        public void ActualizarPuntaje(DtoPuntaje objpuntaje)
        {
            objDaoPuntaje.actualizar_Puntaje(objpuntaje);
        }
        public bool existePuntaje(DtoPuntaje dtoPuntaje)
        {
            return objDaoPuntaje.existePuntaje(dtoPuntaje);
        }
        public int obtenerBloque(string dni)
        {
            return objDaoPuntaje.ObtenerBloqueJurado(dni);
        }
    }
}
