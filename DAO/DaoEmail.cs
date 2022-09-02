using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace DAO
{
    public class DaoEmail
    {
        SqlConnection conexion;
        public DaoEmail()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }

        public DtoDatosEmailInscripcion DevolverDatos(int cod)
        {
            SqlCommand command = new SqlCommand("SP_ObtenerDatoCorreo", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@cod", cod);
            DataSet ds = new DataSet();
            conexion.Open();
            SqlDataAdapter Da = new SqlDataAdapter(command);
            Da.Fill(ds);
            Da.Dispose();

            SqlDataReader reader = command.ExecuteReader();
            DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();

            if (reader.Read())
            {

                objDatosEmail.NombrePrincipal = reader["NombrePrincipal"].ToString();
                objDatosEmail.CorreoPrincipal = reader["CorreoPrincipal"].ToString();
                objDatosEmail.NombrePareja = reader["NombrePareja"].ToString();
                objDatosEmail.CorreoPareja = reader["CorreoPareja"].ToString();
                objDatosEmail.NombreConcurso = reader["VC_NombreCon"].ToString();
                objDatosEmail.Lugar = reader["VC_LugarCon"].ToString();
                objDatosEmail.Monto = Convert.ToDouble(reader["DI_Monto"].ToString());
                objDatosEmail.FechaInscripcion = Convert.ToDateTime(reader["DTUM_FechaIns"].ToString());
                objDatosEmail.NombreModalidad = reader["VM_NombreMod"].ToString();
                objDatosEmail.CodigoParticipante = Convert.ToInt32(reader["PK_IUM_CodPart"].ToString());
                objDatosEmail.FechaConcurso = Convert.ToDateTime(reader["DTC_FechaInicio"].ToString());                
            }
            conexion.Close();

            return objDatosEmail;
        }

        public void EnviarEmail(string CuentaCorreo, string Asunto, string cuerpoMensaje)
        {
            try
            {
                String userName = "TusuyPeru2022@hotmail.com";
                String password = "Tusuy@Peru2022";
                MailMessage msg = new MailMessage(userName, CuentaCorreo);
                msg.Subject = Asunto;
                msg.Body = cuerpoMensaje;
                msg.IsBodyHtml = true;
                SmtpClient SmtpClient = new SmtpClient();
                SmtpClient.Credentials = new System.Net.NetworkCredential(userName, password);
                SmtpClient.Host = "smtp.office365.com";
                SmtpClient.Port = 587;
                SmtpClient.EnableSsl = true;
                SmtpClient.Send(msg);
            }
            catch (Exception ep)
            {
                Console.WriteLine("failed to send email with the following error:");
                Console.WriteLine(ep.Message);
            }
        }

        public string ConfirmarActivacionCuenta(string DNI, string CorreoCuenta, int codigoActivacion, string TipoOperacionSQL)
        {

            SqlCommand command = new SqlCommand("sp_AdministrarCuentaUsuario", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@DNI", DNI);
            command.Parameters.AddWithValue("@CorreoCuenta", CorreoCuenta);
            command.Parameters.AddWithValue("@CodigoActivacion", codigoActivacion);
            command.Parameters.AddWithValue("@StatementType", TipoOperacionSQL);
            if (TipoOperacionSQL == "Contar" || TipoOperacionSQL == "ValidarCuenta")
            {
                command.Parameters.Add("@totalCount", SqlDbType.Int).Direction = ParameterDirection.Output;
            }
            else if (TipoOperacionSQL == "Actualizar")
            {
                command.Parameters.AddWithValue("@totalCount", DBNull.Value);
            }

            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();

            if (TipoOperacionSQL == "Contar" || TipoOperacionSQL == "ValidarCuenta")
            {
                return Convert.ToString(command.Parameters["@totalCount"].Value);
            }
            else
            {
                return "Elemento activado";

            }
        }
    }
}
