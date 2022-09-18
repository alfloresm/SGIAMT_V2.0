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
            H1.InnerText = "Prueba";
            //string id = ddlConcurso.SelectedValue;
            //objdtoconcurso.PK_IC_IdConcurso = int.Parse(id);
            //objCtrConcurso.ObtenerConcurso(objdtoconcurso);
            //_log.CustomWriteOnLog("comprar entrada", "dato concurso: " + objdtoconcurso.VC_NombreCon.ToString());
            //_log.CustomWriteOnLog("comprar entrada", "dato concurso: " + objdtoconcurso.VC_LugarCon.ToString());
            //_log.CustomWriteOnLog("comprar entrada", "dato concurso: " + objdtoconcurso.DTC_FechaI.ToString("dd-MM-yyyy"));
            //_log.CustomWriteOnLog("comprar entrada", "dato concurso: " + objdtoconcurso.DTC_FechaF.ToString("dd-MM-yyyy"));
            //_log.CustomWriteOnLog("comprar entrada", "dato concurso: " + objdtoconcurso.IC_Capacidad.ToString());
            ////_log.CustomWriteOnLog("comprar entrada", "dato concurso: " + objdtoconcurso.IC_Capacidad.ToString()); //IC_Capacidad_2
        }

        public void EnviarCorreoCompraEntrada(int cod)
        {
            DtoDatosEmailInscripcion objDatosEmail = new DtoDatosEmailInscripcion();

            //Obteniendo datos para enviar correo
            //objDatosEmail = objctremail.ObtenerDatosCorreo(cod); --falta revisar

            string asunto = "TusuyPeru -- Compra de Entrada";

            string body = "<body>" +
                              "<h2>Hola " + objdtoespectador.VES_NombreCompleto + " " + "</h2>" +
                              "<h4>Compra de entradas para el concurso " + objDatosEmail.NombreConcurso + "</h4>" +
                              "<br></br><h4>Su informacion es la siguiente:</h4>" +
                              "<br></br><span>Fecha del concurso: " + objdtoespectador.VES_TipoFecha + "</span>" +
                              "<br></br><span>cantidad de entradas: " + objdtoespectador.IES_NumEntrada + "</span>" +
                              "<br></br><span>Saludos cordiales.<span>" +
                              "<br></br><span>TusuyPeru.<span>" +
                              "</body>";

            objctremail.EnviarEmail(objdtoespectador.VES_Email, asunto, body);
            _log.CustomWriteOnLog("Comprar Entradas", "Se envió correo");
        }

        protected void btnRegistrar_Click1(object sender, EventArgs e)
        {
            try
            {
                //registrar
                objdtoespectador.PK_VES_Dni = txtDni.Text;
                objdtoespectador.VES_NombreCompleto = txtNombreCompleto.Text;
                objdtoespectador.VES_Email = txtEmail.Text;
                objdtoespectador.IES_NumEntrada = Convert.ToInt32(txtCantEntradas.Text);
                if (ddlFecha.SelectedValue == "Fecha 1")
                    //objdtoespectador.VES_TipoFecha = ;
                if (ddlFecha.SelectedValue == "Fecha 2")
                    //objdtoespectador.VES_TipoFecha = ;

                //objctrentrada.RegistrarCompraEntrada(objdtoespectador.PK_VES_Dni); --revisar
                _log.CustomWriteOnLog("comprar entradas", objdtoespectador.PK_VES_Dni);
                string m = "Se Registró correctamente";
                //Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");

                //enviar correo
                EnviarCorreoCompraEntrada(int.Parse(ddlConcurso.SelectedValue));
                _log.CustomWriteOnLog("Comprar entradas", "Se envió correo");
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