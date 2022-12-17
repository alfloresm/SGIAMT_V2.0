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
    public partial class W_Asignar_Marinera : System.Web.UI.Page
    {
        CtrMarinera objctrmarinera = new CtrMarinera();
        DtoMarinera objdtomarinera = new DtoMarinera();
        CtrTanda objctrtanda = new CtrTanda();
        DtoTanda objdtotanda = new DtoTanda();
        CtrConcurso objctrConcurso = new CtrConcurso();

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
                        GVTandaMarinera.DataSource = objctrtanda.Listar_Tanda_NC_EM();
                        GVTandaMarinera.DataBind();
                        GVTandaMarinera.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("AsignarMarinera", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
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
            return codMar == "-1";
        }
        protected Boolean ValidacionVerMarinera(string codMar)
        {
            return codMar != "-1";
        }

        protected void GVTandaMarinera_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Elegir")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVTandaMarinera.DataKeys[index].Values;
                    int idT = Convert.ToInt32(colsNoVisible[0].ToString());
                    string mod = colsNoVisible[1].ToString();
                    int dif = 0;
                    if (mod == "Seriado")
                    {
                        dif = 1;
                    }
                    else if (mod == "Novel Novel")
                    {
                        dif = 2;
                    }
                    else if (mod == "Novel Abierto" || mod == "Nacional")
                    {
                        dif = 3;
                    }

                    objctrmarinera.devolverMarineraAleatoria(dif, idT);
                    h2.InnerText = objctrmarinera.devolverCodMar(idT);
                    UpdatePanel2.Update();
                    GVTandaMarinera.DataSource = objctrtanda.Listar_Tanda_NC_EM();
                    GVTandaMarinera.DataBind();
                    GVTandaMarinera.HeaderRow.TableSection = TableRowSection.TableHeader;
                    UpdatePanel.Update();
                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>$('#marineraModal').modal('show');setTimeout(function(){location.reload();}, 2000);</script>", false);
                }
                else if (e.CommandName == "Ver")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVTandaMarinera.DataKeys[index].Values;
                    int idT = Convert.ToInt32(colsNoVisible[0].ToString());
                    h2.InnerText = objctrmarinera.devolverCodMar(idT);
                    UpdatePanel2.Update();
                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "<script type='text/javascript'>$('#marineraModal').modal('show');setTimeout(function(){location.reload();}, 2000);</script>", false);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("AsignarMarinera", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
    }
}