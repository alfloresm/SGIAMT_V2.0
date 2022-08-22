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
        DtoUsuario objDtoUsuario = new DtoUsuario();
        CtrUsuarioxModalidad objCtrUXM = new CtrUsuarioxModalidad();
        CtrInscripcion objCtrInscripcion = new CtrInscripcion();
        DtoUsuarioxModalidad objDtoUXM = new DtoUsuarioxModalidad();
        DtoInscripcion objDtoInscripcion = new DtoInscripcion();
        CtrUsuario objCtrUsuario = new CtrUsuario();
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarConcursos();
                LlenarModalidades();
                pnlParticipantePareja.Visible = false;
                H1.InnerText = "S/.";
                lblMensaje1.Text = "";
                lblmensaje2.Text = "";
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

        protected void btnIr_Click(object sender, EventArgs e)
        {

        }

        protected void btnIr2_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuscar1_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuscar2_Click(object sender, EventArgs e)
        {

        }

        protected void btnInscribir_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {

        }
    }
}