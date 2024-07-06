<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminEdicionFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminEdicionFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="form-wrapper">
        <div class="content-wrapper">

            <h1 class="text-center" style="margin-top: 40px; margin-bottom: 40px;">Edicion de la Filial</h1>

            <div class="container custom-login" style="max-width: 80%; margin-bottom: 40px;">
                <div class="row g-3">
                    <asp:TextBox ID="txtIdUsuario" runat="server" type="text" class="form-control" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txtIdFilial" runat="server" type="text" class="form-control" Visible="false"></asp:TextBox>
                    <div class="col-12">
                        <label for="txtNombre" class="form-label">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtTelefono" class="form-label">Telefono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtHorario" class="form-label">Horario de Atención</label>
                        <asp:TextBox ID="txtHorario" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtCorreo" class="form-label">Correo</label>
                        <asp:TextBox ID="txtCorreo" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtFoto" class="form-label">Url Foto</label>
                        <asp:TextBox ID="txtFoto" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtWeb" class="form-label">Url Web</label>
                        <asp:TextBox ID="txtWeb" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>

                    <!-- DIRECCION -->

                    <div class="col-md-6">
                        <label for="txtCalle" class="form-label">Calle</label>
                        <asp:TextBox ID="txtCalle" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label for="txtAltura" class="form-label">Altura</label>
                        <asp:TextBox ID="txtAltura" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label for="txtPiso" class="form-label">Piso</label>
                        <asp:TextBox ID="txtPiso" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label for="txtDepartamento" class="form-label">Departamento</label>
                        <asp:TextBox ID="txtDepartamento" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label for="txtLocalidad" class="form-label">Localidad</label>
                        <asp:TextBox ID="txtLocalidad" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label for="txtCodigoPostal" class="form-label">Codigo Postal</label>
                        <asp:TextBox ID="txtCodigoPostal" runat="server" type="number" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label for="txtCiudad" class="form-label">Ciudad</label>
                        <asp:TextBox ID="txtCiudad" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label for="txtProvincia" class="form-label">Provincia</label>
                        <asp:TextBox ID="txtProvincia" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-customContinuar" OnClick="btnAceptar_Click" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
