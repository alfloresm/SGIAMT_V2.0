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
    public partial class W_Elegir_Marinera : System.Web.UI.Page
    {
        CtrMarinera objctrmarinera = new CtrMarinera();
        DtoMarinera objdtomarinera = new DtoMarinera();
        CtrTanda objctrtanda = new CtrTanda();
        DtoTanda objdtotanda = new DtoTanda();
        CtrConcurso objctrConcurso = new CtrConcurso();

        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarConcursos();
            GVTandaMarinera.DataSource = objctrtanda.Listar_Tanda_NC_EM();
            GVTandaMarinera.DataBind();
            GVTandaMarinera.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        public void LlenarConcursos()
        {
            DataSet ds = new DataSet();
            ds = objctrConcurso.DesplegableConcursoEnProceso();
            ddlConcurso.DataSource = ds;
            ddlConcurso.DataTextField = "VC_NombreCon";
            ddlConcurso.DataValueField = "PK_IC_IdConcurso";
            ddlConcurso.DataBind();
            ddlConcurso.Items.Insert(0, new ListItem("Seleccione", "0"));
        }

        protected void btnIr_Click(object sender, EventArgs e)
        {
            GVTandaMarinera.DataSource = objctrtanda.Listar_Tanda_NC_EM_By_Concurso(Convert.ToInt32(ddlConcurso.SelectedValue));
            GVTandaMarinera.DataBind();
            GVTandaMarinera.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        
        protected Boolean ValidacionElegirMarinera(string codMar)
        {
            return codMar=="-1";
        }
        protected Boolean ValidacionVerMarinera(string codMar)
        {
            return codMar!="-1";
        }

        protected void GVTandaMarinera_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Elegir")
                {
                    
                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>$('#marineraModal').modal('show');</script>", false);
                }
                else if (e.CommandName == "Ver")
                {

                }
            }
            catch (Exception ex )
            {
                _log.CustomWriteOnLog("ElegirMarinera", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void ddlConcurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField1.Value = ddlConcurso.SelectedValue;
        }
    }
}