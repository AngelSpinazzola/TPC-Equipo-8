<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center mt-4">
        <h3>Completá los datos para crear tu cuenta</h3>
    </div>
    <div class="container">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <asp:TextBox runat="server" placeholder="Email.." ID="txtRegistroEmail" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="exampleInputDni" class="form-label">Dni</label>
            <asp:TextBox runat="server" placeholder="Dni.." ID="txtRegistroDni" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Contraseña</label>
            <asp:TextBox runat="server" placeholder="******" ID="txtRegistroPass" CssClass="form-control" type="password" />
        </div>
        <a href="Default.aspx" style="margin-left: 2%">Cancelar</a>
        <asp:Button Text="Continuar" ID="btnContinuarRegistro" OnClick="btnContinuarRegistro_Click" runat="server" CssClass="btn btn-primary" Style="margin-left: 90%" />
    </div>



</asp:Content>
