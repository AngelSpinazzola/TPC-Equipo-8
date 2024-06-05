<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminEdicionFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminEdicionFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center">Edicion de la Filial</h1>

    <div class="container">
        <div class="row g-3">
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
                <asp:TextBox ID="txtAltura" runat="server" type="number" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label for="txtPiso" class="form-label">Piso</label>
                <asp:TextBox ID="txtPiso" runat="server" type="number" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label for="txtDepartamento" class="form-label">Departamento</label>
                <asp:TextBox ID="txtDepartamento" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-5">
                <label for="txtLocalidad" class="form-label">Localidad</label>
                <asp:TextBox ID="txtLocalidad" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-5">
                <label for="txtCiudad" class="form-label">Ciudad</label>
                <asp:TextBox ID="txtCiudad" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label for="txtCodigoPostal" class="form-label">Codigo Postal</label>
                <asp:TextBox ID="txtCodigoPostal" runat="server" type="number" class="form-control"></asp:TextBox>
            </div>

            <button type="submit" class="btn btn-primary">Aceptar</button>
        </div>
    </div>


</asp:Content>
