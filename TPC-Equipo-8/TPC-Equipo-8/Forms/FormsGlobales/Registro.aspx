<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.Registro" %>

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

                    <div class="row mb-3">
                        <h5 class="text-center">¿Querés inscribirte para donar o para afiliar tu sede a
                            <label style="font-weight: 650;">sanguis</label>?</h5>

                        <div class="col-6 ps-1">
                            <a href="Registro.aspx" class="btn btn-customEliminar btn w-100">Quiero donar</a>
                        </div>
                        <div class="col-6 pe-1">
                            <a href="RegistroFilial.aspx" class="btn btn-customEliminar btn w-100">Soy filial</a>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="txtRegistroNombre" class="form-label">Nombre y Apellido</label>
                        <asp:TextBox runat="server" placeholder="Juan Perez" ID="txtRegistroNombre" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="txtRegistroEmail" class="form-label">Email</label>
                        <asp:TextBox runat="server" placeholder="ejemplo@dona.com" ID="txtRegistroEmail" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroDni" class="form-label">DNI</label>
                        <asp:TextBox runat="server" placeholder="DNI" ID="txtRegistroDni" CssClass="form-control" />
                    </div>
                    <div class="mb-5">
                        <label for="txtRegistroPass" class="form-label">Contraseña</label>
                        <asp:TextBox runat="server" placeholder="******" ID="txtRegistroPass" CssClass="form-control" type="password" />
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
