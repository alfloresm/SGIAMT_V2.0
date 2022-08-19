using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAO
{
    public class ConexionBD
    {
        public static string CadenaConexion
        {
            get
            {
                //ale
                //return @"data source=ALEPC; initial catalog=BD_SGIAMTv1; integrated security=SSPI;";
                //karla
                return @"data source=DESKTOP-NEB97S6; initial catalog=BD_SGIAMTv1; integrated security=SSPI;";
            }
        }
    }
}
