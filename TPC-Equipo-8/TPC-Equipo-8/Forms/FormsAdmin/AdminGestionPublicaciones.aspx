<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGestionPublicaciones.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminGestionPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>GESTION DE LAS PUBLICACIONES</h1>
    <asp:GridView ID="dgvPublicaciones" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="dgvPublicaciones_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="Filial" DataField="filial" />
            <asp:BoundField HeaderText="Receptor" DataField="nombreReceptor" />
            <asp:BoundField HeaderText="Grupos Donantes" DataField="posiblesDonantes" />
            <asp:BoundField HeaderText="Urgencia" DataField="urgencia" />
            <asp:BoundField HeaderText="Donantes Necesarios" DataField="donantesNecesarios" />
            <asp:BoundField HeaderText="Horarios" DataField="horarios" />
            <asp:BoundField HeaderText="Fecha Limite" DataField="fechaLimite" />
            <asp:BoundField HeaderText="Acciones"/>
        </Columns>
    </asp:GridView>
</asp:Content>
