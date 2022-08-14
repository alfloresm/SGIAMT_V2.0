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
                    txtCant.Text = objdtoconcurso.IC_Capacidad.ToString()+ " Personas";
                    int est = Convert.ToInt32(objdtoconcurso.VC_Estado);
                    if (est == 1)
                    {
                        txtEstado.Text = "No Realizado";
                    }
                    else
                    {
                        txtEstado.Text = "Realizado";
                    }
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
        }

        protected void GVConcurso_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
            GVConcurso.DataBind();
        }
        protected Boolean ValidacionEstado(string estado)
        {
            return estado == "No Realizado";
        }

        protected void GVVerPrecios_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GVVerPrecios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
        }
    }
}