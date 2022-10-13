using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB
{
    public partial class W_Registrar_Participante : System.Web.UI.Page
    {
        Log _log = new Log();

        CtrUsuario objCtrUsuario = new CtrUsuario();
        DtoUsuario objdtoUsuario = new DtoUsuario();
        CtrEmail objctrEmail = new CtrEmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    _log.CustomWriteOnLog("Registrar Usuario", "****Cargo****");
                }
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("Registrar Usuario", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            try
            {
                objdtoUsuario.PK_VU_DNI = TextBoxDni.Text;
                if (RequDocumento.IsValid && RequNombre.IsValid && RequAP.IsValid && RequAM.IsValid && RequCorreo.IsValid && RequCelular.IsValid && RequNA.IsValid &&
                 RevDocumento.IsValid && RevNombre.IsValid && RevAP.IsValid && RevAM.IsValid && RevCelular.IsValid && RevNA.IsValid && RevCorreo.IsValid)
                {
                    if (!objCtrUsuario.existeUsuarioAca(objdtoUsuario))
                    {
                        if (!objCtrUsuario.existeUsuario(objdtoUsuario))
                        {
                            DateTime a = Convert.ToDateTime(TextBox10.Text);
                            if (a.Year < 2017)
                            {
                                _log.CustomWriteOnLog("Registrar Usuario", "entra a boton registrar");
                                objdtoUsuario.VU_Nombre = TextBox1.Text; //nombre
                                objdtoUsuario.VU_APaterno = TextBox2.Text; //apellido paterno
                                objdtoUsuario.VU_AMaterno = TextBox3.Text; //apellido materno
                                objdtoUsuario.VU_Sexo = ddlGenero.SelectedValue; //sexo

                                objdtoUsuario.VU_Celular = TextBox5.Text; //celular
                                objdtoUsuario.VU_NAcademia = TextBox6.Text; //academia
                                objdtoUsuario.VU_Correo = TextBox7.Text; //correo electronico

                                objdtoUsuario.DTU_FechaNacimiento = Convert.ToDateTime(TextBox10.Text); //fecha de nacimiento
                                _log.CustomWriteOnLog("Registrar Usuario", objdtoUsuario.DTU_FechaNacimiento.ToString());
                                objdtoUsuario.VU_Contrasenia = TextBox8.Text; //contraseña

                                int anio = objdtoUsuario.DTU_FechaNacimiento.Year;
                                objdtoUsuario.FK_ICA_CodCat = objCtrUsuario.devolverCategoria(anio);


                                //objCtrUsuario.registrarUsuario(objdtoUsuario);
                                _log.CustomWriteOnLog("Registrar Usuario", "DNI:" + objdtoUsuario.PK_VU_DNI.ToString());
                                string id = objdtoUsuario.PK_VU_DNI.ToString();

                                Limpiar();
                                _log.CustomWriteOnLog("Registrar Usuario", "Agregado");

                                _log.CustomWriteOnLog("Registrar Participante", "terminado");

                                objdtoUsuario.IU_CodigoActivacion = GenerarCodigoToken();
                                //Activaciòn
                                string ActivationUrl = Server.HtmlEncode("http://localhost:54460/PAG_WEB/W_ActivarCuenta.aspx?UserID=" + objdtoUsuario.PK_VU_DNI + "&EmailId=" + objdtoUsuario.VU_Correo + "&CodigoActivacion=" + objdtoUsuario.IU_CodigoActivacion);
                                string Asunto = "TusuyPeru -- Mensaje de activación";

                                StringBuilder sb = new StringBuilder();
                                sb.AppendLine("Hola : " + objdtoUsuario.VU_Nombre + " " + objdtoUsuario.VU_APaterno + "\n");
                                sb.AppendLine("Gracias por mostrar interes y registrarte en La Academia de Marinera Tusuy Perú" + "\n");
                                sb.AppendLine("Por favor haga <a href='" + ActivationUrl + "'>Click aquí para activar</a> tu cuenta y disfrutar de nuestros servicios." + "\n");
                                sb.AppendLine("Saludos Cordiales.");

                                string CuerpoMensaje = sb.ToString();
                                objctrEmail.EnviarEmail(objdtoUsuario.VU_Correo, Asunto, sb.ToString());

                                objCtrUsuario.registrarUsuario(objdtoUsuario);
                                _log.CustomWriteOnLog("Registrar Usuario", "RegistrarParticipante : Usuario Registrado con éxito");
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSuccessMessage2()", true);
                                _log.CustomWriteOnLog("Registrar Usuario", "RegistrarParticipante : Correo Enviado");


                            }
                            else
                            {
                                string m = "Año fuera de rango";
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "notify('top','center','danger','ERROR! ','" + m + "')", true);
                            }

                        }
                        else
                        {
                            string m = "Usuario ya registrado en la academia";
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "notify('top','center','danger','ERROR! ','" + m + "')", true);
                        }
                    }
                    else
                    {
                        string m = "Usuario ya registrado como participante";
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "notify('top','center','danger','ERROR! ','" + m + "')", true);
                    }
                }
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("Registrar Usuario", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public void Limpiar()
        {
            TextBoxDni.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            ddlGenero.Text = "---Seleccione----";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox10.Text = ""; //fecha nacimiento

        }
        protected void btnRegreso_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PAG_WEB/index.aspx");
        }
        protected int GenerarCodigoToken()
        {
            int min = 100000;
            int max = 1000000;
            Random rnd = new Random();
            int value = rnd.Next(min, max);

            return value;
        }
    }
}