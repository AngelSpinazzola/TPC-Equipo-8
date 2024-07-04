<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialAltaPublicacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialAltaPublicacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="form-wrapper">
        <div class="content-wrapper">

            <div class="container-fluid d-flex justify-content-center">
                <div class="form-container mt-4 custom-login" style="max-width: 50%; margin-bottom: 100px">

                    <div class="row g-3">
                        <div class="col-12">
                            <label for="txtNombre" class="form-label">Nombre y Apellido del Receptor</label>
                            <asp:TextBox ID="txtNombreReceptor" runat="server" type="text" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtNombreReceptor" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras y espacios. Máximo 50 caracteres.Mínimo 3 caracteres alfabéticos."  ControlToValidate="txtNombreReceptor" runat="server" ValidationExpression="^(?![A-Za-z]{1}\s)[A-Za-z\s]{3,50}$" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="tipoSangre" class="form-label">Tipo de Sangre</label>
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

                    <div class="col-12">
                        <label for="urgencia" class="form-label">Urgencia</label>
                        <asp:DropDownList ID="DropDownUrgencia" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Baja" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Media" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Alta" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-12">
                        <label for="txtDonantesNec" class="form-label">Donantes Necesarios</label>
                        <asp:TextBox ID="txtDonantesNec" runat="server" type="text" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtDonantesNec" runat="server" Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ErrorMessage="Solo se permiten numeros positivos menores a 100."  ControlToValidate="txtDonantesNec" runat="server" ValidationExpression="^(?!0)[1-9][0-9]?$" Display="Dynamic" ForeColor="Red" />
                    </div>

                    <div class="col-12">
                        <label for="txtHorarios" class="form-label">Horarios</label>
                        <asp:TextBox ID="textHorarios" runat="server" type="text" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Campo Requerid" ControlToValidate="textHorarios" runat="server" Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras y números. No se permiten caracteres especiales.Maximo 100 caracteres" ControlToValidate="textHorarios" runat="server" ValidationExpression="^[a-zA-Z0-9\s]{1,100}$" Display="Dynamic" ForeColor="Red"/>
                    </div>


                    <div class="col-12">
                        <label for="txtFecha" class="form-label">Fecha Limite</label>
                        <asp:TextBox ID="textFecha" runat="server" TextMode="Date" type="text" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Campo Requerid" ControlToValidate="textFecha" runat="server" Display="Dynamic" ForeColor="Red" />
                    </div>


                    <div class="col-12 d-flex justify-content-evenly align-items-center mt-4" style="margin-top: 25px;">
                        <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-customContinuar " Text="Aceptar" OnClick="btnCrear_Click" />
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-customEliminar " Text="Cancelar" OnClick="btnCancelar_Click" CausesValidation="false" />
                    </div>


                </div>
            </div>
        </div>
    </div>






</asp:Content>
