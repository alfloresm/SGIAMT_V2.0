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
            objdaoEmail.EnviarEmail(correo, asunto, cuerpoMensaje);
        }
        public string ConfirmarActivacionCuenta(string DNI, string CorreoCuenta, int codigoActivacion, string TipoOperacionSQL)
        {
            return objdaoEmail.ConfirmarActivacionCuenta(DNI, CorreoCuenta, codigoActivacion, TipoOperacionSQL);
        }
    }
}
