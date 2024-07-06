<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialHome.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="rptFilialDetails" runat="server">
        <ItemTemplate>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card border-light mb-3 shadow-sm">
                            <div class="card-body">
                                <h2 class="card-title"><%# Eval("nombre") %></h2>
                                <hr>
                                <p><strong><i class="fas fa-phone"></i>Teléfono:</strong> <%# Eval("telefono") %></p>
                                <p><strong><i class="fas fa-clock"></i>Horario de Atención:</strong> <%# Eval("horarioAtencion") %></p>
                                <p><strong><i class="fas fa-envelope"></i>Correo:</strong> <%# Eval("correo") %></p>
                                <p><strong><i class="fas fa-map-marker-alt"></i>Dirección:</strong> <%# Eval("direccion.calle") %> <%# Eval("direccion.altura") %>, <%# Eval("direccion.localidad") %>, <%# Eval("direccion.provincia") %></p>
                                <p><strong><i class="fas fa-globe"></i>Sitio Web: </strong><a href='<%# Eval("urlWeb") %>' target="_blank"><%# Eval("urlWeb") %></a></p>
                                <div class="mt-4">
                                    <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-customEditar"
                                        CommandArgument='<%# Eval("idFilial") %>' CommandName="Edit">
                                    <i class="fas fa-edit"></i> Editar
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <img src='<%# String.IsNullOrEmpty(Eval("urlImagen") as string) ? "https://visualmedicacloud.com/wp-content/uploads/2022/03/Image_Placeholder_3-131220211647-7.jpg" : Eval("urlImagen") %>'
                            alt='<%# String.IsNullOrEmpty(Eval("urlImagen") as string) ? "Imagen placeholder" : "Imagen de la filial" %>'
                            class="img-fluid rounded shadow-sm"
                            style="max-height: 400px; width: 100%; object-fit: cover; margin: auto;">
                    </div>
                </div>
        </ItemTemplate>
    </asp:Repeater>

    <hr style="border: 0; height: 2px; background: black" />

    <%--LISTA DE DONANTES DE LA FILIAL --%>

    <h1 class="text-center">Tus últimos donantes <i class="fa-solid fa-heart"></i></h1>
    <div class="container-fluid" style="width: 50%;">


        <asp:GridView ID="dgvHomeFilialDonantes" runat="server" CssClass="table table-bordered table-hover custom-table" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Donante">
                    <HeaderStyle CssClass="table-header text-center" Width="150px" />
                    <ItemStyle CssClass="table-item text-center" Width="150px" />
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") + " " + Eval("Apellido") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha donación">
                    <HeaderStyle CssClass="table-header text-center" Width="150px" />
                    <ItemStyle CssClass="table-item text-center" Width="150px" />
                    <ItemTemplate>
                        <asp:Label ID="lblFechaRealizada" runat="server" Text='<%# Eval("FechaRealizada") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div class="text-center">
                    Aún no tuviste donantes. ¡Ya van a llegar!
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</asp:Content>
