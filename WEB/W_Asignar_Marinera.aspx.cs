using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class W_Asignar_Marinera : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIr_Click(object sender, EventArgs e)
        {

        }
        protected Boolean ValidacionElegirMarinera(string codMar)
        {
            return codMar == "-1";
        }
        protected Boolean ValidacionVerMarinera(string codMar)
        {
            return codMar != "-1";
        }
    }
}