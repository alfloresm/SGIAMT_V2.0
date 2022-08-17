using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CTR;
using DTO;

namespace WEB
{
    public partial class W_RegistrarConcurso : System.Web.UI.Page
    {
        CtrConcurso objCtrConcurso = new CtrConcurso();
        DtoConcurso objDtoConcurso = new DtoConcurso();
        CtrConcursoPrecio objCtrConcursoPrecio = new CtrConcursoPrecio();
        DtoConcursoPrecio objDtoConcursoPrecio = new DtoConcursoPrecio();
        Log _log = new Log();
        int idConcurso=0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Params["Id"] != null)
                {

                    txtPagina.InnerText = "Actualizar Concurso";
                    btnRegistrar.Text = "Actualizar";
                    Panel1.Visible = true;
                    Panel2.Visible = true;
                    obtenerConcurso(Request.Params["Id"]);

                }
                else
                {
                    txtPagina.InnerText = "Registrar Concurso";
                    btnRegistrar.Text = "Registrar";
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    tablaPreciosporConcurso();
                    llenarPrecios();
                }
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToDateTime(txtFechaI.Text) < DateTime.Now || Convert.ToDateTime(txtFechaF.Text) < DateTime.Now)
                {
                    string m = "fecha incorrecta";
                    Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','danger')");
                }
                else
                {
                    if (Request.Params["Id"] != null)
                    {
                        idConcurso = Convert.ToInt32(Request.Params["Id"]);
                        objDtoConcurso.PK_IC_IdConcurso = Convert.ToInt32(txtCodigo.Text);
                        objDtoConcurso.VC_NombreCon = txtNombre.Text;
                        objDtoConcurso.VC_LugarCon = txtlugar.Text;
                        objDtoConcurso.DTC_FechaI = Convert.ToDateTime(txtFechaI.Text);
                        objDtoConcurso.DTC_FechaI = Convert.ToDateTime(txtFechaI.Text);
                        objDtoConcurso.IC_Capacidad = Convert.ToInt32(txtcant.Text);
                        objDtoConcurso.VC_Estado = ddlEstado.SelectedValue;
                        objCtrConcurso.ActualizarConcurso(objDtoConcurso);
                        string m = "Se actualizó correctamente";
                        _log.CustomWriteOnLog("regConcurso", m);

                        Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                        //Response.Redirect("~/W_GestionarConcurso.aspx");
                    }
                    else
                    {
                        objDtoConcurso.VC_NombreCon = txtNombre.Text;
                        objDtoConcurso.VC_LugarCon = txtlugar.Text;
                        objDtoConcurso.DTC_FechaI = Convert.ToDateTime(txtFechaI.Text);
                        objDtoConcurso.DTC_FechaF = Convert.ToDateTime(txtFechaI.Text);
                        objDtoConcurso.IC_Capacidad = Convert.ToInt32(txtcant.Text);
                        idConcurso=objCtrConcurso.RegistrarConcurso(objDtoConcurso);
                        _log.CustomWriteOnLog("regConcurso", objDtoConcurso.PK_IC_IdConcurso.ToString());
                        string m = "Se Registró correctamente";

                        Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + m + "','success')");
                        //Response.Redirect("~/W_GestionarConcurso.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Utils.AddScriptClientUpdatePanel(upBotonEnviar, "showMessage('top','center','" + ex.Message + "','danger')");
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/W_Gestionar_Concurso.aspx");
        }
        public void obtenerConcurso(string cod)
        {
            objDtoConcurso.PK_IC_IdConcurso = int.Parse(cod);
            objCtrConcurso.ObtenerConcurso(objDtoConcurso);

            txtCodigo.Text = objDtoConcurso.PK_IC_IdConcurso.ToString();
            txtNombre.Text = objDtoConcurso.VC_NombreCon.ToString();
            txtlugar.Text = objDtoConcurso.VC_LugarCon.ToString();
            txtFechaI.Text = objDtoConcurso.DTC_FechaI.ToString("yyyy-MM-dd");
            txtFechaI.Text = objDtoConcurso.DTC_FechaF.ToString("yyyy-MM-dd");
            txtcant.Text = objDtoConcurso.IC_Capacidad.ToString();
            ddlEstado.Text = objDtoConcurso.VC_Estado;
        }

        protected void GVVerPrecios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnRegistrarPrecio_Click(object sender, EventArgs e)
        {
            objDtoConcursoPrecio.DCP_Monto = Convert.ToInt32(txtMonto.Text);
            objDtoConcursoPrecio.PK_ICP_IdConcurso = idConcurso;
            objDtoConcursoPrecio.PK_ICP_CodPrecio = Convert.ToInt32(ddlPrecios.SelectedValue.ToString());

            //registro
            objCtrConcursoPrecio.RegistrarPreciosDeConcursos(objDtoConcursoPrecio);

            //Tabla Precios
            GVVerPrecios.DataSource = objCtrConcursoPrecio.ListaPreciosByConcursos(idConcurso);
            GVVerPrecios.DataBind();
            UpListaPrecios.Update();
        }
        public void tablaPreciosporConcurso()
        {
            GVVerPrecios.DataSource = objCtrConcursoPrecio.ListaPreciosByConcursos(idConcurso);
            GVVerPrecios.DataBind();
        }
        public void llenarPrecios()
        {
            DataSet ds = new DataSet();
            ds = objCtrConcursoPrecio.DesplegablePrecios();
            ddlPrecios.DataSource = ds;
            ddlPrecios.DataTextField = "VPRE_Descripcion";
            ddlPrecios.DataValueField = "PK_IPRE_CodPrecio";
            ddlPrecios.DataBind();
            ddlPrecios.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
    }
}