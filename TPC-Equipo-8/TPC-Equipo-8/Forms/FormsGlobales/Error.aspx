<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h3 style="margin-top: 60px;">Ingresá tu cuenta</h3>
            </div>
            <div class="container d-flex justify-content-center">
                <div class="form-container mt-4 custom-login text-center">
                    <h5 style="color: black;">La cuenta ingresada es incorrecta</h5>
                    <a href="LogIn.aspx" style="color: #c12222;">Intentar nuevamente</a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
