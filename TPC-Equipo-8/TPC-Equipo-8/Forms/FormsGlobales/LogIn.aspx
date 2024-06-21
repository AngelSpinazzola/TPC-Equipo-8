<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mt-4">
        <h3>Ingresá tu cuenta</h3>
    </div>
    <div class="container">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <asp:TextBox runat="server" placeholder="Email.." ID="txtEmail" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Contraseña</label>
            <asp:TextBox runat="server" type="password" placeholder="******" ID="txtPass" CssClass="form-control" />
        </div>
        <a href="Default.aspx" style="margin-left: 2%">Cancelar</a>
        <asp:Button Text="Continuar" ID="btnContinuar" OnClick="btnContinuar_Click" runat="server" CssClass="btn btn-primary" style="margin-left: 90%"/>
    </div>

</asp:Content>
