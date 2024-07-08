<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="RegistroFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.RegistroFilial" %>

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
                <h3 style="margin-top: 40px;">Completá los datos para crear tu cuenta</h3>
            </div>
            <div class="container d-flex justify-content-center">
                <div class="form-container mt-2 custom-login" style="max-width: 800px;">


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

                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label for="txtRegistroNombre" class="form-label">Nombre</label>
                            <asp:TextBox runat="server" placeholder="Nombre de Filial" ID="txtRegistroNombre" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroNombre" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtRegistroNombre" ErrorMessage="Maximo 30 caracteres." ValidationExpression="^{1,30}$" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label for="txtRegistroEmail" class="form-label">Email</label>
                            <asp:TextBox runat="server" placeholder="ejemplo@filial.com" ID="txtRegistroEmail" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroEmail" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtRegistroEmail" ErrorMessage="Formato de correo electrónico no válido." ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="txtRegistroTelefono" class="form-label">Teléfono</label>
                            <asp:TextBox runat="server" placeholder="Teléfono" ID="txtRegistroTelefono" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroTelefono" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator runat="server" ErrorMessage="Formato de teléfono inválido. Debe tener al menos 6 caracteres y acepta guiones." ControlToValidate="txtRegistroTelefono" ValidationExpression="^[0-9\-]{6,30}$" Display="Dynamic" ForeColor="Red" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtRegistroProvincia" class="form-label">Provincia</label>
                            <asp:TextBox runat="server" placeholder="Provincia" ID="txtRegistroProvincia" CssClass="form-control" />
                             <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroProvincia" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="txtRegistroCiudad" class="form-label">Ciudad</label>
                            <asp:TextBox runat="server" placeholder="Ciudad" ID="txtRegistroCiudad" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroCiudad" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtRegistroLocalidad" class="form-label">Localidad</label>
                            <asp:TextBox runat="server" placeholder="Localidad" ID="txtRegistroLocalidad" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroLocalidad" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="txtCodigoPostal" class="form-label">Código Postal</label>
                            <asp:TextBox runat="server" placeholder="Código Postal" ID="txtCodigoPostal" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtCodigoPostal" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtRegistroCalle" class="form-label">Calle</label>
                            <asp:TextBox runat="server" placeholder="Calle" ID="txtRegistroCalle" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroCalle" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="txtRegistroAltura" class="form-label">Altura</label>
                            <asp:TextBox runat="server" placeholder="Altura" ID="txtRegistroAltura" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroAltura" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtRegistroPass" class="form-label">Contraseña</label>
                            <asp:TextBox runat="server" placeholder="******" ID="txtRegistroPass" CssClass="form-control" type="password" />
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroPass" runat="server" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>


                    <div class="d-grid" style="margin-bottom: 20px;">
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
