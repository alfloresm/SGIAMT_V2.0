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
                GVEntrada.DataSource = objCtrConcurso.ListaConcursos_();
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
            GVEntrada.DataSource = objCtrConcurso.ListaConcursos_();
            GVEntrada.DataBind();
        }

        protected void GVEntrada_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}