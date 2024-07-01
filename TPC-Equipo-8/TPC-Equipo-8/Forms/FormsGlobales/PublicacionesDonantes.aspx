<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="PublicacionesDonantes.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.PublicacionesDonantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 25px;">
        <div class="row">
            <asp:Repeater ID="repPublicaciones" runat="server">
                <ItemTemplate>
                    <div class="col-12 col-md-4 mb-4 d-flex align-items-stretch" >
                        <div class="card shadow-sm" style="width: 25rem; border: 0;">
                            <div class="card-body">
                                <h5 class="card-title text-center"><strong><%# Eval("nombreReceptor") %></strong></h5>
                                <p class="card-subtitle text-center"><%# Eval("filial") %></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item" style="font-size: 13px; "><strong>Grupo receptor: </strong><%# Eval("grupoSanguineo") %></li>
                                <li class="list-group-item" style="font-size: 13px; "><strong>Donantes: </strong><%# Eval("posiblesDonantes") %></li>
                                <li class="list-group-item" style="font-size: 13px; "><strong>Urgencia: </strong><%# Eval("urgencia") %></li>
                                <li class="list-group-item" style="font-size: 13px; "><strong>Donantes necesarios: </strong><%# Eval("donantesNecesarios") %></li>
                                <li class="list-group-item" style="font-size: 13px; "><strong>Fecha Limite: </strong><%# Eval("fechaLimite", "{0:dd/MM/yyyy}") %></li>
                            </ul>
                            <div class="card-body d-grid">
                                <asp:Button ID="btnDonar" OnClick="btnDonar_Click" runat="server" CssClass="btn btn-customDonar" Text="¡Quiero Donar!" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
