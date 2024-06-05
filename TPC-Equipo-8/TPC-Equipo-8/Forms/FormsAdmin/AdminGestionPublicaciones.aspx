<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGestionPublicaciones.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminGestionPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>GESTION DE LAS PUBLICACIONES</h1>
    <asp:GridView ID="dgvPublicaciones" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="dgvPublicaciones_RowDataBound">
        <Columns>           
            <asp:BoundField HeaderText="Receptor" DataField="nombreReceptor" />
            <asp:BoundField HeaderText="Filial" DataField="filial" />
            <asp:BoundField HeaderText="Posibles Grupos Donantes" DataField="posiblesDonantes" />
            <asp:BoundField HeaderText="Urgencia" DataField="urgencia" />
            <asp:BoundField HeaderText="Donantes Necesarios" DataField="donantesNecesarios" />
            <asp:BoundField HeaderText="Horarios" DataField="horarios" />
            <asp:BoundField HeaderText="Fecha Limite" DataField="fechaLimite" />
            
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-primary" />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClientClick="return confirm('¿Está seguro de que desea eliminar esta publicación?');" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</asp:Content>
