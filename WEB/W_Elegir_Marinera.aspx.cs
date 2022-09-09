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
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegreso_Click(object sender, EventArgs e)
        {
            //Response.Redirect("W_Asignar_Tanda.aspx");
            ddlDificultad.Text = "---Seleccione----";
        }

        protected void btnElegir_Click1(object sender, EventArgs e)
        {
            try
            {
                _log.CustomWriteOnLog("elegir marinera", "entro a elegir marinera");

                string marinera = objctrmarinera.devolverMarineraAleatoria(ddlDificultad.SelectedIndex);
                _log.CustomWriteOnLog("elegir marinera", "la dificultad es: " + ddlDificultad.SelectedValue.ToString());

                _log.CustomWriteOnLog("elegir marinera", "la marinera aleatoria es: " + marinera);

                string m = "Se muestra la marinera a bailar con éxito";
                Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + "La marinera a bailar es: " + marinera + "','success')");

                //txtMarinera.Text = marinera.ToString();
            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("elegir marinera", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
    }
}