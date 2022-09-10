using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using CTR;
using System.Data;

namespace WEB
{
    public partial class W_Listar_Tandas_Marinera : System.Web.UI.Page
    {
        CtrTanda objctrtanda = new CtrTanda();
        DtoTanda DtoTanda = new DtoTanda();
        CtrConcurso objCtrConcurso = new CtrConcurso();
        Log _log = new Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    GVTandaMar.DataSource = objctrtanda.listar_Tanda_Marinera();
            //    GVTandaMar.DataBind();
            //}
        }

        protected void GVTanda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GVTandaMar.DataSource = objctrtanda.listar_Tanda_Marinera();
            //GVTandaMar.DataBind();
        }
    }
}