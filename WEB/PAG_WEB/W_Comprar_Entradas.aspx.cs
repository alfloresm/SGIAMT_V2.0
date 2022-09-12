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

namespace WEB.PAG_WEB
{
    public partial class W_Comprar_Entradas : System.Web.UI.Page
    {
        CtrEntrada objctrentrada = new CtrEntrada();
        DtoEspectador objdtoespectador = new DtoEspectador();
        CtrConcurso objCtrConcurso = new CtrConcurso();
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
            //ddlConcurso.DataSource = ds;
            //ddlConcurso.DataTextField = "VC_NombreCon";
            //ddlConcurso.DataValueField = "PK_IC_IdConcurso";
            //ddlConcurso.DataBind();
            //ddlConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnInfoConcurso_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegreso_Click(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {

        }
    }
}