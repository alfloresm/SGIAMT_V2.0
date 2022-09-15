using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
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
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarConcursos();
                LlenarFechasConcurso();
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
            //int id = Convert.ToInt32(hfId.Value); /////
            int cod = int.Parse(ddlConcurso.SelectedValue); ////
            DataSet ds = new DataSet();
            ds = objctrentrada.DesplegableFechasConcurso(cod); //codigo de concurso seleccionado
            ddlFechaConcurso.DataSource = ds;
            ddlFechaConcurso.DataTextField = "DTC_FechaInicio";
            ddlFechaConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlFechaConcurso.DataBind();
            ddlFechaConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}