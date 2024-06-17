<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialGestionPublicaciones.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialGestionPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>GESTION DE PUBLICACIONES DE LA FILIAL</h1>

    <div class="container" style="margin-top: 25px;">
    <div class="row">
        <asp:Repeater ID="repPublicacionesFilial" runat="server">
            <ItemTemplate>
                <div class="col-12 col-md-4 mb-4 d-flex align-items-stretch">
                    <div class="card shadow-sm" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"><strong><%# Eval("nombreReceptor") %></strong></h5>
                            <p class="card-subtitle"><strong>Filial: </strong><%# Eval("filial") %></p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong>Grupo: </strong><%# Eval("grupoSanguineo") %></li>
                            <li class="list-group-item"><strong>Urgencia: </strong><%# Eval("urgencia") %></li>
                            <li class="list-group-item"><strong>Donantes Necesarios: </strong><%# Eval("donantesNecesarios") %></li>
                            <li class="list-group-item"><strong>Horarios: </strong><%# Eval("horarios") %></li>
                            <li class="list-group-item"><strong>Fecha Limite: </strong><%# Eval("fechaLimite") %></li>
                        </ul>
                        <div class="card-body">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Editar" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>






</asp:Content>
