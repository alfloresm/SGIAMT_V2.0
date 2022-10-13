using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using CTR;

namespace WEB
{
    public partial class W_Validar_Entradas : System.Web.UI.Page
    {
        CtrEntrada objctrentrada = new CtrEntrada();
        DtoEspectador objdtoespectador = new DtoEspectador();
        CtrConcurso objCtrConcurso = new CtrConcurso();
        DtoConcurso objdtoconcurso = new DtoConcurso();
        DtoUsuario objdtoUsuario = new DtoUsuario();
        CtrEmail objctrEmail = new CtrEmail();
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVEntrada.DataSource = objctrentrada.ListarEntradasbyConcurso();
                GVEntrada.DataBind();
                LlenarConcursos();
            }
        }

        //lista concursos No Realizado
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
        protected void GVEntrada_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (ddlConcurso.SelectedIndex == 0)
            {
                upLista.Update();
                GVEntrada.DataSource = objctrentrada.ListarEntradasbyConcurso();
                GVEntrada.PageIndex = e.NewPageIndex;
                GVEntrada.DataBind();
            }
            else
            {
                upLista.Update();
                GVEntrada.DataSource = objctrentrada.ListarEntradasbyConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
                GVEntrada.PageIndex = e.NewPageIndex;
                GVEntrada.DataBind();
            }
        }

        protected void GVEntrada_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Validar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVEntrada.DataKeys[index].Values;
                    hfCodEntrada.Value = colsNoVisible[0].ToString();
                    txtCantidad.Text = colsNoVisible[4].ToString();
                    txtMonto.Text = colsNoVisible[5].ToString();
                    hfNombre.Value= colsNoVisible[2].ToString();
                    hfEmail.Value = colsNoVisible[3].ToString();
                    upDatos.Update();
                    upHiddenfields.Update();
                    byte[] ByteArray;
                    ByteArray = (byte[])(colsNoVisible[1]);
                    string strbase64 = Convert.ToBase64String(ByteArray);
                    Image1.ImageUrl = "data:Image/png;base64," + strbase64;
                    Image1.Visible = true;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#ValidarModal').modal('show');</script>", false);
                }
                else if (e.CommandName == "EnviarCorreo")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVEntrada.DataKeys[index].Values;
                    hfCodEntrada.Value = colsNoVisible[0].ToString();
                    int cant = Convert.ToInt32(colsNoVisible[4].ToString());
                    double monto = Convert.ToDouble(colsNoVisible[5].ToString());
                    hfNombre.Value = colsNoVisible[2].ToString();
                    hfEmail.Value = colsNoVisible[3].ToString();
                    upDatos.Update();
                    upHiddenfields.Update();

                    EnviarCorreoAprobacionEntrada(hfNombre.Value, monto, ddlConcurso.SelectedItem.Value,cant, hfEmail.Value);

                    string message = "Se ha enviado correo de confirmación";
                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>showSA('" + message + "')</script>", false);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        protected Boolean ValidacionEstado(string estado)
        {
            return estado == "Por Validar";
        }
        protected Boolean ValidacionEstado2(string estado)
        {
            return estado == "Comprado";
        }

        protected void btnIr_Click(object sender, EventArgs e)
        {
            upLista.Update();
            GVEntrada.DataSource = objctrentrada.ListarEntradasbyConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
            GVEntrada.DataBind();
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
                string op = "Aceptar";
                string des = "";
                int id= Convert.ToInt32(hfCodEntrada.Value);
                objctrentrada.ValidarEntrada(id, op, des);
                EnviarCorreoAprobacionEntrada(hfNombre.Value, Convert.ToDouble(txtMonto.Text), ddlConcurso.SelectedItem.Value, Convert.ToInt32(txtCantidad.Text), hfEmail.Value);
                string message = "Se aprobó la compra de entradas";
                upLista.Update();
                GVEntrada.DataSource = objctrentrada.ListarEntradasbyConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
                GVEntrada.DataBind();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#ValidarModal').modal('hide');$('#AprobarModal').modal('hide');showSA('" + message + "');</script>", false);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#AprobarModal').modal('hide');</script>", false);
                
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSA('"+ message + "')", true);
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void RechazarButton1_Click(object sender, EventArgs e)
        {
            try
            {
                string ope = "Rechazar";
                string descripcion = txtDescripcion.Text;
                int id = Convert.ToInt32(hfCodEntrada.Value);
                objctrentrada.ValidarEntrada(id, ope, descripcion);
                EnviarCorreoRechazoEntrada(hfNombre.Value,Convert.ToDouble(txtMonto.Text),ddlConcurso.SelectedItem.Value,Convert.ToInt32(txtCantidad.Text),hfEmail.Value);
                string message = "Se rechazó la compra de entradas";
                upLista.Update();
                GVEntrada.DataSource = objctrentrada.ListarEntradasbyConcurso(Convert.ToInt32(ddlConcurso.SelectedValue));
                GVEntrada.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>$('#ValidarModal').modal('hide');$('#RechazarModal').modal('hide');showSA('" + message + "')</script>", false);
                
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public void EnviarCorreoRechazoEntrada(string nombre, double mon, string concurso,int numE,string email)
        {
            try
            {
                //Obteniendo datos para enviar correo

                string asunto = "TusuyPeru -- Rechazo de compra";
                double monto = mon;
                string body = "<body>" +
                                  "<h2>Hola " + nombre + " " + "</h2>" +
                                  "<h4 style='color: brown'>El pago de sus entradas para el concurso " + concurso + " ha sido rechazado</h4>" +
                                  "<br></br><h4>Su informacion de la compra rechazada es la siguiente:</h4>" +
                                  "<br></br><span>cantidad de entradas rechazadas: " + numE + "</span>" +
                                  "<br></br><span>Monto total: S/." + monto + "</span>" +
                                  "<br></br><span>Tendrá que comunicarse con la empresa</span>" +
                                  "<br></br><span>telefono: 999999999</span>" +
                                  "<br></br><span>o puede visitar nuestra oficina en Av. Gran Chimú N° 541, Lima, Perú</span>" +
                                  "<br></br>" +
                                  "<br></br><span>Saludos cordiales.<span>" +
                                  "<br></br><span>TusuyPeru.<span>" +
                                  "</body>";

                objctrEmail.EnviarEmail(email, asunto, body);
                _log.CustomWriteOnLog("ValidarEntradas", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }

        }
        public void EnviarCorreoAprobacionEntrada(string nombre, double mon, string concurso, int numE, string email)
        {
            try
            {
                //Obteniendo datos para enviar correo

                string asunto = "TusuyPeru -- Aprobación de compra";
                double monto = mon;
                string body = "<body>" +
                                  "<h2>Hola " + nombre + " " + "</h2>" +
                                  "<h4>El pago de sus entradas para el concurso " + concurso + " ha sido aprobado!!</h4>" +
                                  "<br></br><h4>Su informacion de la compra es la siguiente:</h4>" +
                                  "<br></br><span>cantidad de entradas: " + numE + "</span>" +
                                  "<br></br><span>Monto total: S/." + monto + "</span>" +
                                  "<br></br><span>No olvide guardar este correo para presentarlo el día del concurso</span>" +
                                  "<br></br><span>Lo esperamos 😄 !!</span>" +
                                  "<br></br>" +
                                  "<br></br><span>Saludos cordiales.<span>" +
                                  "<br></br><span>TusuyPeru.<span>" +
                                  "</body>";

                objctrEmail.EnviarEmail(email, asunto, body);
                _log.CustomWriteOnLog("ValidarEntradas", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("ValidarEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }

        }
    }
}