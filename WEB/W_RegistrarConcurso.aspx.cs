using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB
{
    public partial class W_RegistrarConcurso : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        DtoConcurso objDtoConcurso = new DtoConcurso();
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Params["Id"] != null)
                {

                    txtPagina.InnerText = "Actualizar Concurso";
                    btnRegistrar.Text = "Actualizar";
                    Panel1.Visible = true;
                    Panel2.Visible = true;
                    obtenerConcurso(Request.Params["Id"]);

                }
                else
                {
                    txtPagina.InnerText = "Registrar Concurso";
                    btnRegistrar.Text = "Registrar";
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                }
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/W_Gestionar_Concurso.aspx");
        }
        public void obtenerConcurso(string cod)
        {
            objDtoConcurso.PK_IC_IdConcurso = int.Parse(cod);
            //ojCtrConcurso.ObtenerConcurso(objDtoConcurso);

            txtCodigo.Text = objDtoConcurso.PK_IC_IdConcurso.ToString();
            txtNombre.Text = objDtoConcurso.VC_NombreCon.ToString();
            txtlugar.Text = objDtoConcurso.VC_LugarCon.ToString();
            txtFecha.Text = objDtoConcurso.DTC_FechaConcurso.ToString("yyyy-MM-dd");
            txtcantSeriado.Text = objDtoConcurso.DC_PrecioSeriado.ToString();
            txtcantNovel.Text = objDtoConcurso.DC_PrecioNovel.ToString();
            ddlEstado.Text = objDtoConcurso.VC_Estado;
        }
    }
}