<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialAltaPublicacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialAltaPublicacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" style="margin-top: 25px;">

        <div class="row g-3">
            <div class="col-12">
                <label for="txtNombre" class="form-label">Nombre Receptor</label>
                <asp:TextBox ID="txtNombreReceptor" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12" >
                <label for="tipoSangre" class="form-label">Tipo de Sangrue</label>
                <asp:DropDownList ID="DropDownTipoSangre" runat="server" CssClass="form-select">

                </asp:DropDownList>
            </div>


        </div>

    </div>
    





</asp:Content>
