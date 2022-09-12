using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DTO;

namespace DAO
{
    public class DaoEntrada
    {
        SqlConnection conexion;
        public DaoEntrada()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public DataSet desplegableConcursoNoRealizado()
        {
            SqlDataAdapter tipomol = new SqlDataAdapter("SP_Desplegable_Concursos_NR", conexion);
            tipomol.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipomol.Fill(DS);
            return DS;
        }
    }
}
