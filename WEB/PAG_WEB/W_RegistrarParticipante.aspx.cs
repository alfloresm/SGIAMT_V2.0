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
                    _log.CustomWriteOnLog("Registrar Usuario ", "****Cargo****");
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
                objdtoUsuario.PK_VU_DNI = TextBoxDni.Text;
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
                            objdtoUsuario.VU_Sexo = TextBox4.Text; //sexo

                            objdtoUsuario.VU_Celular = TextBox5.Text; //celular
                            objdtoUsuario.VU_NAcademia = TextBox6.Text; //academia
                            objdtoUsuario.VU_Correo = TextBox7.Text; //correo electronico

                            objdtoUsuario.DTU_FechaNacimiento = Convert.ToDateTime(TextBox10.Text); //fecha de nacimiento
                            _log.CustomWriteOnLog("Registrar Usuario", objdtoUsuario.DTU_FechaNacimiento.ToString());
                            objdtoUsuario.VU_Contrasenia = TextBox8.Text; //contraseña

                            int anio = objdtoUsuario.DTU_FechaNacimiento.Year;
                            objdtoUsuario.FK_ICA_CodCat = objCtrUsuario.devolverCategoria(anio);

                            Label2.Text = objCtrUsuario.devolverNombreCateg(anio); //la categoria
                            _log.CustomWriteOnLog("Nombre categoria", Label2.Text);

                            objCtrUsuario.registrarUsuario(objdtoUsuario);
                            _log.CustomWriteOnLog("Registrar Usuario", "DNI:" + objdtoUsuario.PK_VU_DNI.ToString());
                            string id = objdtoUsuario.PK_VU_DNI.ToString();
                            Utils.AddScriptClientUpdatePanel(upBotonEnviar, "uploadFileDocuments(" + id + ");");
                            limpiar();
                            _log.CustomWriteOnLog("Registrar Usuario", "Agregado");
                            string m = "Usuario registrado correctamente";
                            Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                            _log.CustomWriteOnLog("Registrar Participante", "terminado");
                            Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showSuccessMessage2()");

                        }
                        else
                        {
                            string m = "Año fuera de rango";
                            Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                        }

                    }
                    else
                    {
                        string m = "Usuario ya registrado en la academia";
                        Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                    }
                }
                else
                {
                    string m = "Usuario ya registrado como participante";
                    Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                }
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("Registrar Usuario", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public void limpiar()
        {
            TextBoxDni.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox10.Text = ""; //fecha nacimiento

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/index.aspx");
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    //para mostrar nombre de categoria
        //    int anio = objdtoUsuario.DTU_FechaNacimiento.Year;
        //    Label2.Text = objCtrUsuario.devolverNombreCateg(anio);
        //}
    }
}