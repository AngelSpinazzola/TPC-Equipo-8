<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminEdicionPublicacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminEdicionPublicacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center">Edicion de la Publicacion</h1>

    <div class="container">
        <div class="row g-3">
            <asp:TextBox ID="txtIdPublicacion" runat="server" type="text" class="form-control" Visible="false"></asp:TextBox>
            <div class="col-12">
                <label for="txtFilial" class="form-label">Filial</label>
                <asp:TextBox ID="txtFilial" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12">
                <label for="txtNombreReceptor" class="form-label">Nombre del receptor</label>
                <asp:TextBox ID="txtNombreReceptor" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12">
                <label for="txtGrupoSanguineo" class="form-label">Grupo sanguineo</label>
                <asp:TextBox ID="txtGrupoSanguineo" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12">
                <label for="txtDonantesNecesarios" class="form-label">Donantes necesarios</label>
                <asp:TextBox ID="txtDonantesNecesarios" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12">
                <label for="txtHorarios" class="form-label">Horarios</label>
                <asp:TextBox ID="txtHorarios" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12">
                <label for="txtFechaLimite" class="form-label">Fecha límite</label>
                <asp:TextBox ID="txtFechaLimite" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <asp:TextBox ID="txtEstado" runat="server" type="text" class="form-control" Visible="false"></asp:TextBox>

            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#<%= txtFechaLimite.ClientID %>').datepicker({
                format: 'dd/mm/yyyy',
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>

</asp:Content>
