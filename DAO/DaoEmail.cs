using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class DaoEmail
    {
        SqlConnection conexion;
        public DaoEmail()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public void EnviarCorreo(string CuentaCorreo, string Asunto, string cuerpoMensaje)
        {

            try
            {
                String userName = "LaParadaCrossfit@hotmail.com";
                String password = "Nolose19";
                MailMessage msg = new MailMessage(userName, CuentaCorreo);
                msg.Subject = Asunto;
                //StringBuilder sb = new StringBuilder();
                //sb.AppendLine("Hola : " + dtoUsuario.VU_Nombre+ " " + dtoUsuario.VU_APaterno);
                msg.Body = cuerpoMensaje;
                msg.IsBodyHtml = true;
                //Attachment attach = new Attachment(Server.MapPath("folder/" + ImgName));
                //msg.Attachments.Add(attach);
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

            //return "";

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
