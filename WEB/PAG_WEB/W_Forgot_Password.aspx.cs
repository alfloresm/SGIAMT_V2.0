using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB.PAG_WEB
{
    public partial class W_Forgot_Password : System.Web.UI.Page
    {
        Log _log = new Log();
        CtrUsuario objctrusuario = new CtrUsuario();
        CtrEmail objctrEmail = new CtrEmail();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _log.CustomWriteOnLog("Forgot_Password", "****Cargo****");
            }
        }

        protected void btnRes_Click(object sender, EventArgs e)
        {
            try
            {
                if (RevDocumento.IsValid && RevCorreo.IsValid && RequDocumento.IsValid && RequCorreo.IsValid)
                {
                    int nroUsurio = objctrusuario.validacionContrasena(txtDni.Text, txtemail.Text);
                    if (nroUsurio == 1)
                    {
                        //Activaciòn
                        string RestablecerUrl = Server.HtmlEncode("http://localhost:54460/PAG_WEB/W_RestablecerContrasena.aspx?UserID=" + txtDni.Text + "&EmailId=" + txtemail.Text);
                        string Asunto = "TusuyPeru -- Restablecer contraseña";

                        StringBuilder sb = new StringBuilder();
                        sb.AppendLine("Hola :\n");
                        sb.AppendLine("Gracias por mostrar interes y registrarte en La Academia de Marinera Tusuy Perú" + "\n");
                        sb.AppendLine("Por favor haga <a href='" + RestablecerUrl + "'>Click aquí para activar</a> tu cuenta y disfrutar de nuestros servicios." + "\n");
                        sb.AppendLine("Saludos Cordiales.");

                        string CuerpoMensaje = sb.ToString();
                        objctrEmail.EnviarEmail(txtemail.Text, Asunto, sb.ToString());
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSuccessCorreoContrasena()", true);
                    }
                    else
                    {
                        string m = "No se ha encontrado una cuenta asociada a ese dni y ese email. Registrese, por favor.";
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessagecontrasena(" + m + ")", true);
                    }
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Forgot_Password", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }


        }
    }
}