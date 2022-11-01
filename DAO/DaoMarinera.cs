using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace DAO
{
    public class DaoMarinera
    {
        SqlConnection conexion;

        public DaoMarinera()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }

        public void Elegir_Marinera (int dific,int tanda)
        {
            SqlCommand command = new SqlCommand("SP_Elegir_Marinera", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@dificultad", dific);
            command.Parameters.AddWithValue("@tanda", tanda);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }

        public string obtenerMarinera(int tanda)
        {
            try
            {
                string valor_retornado = "";
                SqlCommand cmd = new SqlCommand("select m.VM_Nombre from T_Marinera m inner join T_Tanda t on t.FK_IM_CodMar=m.PK_IM_CodMar where t.PK_IT_CodTan= " + tanda, conexion);
                Console.WriteLine(cmd);
                conexion.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    valor_retornado = reader[0].ToString();
                }
                conexion.Close();
                return valor_retornado;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
