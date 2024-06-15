<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialHome.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>HOME DE LA FILIAL</h1>
    <asp:Label ID="LabelPrueba" runat="server" Text="ID FILIAL"></asp:Label>
    <asp:TextBox ID="TextBoxPrueba" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonPrueba" runat="server" Text="Login" OnClick="ButtonPrueba_Click" />
    <asp:GridView ID="dgvHomeFilial" runat="server"></asp:GridView>
</asp:Content>
