<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RegistroFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.RegistroFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h3 style="margin-top: 60px;">Completá los datos para crear tu cuenta</h3>
            </div>
            <div class="container d-flex justify-content-center">
                <div class="form-container mt-4 custom-login">
                    <div class="mb-3">
                        <label for="txtRegistroNombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" placeholder="Nombre de Filial" ID="txtRegistroNombre" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroTelefono" class="form-label">Telefono</label>
                        <asp:TextBox runat="server" placeholder="Telefono" ID="txtRegistroTelefono" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroProvincia" class="form-label">Provincia</label>
                        <asp:TextBox runat="server" placeholder="Provincia" ID="txtRegistroProvincia" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroCiudad" class="form-label">Ciudad</label>
                        <asp:TextBox runat="server" placeholder="Ciudad" ID="txtRegistroCiudad" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroLocalidad" class="form-label">Localidad</label>
                        <asp:TextBox runat="server" placeholder="Localidad" ID="txtRegistroLocalidad" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroCodigoPostal" class="form-label">Código postal</label>
                        <asp:TextBox runat="server" placeholder="Código postal" ID="txtCodigoPostal" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroCalle" class="form-label">Calle</label>
                        <asp:TextBox runat="server" placeholder="Calle" ID="txtRegistroCalle" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroAltura" class="form-label">Altura</label>
                        <asp:TextBox runat="server" placeholder="Altura" ID="txtRegistroAltura" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroEmail" class="form-label">Email</label>
                        <asp:TextBox runat="server" placeholder="ejemplo@filial.com" ID="txtRegistroEmail" CssClass="form-control" />
                    </div>
                    <div class="mb-5">
                        <label for="txtRegistroPass" class="form-label">Contraseña</label>
                        <asp:TextBox runat="server" placeholder="******" ID="txtRegistroPass" CssClass="form-control" type="password" />
                    </div>

                    <div class="d-flex justify-content-end mb-3">
                        <a href="Registro.aspx" style="color: #c12222; margin: 20px; margin-top: -20px;">Soy Donante</a>
                    </div>

                    <div class="d-grid" style="margin-bottom: 20px; margin-top: -20px;">
                        <asp:Button Text="Continuar" ID="btnContinuarRegistro" OnClick="btnContinuarRegistro_Click" runat="server" CssClass="btn btn-customContinuar" />
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="Default.aspx" style="color: #c12222;">Cancelar</a>
                        <a href="LogIn.aspx" style="color: #c12222;">Ya tengo una cuenta</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
