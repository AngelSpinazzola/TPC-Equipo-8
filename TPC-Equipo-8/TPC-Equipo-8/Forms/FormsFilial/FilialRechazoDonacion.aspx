<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialRechazoDonacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialRechazoDonacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" style="margin-top: 25px;">
        <div class="row g-3">
            <div class="col-12">
                <label for="texNombreDonante" class="form-label">Nombre Donante</label>
                <asp:TextBox ID="TexNombreDonante" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row g-3">
            <div class="col-12">
                <label for="ApellidoDonante" class="form-label">Apellido Donante</label>
                <asp:TextBox ID="TexApeliidoDonante" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row g-3">
            <div class="col-12">
                <label for="DniDonante" class="form-label">DNI Donante</label>
                <asp:TextBox ID="TexDIN" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row g-3">
            <div class="col-12">
                <label for="txtMotivo" class="form-label">Motivo Rechazo</label>
                <asp:TextBox ID="txtMotivo" runat="server" type="text" TextMode="MultiLine" class="form-control"></asp:TextBox>
            </div>

        </div>


        <div class="row g-3">
            <div class="col-12" style="margin-top: 25px;">
                <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-success " Text="Aceptar"  OnClick="btnCrear_Click"/>
                <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger " Text="Cancelar" OnClick="btnCancelar_Click" />
            </div>
        </div>

 

    </div>



</asp:Content>
