using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;

namespace WEB
{
    public partial class W_Gestionar_Tanda : System.Web.UI.Page
    {
        CtrTanda objctrtanda = new CtrTanda();
        DtoTanda DtoTanda = new DtoTanda();
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVTanda.DataSource = objctrtanda.listar_Tanda_NC();
                GVTanda.DataBind();
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/W_Asignar_Tanda.aspx");
        }

        protected void GVTanda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVTanda.DataSource = objctrtanda.listar_Tanda_NC();
            GVTanda.DataBind();
        }
    }
}