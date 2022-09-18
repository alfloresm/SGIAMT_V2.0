using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;
using System.Data;
using System.Text;

namespace WEB
{
    public partial class W_Mostrar_Resultado : System.Web.UI.Page
    {
        Log _log = new Log();
        CtrTanda objctrTanda = new CtrTanda();
        DtoTanda objdtotanda = new DtoTanda();
        DtoUsuarioModalidadTanda objdtoUMT = new DtoUsuarioModalidadTanda();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _log.CustomWriteOnLog("mostrar resultado", "Carga Página");
                try
                {
                    if (Session["ApellidoM"] != null)
                    {

                        string numJ = Session["ApellidoM"].ToString();
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }

                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("mostrar resultado", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }
        }

        protected void btnBuscar1_Click(object sender, EventArgs e)
        {
            try
            {
                objdtotanda.PK_IT_CodTan = Convert.ToInt32(txtTanda.Text);
                if (objctrTanda.selectTanda(objdtotanda))
                {
                    if (validacionCalificado())
                    {
                        objdtotanda.PK_IT_CodTan = Convert.ToInt32(txtTanda.Text);
                        _log.CustomWriteOnLog("mostrar resultado", "entra boton");
                        CtrTanda CTRT = new CtrTanda();
                        CTRT.obtenerTanda(objdtotanda);
                        _log.CustomWriteOnLog("mostrar resultado", "categoria: " + objdtotanda.VT_Descripcion);
                        lblCategoria.Text = objdtotanda.VT_Descripcion;

                        _log.CustomWriteOnLog("mostrar resultado", "tipo tanda: " + objdtotanda.VT_TipoTanda.ToString());
                        lblModalidad.Text = CTRT.obtenerModalidad(objdtotanda.VT_TipoTanda);
                        UpdatePanelInfo.Update();

                        if (objdtotanda.VT_Estado == "NO CALIFICADO")
                        {
                            //SUMA PUNTAJES y actualiza puntaje total

                            CtrTanda ctrT = new CtrTanda();
                            DataTable dt = new DataTable();
                            objdtoUMT.FK_IT_CodTan = Convert.ToInt32(txtTanda.Text);
                            dt = ctrT.obtenerParticipantesxTanda(objdtoUMT);
                            foreach (DataRow row in dt.Rows)
                            {

                                objdtoUMT.PK_IUMT_CodUsuModTan = row["PK_IUMT_CodUsuModTan"].ToString();
                                _log.CustomWriteOnLog("mostrar resultado", "codigo: " + row["PK_IUMT_CodUsuModTan"].ToString());
                                objdtoUMT.IUMT_PuntajeTotal = ctrT.sumaPuntajes(objdtoUMT);
                                ctrT.actualizarPuntajeT(objdtoUMT);
                                _log.CustomWriteOnLog("mostrar resultado", "SE ACTUALIZO EL PUNTAJE");
                            }
                            //actualiza estado a CALIFICADO
                            ctrT.actualizarEstadoT(objdtotanda);
                            //Actualiza Ganador
                            ctrT.actualizarganadorT(objdtotanda);
                        }
                        // Presentar resultados
                        BuildCards(objdtotanda.PK_IT_CodTan);
                    }
                    else
                    {
                        txtTanda.Text = "";
                        string m = "Falta terminar de calificar tanda";
                        Utils.AddScriptClientUpdatePanel(upnBotonBuscar1, "showMessage('top','center','" + m + "','danger')");
                    }
                }
                else
                {
                    txtTanda.Text = "";
                    string m = "No existe Tanda";
                    Utils.AddScriptClientUpdatePanel(upnBotonBuscar1, "showMessage('top','center','" + m + "','danger')");
                }

            }
            catch (Exception ex)
            {
                _log.CustomWriteOnLog("mostrar resultado", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
        public bool validacionCalificado()
        {
            try
            {
                objdtotanda.PK_IT_CodTan = Convert.ToInt32(txtTanda.Text);
                _log.CustomWriteOnLog("mostrar resultado", "entra validacion");
                objctrTanda.obtenerTandaP(objdtotanda);
                objdtoUMT.FK_IT_CodTan = Convert.ToInt32(txtTanda.Text);
                CtrTanda ctrT = new CtrTanda();
                DataTable dt = new DataTable();
                dt = ctrT.obtenerParticipantesxTanda(objdtoUMT);
                if (objdtotanda.VT_TipoTanda == 1)
                {
                    //SERIADO
                    int valor = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        objdtoUMT.FK_IUM_CodUM = Convert.ToInt32(row["FK_IUM_CodUM"].ToString());
                        objdtoUMT.IUMT_Estado = Convert.ToInt32(row["IUMT_Estado"].ToString());
                        if (objdtoUMT.IUMT_Estado == 3)
                        {
                            valor++;
                        }
                        else
                        {
                            valor = valor + 0;
                        }
                        _log.CustomWriteOnLog("mostrar resultado", "valor=" + valor.ToString());
                    }
                    int cfilas = dt.Rows.Count;
                    if (cfilas == valor)
                    {
                        _log.CustomWriteOnLog("mostrar resultado", "VALIDACION TRUE");
                        return true;
                    }
                    else
                    {
                        _log.CustomWriteOnLog("mostrar resultado", "VALIDACION FALSE");
                        return false;
                    }

                }
                else if (objdtotanda.VT_TipoTanda == 2)
                {
                    //NOVEL Abierto, Novel Novel y Nacional
                    int valor = 0;
                    int cfilas = dt.Rows.Count;
                    foreach (DataRow row in dt.Rows)
                    {
                        objdtoUMT.FK_IUM_CodUM = Convert.ToInt32(row["FK_IUM_CodUM"].ToString());
                        objdtoUMT.IUMT_Estado = Convert.ToInt32(row["IUMT_Estado"].ToString());
                        if (objdtoUMT.IUMT_Estado == 6)
                        {
                            valor++;
                        }
                        else
                        {
                            valor = valor + 0;
                        }
                    }
                    if (cfilas == valor)
                    {
                        _log.CustomWriteOnLog("mostrar resultado", "VALIDACION TRUE");
                        return true;
                    }
                    else
                    {
                        _log.CustomWriteOnLog("mostrar resultado", "VALIDACION FALSE");
                        return false;
                    }
                }
                else
                {
                    _log.CustomWriteOnLog("mostrar resultado", "VALIDACION ninguna");
                    return false;
                }

            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("mostrar resultado", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                return false;
            }
        }
        public void BuildCards(int idTanda)
        {
            objdtotanda.PK_IT_CodTan = idTanda;
            objctrTanda.obtenerTandaP(objdtotanda);
            int ganadorA = objdtotanda.IT_GanadorA;
            int ganadorB = objdtotanda.IT_GanadorB;
            int ganadorC = objdtotanda.IT_GanadorC;

            DataTable dt = new DataTable();
            dt = objctrTanda.ObtenertandaXBloque(idTanda);

            int cont = 0;
            StringBuilder cardParticipante = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {
                int idUM = Convert.ToInt32(row["FK_IUM_CodUM"].ToString());
                _log.CustomWriteOnLog("mostrar resultado", "participante: " + row["FK_IUM_CodUM"].ToString());
                string pista = row["IUMT_Pista"].ToString();
                _log.CustomWriteOnLog("mostrar resultado", "pista: " + row["IUMT_Pista"].ToString());
                _log.CustomWriteOnLog("mostrar resultado", "UMT: " + row["PK_IUMT_CodUsuModTan"].ToString());
                string umt = row["PK_IUMT_CodUsuModTan"].ToString();
                cont = cont + 1;
                _log.CustomWriteOnLog("mostrar resultado", "contador: " + cont.ToString());

                string color = "";

                if (idUM == ganadorA || idUM == ganadorB || idUM == ganadorC)
                {
                    color = "green";
                }
                else
                {
                    color = "blue";
                }

                cardParticipante.Append("<div class='col-md-4'>");
                cardParticipante.Append("<div class='card'>");
                cardParticipante.Append("<div class='card-header card-header-icon' data-background-color='" + color + "'>");
                cardParticipante.Append("<h4 class='card-title'>Pista " + pista + " : " + idUM.ToString() + "</h4>");
                cardParticipante.Append("</div>");
                cardParticipante.Append("<div class='card - content'>");
                cardParticipante.Append("<div class='table-responsive table-sales'>");
                cardParticipante.Append("<table class='table'>");
                cardParticipante.Append("<tbody>");
                DataTable dtpuntaje = new DataTable();
                dtpuntaje = objctrTanda.ObtenerPuntajesPorParticipante(row["PK_IUMT_CodUsuModTan"].ToString());
                int i = 0;
                foreach (DataRow rowpuntaje in dtpuntaje.Rows)
                {
                    _log.CustomWriteOnLog("mostrar resultado", "participante x tanda : " + rowpuntaje["PK_IUMT_CodUsuModTan"].ToString());
                    _log.CustomWriteOnLog("mostrar resultado", "jurado : " + rowpuntaje["Nombre_Jurado"].ToString());
                    _log.CustomWriteOnLog("mostrar resultado", "puntaje : " + rowpuntaje["IP_Puntaje"].ToString());
                    i = i + 1;
                    cardParticipante.Append("<tr>");
                    cardParticipante.Append("<td>");
                    cardParticipante.Append(rowpuntaje["Nombre_Jurado"].ToString());
                    cardParticipante.Append("</td>");
                    cardParticipante.Append("<td>");
                    cardParticipante.Append(rowpuntaje["IP_Puntaje"].ToString());
                    cardParticipante.Append("</td>");
                    cardParticipante.Append("</tr>");
                }
                cardParticipante.Append("<tr>");
                cardParticipante.Append("<td>");
                cardParticipante.Append("<p class='text-danger'></p>");
                cardParticipante.Append("</td>");
                cardParticipante.Append("<td>");
                cardParticipante.Append(row["IUMT_puntajeTotal"].ToString());
                cardParticipante.Append("</td>");
                cardParticipante.Append("</tr>");
                cardParticipante.Append("</tbody>");
                cardParticipante.Append("</table>");
                cardParticipante.Append("</div>");
                cardParticipante.Append("</div>");
                cardParticipante.Append("</div>");
                cardParticipante.Append("</div>");
                _log.CustomWriteOnLog("mostrar resultado", "----------------------------------");
            }
            LiteralParticipantes.Text = cardParticipante.ToString();
            UpdatePanelCalificacion.Update();
        }
    }
}