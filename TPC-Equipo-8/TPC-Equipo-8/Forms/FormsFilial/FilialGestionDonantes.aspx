<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialGestionDonantes.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialGestionDonantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>GESTION DE DONANTES DE LA FILIAL:</h2>
    
   
    <div class="container" style="margin-top: 35px;">
    <h3 class="text-center">Lista de Próximas Donaciones: </h3>
    <asp:Repeater ID="RepProximasDonaciones" runat="server">
        <HeaderTemplate>
            <div class="table">
                <div class="row">
                    <div class="col">Nombre Donante</div>
                    <div class="col">Apellido Donante</div>
                    <div class="col">DIN</div>
                    <div class="col">Grupo Sanguíneo Donante</div>
                    <div class="col">Nombre Receptor</div>
                    <div class="col">Grupo Sanguíneo Receptor</div>
                    <div class="col">Donantes Necesarios</div>
                    <div class="col">Urgencia</div>
                    <div class="col">Fecha Registro</div>
                    <div class="col">Fecha Límite</div>
                </div>
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="table">
                <div class="row">
                    <div class="col"><%# Eval("NombreDonante") %></div>
                    <div class="col"><%# Eval("ApellidoDonante") %></div>
                    <div class="col"><%# Eval("DIN") %></div>
                    <div class="col"><%# Eval("GrupoSanguineoDonante") %></div>
                    <div class="col"><%# Eval("NombreReceptor") %></div>
                    <div class="col"><%# Eval("GrupoSanguineoReceptor") %></div>
                    <div class="col"><%# Eval("DonantesNecesarios") %></div>
                    <div class="col"><%# Eval("Urgencia") %></div>
                    <div class="col"><%# Eval("FechaRegistro", "{0:dd/MM/yyyy}") %></div>
                    <div class="col"><%# Eval("FechaLimite", "{0:dd/MM/yyyy}") %></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>





</asp:Content>
