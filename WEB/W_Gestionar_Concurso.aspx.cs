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
    public partial class W_Gestionar_Concurso : System.Web.UI.Page
    {
        CtrConcurso objctrConcurso = new CtrConcurso();
        DtoConcurso objdtoconcurso = new DtoConcurso();
        Log _log = new Log();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
                GVConcurso.DataBind();

            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

        }

        protected void GVConcurso_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GVConcurso_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVConcurso.DataSource = objctrConcurso.ListaConcursos_();
            GVConcurso.DataBind();
        }
        protected Boolean ValidacionEstado(string estado)
        {
            return estado == "No Realizado";
        }
    }
}