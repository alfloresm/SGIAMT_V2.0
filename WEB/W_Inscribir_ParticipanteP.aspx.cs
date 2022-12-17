using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;

namespace WEB
{
    public partial class W_Inscribir_ParticipanteP : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        CtrConcursoPrecio objCtrConcurso_Precio = new CtrConcursoPrecio();
        DtoUsuario objDtoUsuario = new DtoUsuario();
        CtrUsuarioxModalidad objCtrUXM = new CtrUsuarioxModalidad();
        CtrInscripcion objCtrInscripcion = new CtrInscripcion();
        DtoUsuarioxModalidad objDtoUXM = new DtoUsuarioxModalidad();
        DtoInscripcion objDtoInscripcion = new DtoInscripcion();
        CtrUsuario objCtrUsuario = new CtrUsuario();
        CtrEmail objctrEmail = new CtrEmail();
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
                        LlenarModalidades();
                        pnlParticipantePareja.Visible = false;
                        pnlParticipanteIndividual.Visible = false;
                        H1.InnerText = "S/.";
                        lblMensaje1.Text = "";
                        lblmensaje2.Text = "";
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("inscribir Participante presencial", "Error : " + ex.Message + "Stac" + ex.StackTrace);
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

        public void LlenarModalidades()
        {
            DataSet ds = new DataSet();
            ds = objCtrConcurso.DesplegableModalidades();
            ddlModalidades.DataSource = ds;
            ddlModalidades.DataTextField = "VM_NombreMod";
            ddlModalidades.DataValueField = "PK_IM_CodigoMod";
            ddlModalidades.DataBind();
            ddlModalidades.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        protected void btnIr2_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("inscribir Participante presencial", "ddlModalidad");
            DtoConcurso objCon = new DtoConcurso();
            objCon.PK_IC_IdConcurso = Convert.ToInt32(ddlConcurso.SelectedValue);
            _log.CustomWriteOnLog("inscribir Participante presencial", "codConcurso:" + objCon.PK_IC_IdConcurso);
            _log.CustomWriteOnLog("inscribir Participante presencial", "modalidad:" + ddlModalidades.SelectedItem.ToString());
            double precio = objCtrConcurso_Precio.ObtenerPrecio(objCon.PK_IC_IdConcurso, ddlModalidades.SelectedItem.ToString());
            _log.CustomWriteOnLog("inscribir Participante presencial", "Precio:" + precio.ToString());
            if (precio != 0.0)
            {
                hdPrecio.Value = precio.ToString();
                if (ddlModalidades.SelectedItem.ToString() == "Seriado")
                {
                    H1.InnerText = "S/." + precio.ToString();
                    hdPrecio.Value = precio.ToString();
                    pnlParticipanteIndividual.Visible = true;
                    UpParticipanteInd.Update();
                    Uppago.Update();
                    UpDatos.Update();
                }
                else
                {
                    H1.InnerText = "S/." + (precio * 2).ToString();
                    hdPrecio.Value = (precio * 2).ToString();
                    pnlParticipanteIndividual.Visible = true;
                    pnlParticipantePareja.Visible = true;
                    UpParticipanteInd.Update();
                    UpParticipantePareja.Update();
                    Uppago.Update();
                    UpDatos.Update();
                }
            }
            else
            {
                string m = "Monto no establecido para la categoría, Por favor escoja otra";
                Utils.AddScriptClientUpdatePanel(UpBtnIr2, "showMessage('top','center','" + m + "','danger')");
            }
            _log.CustomWriteOnLog("inscribir Participante presencial", "Precio:" + hdPrecio.Value);
        }

        protected void btnBuscar1_Click(object sender, EventArgs e)
        {
            try
            {
                objDtoUsuario.PK_VU_DNI = txtDni.Text;
                if (objCtrUsuario.existeUsuario(objDtoUsuario))
                {
                    if (objCtrUsuario.existeUsuarioAca(objDtoUsuario))
                    {
                        _log.CustomWriteOnLog("inscribir Participante presencial", "entra boton");
                        DtoCategoria objcat = new DtoCategoria();
                        objCtrUsuario.obtenerParticipante(objDtoUsuario, objcat);
                        _log.CustomWriteOnLog("inscribir Participante presencial", "nombre" + objDtoUsuario.nombres.ToString());
                        _log.CustomWriteOnLog("inscribir Participante presencial", "categoria" + objcat.VCA_NomCategoria.ToString());
                        _log.CustomWriteOnLog("inscribir Participante presencial", "genero" + objDtoUsuario.VU_Sexo.ToString());
                        txtNombre1.Text = objDtoUsuario.nombres.ToString();
                        txtCategoria.Text = objcat.VCA_NomCategoria.ToString();
                        txtGen.Text = objDtoUsuario.VU_Sexo.ToString();
                        txtcodCat.Text = objcat.PK_ICA_CodCat.ToString();
                        updPanel1.Update();
                    }
                    else
                    {
                        string m = "Usuario no permitido";
                        Utils.AddScriptClientUpdatePanel(upnBotonBuscar1, "showMessage('top','center','" + m + "','danger')");
                    }
                }
                else
                {
                    string m = "No existe DNI";
                    Utils.AddScriptClientUpdatePanel(upnBotonBuscar1, "showMessage('top','center','" + m + "','danger')");
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("inscribir Participante presencial", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnBuscar2_Click(object sender, EventArgs e)
        {
            try
            {
                objDtoUsuario.PK_VU_DNI = txtdni2.Text;
                if (objCtrUsuario.existeUsuario(objDtoUsuario))
                {
                    if (objCtrUsuario.existeUsuarioAca(objDtoUsuario))
                    {
                        string gen = txtGen.Text;
                        if (objCtrUsuario.existeUsuarioGen(objDtoUsuario, gen))
                        {
                            _log.CustomWriteOnLog("inscribir Participante presencial", "entra boton pareja");
                            DtoCategoria objcat = new DtoCategoria();
                            objCtrUsuario.obtenerParticipante(objDtoUsuario, objcat);
                            _log.CustomWriteOnLog("inscribir Participante presencial", "*********************************");
                            _log.CustomWriteOnLog("inscribir Participante presencial", "nombre" + objDtoUsuario.nombres.ToString());
                            _log.CustomWriteOnLog("inscribir Participante presencial", "categoria" + objcat.VCA_NomCategoria.ToString());
                            _log.CustomWriteOnLog("inscribir Participante presencial", "genero" + objDtoUsuario.VU_Sexo.ToString());
                            txtNombre2.Text = objDtoUsuario.nombres.ToString();
                            txtCategoria2.Text = objcat.VCA_NomCategoria;
                            txtCodCatN.Text = objcat.PK_ICA_CodCat.ToString();
                            updPanel2.Update();
                        }
                        else
                        {
                            string m = "Usuario no petenece a genero diferente";
                            Utils.AddScriptClientUpdatePanel(upnBotonBuscar2, "showMessage('top','center','" + m + "','danger')");
                        }
                    }
                    else
                    {
                        string m = "Usuario no permitido";
                        Utils.AddScriptClientUpdatePanel(upnBotonBuscar2, "showMessage('top','center','" + m + "','danger')");
                    }
                }
                else
                {
                    string m = "No existe DNI";
                    Utils.AddScriptClientUpdatePanel(upnBotonBuscar2, "showMessage('top','center','" + m + "','danger')");
                }
            }

            catch (Exception ex)
            {
                _log.CustomWriteOnLog("inscribir Participante presencial", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnInscribir_Click(object sender, EventArgs e)
        {
            try
            {
                objDtoUXM.FK_VU_Dni = txtDni.Text;
                objDtoUXM.FK_IC_IdConcurso = Convert.ToInt32(ddlConcurso.SelectedValue);
                int Cat1 = Convert.ToInt32(txtcodCat.Text);
                if (ddlModalidades.SelectedItem.ToString() == "Seriado")
                {
                    if (objCtrUXM.existeUXM_S(objDtoUXM) == false)
                    {
                        objDtoUXM.FK_IM_IdModalidad = Convert.ToInt32(ddlModalidades.SelectedValue.ToString());
                        objCtrUXM.registrarUXM_S(objDtoUXM);
                        _log.CustomWriteOnLog("inscribir Participante presencial", "id UXM: " + objDtoUXM.PK_IUM_CodUM.ToString());
                        objDtoInscripcion.FK_IUM_CodUm = objDtoUXM.PK_IUM_CodUM;
                        _log.CustomWriteOnLog("inscribir Participante presencial", "Precio:" + hdPrecio.Value.ToString());
                        objDtoInscripcion.DI_Monto = Convert.ToDouble(hdPrecio.Value.ToString());
                        objCtrInscripcion.RegistrarInscripcionP(objDtoInscripcion);
                        //enviar correo
                        EnviarCorreo(objDtoInscripcion.FK_IUM_CodUm);
                        string m = "Se registró la inscripción";
                        Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                    }
                    else
                    {
                        string m = "Existe Registro";
                        Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                    }
                }
                else
                {
                    int Cat2 = Convert.ToInt32(txtCodCatN.Text);
                    if (Cat1 - Cat2 == 0)
                    {
                        objDtoUXM.FK_DNI_Pareja = txtdni2.Text;
                        if (!objCtrUXM.existeUXM_N(objDtoUXM))
                        {
                            objDtoUXM.FK_IM_IdModalidad = Convert.ToInt32(ddlModalidades.SelectedValue.ToString());
                            objCtrUXM.registrarUXM_N(objDtoUXM);
                            _log.CustomWriteOnLog("inscribir Participante presencial", "NOVEL id UXM: " + objDtoUXM.PK_IUM_CodUM.ToString());
                            objDtoInscripcion.FK_IUM_CodUm = objDtoUXM.PK_IUM_CodUM;
                            _log.CustomWriteOnLog("inscribir Participante presencial", "Precio:" + hdPrecio.Value.ToString());
                            objDtoInscripcion.DI_Monto = Convert.ToDouble(hdPrecio.Value.ToString());
                            objCtrInscripcion.RegistrarInscripcionP(objDtoInscripcion);
                            //enviar correo
                            EnviarCorreo(objDtoInscripcion.FK_IUM_CodUm);
                            string m1 = "Se registró la inscripción";
                            Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m1 + "','success')");
                        }
                        else
                        {
                            string m = "Existe Registro";
                            Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                        }
                    }
                    else
                    {
                        string m = "No puede inscribirse con pareja mayor a su categoria";
                        Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                    }
                }

            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("inscribir Participante presencial", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        public void EnviarCorreo(int cod)
        {
            DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();

            //Obteniendo datos para enviar correo
            objDatosEmail = objctrEmail.ObtenerDatosCorreo(cod);

            string asunto = "Tusuyperu - Datos de Inscripción";
            if (objDatosEmail.NombreModalidad == "Seriado")
            {
                string body = "<body>" +
                              "<h2>Hola " + objDatosEmail.NombrePrincipal + "</h2>" +
                              "<h4>Tu inscripcion al concurso " + objDatosEmail.NombreConcurso + ",que se realizara en " + objDatosEmail.Lugar + " ,el día " + objDatosEmail.FechaConcurso.ToShortDateString() + " ha sido realizada correctamente el dia " + objDatosEmail.FechaInscripcion + "</h4>" +
                              "<br></br><h4>Su informacion es la siguiente:</h4>" +
                              "<br></br><span>Monto de inscripcion: S/." + objDatosEmail.Monto + "</span>" +
                              "<br></br><span>Modalidad: " + objDatosEmail.NombreModalidad + "</span>" +
                              "<br></br><h3>recuerde que su código de participante es: " + objDatosEmail.CodigoParticipante + "</h3>" +
                              "<br></br><span> Saludos cordiales.<span>" +
                              "<br></br><span> TusuyPeru.<span>" +
                              "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                _log.CustomWriteOnLog("inscribir Participante presencial", "Se envio correo seriado");
            }
            else
            {
                string body ="<body>" +
                                "<h2>Hola " + objDatosEmail.NombrePrincipal + " y " + objDatosEmail.NombrePareja + "</h2>" +
                                "<h4>Tu inscripcion al concurso " + objDatosEmail.NombreConcurso + ",que se realizara en " + objDatosEmail.Lugar + " ,el día " + objDatosEmail.FechaConcurso.ToShortDateString() + " ha sido realizada correctamente el dia " + objDatosEmail.FechaInscripcion + "</h4>" +
                                "<br></br><h4>Su informacion es la siguiente:</h4>" +
                                "<br></br><span>Monto de inscripcion: S/." + objDatosEmail.Monto + "</span>" +
                                "<br></br><span>Modalidad: " + objDatosEmail.NombreModalidad + "</span>" +
                                "<br></br><h3>recuerde que su código de participante es: " + objDatosEmail.CodigoParticipante + "</h3>" +
                                "<br></br><span> Saludos cordiales.<span>" +
                                "<br></br><span> TusuyPeru.<span>" +
                            "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                objctrEmail.EnviarEmail(objDatosEmail.CorreoPareja, asunto, body);
                _log.CustomWriteOnLog("inscribir Participante presencial", "Se envio correo");
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/W_Inscribir_ParticipanteP.aspx");
        }
    }
}