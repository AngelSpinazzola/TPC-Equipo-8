<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonantePerfil.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonantePerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .barra {
            background-color: #00ADEF;
            padding-top: 15px;
            padding-bottom: 15px;
            margin: 0;
        }


        .barra-lateral {
            background: #c12222;
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            padding-top: 60px;
        }

        .menu a {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

            .menu a:hover {
                background-color: #c12222;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="barra-lateral col-12 col-sm-auto">
                <nav class="menu d-flex flex-column">
                    <a href="#" class="d-flex align-items-center" onclick="showInfoPersonal()"><i class="fas fa-home me-2"></i><span>Información personal</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showContraseña()"><i class="fas fa-lock me-2"></i><span>Contraseña</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showProximaDonacion()"><i class="fas fa-calendar-alt me-2"></i><span>Próxima donación</span></a>
                    <a href="#" class="d-flex align-items-center" onclick="showDonacionesRealizadas()"><i class="fas fa-hand-holding-heart me-2"></i><span>Donaciones realizadas</span></a>
                </nav>
            </div>
        </div>
    </div>

    <main class="main col">
        <div class="row justify-content-center align-content-center text-center">
            <div class="columna col-lg-6">
                <div id="infoPersonal" style="display: none;">
                    <h1 class="text-center">Edición del perfil</h1>
                    <div class="container">
                        <div class="row">
                            <!-- Formulario de información personal -->
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="txtNombre" class="form-label">Nombre</label>
                                        <asp:TextBox ID="txtNombre" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtApellido" class="form-label">Apellido</label>
                                        <asp:TextBox ID="txtApellido" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="txtEmail" class="form-label">Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtDni" class="form-label">Dni</label>
                                        <asp:TextBox ID="txtDni" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="txtFechaAlta" class="form-label">Fecha de Alta</label>
                                        <asp:TextBox ID="txtFechaAlta" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtNombreGrupoSanguineo" class="form-label">Grupo Sanguíneo</label>
                                        <asp:TextBox ID="txtNombreGrupoSanguineo" runat="server" type="text" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="txtCalle" class="form-label">Calle</label>
                                        <asp:TextBox ID="txtCalle" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtAltura" class="form-label">Altura</label>
                                        <asp:TextBox ID="txtAltura" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="txtCp" class="form-label">Código Postal</label>
                                        <asp:TextBox ID="txtCp" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtNombreLocalidad" class="form-label">Localidad</label>
                                        <asp:TextBox ID="txtNombreLocalidad" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="txtNombreProvincia" class="form-label">Provincia</label>
                                        <asp:TextBox ID="txtNombreProvincia" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtNombreCiudad" class="form-label">Ciudad</label>
                                        <asp:TextBox ID="txtNombreCiudad" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <!-- Sección de carga de imagen -->
                            <div class="col-md-4">
                                <asp:Image ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3" />
                                <div class="mb-3">
                                    <label class="form-label">Imagen Perfil</label>
                                    <input type="file" id="txtImagen" runat="server" class="form-control" accept="image/*" />
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12 d-flex justify-content-center">
                                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div id="contraseña" style="display: none;">
                Contenido de Contraseña
               
            </div>
            <div id="proximaDonacion" style="display: none;">
                Contenido de Próxima Donación
               
            </div>
            <div id="donacionesRealizadas" style="display: none;">
                Contenido de Donaciones Realizadas
               
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        function showInfoPersonal() {
            document.getElementById('infoPersonal').style.display = 'block';
            document.getElementById('contraseña').style.display = 'none';
            document.getElementById('proximaDonacion').style.display = 'none';
            document.getElementById('donacionesRealizadas').style.display = 'none';
        }

        function showContraseña() {
            document.getElementById('infoPersonal').style.display = 'none';
            document.getElementById('contraseña').style.display = 'block';
            document.getElementById('proximaDonacion').style.display = 'none';
            document.getElementById('donacionesRealizadas').style.display = 'none';
        }

        function showProximaDonacion() {
            document.getElementById('infoPersonal').style.display = 'none';
            document.getElementById('contraseña').style.display = 'none';
            document.getElementById('proximaDonacion').style.display = 'block';
            document.getElementById('donacionesRealizadas').style.display = 'none';
        }

        function showDonacionesRealizadas() {
            document.getElementById('infoPersonal').style.display = 'none';
            document.getElementById('contraseña').style.display = 'none';
            document.getElementById('proximaDonacion').style.display = 'none';
            document.getElementById('donacionesRealizadas').style.display = 'block';
        }

    </script>



</asp:Content>
