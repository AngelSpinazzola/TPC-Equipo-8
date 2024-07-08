<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonantePerfil.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonantePerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../Estilos/EstilosGlobales.css" />
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

                        <div id="resumenCuenta">
                            <div class="row">
                                <h3 id="tituloProximaDonacion" runat="server" class="text-center">Tu próxima donacion</h3>
                                <div class="container-fluid" style="width: 50%;">
                                    <asp:GridView ID="dgvProximaDonacion" runat="server" CssClass="table table-bordered table-hover custom-table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Nombre receptor">
                                                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                                <ItemStyle CssClass="table-item text-center" Width="150px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNombreReceptor" runat="server" Text='<%# Eval("NombreReceptor") %>' CssClass="label-text"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Hora confirmación">
                                                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                                <ItemStyle CssClass="table-item text-center" Width="150px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFechaTurno" runat="server" Text='<%# Eval("FechaRegistro") %>' CssClass="label-text"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Filial">
                                                <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                                <ItemStyle CssClass="table-item text-center" Width="150px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNombreFilial" runat="server" Text='<%# Eval("nombreFilial") %>' CssClass="label-text"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <h3 id="tituloUltimasDonaciones" runat="server" class="text-center">Tus últimas donaciones</h3>
                            <div class="container-fluid" style="width: 50%;">
                                <asp:GridView ID="dgvUltimasDonaciones" runat="server" CssClass="table table-bordered table-hover custom-table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Filial">
                                            <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                            <ItemStyle CssClass="table-item text-center" Width="150px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblNombreFilial" runat="server" Text='<%# Eval("NombreFilial") %>' CssClass="label-text"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Fecha donación">
                                            <HeaderStyle CssClass="table-header text-center" Width="150px" />
                                            <ItemStyle CssClass="table-item text-center" Width="150px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblFechaDonacion" runat="server" Text='<%# Eval("FechaRealizada") %>' CssClass="label-text"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <h3 id="tituloCantidadPersonasAyudadas" runat="server" class="text-center" style="margin-top: 20px;">Cantidad de donaciones hechas</h3>
                            <div id="divCantPersonasAyudadas" runat="server" class="container-fluid" style="width: 20%; margin-top: 10px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table table-bordered table-hover custom-table">
                                            <asp:Label ID="lblCantidadPersonasAyudadas" runat="server" CssClass="label-text" style="font-size: 30px;"><strong></strong></asp:Label>
                                        </div>
                                    </div>
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
                                                runat="server" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtNombre"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,50}$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtApellido" class="form-label">Apellido</label>
                                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtApellido"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtApellido"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,50}$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label for="txtEmail" class="form-label">Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
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
                                            <asp:TextBox ID="txtNombreGrupoSanguineo" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
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
                                                ForeColor="Red" />

                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtAltura" class="form-label">Altura</label>
                                            <asp:TextBox ID="txtAltura" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtAltura"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten números enteros."
                                                ControlToValidate="txtAltura"
                                                runat="server"
                                                ValidationExpression="^\d+$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
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
                                                ForeColor="Red" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten números y letras. Máximo 10 caracteres."
                                                ControlToValidate="txtCp"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z0-9]{1,10}$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtLocalidad" class="form-label">Localidad</label>
                                            <asp:TextBox ID="txtLocalidad" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtLocalidad"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 75 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtLocalidad"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,75}$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
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
                                                ForeColor="Red" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtProvincia"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,50}$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label for="txtCiudad" class="form-label">Ciudad</label>
                                            <asp:TextBox ID="txtCiudad" runat="server" type="text" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ErrorMessage="El campo es requerido"
                                                ControlToValidate="txtCiudad"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red" />
                                            <asp:RegularExpressionValidator
                                                ErrorMessage="Solo se permiten letras y espacios. Máximo 75 caracteres. Mínimo 3 caracteres alfabéticos."
                                                ControlToValidate="txtCiudad"
                                                runat="server"
                                                ValidationExpression="^[A-Za-z\s]{3,75}$"
                                                Display="Dynamic"
                                                ForeColor="Red" />
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
                                                    ForeColor="Red" />
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
                                                    ForeColor="Red" />
                                                <asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator1"
                                                    runat="server"
                                                    ErrorMessage="La contraseña debe tener al menos 8 caracteres y contener al menos una letra mayúscula, una minúscula y un número."
                                                    ControlToValidate="txtContrasenaNueva"
                                                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"
                                                    Display="Dynamic"
                                                    ForeColor="Red" />
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
                                                    ForeColor="Red" />
                                                <asp:CompareValidator
                                                    ID="CompareValidator1"
                                                    runat="server"
                                                    ErrorMessage="Las contraseñas no coinciden."
                                                    ControlToValidate="txtRepetirContrasena"
                                                    ControlToCompare="txtContrasenaNueva"
                                                    Display="Dynamic"
                                                    ForeColor="Red" />
                                            </div>
                                            <div class="row mt-4">
                                                <asp:Button ID="btnCambiarContrasena" runat="server" Text="Guardar cambios" CssClass="btn btn-customContinuar" OnClick="btnCambiarContrasena_Click" />
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
