<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialHome.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <h1>HOME DE LA FILIAL</h1>--%>
    <h1 class="text-center">HOME DE LA FILIAL</h1>
   <%-- <asp:Label ID="LabelPrueba" runat="server" Text="ID FILIAL"></asp:Label>
    <asp:TextBox ID="TextBoxPrueba" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonPrueba" runat="server" Text="Login" OnClick="ButtonPrueba_Click" />--%>

    <%--INFORMACION DE LA FILIAL --%>
    <div class="container-fluid">
        <asp:GridView ID="dgvHomeFilial" runat="server" CssClass="table table-hover table-bordered" 
            AutoGenerateColumns="false" OnRowDataBound="dgvHomeFilial_RowDataBound">
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

                <asp:TemplateField HeaderText="Horario de Atención">
                    <HeaderStyle CssClass="table-header text-center" />
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
                    <HeaderStyle CssClass="table-header text-center" Width="100px" />
                    <ItemStyle CssClass="table-item text-center" Width="100px" Height="50px" />
                    <ItemTemplate>
                        <a href="#" onclick="showImageModal('<%# Eval("urlImagen") %>')">
                            <img src='<%# Eval("urlImagen") %>' class="img-thumbnail" style="width: 70px; height: 70px; margin: auto;" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Web">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:HyperLink ID="hlWeb" runat="server" NavigateUrl='<%# Eval("urlWeb") %>' Text="Link" Target="_blank"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Direccion">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:Label ID="lblDireccion" runat="server" Text='<%# Eval("idFilial") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

               <asp:TemplateField HeaderText="Editar">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("idFilial") %>' CommandName="idFilial">
                        <i class="fas fa-edit fa-sm"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

   
     <%--LISTA DE DONANTES DE LA FILIAL --%>
    <h1 class="text-center">LISTA DE TUS DONANTES</h1>
    <div class="container-fluid">
    <asp:GridView ID="dgvHomeFilialDonantes" runat="server" CssClass="table table-bordered" 
        AutoGenerateColumns="false">
        <Columns>
            
            <asp:TemplateField HeaderText="Nombre">
                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                <ItemStyle CssClass="table-item text-center " Width="150px" />
                <ItemTemplate>
                    <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>' CssClass="label-text"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Apellido">
                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                <ItemStyle CssClass="table-item text-center" Width="150px" />
                <ItemTemplate>
                    <asp:Label ID="lblApellido" runat="server" Text='<%# Eval("Apellido") %>' CssClass="label-text"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Fecha Realizada">
                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                <ItemStyle CssClass="table-item text-center" Width="150px" />
                <ItemTemplate>
                    <asp:Label ID="lblFechaRealizada" runat="server" Text='<%# Eval("FechaRealizada") %>' CssClass="label-text" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</div>



   
  <%--  <div class="container  " style="margin-top: 35px;">
         <h3 class="text-center">Lista de Donaciones: </h3>
        <asp:Repeater ID="RepHomeFilial" runat="server">
            <ItemTemplate>
                <div class="table">
                    <%# Eval("Nombre") %>
                    <%# Eval("Apellido") %>
                    <%# Eval("FechaRealizada") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>--%>

      <%--EFECTO JS --%>

    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img id="modalImage" src="#" class="img-fluid" style="margin: auto; width: 100%;" alt="Foto Filial">
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
