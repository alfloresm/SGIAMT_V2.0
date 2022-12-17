using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB.PAG_WEB
{
    public partial class W_Inscribir_Participante : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        CtrInscripcion objCtrInscripcion = new CtrInscripcion();
        CtrUsuario objCtrUsuario = new CtrUsuario();
        CtrEmail objctrEmail = new CtrEmail();
        DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();
        DtoUsuario objDtoUsuario = new DtoUsuario();
        CtrUsuarioxModalidad objCtrUXM = new CtrUsuarioxModalidad();
        DtoInscripcion objDtoInscripcion = new DtoInscripcion();
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {
                        LlenarConcursos();
                    }
                    else
                    {
                        Response.Redirect("W_Iniciar_Sesion.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
        }
        public void LlenarConcursos()
        {
            DataSet ds = new DataSet();
            ds = objCtrConcurso.DesplegableConcurso();
            ddlConcurso.DataSource = ds;
            ddlConcurso.DataTextField = "VC_NombreCon";
            ddlConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlConcurso.DataBind();
            ddlConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
        protected void btnIr_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlConcurso.SelectedValue);
            GVInscribir.DataSource = objCtrInscripcion.ListarModalidadPorConcurso(id);
            GVInscribir.DataBind();
            //GVInscribir.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GVInscribir_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Inscribir")
                {
                    PanelPareja.Visible = false;
                    string dni = Session["DNIUsuario"].ToString();
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVInscribir.DataKeys[index].Values;
                    int mod = Convert.ToInt32(colsNoVisible[0].ToString());
                    int Cat1 = Convert.ToInt32(Session["Categoria"].ToString());
                    if (Cat1 != -1)
                    {
                        if (!objCtrUsuario.existeUsuarioGanador(dni, mod))
                        {
                            lblCosto.Text = colsNoVisible[2].ToString();
                            if (mod > 1)
                            {
                                double costo = Convert.ToDouble(colsNoVisible[2].ToString()) * 2;
                                lblCosto.Text = costo.ToString();
                                PanelPareja.Visible = true;
                            }
                            hfModalidad.Value = mod.ToString();
                            upCosto.Update();
                            upPareja.Update();
                            UpSelecion.Update();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#inscripcionModal').modal('show');</script>", false);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>showErrorCategoriaInscripcion()</script>", false);
                    }
                    
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                objDtoUsuario.PK_VU_DNI = txtDni.Text;
                if (objCtrUsuario.existeUsuario(objDtoUsuario))
                {
                    if (objCtrUsuario.existeUsuarioAca(objDtoUsuario))
                    {
                        string gen = Session["Genero"].ToString();
                        if (objCtrUsuario.existeUsuarioGen(objDtoUsuario, gen))
                        {
                            _log.CustomWriteOnLog("Inscribir_Participante", "entra boton pareja");
                            DtoCategoria objcat = new DtoCategoria();
                            objCtrUsuario.obtenerParticipante(objDtoUsuario, objcat);
                            _log.CustomWriteOnLog("Inscribir_Participante", "*********************************");
                            _log.CustomWriteOnLog("Inscribir_Participante", "nombre" + objDtoUsuario.nombres.ToString());
                            _log.CustomWriteOnLog("Inscribir_Participante", "categoria" + objcat.VCA_NomCategoria.ToString());
                            _log.CustomWriteOnLog("Inscribir_Participante", "genero" + objDtoUsuario.VU_Sexo.ToString());
                            txtNombre2.Text = objDtoUsuario.nombres.ToString();
                            txtCategoria2.Text = objcat.VCA_NomCategoria;
                            txtCodCatN.Text = objcat.PK_ICA_CodCat.ToString();
                            updPanel2.Update();
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion3();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion2();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion1();", true);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnGuardar1_Click(object sender, EventArgs e)
        {
            try
            {
                DtoUsuarioxModalidad objDtoUxM = new DtoUsuarioxModalidad();
                objDtoUxM.FK_VU_Dni=Session["DNIUsuario"].ToString();
                objDtoUxM.FK_IC_IdConcurso = Convert.ToInt32(ddlConcurso.SelectedValue);
                int Cat1 = Convert.ToInt32(Session["Categoria"].ToString());
                
                if (Convert.ToInt32(hfModalidad.Value.ToString()) == 1)
                {
                    if (objCtrUXM.existeUXM_S(objDtoUxM) == false)
                    {
                        objDtoUxM.FK_IM_IdModalidad = Convert.ToInt32(hfModalidad.Value.ToString());
                        objCtrUXM.registrarUXM_S_V(objDtoUxM);
                        _log.CustomWriteOnLog("inscribir Participante presencial", "id UXM: " + objDtoUxM.PK_IUM_CodUM.ToString());
                        objDtoInscripcion.FK_IUM_CodUm = objDtoUxM.PK_IUM_CodUM;
                        _log.CustomWriteOnLog("inscribir Participante presencial", "Precio:" + lblCosto.Text);
                        objDtoInscripcion.DI_Monto = Convert.ToDouble(lblCosto.Text);
                        int ID = objCtrInscripcion.RegistrarInscripcionV(objDtoInscripcion);
                        //Subir voucher
                        Utils.AddScriptClientUpdatePanel(UpRegistrarVoucher, "uploadFileDocumentsInscripcion(" + ID + ");");
                        //enviar correo
                        EnviarCorreoSeriado(objDtoInscripcion.FK_IUM_CodUm);

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSuccessMessageSubirVoucher();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion4();", true);
                    }
                }
                else
                {
                    //no seriado
                    int Cat2 = Convert.ToInt32(txtCodCatN.Text);
                    if (Cat1 - Cat2 == 0)
                    {
                        objDtoUxM.FK_DNI_Pareja = txtDni.Text;
                        if (!objCtrUXM.existeUXM_N(objDtoUxM))
                        {
                            objDtoUxM.FK_IM_IdModalidad = Convert.ToInt32(hfModalidad.Value.ToString());
                            objCtrUXM.registrarUXM_N_V(objDtoUxM);
                            _log.CustomWriteOnLog("inscribir Participante presencial", "NOVEL id UXM: " + objDtoUxM.PK_IUM_CodUM.ToString());
                            objDtoInscripcion.FK_IUM_CodUm = objDtoUxM.PK_IUM_CodUM;
                            _log.CustomWriteOnLog("inscribir Participante presencial", "Precio:" + lblCosto.Text);
                            objDtoInscripcion.DI_Monto = Convert.ToDouble(lblCosto.Text);
                            int ID = objCtrInscripcion.RegistrarInscripcionV(objDtoInscripcion);

                            //subirVoucher
                            Utils.AddScriptClientUpdatePanel(UpRegistrarVoucher, "uploadFileDocumentsInscripcion(" + ID + ");");
                            //enviar correo
                            EnviarCorreos(objDtoInscripcion.FK_IUM_CodUm);

                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSuccessMessageSubirVoucher();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion4();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion5();", true);
                    }
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public void EnviarCorreoSeriado(int codP)
        {
            try
            {
                //Obteniendo datos para enviar correo
                objDatosEmail = objctrEmail.ObtenerDatosCorreo(codP);
                string asunto = "TusuyPeru -- Inscripción Concurso";
                string body = "<body>" +
                                  "<h2>Hola " + objDatosEmail.NombrePrincipal + " " + "</h2>" +
                                  "<h4 style='color: brown'>El pago de su inscripción para el concurso " + objDatosEmail.NombreConcurso + " esta siendo evaluado</h4>" +
                                  "<br></br><h4>Su informacion de la compra es la siguiente:</h4>" +
                                  "<br></br><span>Codigo de participante: " + codP + "</span>" +
                                  "<br></br><span>Monto total: S/." + objDatosEmail.Monto + "</span>" +
                                  "<br></br><span>Se le enviará a este correo si su inscripción ha sido rechazado o aprobado. </span>" +
                                  "<br></br><span>Saludos cordiales.<span>" +
                                  "<br></br><span>TusuyPeru.<span>" +
                                  "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                _log.CustomWriteOnLog("Inscribir_Participante", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }

        }
        public void EnviarCorreos(int codP)
        {
            try
            {
                //Obteniendo datos para enviar correo
                objDatosEmail = objctrEmail.ObtenerDatosCorreo(codP);
                string asunto = "TusuyPeru -- Inscripción Concurso";
                string body = "<body>" +
                                  "<h2>Hola " + objDatosEmail.NombrePrincipal + " y " + objDatosEmail.NombrePareja + "</h2>" +
                                  "<h4 style='color: brown'>El pago de su inscripción para el concurso " + objDatosEmail.NombreConcurso + " esta siendo evaluado</h4>" +
                                  "<br></br><h4>Su informacion de la compra es la siguiente:</h4>" +
                                  "<br></br><span>Codigo de participante: " + codP + "</span>" +
                                  "<br></br><span>Monto total: S/." + objDatosEmail.Monto + "</span>" +
                                  "<br></br><span>Se le enviará a este correo si su inscripción ha sido rechazado o aprobado. </span>" +
                                  "<br></br><span>Saludos cordiales.<span>" + 
                                  "<br></br><span>TusuyPeru.<span>" +
                                  "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                objctrEmail.EnviarEmail(objDatosEmail.CorreoPareja, asunto, body);
                _log.CustomWriteOnLog("Inscribir_Participante", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }

        }
    }
}