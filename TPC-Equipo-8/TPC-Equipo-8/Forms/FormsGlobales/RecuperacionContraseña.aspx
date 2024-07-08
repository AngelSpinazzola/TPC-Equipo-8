<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RecuperacionContraseña.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.RecuperacionContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

    <style>
        .swal2-confirm {
            width: 150px !important;
            background-color: #c12222 !important;
            color: white !important;
            border-radius: 100px !important;
            border: 2px solid #c12222 !important;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2) !important;
            transition: background-color 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease !important;
        }

            .swal2-confirm:hover {
                background-color: white !important;
                color: #c12222 !important;
                border: 2px solid #c12222 !important;
            }
    </style>

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

    <script>
        function mostrarMensaje(mensaje, icon) {
            Swal.fire({
                icon: icon,
                text: mensaje,
                showCancelButton: false,
                confirmButtonText: 'OK'
            });
        }
    </script>
</asp:Content>
