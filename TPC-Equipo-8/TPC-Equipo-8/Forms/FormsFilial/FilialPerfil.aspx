<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialPerfil.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
                <div class="container d-flex justify-content-center">
                    <div class="custom-login" style="max-width: 50%; margin-bottom: 100px">

                        <%--Barra lateral menu--%>
                        <div class="col-md-3 col-lg-2 barra-lateral">
                            <nav class="menu d-flex flex-column">
                                <a href="#" class="d-flex align-items-center" onclick="showEditarPerfil()"><i class="fas fa-user-edit me-2"></i><span>Editar Perfil</span></a>
                                <a href="#" class="d-flex align-items-center" onclick="showEditarDireccion()"><i class="fas fa-map-marker-alt me-2"></i><span>Editar Direccion</span></a>
                                <a href="#" class="d-flex align-items-center" onclick="showContraseña()"><i class="fas fa-lock me-2"></i><span>Contraseña</span></a>
                            </nav>
                        </div>
                         <%--EDICION PERFIL--%>
                        
                        <%--DATOS FILIAL--%>

                        <div id="editarPerfil" style="display: block;" class="form-container">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="txtNombreFilial" class="form-label">Nombre de la Filial</label>
                                    <asp:TextBox ID="txtNombreFilial" runat="server" type="text" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtNombreFilial" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres.Mínimo 3 caracteres alfabéticos."  ControlToValidate="txtNombreFilial" runat="server" ValidationExpression="^(?![A-Za-z]{1}\s)[A-Za-z\s]{3,50}$" Display="Dynamic" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="txtTelefono" class="form-label">Teléfono</label>
                                    <asp:TextBox ID="txtTelefono" runat="server" type="text" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtTelefono" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator runat="server" ErrorMessage="Formato de teléfono inválido. Debe tener al menos 6 caracteres y acepta guiones." ControlToValidate="txtTelefono" ValidationExpression="^[0-9\-]{6,30}$" Display="Dynamic" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="txtHorarioAtencion" class="form-label">Horario de Atención</label>
                                    <asp:TextBox ID="txtHorarioAtencion" runat="server" type="text" class="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revHorarioAtencion" runat="server" ControlToValidate="txtHorarioAtencion" ErrorMessage="Ingrese menos 100 caracteres y puede contener dos puntos (:), guiones (-), puntos (.) y coma (,)" ValidationExpression="^[\w\sáéíóú,:\-\&]{1,100}$" Display="Dynamic" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="txtCorreo" class="form-label">Correo</label>
                                    <asp:TextBox ID="txtCorreo" runat="server" type="email" class="form-control"></asp:TextBox>
                                     <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCorreo" ErrorMessage="Formato de correo electrónico no válido." ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="txtUrlWeb" class="form-label">URL Web</label>
                                    <asp:TextBox ID="txtUrlWeb" runat="server" type="text" class="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtUrlWeb" ErrorMessage="Formato de URL no válido." ValidationExpression="^(https?://)?(www\.)?([\w-]+\.)+[\w-]+(/[/?%&=]*)?$" Display="Dynamic" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="col-12 d-flex justify-content-evenly align-items-center mt-4" style="margin-top: 25px;">
                                <asp:Button ID="btnAceparPerfil" runat="server" CssClass="btn btn-customContinuar " Text="Aceptar" OnClick="btnAceparPerfil_Click"/>
                                <asp:Button ID="btnCancelarPerfil" runat="server" CssClass="btn btn-customEliminar " Text="Cancelar" OnClick="btnCancelarPerfil_Click" CausesValidation="false" />
                            </div>


                        </div>

                        <%--DIRECCION--%>
                        <div id="editarDireccion" style="display: none;" class="form-container">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="txtCalle" class="form-label">Calle</label>
                                            <asp:TextBox ID="TextCalle" runat="server" type="text" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="txtAltura" class="form-label">Altura</label>
                                            <asp:TextBox ID="TextAltura" runat="server" type="text" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="txtPiso" class="form-label">Piso</label>
                                            <asp:TextBox ID="TextPiso" runat="server" type="text" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="txtDepartamento" class="form-label">Departamento</label>
                                            <asp:TextBox ID="TextDep" runat="server" type="text" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="provincia" class="form-label">Provincia</label>
                                        <asp:DropDownList ID="DropDownProvincia" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownProvincia_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-12">
                                        <label for="ciudades" class="form-label">Ciudades</label>
                                        <asp:DropDownList ID="DropDownCiudad" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownCiudad_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-12">
                                        <label for="localidad" class="form-label">Localidad</label>
                                        <asp:DropDownList ID="DropDownLocalidad" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownLocalidad_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-12">
                                        <label for="codigoPostal" class="form-label">Codigo Postal</label>
                                        <asp:DropDownList ID="DropDownCP" runat="server" CssClass="form-select" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <%-- FIN DIRECCION--%>

                                    <%-- IMAGEN --%>

                                    <%--<div class="col-md-6">
                                            <div class="img-fluid rounded shadow-sm">
                                                <asp:Image ID="imgNuevoPerfil" runat="server" CssClass="profile-image" />
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Imagen Perfil</label>
                                                <input type="file" id="txtImagen" runat="server" class="form-control" accept="image/*" onchange="previewImage(this);" />
                                            </div>
                                        </div>--%>
                                    <div class="col-12 d-flex justify-content-evenly align-items-center mt-4" style="margin-top: 25px;">
                                        <asp:Button ID="btnAceptarDireccion" runat="server" CssClass="btn btn-customContinuar " Text="Aceptar" OnClick="btnAceptarDireccion_Click"/>
                                        <asp:Button ID="btnCancelarDireccion" runat="server" CssClass="btn btn-customEliminar " Text="Cancelar" CausesValidation="false" OnClick="btnCancelarDireccion_Click" />
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>


                              <%--  <div class="col-12 d-flex justify-content-evenly align-items-center mt-4" style="margin-top: 25px;">
                                    <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-customContinuar " Text="Aceptar" />
                                    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-customEliminar " Text="Cancelar" />
                                </div>--%>
                            </div> <%--DATOS FILIAL--%>
                         <%--FIN EDICION PERFIL--%>

                    </div>
                </div>
        
   









    <%--  <div class="col-md-4 text-center">
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
      </div>--%>



     <script>
     
     function showEditarPerfil() {

         document.getElementById('editarDireccion').style.display = 'none';
         document.getElementById('editarPerfil').style.display = 'block';
         document.getElementById('contraseña').style.display = 'none';
     }

     function showEditarDireccion() {

         document.getElementById('editarDireccion').style.display = 'block';
         document.getElementById('editarPerfil').style.display = 'none';
         document.getElementById('contraseña').style.display = 'none';
     }

     function showContraseña() {
         document.getElementById('editarDireccion').style.display = 'none';
         document.getElementById('editarPerfil').style.display = 'none';
         document.getElementById('contraseña').style.display = 'block';
     }
    <%-- function previewImage(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 document.getElementById('<%= imgNuevoPerfil.ClientID %>').src = e.target.result;
             }

             reader.readAsDataURL(input.files[0]);
         }
     }--%>
     </script>

    
</asp:Content>
