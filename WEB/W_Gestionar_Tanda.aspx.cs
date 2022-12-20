using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;
using System.Data;

namespace WEB
{
    public partial class W_Gestionar_Tanda : System.Web.UI.Page
    {
        CtrTanda objctrtanda = new CtrTanda();
        DtoTanda DtoTanda = new DtoTanda();
        CtrConcurso objCtrConcurso = new CtrConcurso();
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
                        GVTanda.DataSource = objctrtanda.listar_Tanda_NC();
                        GVTanda.DataBind();
                        GVTanda.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("Gestionar_Tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
        }

        public void LlenarConcursos()
        {
            DataSet ds = new DataSet();
            ds = objCtrConcurso.DesplegableConcursoEnProceso();
            ddlConcurso.DataSource = ds;
            ddlConcurso.DataTextField = "VC_NombreCon";
            ddlConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlConcurso.DataBind();
            ddlConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/W_AsignarTanda.aspx?ConcursoID="+ddlConcurso.SelectedValue);
        }

    }
}