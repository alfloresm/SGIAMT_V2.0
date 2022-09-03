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
    public partial class W_Asignar_Tanda : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HdIdConcurso.Value = Request.QueryString["ConcursoID"];
                LlenarModalidades();
            }
        }

        protected void btnIr_Click(object sender, EventArgs e)
        {

        }
        public void LlenarModalidades()
        {
            DataSet ds = new DataSet();
            ds = objCtrConcurso.DesplegableModalidades();
            ddlModalidad.DataSource = ds;
            ddlModalidad.DataTextField = "VM_NombreMod";
            ddlModalidad.DataValueField = "PK_IM_CodigoMod";
            ddlModalidad.DataBind();
            ddlModalidad.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
    }
}