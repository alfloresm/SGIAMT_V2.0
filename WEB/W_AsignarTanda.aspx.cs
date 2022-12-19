using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using CTR;

namespace WEB
{
    public partial class W_AsignarTanda : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        DtoUsuarioModalidadTanda objumt = new DtoUsuarioModalidadTanda();
        DtoTanda objtanda = new DtoTanda();
        CtrTanda objctrtanda = new CtrTanda();
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Session["DNIUsuario"] != null)
                    {
                        HdIdConcurso.Value = Request.QueryString["ConcursoID"];
                        LlenarModalidades();
                        PanelIndividual.Visible = false;
                        PanelParejas.Visible = false;
                        btnReset.Visible = false;
                    }
                    else
                    {
                        Response.Redirect("W_Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    _log.CustomWriteOnLog("asignar tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
                }
            }

        }

        protected void btnIr_Click(object sender, EventArgs e)
        {
            try
            {
                objtanda.IT_CodigoConcurso= Convert.ToInt32(HdIdConcurso.Value);
                objtanda.VT_TipoTanda = Convert.ToInt32(ddlModalidad.SelectedValue);
                objtanda.VT_Descripcion = ddlCat.SelectedValue.ToString();
                objctrtanda.regTanda(objtanda);
                _log.CustomWriteOnLog("asignar tanda", "registra tanda");
                _log.CustomWriteOnLog("asignar tanda", "codigo : " + objtanda.PK_IT_CodTan);
                HFidTanda.Value = objtanda.PK_IT_CodTan.ToString();
                txtCodPista1.Text = "";
                txtCodPista2.Text = "";
                txtCodPista3.Text = "";
                txtCodPista4.Text = "";

                if (ddlModalidad.SelectedItem.ToString() != "Seriado")
                {
                    PanelParejas.Visible = true;
                }
                else
                {
                    PanelIndividual.Visible = true;
                }


            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("asignar tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        public void LlenarModalidades()
        {
            DataSet ds = new DataSet();
            ds = objCtrConcurso.DesplegableModalidades();
            ddlModalidad.DataSource = ds;
            ddlModalidad.DataTextField = "VM_NombreMod";
            ddlModalidad.DataValueField = "PK_IM_CodigoMod";
            ddlModalidad.DataBind();
            ddlModalidad.Items.Insert(0, new ListItem("Seleccione Modalidad", "0"));
        }

        protected void BtnPista1A_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 1A");
            objumt.IUMT_Pista = "1A";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista1A.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista1A.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "A";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 1A");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista1A, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista2A_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 2A");
            objumt.IUMT_Pista = "2A";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista2A.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista2A.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "A";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 2A");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista2A, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista3A_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 3A");
            objumt.IUMT_Pista = "3A";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista3A.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista3A.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "A";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 3A");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista3A, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista1B_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 1B");
            objumt.IUMT_Pista = "1B";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista1B.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista1B.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "B";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 1B");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista1B, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista2B_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 2B");
            objumt.IUMT_Pista = "2B";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista2B.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista2B.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "B";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 2B");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista2B, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista3B_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 3B");
            objumt.IUMT_Pista = "3B";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista3B.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista3B.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "B";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 3B");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista3B, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista1C_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 1C");
            objumt.IUMT_Pista = "1C";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista1C.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista1C.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "C";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 1C");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista1C, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista2C_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 2C");
            objumt.IUMT_Pista = "2C";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista2C.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista2C.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "C";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 2C");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista2C, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista3C_Click(object sender, EventArgs e)
        {
            _log.CustomWriteOnLog("asignar tanda", "entra boton pista 3C");
            objumt.IUMT_Pista = "3C";
            objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista3C.Text);
            objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
            objumt.PK_IUMT_CodUsuModTan = txtCodPista3C.Text + HFidTanda.Value;
            objumt.VUMT_Bloque = "C";
            objctrtanda.registrarUMT(objumt);
            _log.CustomWriteOnLog("asignar tanda", "registra 3C");
            string m = "Se registro Correctamente";
            Utils.AddScriptClientUpdatePanel(updPista3C, "showMessage('top','center','" + m + "','success')");
        }

        protected void BtnPista1_Click(object sender, EventArgs e)
        {
            try
            {
                _log.CustomWriteOnLog("asignar tanda", "entra boton pista 1");
                objumt.IUMT_Pista = "1";
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista1.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista1.Text + HFidTanda.Value;
                objumt.VUMT_Bloque = "0";
                objctrtanda.registrarUMT(objumt);
                _log.CustomWriteOnLog("asignar tanda", "registra 1");
                string m = "Se registro Correctamente";
                Utils.AddScriptClientUpdatePanel(updPista1, "showMessage('top','center','" + m + "','success')");
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("asignar tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void BtnPista2_Click(object sender, EventArgs e)
        {
            try
            {
                _log.CustomWriteOnLog("asignar tanda", "entra boton pista 2");
                objumt.IUMT_Pista = "2";
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista2.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista2.Text + HFidTanda.Value;
                objumt.VUMT_Bloque = "0";
                objctrtanda.registrarUMT(objumt);
                _log.CustomWriteOnLog("asignar tanda", "registra 2");
                string m = "Se registro Correctamente";
                Utils.AddScriptClientUpdatePanel(updPista2, "showMessage('top','center','" + m + "','success')");
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("asignar tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void BtnPista3_Click(object sender, EventArgs e)
        {
            try
            {
                _log.CustomWriteOnLog("asignar tanda", "entra boton pista 3");
                objumt.IUMT_Pista = "3";
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista3.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista3.Text + HFidTanda.Value;
                objumt.VUMT_Bloque = "0";
                objctrtanda.registrarUMT(objumt);
                _log.CustomWriteOnLog("asignar tanda", "registra 3");
                string m = "Se registro Correctamente";
                Utils.AddScriptClientUpdatePanel(updPista3, "showMessage('top','center','" + m + "','success')");
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("asignar tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }

        protected void BtnPista4_Click(object sender, EventArgs e)
        {
            try
            {
                _log.CustomWriteOnLog("asignar tanda", "entra boton pista 4");
                objumt.IUMT_Pista = "4";
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista4.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista4.Text + HFidTanda.Value;
                objumt.VUMT_Bloque = "0";
                objctrtanda.registrarUMT(objumt);
                _log.CustomWriteOnLog("asignar tanda", "registra 4");
                string m = "Se registro Correctamente";
                Utils.AddScriptClientUpdatePanel(updPista4, "showMessage('top','center','" + m + "','success')");
            }
            catch (Exception ex)
            {

                _log.CustomWriteOnLog("asignar tanda", "Error : " + ex.Message + "Stac" + ex.StackTrace);
            }
        }
    }
}