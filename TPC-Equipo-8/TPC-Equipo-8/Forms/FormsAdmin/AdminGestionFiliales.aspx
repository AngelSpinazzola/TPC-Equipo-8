<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGestionFiliales.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminGestionFiliales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>GESTION DE LAS FILIALES</h1>
    <asp:GridView ID="dgvFiliales" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="dgvFiliales_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="Filial" DataField="nombre" />
            <asp:BoundField HeaderText="Telefono" DataField="telefono" />
            <asp:BoundField HeaderText="Horario de Atención" DataField="horarioAtencion" />
            <asp:BoundField HeaderText="Correo" DataField="correo" />


            <asp:TemplateField HeaderText="Foto Filial">
                <ItemTemplate>
                    <asp:Image ID="imgFotoFilial" runat="server" ImageUrl='<%# Eval("urlImagen") %>' Width="100px" Height="100px" />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:BoundField HeaderText="Web" DataField="urlWeb" />
            
            <asp:TemplateField HeaderText="Direccion">
            <ItemTemplate>
                <asp:Label ID="lblDireccion" runat="server" Text='<%# Eval("idFilial") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-primary" />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClientClick="return confirm('¿Está seguro de que desea eliminar esta publicación?');" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</asp:Content>
