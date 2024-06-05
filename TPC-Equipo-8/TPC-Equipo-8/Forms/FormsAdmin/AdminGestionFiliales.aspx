<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminGestionFiliales.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminGestionFiliales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .truncate {
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .tooltip-inner {
            white-space: pre-wrap;
            max-width: 100px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">GESTION DE LAS FILIALES</h1>
    <div class="container-fluid text-center">
        <asp:GridView ID="dgvFiliales" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="false" OnRowDataBound="dgvFiliales_RowDataBound">
            <Columns>
                <asp:BoundField HeaderText="Filial" DataField="nombre" HeaderStyle-CssClass="table-header" ItemStyle-CssClass="table-item" />

                <asp:TemplateField HeaderText="Telefono">
                    <HeaderStyle CssClass="table-header" Width="150px" />
                    <ItemStyle CssClass="table-item" Width="150px"/>
                    <ItemTemplate>
                        <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("telefono") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Horario de Atención">
                    <HeaderStyle CssClass="table-header" />
                    <ItemStyle CssClass="table-item truncate" />
                    <ItemTemplate>
                        <asp:Label ID="lblHorarioAtencion" runat="server" Text='<%# Eval("horarioAtencion") %>' CssClass="label-text truncate" ToolTip='<%# Eval("horarioAtencion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Correo">
                    <HeaderStyle CssClass="table-header" />
                    <ItemStyle CssClass="table-item truncate" />
                    <ItemTemplate>
                        <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("correo") %>' CssClass="label-text truncate" ToolTip='<%# Eval("correo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Foto">
                    <HeaderStyle CssClass="table-header" Width="200px" />
                    <ItemStyle CssClass="table-item" Width="200px" Height="100px" />
                    <ItemTemplate>
                        <a href="#" onclick="showImageModal('<%# Eval("urlImagen") %>')">
                            <img src='<%# Eval("urlImagen") %>' class="img-thumbnail" style="width: 150px; margin: auto;" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Web">
                    <HeaderStyle CssClass="table-header" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:HyperLink ID="hlWeb" runat="server" NavigateUrl='<%# Eval("urlWeb") %>' Text="Link" Target="_blank"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Direccion">
                    <HeaderStyle CssClass="table-header" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:Label ID="lblDireccion" runat="server" Text='<%# Eval("idFilial") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Acciones">
                    <HeaderStyle CssClass="table-header" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-primary btn-sm" CommandName="Edit">
                            <i class="fas fa-edit fa-sm"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger btn-sm" CommandName="Delete" OnClientClick="return confirm('¿Está seguro de que desea eliminar esta publicación?');">
                            <i class="fas fa-trash fa-sm"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img id="modalImage" src="#" class="img-fluid" style="margin: auto;" alt="Foto Filial">
                </div>
            </div>
        </div>
    </div>

    <script>
        function showImageModal(imageUrl) {
            document.getElementById('modalImage').src = imageUrl;
            $('#imageModal').modal('show');
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</asp:Content>
