using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAO;

namespace CTR
{
    public class CtrEmail
    {
        DaoEmail objdaoEmail;
        Log _log = new Log();
        public CtrEmail()
        {
            objdaoEmail = new DaoEmail();
        }

        public DtoDatosEmailInscripcion ObtenerDatosCorreo(int cod)
        {
            return objdaoEmail.DevolverDatos(cod);
        }

        public void EnviarEmail(string correo,string asunto, string cuerpoMensaje)
        {
            _log.CustomWriteOnLog("Registrar Cuenta", "Cuenta : no entra, CUENTA:" +cuerpoMensaje + " **"+ correo+" **"+asunto);
            objdaoEmail.EnviarEmail(correo, asunto, cuerpoMensaje);

            _log.CustomWriteOnLog("Registrar Cuenta", "Cuenta : no entra2");
        }
        public string ConfirmarActivacionCuenta(string DNI, string CorreoCuenta, int codigoActivacion, string TipoOperacionSQL)
        {
            return objdaoEmail.ConfirmarActivacionCuenta(DNI, CorreoCuenta, codigoActivacion, TipoOperacionSQL);
        }
    }
}
