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

        //metodo devolver la categoria segun su año
        public int ObtenerCategoria(int anio)
        {
            try
            {
                int valor_retornado = 0;
                SqlCommand cmd = new SqlCommand("select PK_ICA_CodCat from T_Categoria where " + anio + " >= ICA_AnioInicio and " + anio + " <= ICA_Aniofin", conexion);
                Console.WriteLine(cmd);
                conexion.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    valor_retornado = int.Parse(reader[0].ToString());
                }
                conexion.Close();
                return valor_retornado;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string ObtenerNombreCategoria(int anio)
        {
            try
            {
                string valor_retornado = "";
                SqlCommand cmd = new SqlCommand("select C.VCA_NomCategoria from T_Categoria C inner join T_Usuario U ON C.PK_ICA_CodCat = U.FK_ICA_CodCat where " + anio + " >= C.ICA_AnioInicio and " + anio + " <= C.ICA_Aniofin", conexion);
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

        public bool SelectUsuario(DtoUsuario objuser)//encuentra usuario con ese dni
        {
            string Select = "SELECT * from T_Usuario where PK_VU_Dni ='" + objuser.PK_VU_DNI + "'";
            SqlCommand unComando = new SqlCommand(Select, conexion);
            conexion.Open();
            SqlDataReader reader = unComando.ExecuteReader();
            bool hayRegistros = reader.Read();
            if (hayRegistros)
            {
                objuser.PK_VU_DNI = (string)reader[0];
            }

            conexion.Close();
            return hayRegistros;
        }
        public bool SelectUsuario_Aca(DtoUsuario objuser)//encuentra usuario con ese dni diferente a la acedemia
        {
            string Select = "SELECT * from T_Usuario where PK_VU_Dni ='" + objuser.PK_VU_DNI + "' AND VU_NAcademia<>'TUSUY PERU'";
            SqlCommand unComando = new SqlCommand(Select, conexion);
            conexion.Open();
            SqlDataReader reader = unComando.ExecuteReader();
            bool hayRegistros = reader.Read();
            if (hayRegistros)
            {
                objuser.PK_VU_DNI = (string)reader[0];
            }

            conexion.Close();
            return hayRegistros;
        }
        public bool SelectUsuario_Gen(DtoUsuario objuser, string gen)//encuentra usuario con ese dni diferente al genero
        {
            string Select = "SELECT * from T_Usuario where PK_VU_Dni ='" + objuser.PK_VU_DNI + "' AND VU_Sexo<>'" + gen + "'";
            SqlCommand unComando = new SqlCommand(Select, conexion);
            conexion.Open();
            SqlDataReader reader = unComando.ExecuteReader();
            bool hayRegistros = reader.Read();
            if (hayRegistros)
            {

                objuser.PK_VU_DNI = (string)reader[0];
            }

            conexion.Close();
            return hayRegistros;
        }


        //metodo registrar usuario
        public void RegistrarUsuario(DtoUsuario obju)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Registrar_Usuario", conexion); //falta este procedure
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@dni", obju.PK_VU_DNI); //
                command.Parameters.AddWithValue("@nombre", obju.VU_Nombre);
                command.Parameters.AddWithValue("@apellidoP", obju.VU_APaterno);
                command.Parameters.AddWithValue("@apellidoM", obju.VU_AMaterno);
                command.Parameters.AddWithValue("@fechaNacimiento", obju.DTU_FechaNacimiento);
                command.Parameters.AddWithValue("@contrasenia", obju.VU_Contrasenia);
                command.Parameters.AddWithValue("@sexo", obju.VU_Sexo);
                command.Parameters.AddWithValue("@nombreAcademia", obju.VU_NAcademia);
                command.Parameters.AddWithValue("@correo", obju.VU_Correo);
                command.Parameters.AddWithValue("@celular", obju.VU_Celular);
                command.Parameters.AddWithValue("@cat", obju.FK_ICA_CodCat);
                command.Parameters.AddWithValue("@codigoAct", obju.IU_CodigoActivacion);
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            
            catch (Exception ex)
            {
                throw;
            }
        }

        public void ObtenerParticipante(DtoUsuario objUsuario, DtoCategoria objcat)
        {
            SqlCommand command = new SqlCommand("SP_Obtener_Participante_I", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@dni", objUsuario.PK_VU_DNI);
            DataSet ds = new DataSet();
            conexion.Open();
            SqlDataAdapter moldura = new SqlDataAdapter(command);
            moldura.Fill(ds);
            moldura.Dispose();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                objUsuario.nombres = reader[0].ToString();
                objcat.PK_ICA_CodCat = Convert.ToInt32(reader[1].ToString());
                objcat.VCA_NomCategoria = reader[2].ToString();
                objUsuario.VU_Sexo = reader[3].ToString();
            }
            conexion.Close();
            conexion.Dispose();
        }
        public string ObtenerCodJurado(string dni)
        {
            try
            {
                string valor_retornado = "";
                SqlCommand cmd = new SqlCommand("select PK_IJ_CodJurado from T_Jurado where FK_VU_Dni='"+ dni + "'", conexion);
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
        //metodo registrar imagen usuario
        //public void RegistrarImgUsuario(byte[] bytes, string id)
        //{
        //    try
        //    {
        //        SqlCommand command = new SqlCommand("SP_Registrar_Img_Usuario", conexion); //falta este procedure
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@id", id);
        //        command.Parameters.AddWithValue("@imagen", bytes);
        //        conexion.Open();

        //        command.ExecuteNonQuery();
        //        conexion.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
    }
}
