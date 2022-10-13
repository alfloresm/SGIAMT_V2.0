using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using CTR;
using DAO;

namespace WEB.PAG_WEB
{
    public partial class W_Comprar_Entradas : System.Web.UI.Page
    {
        CtrEntrada objctrentrada = new CtrEntrada();
        DtoEspectador objdtoespectador = new DtoEspectador();
        CtrConcurso objCtrConcurso = new CtrConcurso();
        DtoConcurso objdtoconcurso = new DtoConcurso();
        CtrEmail objctremail = new CtrEmail();

        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarConcursos();

            }
        }
        public void LlenarConcursos()
        {
            DataSet ds = new DataSet();
            ds = objctrentrada.DesplegableConcursoNoRealizado();
            ddlConcurso.DataSource = ds;
            ddlConcurso.DataTextField = "VC_NombreCon";
            ddlConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlConcurso.DataBind();
            ddlConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        //mostrar info del concurso
        protected void btnVerInfo_Click(object sender, EventArgs e)
        {
            try
            {
                string id = ddlConcurso.SelectedValue;
                objdtoconcurso.PK_IC_IdConcurso = int.Parse(id);
                objCtrConcurso.ObtenerDatosConcurso(objdtoconcurso);
                int cap1 = objctrentrada.disponibilidadEntradas("fecha1", Convert.ToInt32(ddlConcurso.SelectedValue));
                int cap2 = objctrentrada.disponibilidadEntradas("fecha2", Convert.ToInt32(ddlConcurso.SelectedValue));
                if (objCtrConcurso.ExistePrecioEntrada(objdtoconcurso.PK_IC_IdConcurso))
                {
                    Nombre.InnerText = objdtoconcurso.VC_NombreCon;
                    Lugar.InnerText = objdtoconcurso.VC_LugarCon;
                    Fecha1.InnerText = "1° Fecha: " + objdtoconcurso.DTC_FechaI;
                    CantEntrada1.InnerText = "Disponibles " + cap1 + " Entradas";
                    Fecha2.InnerText = "2° Fecha: " + objdtoconcurso.DTC_FechaF;
                    CantEntrada2.InnerText = "Disponibles " + cap2 + " Entradas";
                    Precio.InnerText = "El precio de la entrada es S/. " + objdtoconcurso.precio_entrada;
                    HFCosto.Value = objdtoconcurso.precio_entrada.ToString();
                    UpinfoConcurso.Update();
                }
                else
                {
                    string m = "Aun no se ha establecido precio de venta de la entrada";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "notify('top','center','danger','ERROR! ','" + m + "')", true);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Comprar entradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }

        }

        public void EnviarCorreoCompraEntrada(int cod, DtoEspectador obj, string concurso)
        {
            try
            {
                DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();

                //Obteniendo datos para enviar correo

                string asunto = "TusuyPeru -- Compra de Entrada";
                double monto = Convert.ToDouble(txtCantEntradas.Text) * Convert.ToDouble(HFCosto.Value);
                string archivoUrl = Server.HtmlEncode("http://localhost:54460/PAG_WEB/W_Mis_Entradas.aspx");
                string urlLogin = Server.HtmlEncode("http://localhost:54460/PAG_WEB/W_Iniciar_Sesion.aspx");
                string body = "<body>" +
                                  "<h2>Hola " + objdtoespectador.VES_NombreCompleto + " " + "</h2>" +
                                  "<h4>Ha separado entradas para el concurso " + concurso + "</h4>" +
                                  "<br></br><h4>Su informacion es la siguiente:</h4>" +
                                  "<br></br><span>cantidad de entradas separadas: " + objdtoespectador.IES_NumEntrada + "</span>" +
                                  "<br></br><span>Monto total: S/." + monto + "</span>" +
                                  "<br></br><span>Tendra que hacer el depósito al número de cuenta BCP 194-46576879-0-08</span>" +
                                  "<br></br><span>CCI: 002-1944456456879008</span>" +
                                  "<br></br><span>YAPE: 999999999</span>" +
                                  "<br></br><span>Luego del depósito haga <a href='" + archivoUrl + "'>Click aquí</a> para poder subir el voucher</span>" +
                                  "<br></br>" +
                                  "<br></br><span>Recuerde que solo ha separado las entradas una ves subido el voucher nuestro staff validará el pago</span>" +
                                  "<br></br><span>Puede verificar el estrado de sus entradas en su perfil</span>" +
                                  "<br></br>" +
                                  "<br></br><span>sí es la primera vez en el sitio su usuario es su número de DNI y su contraseña es TusuyPeruEspectador</span>" +
                                  "<br></br><span>puede iniciar sesión en nuestro sítio haciendo <a href='" + urlLogin + "'>Click aquí </a></span>" +
                                  "<br></br>" +
                                  "<br></br><span>Saludos cordiales.<span>" +
                                  "<br></br><span>TusuyPeru.<span>" +
                                  "</body>";

                objctremail.EnviarEmail(objdtoespectador.VES_Email, asunto, body);
                _log.CustomWriteOnLog("Comprar Entradas", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Comprar entradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }

        }

        protected void btnRegistrar_Click1(object sender, EventArgs e)
        {
            try
            {
                //registrar
                if (objctrentrada.disponibilidadEntradas(ddlFecha.SelectedValue, Convert.ToInt32(ddlConcurso.SelectedValue)) >= Convert.ToInt32(txtCantEntradas.Text))
                {
                    objdtoespectador.VES_Dni = txtDni.Text;
                    objdtoespectador.VES_NombreCompleto = txtNombreCompleto.Text;
                    objdtoespectador.VES_Email = txtEmail.Text;
                    objdtoespectador.IES_NumEntrada = Convert.ToInt32(txtCantEntradas.Text);
                    objdtoespectador.VES_TipoFecha = ddlFecha.SelectedValue;
                    objdtoespectador.FK_IC_IdConcurso = Convert.ToInt32(ddlConcurso.SelectedValue);

                    int cod = objctrentrada.RegistrarCompraEntrada(objdtoespectador);
                    _log.CustomWriteOnLog("comprar entradas", objdtoespectador.PK_VES_cod.ToString());

                    //enviar correo
                    EnviarCorreoCompraEntrada(cod, objdtoespectador, ddlConcurso.SelectedItem.ToString());
                    _log.CustomWriteOnLog("Comprar entradas", "Se envió correo");
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSuccessMessageEntrada()", true);
                }
                else
                {
                    string m = "No hay disponibilidad de entradas";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "notify('top','center','danger','ERROR! ','" + m + "')", true);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Comprar entradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnRegresar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

    }
}