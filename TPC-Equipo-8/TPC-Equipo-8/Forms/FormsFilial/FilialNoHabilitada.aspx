<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialNoHabilitada.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialNoHabilitada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center" style="margin: 30px">No es posible crear una publicación</h2>
    <div class="container text-center">
    <p>
        Todavía no estas disponible como filial habilitada para crear publicaciones. 
        Si todos tus datos son correctos, un administrador debería habilitarte pronto.
    </p>
    <p>Para acelerar la habilitación, podes completar todos los datos de la filial en tu perfil</p>
    <div class="justify-content-start mt-5">
        <a href="FilialPerfil.aspx" class="btn btn-customContinuar">Ir a mi perfil</a>
    </div>
        </div>
</asp:Content>
