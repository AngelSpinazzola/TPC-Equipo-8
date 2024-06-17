﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manager;
using TPC_Equipo_8.Manager;

namespace TPC_Equipo_8.Forms.FormsFilial
{
    public partial class FilialHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(TextBoxPrueba.Text=="")
            {
                TextBoxPrueba.Text = "1";
            }
            
           int id = Convert.ToInt32(TextBoxPrueba.Text);
           FilialManager managerFilial = new FilialManager();
           DonacionManager manager = new DonacionManager();

            if(!IsPostBack)
            {
                dgvHomeFilial.DataSource = managerFilial.ListarFilial(id);
                dgvHomeFilial.DataBind();
                RepHomeFilial.DataSource = manager.ListarDonaciones(id);
                RepHomeFilial.DataBind();

                Session.Add("Filialid",id);
            }
            

        }

        protected void ButtonPrueba_Click(object sender, EventArgs e)
        {
            string text = TextBoxPrueba.Text;
            int id = Convert.ToInt32(TextBoxPrueba.Text);
            //FilialManager manager = new FilialManager();
            FilialManager managerFilial = new FilialManager();
            DonacionManager manager = new DonacionManager();

            dgvHomeFilial.DataSource = managerFilial.ListarFilial(id);
            dgvHomeFilial.DataBind();

            RepHomeFilial.DataSource = manager.ListarDonaciones(id);
            RepHomeFilial.DataBind();

            Session.Add("Filialid", id);
        }
    }
}