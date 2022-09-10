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

        public void inicio()
        {
            _log.CustomWriteOnLog("Master", " Session['NombreUsuario'] " + Session["NombreUsuario"]);
            string dni = Session["DNIUsuario"].ToString();

            string html = string.Format(@"
                         
                <ul class='nav'>
                    <li class='active'>
                        <a href = 'MASTER_EXTERNO/index_Externo.html'>
                            <i class='material-icons'>dashboard</i>
                            <p>Inicio</p>
                        </a>
                    </li>
                    
                    <li>
                        <a data-toggle='collapse' href='#gestionConcurso'>
                            <i class='material-icons'>emoji_events</i>
                            <p>
                                Gestion Concurso

                                <b class='caret'></b>
                            </p>
                        </a>
                        <div class='collapse' id='gestionConcurso'>
                            <ul class='nav'>
                                <li>
                                    <a href = 'W_Gestionar_Concurso.aspx' > Gestionar Concurso</a>
                                </li>
                                <li>
                                    <a href = 'W_Inscribir_ParticipanteP.aspx' > Inscribir Participante</a>
                                </li>
                                <li>
                                    <a href = '#' > Adminitrar Participante</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
                    ");
            string img = String.Format(@"<img src='../assets/img/faces/avatar.jpg'/>");
            //this.Literal.Text = img;
            //this.Literal1.Text = html;
        }
           
    }
}
