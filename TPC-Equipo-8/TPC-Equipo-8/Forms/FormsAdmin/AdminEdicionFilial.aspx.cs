using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_8.Forms.FormsAdmin
{
    public partial class AdminEdicionFilial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["idFilial"] != null)
                {

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
            
        }
    }
}