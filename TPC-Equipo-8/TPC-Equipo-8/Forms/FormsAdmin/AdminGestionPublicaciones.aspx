<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGestionPublicaciones.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminGestionPublicaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">GESTION DE LAS PUBLICACIONES</h1>
    <div class="container-fluid">
        <asp:GridView ID="dgvPublicaciones" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="false" OnRowDataBound="dgvPublicaciones_RowDataBound">
            <Columns>
                <asp:BoundField HeaderText="Receptor" DataField="nombreReceptor" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />
                <asp:BoundField HeaderText="Filial" DataField="filial" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />
                <asp:BoundField HeaderText="Posibles Grupos Donantes" DataField="posiblesDonantes" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />
                <asp:BoundField HeaderText="Urgencia" DataField="urgencia" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />
                <asp:BoundField HeaderText="Donantes Necesarios" DataField="donantesNecesarios" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />
                <asp:BoundField HeaderText="Horarios" DataField="horarios" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />
                <asp:BoundField HeaderText="Fecha Limite" DataField="fechaLimite" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />

                <asp:TemplateField HeaderText="Acciones">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("idPublicacion") %>' CommandName="idPublicacion" OnClick="btnEditar_Click">
                            <i class="fas fa-edit fa-sm"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDesactivar" runat="server" CssClass="btn btn-danger btn-sm" CommandName="Delete" OnClick="btnDesactivar_Click">
                            <i class="fas fa-trash fa-sm"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
