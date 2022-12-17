using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;

namespace WEB
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        Log log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    log.CustomWriteOnLog("Master", "-------------------------------------------------------------------------------------------------------------");
                    log.CustomWriteOnLog("Master", "-----------------------------Ingresando a masterpage y Obtener pestañas disponibles--------------------------");
                    log.CustomWriteOnLog("Master", "-------------------------------------------------------------------------------------------------------------");
                    int perfil = int.Parse(Session["id_perfil"].ToString());
                    lblNombre.Text = Session["NombreUsuario"].ToString() + " " + Session["ApellidoP"].ToString() + " " + Session["ApellidoM"].ToString();


                    switch (perfil)
                    {
                        case 2://gerente
                            perfil_Gerente();
                            break;
                        case 4://jurado
                            perfil_Jurado();
                            break;
                        case 3://gestor
                            perfil_staff();
                            break;
                        case 5://gestor
                            perfil_Presentador();
                            break;
                        default:
                            Session.Clear();
                            Session.Abandon();
                            HttpContext.Current.Session.Abandon();
                            Session.RemoveAll();
                            Response.Redirect("~/Login_.aspx");
                            break;
                    }
                    //Session.Clear();
                }
            }
            catch (Exception ex)
            {
                log.CustomWriteOnLog("Master", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public void perfil_Gerente()
        {

            log.CustomWriteOnLog("Master", " Session['NombreUsuario'] " + Session["NombreUsuario"]);
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
                            </ul>
                        </div>
                    </li>
                </ul>
                    ");
            string img = String.Format(@"<img src='../assets/img/faces/avatar.jpg'/>");
            this.Literal2.Text = img;
            this.Literal1.Text = html;
        }
        public void perfil_staff()
        {
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
                            <p> Gestion Concurso<b class='caret'></b></p>
                        </a>
                        <div class='collapse' id='gestionConcurso'>
                            <ul class='nav'>

                                <li>
                                    <a href = 'W_Inscribir_ParticipanteP.aspx'> Inscribir Participante</a>
                                </li>
                                <li>
                                    <a href = 'W_Validar_Inscripcion.aspx'> Validar Inscripción</a>
                                </li>
                                <li>
                                    <a href = 'W_Gestionar_Tanda.aspx'> Gestionar Tandas</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a data-toggle='collapse' href='#gestionEntradas'>
                            <i class='material-icons'>emoji_events</i>
                            <p> Gestion Entradas<b class='caret'></b></p>
                        </a>
                            <div class='collapse' id='gestionEntradas'>
                            <ul class='nav'>
                                <li>
                                    <a href = 'W_Validar_Entradas.aspx'> Validar Entradas</a>
                                </li>
                                <li>
                                    <a href = 'W_Vender_Entradas.aspx'> Vender Entradas</a>
                                </li>
                            </ul>
                        </div>
                    </li>
               </ul> ");
            string img = String.Format(@"<img src='../assets/img/default-avatar.png'/>");
            this.Literal2.Text = img;
            this.Literal1.Text = html;
        }
        public void perfil_Jurado()
        {
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
                                    <a href = 'W_Calificar_Participante.aspx'> Calificar Participante</a>
                                </li>
                                
                            </ul>
                        </div>
                    </li> 
               </ul> ");
            string img = String.Format(@"<img src='../assets/img/default-avatar.png'/>");
            this.Literal2.Text = img;
            this.Literal1.Text = html;
        }
        public void perfil_Presentador()
        {
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
                                    <a href = 'W_Mostrar_Resultado.aspx'> Mostrar Resultado</a>
                                </li>
                                <li>
                                    <a href = 'W_Asignar_Marinera.aspx'> Asignar Marinera</a>
                                </li>
                           </ul>
                        </div>
                    </li>
               </ul> ");
            string img = String.Format(@"<img src='../assets/img/flags/trofeo.png'/>");
            this.Literal2.Text = img;
            this.Literal1.Text = html;
        }
    }
}