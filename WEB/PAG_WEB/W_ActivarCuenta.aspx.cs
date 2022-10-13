using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DAO;

namespace WEB.PAG_WEB
{
    public partial class W_ActivarCuenta : System.Web.UI.Page
    {
        DaoEmail obj_daoEmail = new DaoEmail();
        CtrEmail obj_ctrEmail = new CtrEmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                activarMiCuenta();
            }
        }

        private void activarMiCuenta()
        {
            try
            {
                TextoAyuda.InnerHtml = "Validando...";

                if ((!string.IsNullOrEmpty(Request.QueryString["UserID"])) & (!string.IsNullOrEmpty(Request.QueryString["EmailId"])) & (!string.IsNullOrEmpty(Request.QueryString["CodigoActivacion"])))
                {
                    string validarActivacionCuenta = obj_ctrEmail.ConfirmarActivacionCuenta(Request.QueryString["UserID"], Request.QueryString["EmailId"], int.Parse(Request.QueryString["CodigoActivacion"]), "Contar");

                    if (validarActivacionCuenta == "0")
                    {
                        string ActualizarInformacion = obj_ctrEmail.ConfirmarActivacionCuenta(Request.QueryString["UserID"], Request.QueryString["EmailId"], int.Parse(Request.QueryString["CodigoActivacion"]), "Actualizar");
                        TextoAyuda.InnerHtml = "Completado...";
                        preloader.Visible = false;
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "Confirmacion();", true);
                    }
                    else
                    {

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "ErrorConfirmacion()", true);

                    }
                }
                else
                {
                    TextoAyuda.InnerHtml = "Hubo un error...";
                    preloader.Visible = false;

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "ErrorConfirmacion();", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                return;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PAG_WEB/W_Iniciar_Sesion.aspx");
        }
    }

}