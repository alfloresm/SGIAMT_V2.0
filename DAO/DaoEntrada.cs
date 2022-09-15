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

        //desplegable fechas segun concurso seleccionado
        public DataSet desplegableFechasConcurso(int codcon)
        {
            try
            {
                DataSet dtFechasConcurso = null;
                conexion.Open();
                SqlCommand command = new SqlCommand("SP_Desplegable_Fechas_Concurso_NR", conexion);
                command.Parameters.AddWithValue("@cod_con", codcon);
                SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
                command.CommandType = CommandType.StoredProcedure;
                dtFechasConcurso = new DataSet();
                daAdaptador.Fill(dtFechasConcurso);
                conexion.Close();
                return dtFechasConcurso;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
