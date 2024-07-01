<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialGestionPublicaciones.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialGestionPublicaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center" style="margin: 30px">Mis Publicaciones</h2>

    <div class="text-center">
        <a href="FilialAltaPublicacion.aspx" class="btn btn-customCrear"">Nueva Publicacion <i class="fa-solid fa-circle-plus"></i><span class="overlay"></span></a>
    </div>

    <div class="container" style="margin-top: 25px;">
        <div class="row">
            <asp:Repeater ID="repPublicacionesFilial" runat="server">
                <ItemTemplate>
                    <div class="col-12 col-md-4 mb-4 d-flex align-items-stretch">
                        <div class="card shadow-sm" style="width: 25rem; border: 0;">
                            <div class="card-body">
                                <h5 class="card-title text-center"><strong><%# Eval("nombreReceptor") %></strong></h5>
                                <p class="card-subtitle text-center"><%# Eval("filial") %></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item" style="font-size: 13px;"><strong>Grupo receptor: </strong><%# Eval("grupoSanguineo") %></li>
                                <li class="list-group-item" style="font-size: 13px;"><strong>Posibles Donantes: </strong><%# Eval("posiblesDonantes") %></li>
                                <li class="list-group-item" style="font-size: 13px;"><strong>Urgencia: </strong><%# Eval("urgencia") %></li>
                                <li class="list-group-item" style="font-size: 13px;"><strong>Donantes necesarios: </strong><%# Eval("donantesNecesarios") %></li>
                                <li class="list-group-item" style="font-size: 13px;"><strong>Fecha Limite: </strong><%# Eval("fechaLimite", "{0:dd/MM/yyyy}") %></li>
                            </ul>

                            <div class="card-body d-grid gap-2">
                                <asp:LinkButton ID="EditarPublicacion" runat="server" CssClass="btn btn-customEditar" OnClick="EditarPublicacion_Click" CommandArgument='<%# Eval("IdPublicacion") %>' CommandName="IdPublicacion">
                                    Editar <i class="fa-solid fa-pen-to-square"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="BtnEliminar" runat="server" CssClass="btn btn-customEliminar" OnClientClick="return confirm('¿Estás seguro que deseas eliminar esta publicación?');" OnClick="BtnEliminar_Click" CommandArgument='<%# Eval("IdPublicacion") %>' CommandName="IdPublicacion">
                                    Eliminar <i class="fa-solid fa-trash"></i>
                                </asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>






</asp:Content>
