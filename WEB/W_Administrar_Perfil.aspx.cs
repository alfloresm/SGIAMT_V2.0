using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB
{
    public partial class W_Administrar_Perfil : System.Web.UI.Page
    {
        CtrUsuario objCtrUsuario = new CtrUsuario();
        DtoUsuario objDtoUsuario = new DtoUsuario();
        CtrEmail objctrEmail = new CtrEmail();
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {
                        GVPerfil.DataSource = objCtrUsuario.listarPerfiles();
                        GVPerfil.DataBind();
                        GVPerfil.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("AdministrarPerfiles", ex.Message);
                }
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            updPanelModal.Update();
            UpDatos.Update();
            btnAceptar.Visible = true;
            myModalLabel.InnerText = "Registrar Usuario";
            HFOperacion.Value = "registrar";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#noticeModal').modal('show');</script>", false);
        }

        protected void GVPerfil_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Actualizar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVPerfil.DataKeys[index].Values;
                    txtCodigo.Text = colsNoVisible[0].ToString();
                    txtNombre.Text = colsNoVisible[1].ToString();
                    txtApeP.Text = colsNoVisible[2].ToString();
                    txtApeM.Text = colsNoVisible[3].ToString();
                    txtCorreo.Text = colsNoVisible[4].ToString();
                    txtCelular.Text = colsNoVisible[5].ToString();
                    ddlTipoUsuario.SelectedValue = colsNoVisible[7].ToString();
                    txtContrasenia.Text = colsNoVisible[8].ToString();

                    btnAceptar.Visible = true;
                    HFOperacion.Value = "Actualizar";
                    myModalLabel.InnerText = "Actualizar Usuario";
                    updPanelModal.Update();
                    UpDatos.Update();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#noticeModal').modal('show');</script>", false);
                }
                else if (e.CommandName == "Detalle")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVPerfil.DataKeys[index].Values;
                    txtCodigo.Text = colsNoVisible[0].ToString();
                    txtNombre.Text = colsNoVisible[1].ToString();
                    txtApeP.Text = colsNoVisible[2].ToString();
                    txtApeM.Text = colsNoVisible[3].ToString();
                    txtCorreo.Text = colsNoVisible[4].ToString();
                    txtCelular.Text = colsNoVisible[5].ToString();
                    ddlTipoUsuario.SelectedValue = colsNoVisible[7].ToString();
                    txtContrasenia.Text= colsNoVisible[8].ToString();

                    txtCodigo.Enabled = false;
                    txtNombre.Enabled = false;
                    txtApeP.Enabled = false;
                    txtApeM.Enabled = false;
                    txtCorreo.Enabled = false;
                    txtCelular.Enabled = false;
                    txtContrasenia.Enabled = false;
                    ddlTipoUsuario.Enabled = false;

                    updPanelModal.Update();
                    UpDatos.Update();
                    btnAceptar.Visible = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#noticeModal').modal('show');</script>", false);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("AdministrarPerfiles", ex.Message);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                objDtoUsuario.PK_VU_DNI = txtCodigo.Text;
                objDtoUsuario.VU_Nombre = txtNombre.Text;
                objDtoUsuario.VU_APaterno = txtApeP.Text;
                objDtoUsuario.VU_AMaterno = txtApeM.Text;
                objDtoUsuario.VU_Correo = txtCorreo.Text;
                objDtoUsuario.VU_Contrasenia = txtContrasenia.Text;
                objDtoUsuario.VU_Celular = txtCelular.Text;
                objDtoUsuario.FK_ITU_TipoUsuario=Convert.ToInt32(ddlTipoUsuario.SelectedValue);
                if (HFOperacion.Value == "registrar")
                {
                    objCtrUsuario.registrarPerfil(objDtoUsuario);
                    Enviarcorreo(objDtoUsuario, "registrar", ddlTipoUsuario.Text);
                    string m = "Se Registró correctamente";

                    Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                }
                else if (HFOperacion.Value == "Actualizar")
                {
                    objCtrUsuario.ActualizarPerfil(objDtoUsuario);
                    Enviarcorreo(objDtoUsuario, "Actualizar", ddlTipoUsuario.Text);
                    string m = "Se actualizó correctamente";

                    Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("AdministrarPerfiles", ex.Message);
            }
        }
        public void Enviarcorreo(DtoUsuario obj,string OP,string tipo)
        {
            try
            {
                string asunto = "";
                if (OP== "registrar")
                {
                    asunto = "TusuyPeru -- Creación de Usuario";
                }else if (OP == "Actualizar")
                {
                    asunto = "TusuyPeru -- Actualización de Usuario";
                }

                string body = "<body>" +
                                  "<h2>Hola " + obj.VU_Nombre + " " + "</h2>" +
                                  "<h4 style='color: brown'>Se ha registrado como usuario " + tipo + " correctamente,</h4>" +
                                  "<br></br><h4>Su informacion es la siguiente:</h4>" +
                                  "<br></br><span>Codigo: " + obj.PK_VU_DNI + "</span>" +
                                  "<br></br><span>Nombre: " + obj.VU_Nombre + "</span>" +
                                  "<br></br><span>Apellidos: " + obj.VU_APaterno + " " + obj.VU_AMaterno +"</span>" +
                                  "<br></br><span>Correo: " + obj.VU_Correo + "</span>" +
                                  "<br></br><span>Contraseña: " + obj.VU_Contrasenia + "</span>" +
                                  "<br></br><span>Celular: " + obj.VU_Celular + "</span>" +
                                  "<br></br><span>En caso de alguna equivocación tendrá que comunicarse con la empresa</span>" +
                                  "<br></br><span>telefono: 999999999</span>" +
                                  "<br></br><span>o puede visitar nuestra oficina en Av. Gran Chimú N° 541, Lima, Perú</span>" +
                                  "<br></br>" +
                                  "<br></br><span>Saludos cordiales.<span>" +
                                  "<br></br><span>TusuyPeru.<span>" +
                                  "</body>";

                objctrEmail.EnviarEmail(obj.VU_Correo, asunto, body);
                _log.CustomWriteOnLog("AdministrarPerfiles", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("AdministrarPerfiles", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
    }
}