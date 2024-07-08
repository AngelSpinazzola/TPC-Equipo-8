<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGestionFiliales.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminGestionFiliales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center" style="margin-top: 40px; margin-bottom: 40px;">Gestión de nuevas Filiales</h1>
    <div class="container-fluid" style="max-width: 80%;">
        <asp:GridView ID="dgvFiliales" runat="server" CssClass="table table-hover table-bordered custom-table" AutoGenerateColumns="false" OnRowDataBound="dgvFiliales_RowDataBound" DataKeyNames="idFilial">
            <Columns>

                <asp:BoundField DataField="idFilial" Visible="false" />

                <asp:BoundField HeaderText="Filial" DataField="nombre" HeaderStyle-CssClass="table-header text-center" ItemStyle-CssClass="table-item" />

                <asp:TemplateField HeaderText="Telefono">
                    <HeaderStyle CssClass="table-header text-center" Width="150px" />
                    <ItemStyle CssClass="table-item" Width="150px" />
                    <ItemTemplate>
                        <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("telefono") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Correo">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item truncate" />
                    <ItemTemplate>
                        <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("correo") %>' CssClass="label-text truncate" ToolTip='<%# Eval("correo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Direccion">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:Label ID="lblDireccion" runat="server" Text='<%# Eval("idFilial") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Acciones">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item text-center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-warning btn-sm" CommandArgument='<%# Eval("idFilial") %>' CommandName="idFilial" OnClick="btnEditar_Click" ToolTip="Editar">
                            <i class="fas fa-edit fa-sm"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnHabilitar" runat="server"
                            CssClass="btn btn-success btn-success btn-sm"
                            CommandArgument='<%# Eval("idFilial") %>'
                            OnClick="btnHabilitar_Click"
                            OnClientClick="return confirmarHabilitar();"
                            ToolTip="Habilitar">
    <i class="fa-solid fa-check"></i>
</asp:LinkButton>

                        <asp:LinkButton ID="btnDesactivar" runat="server"
                            CssClass="btn btn-danger btn-sm"
                            CommandArgument='<%# Eval("idFilial") %>'
                            OnClick="btnDesactivar_Click"
                            OnClientClick="return confirmarEliminar();"
                            ToolTip="Eliminar">
    <i class="fas fa-trash fa-sm"></i>
</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
    function confirmarHabilitar() {
        return confirm("¿Está seguro que desea habilitar esta filial?");
    }

    function confirmarEliminar() {
        return confirm("¿Está seguro que desea eliminar esta filial?");
    }
</script>

</asp:Content>
