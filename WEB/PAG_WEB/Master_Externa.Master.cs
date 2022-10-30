using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
            try
            {
                if (!IsPostBack)
                {

                    log.CustomWriteOnLog("MasterExterno", "-------------------------------------------------------------------------------------------------------------");
                    log.CustomWriteOnLog("MasterExterno", "-----------------------------Ingresando a masterpage --------------------------");
                    log.CustomWriteOnLog("MasterExterno", "-------------------------------------------------------------------------------------------------------------");
                    

                    if (Session["login"] != null)
                    {
                        int perfil = int.Parse(Session["id_perfil"].ToString());
                        StringBuilder html = new StringBuilder();
                        html.Append(@"<li class='nav - item dropdown'>
                                <a href='#' data-toggle='dropdown' role='button' aria-expanded='false' class='nav-link dropdown-toggle'><span><i class='notika-icon notika-support'> <p> Hola "+ Session["NombreUsuario"].ToString());
                        html.Append("</p></i></span></a>");
                        html.Append("<div role='menu' class='dropdown-menu message-dd animated zoomIn'>");
                        html.Append("<div class='hd-mg-tt'>");
                        html.Append("<h2>Usuario</h2>");
                        html.Append("</div>");
                        html.Append("<div class='hd-message-info'>");
                        html.Append("<a href='#'>");
                        html.Append("<div class='hd-message-sn'>");
                        html.Append("<div class='hd-mg-ctn'>");
                        html.Append("<h3>Mi perfil</h3>");
                        html.Append("</div>");
                        html.Append("</div>");
                        html.Append("</a>");
                        html.Append("<a href='W_Mis_Entradas.aspx'>");
                        html.Append("<div class='hd-message-sn'>");
                        html.Append("<div class='hd-mg-ctn'>");
                        html.Append("<h3>Mis Entradas</h3>");
                        html.Append("</div>");
                        html.Append("</div>");
                        html.Append("</a>");
                        html.Append("<a href='W_Mis_Inscripciones.aspx'>");
                        html.Append("<div class='hd-message-sn'>");
                        html.Append("<div class='hd-mg-ctn'>");
                        html.Append("<h3>Mis Inscripciones</h3>");
                        html.Append("</div>");
                        html.Append("</div>");
                        html.Append("</a>");
                        html.Append("<a href='W_Iniciar_Sesion.aspx'>");
                        html.Append("<div class='hd-message-sn'>");
                        html.Append("<div class='hd-mg-ctn'>");
                        html.Append("<h3>Cerrar sesion</h3>");
                        html.Append("</div>");
                        html.Append("</div>");
                        html.Append("</a>");
                        html.Append("</div>");
                        html.Append("</div>");
                        html.Append("</li>");
                        this.Literal1.Text = html.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                log.CustomWriteOnLog("MasterExterno", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
    }
}