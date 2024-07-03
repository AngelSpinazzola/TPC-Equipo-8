<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonantePerfil.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonantePerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../Estilos/EstilosGlobales.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 col-lg-2 barra-lateral">
                <nav class="menu d-flex flex-column">
                    <a href="#" class="d-flex align-items-center" onclick="showResumenCuenta()"><i class="fas fa-home me-2"></i><span>Resumen</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showEditarPerfil()"><i class="fas fa-user-edit me-2"></i><span>Editar Perfil</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showContraseña()"><i class="fas fa-lock me-2"></i><span>Contraseña</span></a>
                </nav>
            </div>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
                <div class="container-fluid">
                    <div id="resumenCuenta" style="display: block;">
                        Contenido del resumen de la cuenta
       
                    </div>

                    <div id="editarPerfil" style="display: none;" class="form-container">
                        <h1 class="text-center form-title">Edición del perfil</h1>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <label for="txtNombre" class="form-label">Nombre</label>
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="txtApellido" class="form-label">Apellido</label>
                                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
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
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="txtAltura" class="form-label">Altura</label>
                                        <asp:TextBox ID="txtAltura" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <label for="txtCp" class="form-label">Código Postal</label>
                                        <asp:TextBox ID="txtCp" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="txtNombreLocalidad" class="form-label">Localidad</label>
                                        <asp:TextBox ID="txtNombreLocalidad" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <label for="txtNombreProvincia" class="form-label">Provincia</label>
                                        <asp:TextBox ID="txtNombreProvincia" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="txtNombreCiudad" class="form-label">Ciudad</label>
                                        <asp:TextBox ID="txtNombreCiudad" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <!-- Sección de carga de imagen -->
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

                    <div id="contraseña" style="display: none;">
                        Contenido de Contraseña
       
                    </div>
                </div>
            </main>
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
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
