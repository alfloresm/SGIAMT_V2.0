﻿using System;
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
    public partial class W_Asignar_Tanda : System.Web.UI.Page
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

                HdIdConcurso.Value = Request.QueryString["ConcursoID"];
                LlenarModalidades();
                PanelIndividual.Visible = false;
                PanelParejas.Visible = false;
                btnReset.Visible = false;
            }
        }

        protected void btnIr_Click(object sender, EventArgs e)
        {
            try
            {
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

                if (ddlModalidad.SelectedItem.ToString()!= "Seriado")
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

        }

        protected void BtnPista1B_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista1C_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista2A_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista2B_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista2C_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista3A_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista3B_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista3C_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPista1_Click(object sender, EventArgs e)
        {
            try
            {
                _log.CustomWriteOnLog("asignar tanda", "entra boton pista 1");
                objumt.IUMT_Pista = 1;
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista1.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista1.Text + HFidTanda.Value;
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
                objumt.IUMT_Pista = 2;
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista2.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista2.Text + HFidTanda.Value;
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
                objumt.IUMT_Pista = 3;
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista3.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista3.Text + HFidTanda.Value;
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
                objumt.IUMT_Pista = 4;
                objumt.FK_IUM_CodUM = Convert.ToInt32(txtCodPista4.Text);
                objumt.FK_IT_CodTan = Convert.ToInt32(HFidTanda.Value);
                objumt.PK_IUMT_CodUsuModTan = txtCodPista3.Text + HFidTanda.Value;
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