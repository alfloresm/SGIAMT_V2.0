using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;
using System.Data;

namespace WEB
{
    public partial class W_Validar_Inscripcion : System.Web.UI.Page
    {
        CtrInscripcion objctrInscripcion = new CtrInscripcion();
        DtoUsuarioxModalidad objdtoUxM = new DtoUsuarioxModalidad();
        CtrConcurso objCtrConcurso = new CtrConcurso();
        DtoConcurso objdtoconcurso = new DtoConcurso();
        DtoUsuario objdtoUsuario = new DtoUsuario();
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
                        GVInscripciones.DataSource = objctrInscripcion.ListarInscripcionesByConcurso();
                        GVInscripciones.DataBind();
                        GVInscripciones.HeaderRow.TableSection = TableRowSection.TableHeader;
                        LlenarConcursos();
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("ValidarInscripcion", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
        }

        protected void btnIr_Click(object sender, EventArgs e)
        {
            upLista.Update();
            GVInscripciones.DataSource = objctrInscripcion.ListarInscripcionesByConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
            GVInscripciones.DataBind();
            GVInscripciones.HeaderRow.TableSection = TableRowSection.TableHeader;
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>tableLoad()</script>", false);
        }
        protected Boolean ValidacionEstado(string estado)
        {
            return estado == "Por Aprobar";
        }
        protected Boolean ValidacionEstado2(string estado)
        {
            return estado == "Aprobado" || estado == "Rechazado";
        }
        protected Boolean ValidacionEstado3(string estado)
        {
            return estado == "Rechazado";
        }

        //lista concursos No Realizado
        public void LlenarConcursos()
        {
            DataSet ds = new DataSet();
            ds = objctrInscripcion.DesplegableConcursoNoRealizado();
            ddlConcurso.DataSource = ds;
            ddlConcurso.DataTextField = "VC_NombreCon";
            ddlConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlConcurso.DataBind();
            ddlConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
        public void llenarTabla()
        {
            if (ddlConcurso.SelectedIndex == 0)
            {
                upLista.Update();
                GVInscripciones.DataSource = objctrInscripcion.ListarInscripcionesByConcurso();
                GVInscripciones.DataBind();
                GVInscripciones.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            else
            {
                upLista.Update();
                GVInscripciones.DataSource = objctrInscripcion.ListarInscripcionesByConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
                GVInscripciones.DataBind();
                GVInscripciones.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void GVInscripciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Validar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVInscripciones.DataKeys[index].Values;
                    hfCod.Value = colsNoVisible[1].ToString();
                    txtModalidad.Text = colsNoVisible[2].ToString();
                    txtMonto.Text = colsNoVisible[5].ToString();
                    upDatos.Update();
                    upHiddenfields.Update();
                    byte[] ByteArray;
                    ByteArray = (byte[])(colsNoVisible[6]);
                    string strbase64 = Convert.ToBase64String(ByteArray);
                    Image1.ImageUrl = "data:Image/png;base64," + strbase64;
                    Image1.Visible = true;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#ValidarModal').modal('show');</script>", false);
                }
                else if (e.CommandName == "EnviarCorreo")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVInscripciones.DataKeys[index].Values;
                    hfCod.Value = colsNoVisible[1].ToString();
                    txtModalidad.Text = colsNoVisible[2].ToString();
                    double monto = Convert.ToDouble(colsNoVisible[5].ToString());
                    hfEstado.Value = colsNoVisible[4].ToString();
                    upDatos.Update();
                    upHiddenfields.Update();

                    //EnviarCorreoAprobacionEntrada(hfNombre.Value, monto, ddlConcurso.SelectedItem.Value, cant, hfEmail.Value);

                    string message = "Se ha enviado correo de confirmación";
                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>showSA('" + message + "')</script>", false);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarInscripcion", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#AprobarModal').modal('show');</script>", false);
        }

        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#RechazarModal').modal('show');</script>", false);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                int estado = 2;
                int id = Convert.ToInt32(hfCod.Value);
                objctrInscripcion.ValidarInscripcion(id, estado);
                EnviarCorreoAprobacionInscripcion(id);
                string message = "Se aprobó la inscripción";
                upLista.Update();
                GVInscripciones.DataSource = objctrInscripcion.ListarInscripcionesByConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
                GVInscripciones.DataBind();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#ValidarModal').modal('hide');$('#AprobarModal').modal('hide');showSA('" + message + "');tableLoad();</script>", false);
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarInscripcion", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void RechazarButton1_Click(object sender, EventArgs e)
        {
            try
            {
                int estado = 0;
                int id = Convert.ToInt32(hfCod.Value);
                objctrInscripcion.ValidarInscripcion(id, estado);
                EnviarCorreoRechazoInscripcion(id);
                string message = "Se rechazó la inscripción";
                upLista.Update();
                GVInscripciones.DataSource = objctrInscripcion.ListarInscripcionesByConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
                GVInscripciones.DataBind();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#ValidarModal').modal('hide');$('#AprobarModal').modal('hide');showSA('" + message + "');tableLoad();</script>", false);
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarInscripcion", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        public void EnviarCorreoAprobacionInscripcion(int cod)
        {
            DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();

            //Obteniendo datos para enviar correo
            objDatosEmail = objctrEmail.ObtenerDatosCorreo(cod);

            string asunto = "Tusuyperu - Aprobación de Inscripción";
            if (objDatosEmail.NombreModalidad == "Seriado")
            {
                string body = "<body>" +
                              "<h2>Hola " + objDatosEmail.NombrePrincipal + "</h2>" +
                              "<h4>Tu inscripcion al concurso " + objDatosEmail.NombreConcurso + ",que se realizara en " + objDatosEmail.Lugar + " ,el día " + objDatosEmail.FechaConcurso.ToShortDateString() + " ha sido aprobada correctamente el dia " + DateTime.Now + "</h4>" +
                              "<br></br><h4>Su informacion es la siguiente:</h4>" +
                              "<br></br><span>Monto de inscripcion: S/." + objDatosEmail.Monto + "</span>" +
                              "<br></br><span>Modalidad: " + objDatosEmail.NombreModalidad + "</span>" +
                              "<br></br><h3>recuerde que su código de participante es: " + objDatosEmail.CodigoParticipante + "</h3>" +
                              "<br></br><span> Saludos cordiales.<span>" +
                              "<br></br><span> TusuyPeru.<span>" +
                              "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                _log.CustomWriteOnLog("ValidarInscripcion", "Se envio correo seriado");
            }
            else
            {
                string body = "<body>" +
                                "<h2>Hola " + objDatosEmail.NombrePrincipal + " y " + objDatosEmail.NombrePareja + "</h2>" +
                                "<h4>Tu inscripcion al concurso " + objDatosEmail.NombreConcurso + ",que se realizara en " + objDatosEmail.Lugar + " ,el día " + objDatosEmail.FechaConcurso.ToShortDateString() + " ha sido aprobada correctamente el dia " + DateTime.Now + "</h4>" +
                                "<br></br><h4>Su informacion es la siguiente:</h4>" +
                                "<br></br><span>Monto de inscripcion: S/." + objDatosEmail.Monto + "</span>" +
                                "<br></br><span>Modalidad: " + objDatosEmail.NombreModalidad + "</span>" +
                                "<br></br><h3>recuerde que su código de participante es: " + objDatosEmail.CodigoParticipante + "</h3>" +
                                "<br></br><span> Saludos cordiales.<span>" +
                                "<br></br><span> TusuyPeru.<span>" +
                            "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                objctrEmail.EnviarEmail(objDatosEmail.CorreoPareja, asunto, body);
                _log.CustomWriteOnLog("ValidarInscripcion", "Se envio correo");
            }
        }

        public void EnviarCorreoRechazoInscripcion(int cod)
        {
            DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();

            //Obteniendo datos para enviar correo
            objDatosEmail = objctrEmail.ObtenerDatosCorreo(cod);

            string asunto = "Tusuyperu - Rechazo de Inscripción";
            if (objDatosEmail.NombreModalidad == "Seriado")
            {
                string body = "<body>" +
                              "<h2>Hola " + objDatosEmail.NombrePrincipal + "</h2>" +
                              "<h4>Tu inscripcion al concurso " + objDatosEmail.NombreConcurso + ",que se realizara en " + objDatosEmail.Lugar + " ,el día " + objDatosEmail.FechaConcurso.ToShortDateString() + " ha sido rechazada con fecha: " + DateTime.Now + "</h4>" +
                              "<br></br><h4>Su informacion es la siguiente:</h4>" +
                              "<br></br><span>Monto de inscripcion: S/." + objDatosEmail.Monto + "</span>" +
                              "<br></br><span>Modalidad: " + objDatosEmail.NombreModalidad + "</span>" +
                              "<br></br><h3>recuerde que su código de participante es: " + objDatosEmail.CodigoParticipante + "</h3>" +
                              "<br></br><span> Saludos cordiales.<span>" +
                              "<br></br><span> TusuyPeru.<span>" +
                              "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                _log.CustomWriteOnLog("ValidarInscripcion", "Se envio correo seriado");
            }
            else
            {
                string body = "<body>" +
                                "<h2>Hola " + objDatosEmail.NombrePrincipal + " y " + objDatosEmail.NombrePareja + "</h2>" +
                                "<h4>Tu inscripcion al concurso " + objDatosEmail.NombreConcurso + ",que se realizara en " + objDatosEmail.Lugar + " ,el día " + objDatosEmail.FechaConcurso.ToShortDateString() + " ha sido rechazada con fecha: " + DateTime.Now + "</h4>" +
                                "<br></br><h4>Su informacion es la siguiente:</h4>" +
                                "<br></br><span>Monto de inscripcion: S/." + objDatosEmail.Monto + "</span>" +
                                "<br></br><span>Modalidad: " + objDatosEmail.NombreModalidad + "</span>" +
                                "<br></br><span>Tendrá que comunicarse con la empresa</span>" +
                                "<br></br><span>telefono: 999999999</span>" +
                                "<br></br><span>o puede visitar nuestra oficina en Av. Gran Chimú N° 541, Lima, Perú</span>" +
                                "<br></br>" +
                                "<br></br><span> Saludos cordiales.<span>" +
                                "<br></br><span> TusuyPeru.<span>" +
                            "</body>";

                objctrEmail.EnviarEmail(objDatosEmail.CorreoPrincipal, asunto, body);
                objctrEmail.EnviarEmail(objDatosEmail.CorreoPareja, asunto, body);
                _log.CustomWriteOnLog("ValidarInscripcion", "Se envio correo");
            }
        }
    }
}