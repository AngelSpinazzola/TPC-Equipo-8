<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RecuperacionContraseña.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.RecuperacionContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h3 style="margin-top: 60px;">Recuperación de contraseña</h3>
            </div>

            <div class="container d-flex justify-content-center">
                <div class="form-container mt-4 custom-login">

                    <div class="mb-3 text-center">
                        <label for="exampleInputEmail1" class="form-label">Ingresá tu email</label>
                        <asp:TextBox runat="server" placeholder="ejemplo@gmail.com" ID="txtEmail" CssClass="form-control" />
                    </div>

                    <div class="mb-5 text-center" style="margin-top: 20px;">
                        <asp:LinkButton ID="btnRecuperarContraseña" runat="server" CssClass="btn btn-customContinuar" OnClick="btnRecuperarContraseña_Click">Enviar correo de recuperación</asp:LinkButton>
                    </div>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
