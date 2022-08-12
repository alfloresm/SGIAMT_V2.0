using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;
using System.Net.Mail;
using System.Net;

namespace DAO
{
    public class DaoUsuario
    {
        SqlConnection conexion;
        public DaoUsuario()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public int validacionLogin(string usuario, string clave)
        {

            int valor_retornado = 0;
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM T_USUARIO as U WHERE" +
                " U.PK_VU_DNI = '" + usuario + "' AND U.VU_Contrasenia = '" + clave + "'", conexion);



            Console.WriteLine(cmd);
            conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {    //valor_retornado = reader[0].ToString();
                valor_retornado = int.Parse(reader[0].ToString());

            }
            conexion.Close();

            return valor_retornado;
        }

        public DtoUsuario datosUsuario(String usuario)
        {
            SqlCommand cmd = new SqlCommand("select U.FK_ITU_TipoUsuario," +
                "U.VU_Nombre," +
                "U.VU_APaterno," +
                "U.VU_AMaterno," +
                "U.VU_Correo," +
                "U.VU_Sexo," +
                "U.VU_NAcademia," +
                "U.PK_VU_DNI," +
                "U.VU_Celular," +
                "U.FK_ICA_CodCat" +
                " from T_Usuario as U " +
                "where U.PK_VU_DNI = '" + usuario + "'", conexion);

            DtoUsuario usuarioDto = new DtoUsuario();
            DtoTipoUsuario tipousuarioDto = new DtoTipoUsuario();



            conexion.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                tipousuarioDto.PK_ITU_TipoUsuario = int.Parse(reader[0].ToString());
                usuarioDto.FK_ITU_TipoUsuario = int.Parse(reader[0].ToString());
                usuarioDto.VU_Nombre = reader[1].ToString();
                usuarioDto.VU_APaterno = reader[2].ToString();
                usuarioDto.VU_AMaterno = reader[3].ToString();
                usuarioDto.VU_Correo = reader[4].ToString();
                usuarioDto.VU_Sexo = reader[5].ToString();
                usuarioDto.VU_NAcademia = reader[6].ToString();
                usuarioDto.PK_VU_DNI = reader[7].ToString();
                usuarioDto.VU_Celular = reader[8].ToString();
                usuarioDto.FK_ICA_CodCat = int.Parse(reader[9].ToString());

            }
            conexion.Close();

            return (usuarioDto);
        }
    }
}
