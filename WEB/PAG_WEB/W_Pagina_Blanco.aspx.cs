using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using DAO;
using CTR;

namespace WEB.PAG_WEB
{
    public partial class W_Pagina_Blanco : System.Web.UI.Page
    {
        DtoUsuario dtousuario = new DtoUsuario();
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {

                    _log.CustomWriteOnLog("Master", "-------------------------------------------------------------------------------------------------------------");
                    _log.CustomWriteOnLog("Master", "-----------------------------Ingresando a masterpage y Obtener pestañas disponibles--------------------------");
                    _log.CustomWriteOnLog("Master", "-------------------------------------------------------------------------------------------------------------");
                    int perfil = int.Parse(Session["id_perfil"].ToString());
                    //lblnombre.Text = Session["NombreUsuario"].ToString() + " " + Session["ApellidoP"].ToString();


                }
                //Session.Clear();

            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("Master", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
    }
}
