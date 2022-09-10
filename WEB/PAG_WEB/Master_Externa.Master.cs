using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;

namespace WEB.PAG_WEB
{
    public partial class Master_Externa : System.Web.UI.MasterPage
    {
        Log log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (!IsPostBack)
            //    {

            //        log.CustomWriteOnLog("Master", "-------------------------------------------------------------------------------------------------------------");
            //        log.CustomWriteOnLog("Master", "-----------------------------Ingresando a masterpage y Obtener pestañas disponibles--------------------------");
            //        log.CustomWriteOnLog("Master", "-------------------------------------------------------------------------------------------------------------");
            //        int perfil = int.Parse(Session["id_perfil"].ToString());
            //        //lblNombre.Text = Session["NombreUsuario"].ToString() + " " + Session["ApellidoP"].ToString();

            //    }
            //}

            //catch (Exception ex)
            //{
            //    log.CustomWriteOnLog("Master", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            //}
        }
    }
}