﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;

namespace WEB
{
    public partial class W_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DtoUsuario usr = new DtoUsuario();
        Log log = new Log();
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string dni = txtDni.Text;
            string pass = txtPassword.Text;

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

                if (Session["id_perfil"].ToString() == "2")
                {
                    string script = @"<script type='text/javascript'>
                                      location.href='../W_Gestionar_Concurso.aspx';
                                  </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else if (Session["id_perfil"].ToString() == "4")
                {
                    Session["codJurado"] = usuarioCtr.devolverCodJurado(usuarioDto.PK_VU_DNI);
                    string script = @"<script type='text/javascript'>
                                      location.href='../W_Calificar_Participante.aspx';
                                  </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else if (Session["id_perfil"].ToString() == "3")
                {
                    string script = @"<script type='text/javascript'>
                                      location.href='../W_Inscribir_ParticipanteP.aspx';
                                  </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                else if (Session["id_perfil"].ToString() == "5")
                {
                    string script = @"<script type='text/javascript'>
                                      location.href='../W_Mostrar_Resultado.aspx';
                                  </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", script, false);
                }
                Session.Timeout = 60;
            }
            else
            {
                log.CustomWriteOnLog("Login_", "---------------------------ERROR---------------------------------------------------");
                txtDni.Text = String.Empty;
                log.CustomWriteOnLog("Login_", "---------------------------ERROR---------------------------------------------------");
                txtPassword.Text = String.Empty;
                log.CustomWriteOnLog("Login_", "---------------------------ERROR---------------------------------------------------");
                Utils.AddScriptClientUpdatePanel(UpdatePanel, "showErrorMessage()");
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "mensaje", "swal({icon: 'error',title: 'ERROR!',text: 'Su usuario o contraseña es incorrecta o no existe'});", true);

            }
        }
    }
    
}