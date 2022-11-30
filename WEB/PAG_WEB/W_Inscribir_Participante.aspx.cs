using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB.PAG_WEB
{
    public partial class W_Inscribir_Participante : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        CtrInscripcion objCtrInscripcion = new CtrInscripcion();
        CtrUsuario objCtrUsuario = new CtrUsuario();
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {
                        LlenarConcursos();
                    }
                    else
                    {
                        Response.Redirect("W_Iniciar_Sesion.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
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
        protected void btnIr_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlConcurso.SelectedValue);
            GVInscribir.DataSource = objCtrInscripcion.ListarModalidadPorConcurso(id);
            GVInscribir.DataBind();
            //GVInscribir.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GVInscribir_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Inscribir")
                {
                    PanelPareja.Visible = false;
                    string dni = Session["DNIUsuario"].ToString();
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVInscribir.DataKeys[index].Values;
                    int mod = Convert.ToInt32(colsNoVisible[0].ToString());
                    if (!objCtrUsuario.existeUsuarioGanador(dni, mod))
                    {
                        lblCosto.Text = colsNoVisible[2].ToString();
                        if (mod > 1)
                        {
                            double costo = Convert.ToDouble(colsNoVisible[2].ToString()) * 2;
                            lblCosto.Text = costo.ToString();
                            PanelPareja.Visible = true;
                        }
                        upCosto.Update();
                        upPareja.Update();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#inscripcionModal').modal('show');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showErrorMessageInscripcion();", true);
                    }
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Inscribir_Participante", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar1_Click(object sender, EventArgs e)
        {

        }
    }
}