<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonantePerfil.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonantePerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../Estilos/EstilosGlobales.css" />
    <style>
        .table-item {
            vertical-align: middle;
        }

            .table-item .d-flex {
                height: 100%;
            }

                .table-item .d-flex > * {
                    margin: auto;
                }

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

        .form-control[readonly] {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        #resumenCuenta {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row general-container-profile">
            <div class="col-md-3 col-lg-2 barra-lateral">
                <nav class="menu d-flex flex-column">
                    <a href="#" class="d-flex align-items-center" onclick="showResumenCuenta()"><i class="fas fa-home me-2"></i><span>Resumen</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showEditarPerfil()"><i class="fas fa-user-edit me-2"></i><span>Editar Perfil</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showContraseña()"><i class="fas fa-lock me-2"></i><span>Contraseña</span></a>
                </nav>
            </div>
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">


                <main class="main-content text-center">
                    <div class="container-fluid">

                        <!-- SECCION RESUMEN DE LA CUENTA -->
                        <div id="resumenCuenta" class="form-container">
                            <h3 id="tituloProximaDonacion" runat="server" class="text-center">Tu próxima donacion</h3>
                            <!-- Contenedor del GridView -->
                            <asp:GridView ID="dgvProximaDonacion" runat="server" CssClass="table table-bordered table-hover custom-table" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Nombre receptor">
                                        <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                        <ItemStyle CssClass="table-item text-center" Width="150px" />
                                        <ItemTemplate>
                                            <div class="d-flex align-items-center" style="height: 100%;">
                                                <asp:Label ID="lblNombreReceptor" runat="server" Text='<%# Eval("NombreReceptor") %>' CssClass="label-text"></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hora confirmación">
                                        <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                        <ItemStyle CssClass="table-item text-center" Width="150px" />
                                        <ItemTemplate>
                                            <div class="d-flex align-items-center" style="height: 100%;">
                                                <asp:Label ID="lblFechaTurno" runat="server" Text='<%# Eval("FechaRegistro") %>' CssClass="label-text"></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Filial">
                                        <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                        <ItemStyle CssClass="table-item text-center" Width="150px" />
                                        <ItemTemplate>
                                            <div class="d-flex justify-content-between align-items-center" style="height: 100%;">
                                                <asp:Label ID="lblNombreFilial" runat="server" Text='<%# Eval("nombreFilial") %>' CssClass="label-text"></asp:Label>
                                                <asp:Button ID="btnComoLlego" runat="server" Text="¿Como llego?" CssClass="btn btn-customComoLlego ms-2" OnClick="btnComoLlego_Click" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <h3 id="tituloUltimasDonaciones" runat="server" class="text-center">Tus últimas donaciones</h3>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="dgvUltimasDonaciones" runat="server" CssClass="table table-bordered table-hover custom-table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Filial">
                                                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                                <ItemStyle CssClass="table-item text-center" Width="150px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNombreFilial" runat="server" Text='<%# Eval("NombreFilial") %>' CssClass="label-text"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Fecha de donación">
                                                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                                <ItemStyle CssClass="table-item text-center" Width="150px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFechaDonacion" runat="server" Text='<%# Eval("FechaRealizada") %>' CssClass="label-text"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>


                        <!-- SECCION EDITAR PERFIL -->

                        <div id="editarPerfil" style="display: none;" class="form-container">
                            <h1 class="text-center form-title">Edición del perfil</h1>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtNombre" class="form-label">Nombre</label>
                                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtNombre"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                runat="server"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtNombre"
                                                runat="server"
                                                ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]{3,50}$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtApellido" class="form-label">Apellido</label>
                                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtApellido"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtApellido"
                                                runat="server"
                                                ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]{3,50}$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtEmail" class="form-label">Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Style="background-color: #f0f0f0; cursor: not-allowed;" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtDni" class="form-label">DNI</label>
                                            <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtFechaAlta" class="form-label">Fecha de Alta</label>
                                            <asp:TextBox ID="txtFechaAlta" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtNombreGrupoSanguineo" class="form-label">Grupo Sanguíneo</label>
                                            <asp:DropDownList ID="DropDownTipoSangre" runat="server" CssClass="form-select">
                                                <asp:ListItem Text="A+" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="A-" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="B+" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="B-" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="AB+" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="AB-" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="O+" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="O-" Value="8"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtCalle" class="form-label">Calle</label>
                                            <asp:TextBox ID="txtCalle" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtCalle"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />

                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtAltura" class="form-label">Altura</label>
                                            <asp:TextBox ID="txtAltura" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtAltura"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten números enteros."
                                                ControlToValidate="txtAltura"
                                                runat="server"
                                                ValidationExpression="^\d+$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtCp" class="form-label">Código Postal</label>
                                            <asp:TextBox ID="txtCp" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtCp"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten números y letras. Máximo 10 caracteres."
                                                ControlToValidate="txtCp"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z0-9]{1,10}$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtLocalidad" class="form-label">Localidad</label>
                                            <asp:TextBox ID="txtLocalidad" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtLocalidad"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 75 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtLocalidad"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,75}$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtProvincia" class="form-label">Provincia</label>
                                            <asp:TextBox ID="txtProvincia" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtProvincia"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtProvincia"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,50}$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtCiudad" class="form-label">Ciudad</label>
                                            <asp:TextBox ID="txtCiudad" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtCiudad"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 75 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtCiudad"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,75}$"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="datosPersonales" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 text-center">
                                    <div class="profile-image-container">
                                        <asp:Image ID="imgNuevoPerfil" runat="server" CssClass="profile-image" />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Imagen Perfil</label>
                                        <input type="file" id="txtImagen" runat="server" class="form-control" accept="image/*" onchange="previewImage(this);" />
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <asp:Button ID="btnAceptar" runat="server" Text="Guardar cambios" CssClass="btn btn-customContinuar" OnClick="btnAceptar_Click" />
                            </div>
                        </div>

                        <!-- SECCION CONTRASEÑA -->

                        <div id="contraseña" style="display: none;">

                            <div class="form-wrapper">
                                <div class="content-wrapper">
                                    <div class="text-center mt-4">
                                        <h3 style="margin-top: 60px;">Cambiar contraseña</h3>
                                    </div>
                                    <div class="container d-flex justify-content-center">
                                        <div class="form-container mt-4 custom-login">
                                            <div class="mb-5">
                                                <label for="txtContrasenaActual" class="form-label">Contraseña actual</label>
                                                <asp:TextBox ID="txtContrasenaActual" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator1"
                                                    runat="server"
                                                    ErrorMessage="El campo es requerido"
                                                    ControlToValidate="txtContrasenaActual"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="cambiarContrasena" />
                                            </div>
                                            <div class="mb-5">
                                                <label for="txtContrasenaNueva" class="form-label">Contraseña nueva</label>
                                                <asp:TextBox ID="txtContrasenaNueva" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator2"
                                                    runat="server"
                                                    ErrorMessage="El campo es requerido"
                                                    ControlToValidate="txtContrasenaNueva"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="cambiarContrasena" />
                                            </div>
                                            <div class="mb-5">
                                                <label for="txtRepetirContrasena" class="form-label">Repetir contraseña nueva</label>
                                                <asp:TextBox ID="txtRepetirContrasena" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator3"
                                                    runat="server"
                                                    ErrorMessage="El campo es requerido"
                                                    ControlToValidate="txtRepetirContrasena"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="cambiarContrasena" />
                                                <asp:CompareValidator
                                                    ID="CompareValidator1"
                                                    runat="server"
                                                    ErrorMessage="Las contraseñas no coinciden."
                                                    ControlToValidate="txtRepetirContrasena"
                                                    ControlToCompare="txtContrasenaNueva"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="cambiarContrasena" />
                                            </div>
                                            <div class="row mt-4">
                                                <asp:Button ID="btnCambiarContrasena" runat="server" Text="Guardar cambios" CssClass="btn btn-customContinuar" OnClick="btnCambiarContrasena_Click" CausesValidation="true" ValidationGroup="cambiarContrasena" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>

    <script>
        function desactivarValidadores() {
            Page_Validators.forEach(validator => {
                validator.enabled = false;
            });
        }

        function activarValidadores() {
            Page_Validators.forEach(validator => {
                validator.enabled = true;
            });
        }
        function showResumenCuenta() {
            document.getElementById('resumenCuenta').style.display = 'block';
            document.getElementById('editarPerfil').style.display = 'none';
            document.getElementById('contraseña').style.display = 'none';
        }

        function showEditarPerfil() {
            document.getElementById('resumenCuenta').style.display = 'none';
            document.getElementById('editarPerfil').style.display = 'block';
            document.getElementById('contraseña').style.display = 'none';
        }

        function showContraseña() {
            document.getElementById('resumenCuenta').style.display = 'none';
            document.getElementById('editarPerfil').style.display = 'none';
            document.getElementById('contraseña').style.display = 'block';
        }
        function logout() {
            var pageValidators = Page_Validators;
            if (pageValidators) {
                for (var i = 0; i < pageValidators.length; i++) {
                    ValidatorEnable(pageValidators[i], false);
                }
            }

            window.location.href = '../FormsGlobales/Default.aspx';
        }
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('<%= imgNuevoPerfil.ClientID %>').src = e.target.result;
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        function mostrarMensaje(mensaje) {
            Swal.fire({
                icon: 'info',
                title: 'Mensaje',
                text: mensaje,
                showCancelButton: false,
                confirmButtonText: 'OK'
            });
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
