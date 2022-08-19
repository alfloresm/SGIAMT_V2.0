using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB.PAG_WEB
{
    public partial class W_RegistrarParticipante : System.Web.UI.Page
    {
        Log _log = new Log();

        CtrUsuario objCtrUsuario = new CtrUsuario();
        DtoUsuario objdtoUsuario = new DtoUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    _log.CustomWriteOnLog("Registrar Usuario ", "***Cargo****");
                }
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("Registrar Usuario", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                //objdtoUsuario.PK_VU_DNI = TextBoxDNI.Text; //FALTA AGREGAR EL TEXTBOX PARA EL DNI
                if (!objCtrUsuario.existeUsuarioAca(objdtoUsuario))
                {
                    if (!objCtrUsuario.existeUsuario(objdtoUsuario))
                    {
                        DateTime a = Convert.ToDateTime(TextBox10.Text); //TextBox10: fecha de nacimiento
                        if (a.Year < 2017)
                        {
                            _log.CustomWriteOnLog("Registrar Usuario", "entra a boton registrar");
                            objdtoUsuario.VU_Nombre = TextBox1.Text; //nombre
                            objdtoUsuario.VU_APaterno = TextBox2.Text; //apellido paterno
                            objdtoUsuario.VU_AMaterno = TextBox3.Text; //apellido materno
                            objdtoUsuario.VU_Sexo = TextBox4.Text; //sexo

                            objdtoUsuario.VU_Celular = TextBox5.Text; //celular
                            objdtoUsuario.VU_NAcademia = TextBox6.Text; //academia
                            objdtoUsuario.VU_Correo = TextBox7.Text; //correo electronico

                            objdtoUsuario.DTU_FechaNacimiento = Convert.ToDateTime(TextBox10.Text); //fecha de nacimiento
                            
                            //objdtoUsuario.VU_Contrasenia = txtContraseña.Text; //FALTA AGREGAR EL TEXTBOX PARA EL DNI

                            int anio = objdtoUsuario.DTU_FechaNacimiento.Year;
                            objdtoUsuario.FK_ICA_CodCat = objCtrUsuario.devolverCategoria(anio);
                            objCtrUsuario.registrarUsuario(objdtoUsuario);
                            _log.CustomWriteOnLog("Registrar Usuario", "DNI:" + objdtoUsuario.PK_VU_DNI.ToString());
                            string id = objdtoUsuario.PK_VU_DNI.ToString();
                            //VERIFICAR: Utils.AddScriptClientUpdatePanel(upBotonEnviar, "uploadFileDocuments(" + id + ");");
                            limpiar();
                            _log.CustomWriteOnLog("Registrar Usuario", "Agregado");
                            string m = "Usuario registrado correctamente";
                            //VERIFICAR: Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                            _log.CustomWriteOnLog("Registrar Participante", "terminado");
                            //Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showSuccessMessage2()");
                        }
                        else
                        {
                            string m = "Año fuera de rango";
                            //VERIFICAR: Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                        }

                    }
                    else
                    {
                        string m = "Usuario ya registrado en la academia";
                        //VERIFICAR: Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                    }
                }
                else
                {
                    string m = "Usuario ya registrado como participante";
                    //VERIFICAR: Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                }
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("Registrar Usuario", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public void limpiar()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox10.Text = ""; //fecha nacimiento

        }
    
}
}