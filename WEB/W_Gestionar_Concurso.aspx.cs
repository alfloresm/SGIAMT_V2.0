using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;

namespace WEB
{
    public partial class W_Gestionar_Concurso : System.Web.UI.Page
    {
        CtrConcurso objctrConcurso = new CtrConcurso();
        DtoConcurso objdtoconcurso = new DtoConcurso();
        CtrConcursoPrecio objCtrConcursoPrecio = new CtrConcursoPrecio();
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
                GVConcurso.DataBind();
                GVConcurso.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("W_RegistrarConcurso.aspx");
        }

        protected void GVConcurso_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detalle")
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVConcurso.DataKeys[index].Values;
                    string id = colsNoVisible[0].ToString();
                    objdtoconcurso.PK_IC_IdConcurso = int.Parse(id);
                    objctrConcurso.ObtenerConcurso(objdtoconcurso);

                    _log.CustomWriteOnLog("gestionar concurso", "dato concurso: " + objdtoconcurso.VC_NombreCon.ToString());
                    _log.CustomWriteOnLog("gestionar concurso", "dato concurso: " + objdtoconcurso.VC_LugarCon.ToString());
                    _log.CustomWriteOnLog("gestionar concurso", "dato concurso: " + objdtoconcurso.DTC_FechaI.ToString("dd-MM-yyyy"));
                    _log.CustomWriteOnLog("gestionar concurso", "dato concurso: " + objdtoconcurso.DTC_FechaF.ToString("dd-MM-yyyy"));

                    myModalLabel.InnerText = objdtoconcurso.VC_NombreCon.ToString();
                    txtlugar.Text = objdtoconcurso.VC_LugarCon.ToString();
                    txtFechaI.Text = objdtoconcurso.DTC_FechaI.ToString("dd-MM-yyyy");
                    txtFechaF.Text = objdtoconcurso.DTC_FechaF.ToString("dd-MM-yyyy");
                    txtCant.Text = objdtoconcurso.IC_Capacidad1.ToString() + " Personas";
                    txtEstado.Text = objdtoconcurso.VC_Estado.ToString();

                    //Tabla Precios
                    GVVerPrecios.DataSource = objCtrConcursoPrecio.ListaPreciosByConcursos(objdtoconcurso.PK_IC_IdConcurso);
                    GVVerPrecios.DataBind();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#noticeModal').modal('show');</script>", false);
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("gestionar concurso", ex.Message);
                }
            }
            else if (e.CommandName == "Actualizar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                var colsNoVisible = GVConcurso.DataKeys[index].Values;
                string id = colsNoVisible[0].ToString();
                Response.Redirect("~/W_RegistrarConcurso.aspx?ID=" + id);
            }
            else if (e.CommandName == "CambiarEstado")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                var colsNoVisible = GVConcurso.DataKeys[index].Values;
                string estado = colsNoVisible[4].ToString();
                hfEstado.Value = estado;
                string id = colsNoVisible[0].ToString();
                hfId.Value = id;
                upHiddenfields.Update();
                if (estado == "No Realizado")
                {
                    H1.InnerText = "Empezar Concurso";
                    h2.InnerText = "¿Está seguro de empezar el concurso?";
                }
                else if (estado == "En Proceso")
                {
                    H1.InnerText = "Finalizar Concurso";
                    h2.InnerText = "¿Está seguro de finalizar el concurso?";
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#EstadoModal').modal('show');</script>", false);

            }
        }

        //protected void GVConcurso_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    upLista.Update();
        //    GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
        //    GVConcurso.PageIndex = e.NewPageIndex;            
        //    GVConcurso.DataBind();
        //}
        protected Boolean ValidacionEstado(string estado)
        {
            return estado == "No Realizado";
        }
        protected Boolean ValidacionEstado2(string estado)
        {
            return estado != "Finalizado";
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (hfEstado.Value == "No Realizado")
            {
                string operacion = "proceso";
                int id = Convert.ToInt32(hfId.Value);
                objctrConcurso.ActualizarConcursoEstado(id, operacion);
                GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
                GVConcurso.DataBind();
                GVConcurso.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#EstadoModal').modal('hide');</script>", false);
            }
            else if (hfEstado.Value == "En Proceso")
            {
                string operacion = "finalizado";
                int id = Convert.ToInt32(hfId.Value);
                objctrConcurso.ActualizarConcursoEstado(id, operacion);
                GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
                GVConcurso.DataBind();
                GVConcurso.HeaderRow.TableSection = TableRowSection.TableHeader;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#EstadoModal').modal('hide');</script>", false);
            }
        }
    }
}