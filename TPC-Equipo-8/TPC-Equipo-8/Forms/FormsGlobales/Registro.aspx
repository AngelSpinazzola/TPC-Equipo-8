<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.Registro" %>

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

                    <%-- <div class="mb-3">
                        <label for="txtRegistroApellido" class="form-label">Apellido</label>
                        <asp:TextBox runat="server" placeholder="Perez" ID="txtRegistroApellido" CssClass="form-control" />
                    </div>--%>

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
