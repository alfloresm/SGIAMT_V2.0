using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;

namespace WEB.PAG_WEB
{
    public partial class W_ActivarCuenta : System.Web.UI.Page
    {
        //DaoEmail obj_daoEmail = new DaoEmail();
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
                TextoAyuda.InnerHtml = "Validando parámetros...";

                if ((!string.IsNullOrEmpty(Request.QueryString["UserID"])) & (!string.IsNullOrEmpty(Request.QueryString["EmailId"])) & (!string.IsNullOrEmpty(Request.QueryString["CodigoActivacion"])))
                {
                    string validarActivacionCuenta = obj_ctrEmail.ConfirmarActivacionCuenta(Request.QueryString["UserID"], Request.QueryString["EmailId"], int.Parse(Request.QueryString["CodigoActivacion"]), "Contar");

                    TextoAyuda.InnerHtml = "Esto no debería tomar mucho tiempo...";

                    if (validarActivacionCuenta == "0")
                    {
                        string ActualizarInformacion = obj_ctrEmail.ConfirmarActivacionCuenta(Request.QueryString["UserID"], Request.QueryString["EmailId"], int.Parse(Request.QueryString["CodigoActivacion"]), "Actualizar");
                        TextoAyuda.InnerHtml = "Completado...";
                        //preloader.Visible = false;
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "MensajeConfirmacion();", true);
                    }
                    else
                    {
                        TextoAyuda.InnerHtml = "Hubo un error...";
                        //preloader.Visible = false;

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "MensajeErrorConfirmacion();", true);
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "MensajeErrorConfirmacion()", true);

                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                return;
            }
        }
    }

    }