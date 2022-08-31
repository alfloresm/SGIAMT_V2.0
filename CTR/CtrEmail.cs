using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;

namespace CTR
{
    public class CtrEmail
    {
        DaoEmail objDaoEmail;
        public CtrEmail()
        {
            objDaoEmail = new DaoEmail();
        }
        public void EnviarEmail(string CuentaCorreo, string Asunto, string CuerpoMensaje)
        {
            objDaoEmail.EnviarCorreo(CuentaCorreo, Asunto, CuerpoMensaje);
        }

        public string ConfirmarActivacionCuenta(string DNI, string CorreoCuenta, int codigoActivacion, string TipoOperacionSQL)
        {
            return objDaoEmail.ConfirmarActivacionCuenta(DNI, CorreoCuenta, codigoActivacion, TipoOperacionSQL);
        }
    }
}
