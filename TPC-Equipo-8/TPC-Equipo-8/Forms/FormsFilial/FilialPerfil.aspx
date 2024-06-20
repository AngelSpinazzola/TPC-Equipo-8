<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialPerfil.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>PERFIL FILIAL</h1>
    <asp:Label ID="Labelogin" runat="server" Text="ID FILIAL"></asp:Label>
    <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click"/>
</asp:Content>
