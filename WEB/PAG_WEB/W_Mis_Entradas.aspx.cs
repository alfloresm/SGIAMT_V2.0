using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;

namespace WEB.PAG_WEB
{
    public partial class W_Mis_Entradas : System.Web.UI.Page
    {
        CtrEntrada objCtrEntrada = new CtrEntrada();
        DtoEspectador objEntrada = new DtoEspectador();

        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _log.CustomWriteOnLog("MisEntradas", "Carga Página");
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {

                        string dni = Session["DNIUsuario"].ToString();
                        hfDNI.Value = dni;
                        GVEntradas.DataSource = objCtrEntrada.ListarMisEntradas(dni);
                        GVEntradas.DataBind();
                    }
                    else
                    {
                        Response.Redirect("W_Iniciar_Sesion.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("MisEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
        }
        protected Boolean ValidacionEstado(string estado)
        {
            return estado == "Reservado";
        }

        protected void GVEntradas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "subirVoucher")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    var colsNoVisible = GVEntradas.DataKeys[index].Values;
                    hfCodEntrada.Value = colsNoVisible[0].ToString();
                    txtCant.Text = colsNoVisible[2].ToString();
                    txtMonto.Text = colsNoVisible[3].ToString();
                    upDatos.Update();
                    upHiddenfields.Update();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#imagenmodal').modal('show');</script>", false);
                }
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("MisEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void btnGuardar1_Click(object sender, EventArgs e)
        {
            try
            {
                string id = hfCodEntrada.Value;
                Utils.AddScriptClientUpdatePanel(UpRegistrarVoucher, "uploadFileDocuments(" + id + ");");
                GVEntradas.DataSource = objCtrEntrada.ListarMisEntradas(hfDNI.Value);
                GVEntradas.DataBind();
                UPTable.Update();
                string jstable= "(function ($) {'use strict';$(document).ready(function() {$('#GVEntradas').prepend($('<thead></thead>').append($(this).find('tr:first'))).DataTable();});})(jQuery)";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "<script>$('#imagenmodal').modal('hide');"+jstable+";showSuccessMessageSubirVoucher()</script>", false);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "myScript", "$('#cph_body_GVEntradas').prepend($('<thead></thead>').append($('#cph_body_GVEntradas').find('tr:first'))).DataTable(); ", true);
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "showSuccessMessageSubirVoucher()", true);
                
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("MisEntradas", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

    }
}
