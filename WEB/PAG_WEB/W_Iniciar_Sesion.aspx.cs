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
    public partial class W_Iniciar_Sesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["id_perfil"] = -1;
            }
        }

        DtoUsuario usr = new DtoUsuario();
        Log log = new Log();

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string dni = TextBox2.Text;
            string pass = TextBox1.Text;

            DtoUsuario usuarioDto = new DtoUsuario();
            CtrUsuario usuarioCtr = new CtrUsuario();

            usuarioDto.PK_VU_DNI = dni;
            usuarioDto.VU_Contrasenia = pass;

            usuarioDto = usuarioCtr.Login(usuarioDto);
            log.CustomWriteOnLog("Login_", "usuarioDto" + usuarioDto);
            if (usuarioDto != null)
            {
                log.CustomWriteOnLog("Login_", "-------------------------------------------------------------------------------------------------------------");
                log.CustomWriteOnLog("Login_", "-----------------------------Ingresando a login y seteando valores de session--------------------------------");
                log.CustomWriteOnLog("Login_", "------------------------------------------------------------------------------------------------------------");
                Session["id_perfil"] = usuarioDto.FK_ITU_TipoUsuario;
                log.CustomWriteOnLog("Login_", " Session['id_perfil'] " + Session["id_perfil"]);
                Session["DNIUsuario"] = usuarioDto.PK_VU_DNI;
                Session["NombreUsuario"] = usuarioDto.VU_Nombre;
                Session["ApellidoP"] = usuarioDto.VU_APaterno;
                Session["ApellidoM"] = usuarioDto.VU_AMaterno;
                Session["Genero"] = usuarioDto.VU_Sexo;
                Session["NAcademia"] = usuarioDto.VU_NAcademia;
                Session["CorreoUsuario"] = usuarioDto.VU_Correo;
                Session["FechaNacUsuario"] = usuarioDto.DTU_FechaNacimiento;
                Session["CelularUsuario"] = usuarioDto.VU_Celular;
                Session["Categoria"] = usuarioDto.FK_ICA_CodCat;

                Session["login"] = true;

                //Session.Timeout = 60;
                Response.Redirect("~/PAG_WEB/index.aspx?IdPerfil=" + usuarioDto.FK_ITU_TipoUsuario); //pagina inicio con su perfil
            }
            else
            {
                log.CustomWriteOnLog("Login_", "---------------------------ERROR---------------------------------------------------");
                TextBox2.Text = String.Empty;
                log.CustomWriteOnLog("Login_", "---------------------------ERROR---------------------------------------------------");
                TextBox1.Text = String.Empty;
                log.CustomWriteOnLog("Login_", "---------------------------ERROR---------------------------------------------------");
                //Utils.AddScriptClientUpdatePanel(UpdatePanel, "showErrorMessage()");
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "showErrorMessageLogin()", true);

            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PAG_WEB/W_Registrar_Participante.aspx");
        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {

        }
    }
}


