using CTR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB.PAG_WEB
{
    public partial class W_Mis_Inscripciones : System.Web.UI.Page
    {
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _log.CustomWriteOnLog("MisInscrpciones", "Carga Página");
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {
                        CtrInscripcion objCtrInscrpcion = new CtrInscripcion();
                        CtrInscripcion objCtrInscrpcion1 = new CtrInscripcion();

                        string dni = Session["DNIUsuario"].ToString();
                        hfDNI.Value = dni;
                        gvInscritos.DataSource = objCtrInscrpcion.ListarInscripcionesByDni(dni);
                        gvInscritos.DataBind();
                        gvInscritos.HeaderRow.TableSection = TableRowSection.TableHeader;
                        upListaIns.Update();
                        gvParticipados.DataSource = objCtrInscrpcion1.ListarConcursosParticipadosByDni(dni);
                        gvParticipados.DataBind();
                        //gvParticipados.HeaderRow.TableSection = TableRowSection.TableHeader;
                        UpListaPart.Update();
                    }
                    else
                    {
                        Response.Redirect("W_Iniciar_Sesion.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("MisInscrpciones", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
        }
    }
}