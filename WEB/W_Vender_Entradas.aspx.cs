using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using DAO;
using CTR;
using DTO;

namespace WEB
{
    public partial class W_Vender_Entradas : System.Web.UI.Page
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
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {
                        LlenarConcursos();
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("Vender entradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
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
        public void LlenarFechasConcurso()
        {
            //int id = Convert.ToInt32(hfId.Value); //

            /*int cod = int.Parse(ddlConcurso.SelectedValue);
            DataSet ds = new DataSet();
            ds = objctrentrada.DesplegableFechasConcurso(cod); //codigo de concurso seleccionado
            ddlFechaConcurso.DataSource = ds;
            ddlFechaConcurso.DataTextField = "DTC_FechaInicio";
            ddlFechaConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlFechaConcurso.DataBind();
            ddlFechaConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
            */
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                objdtoespectador.VES_Dni = txtDni.Text;
                objdtoespectador.FK_IC_IdConcurso = Convert.ToInt32(ddlConcurso.SelectedValue);
                objdtoespectador.VES_NombreCompleto = txtNombreCompleto.Text;
                objdtoespectador.VES_Email = txtCorreo.Text;
                objdtoespectador.IES_NumEntrada = Convert.ToInt32(txtCantEntradas.Text);
                if (ddlFechaConcurso.SelectedValue == "1") objdtoespectador.VES_TipoFecha = "fecha1";
                else if (ddlFechaConcurso.SelectedValue == "2") objdtoespectador.VES_TipoFecha = "fecha2";
                //else {
                //    String Me = "Elija una fecha";
                //    Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + Me + "','Error')"); }
                objctrentrada.RegistrarVentaEntrada(objdtoespectador);
                _log.CustomWriteOnLog("Vender entradas", objdtoespectador.VES_Dni);
                string m = "Se Registró correctamente";

                Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                //enviar correo
                //EnviarCorreoCompraEntrada(int.Parse(ddlConcurso.SelectedValue));
                _log.CustomWriteOnLog("Vender entradas", "Se envió correo");
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Vender entradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }
    }
}