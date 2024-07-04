<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialRechazoDonacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialRechazoDonacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center mt-4">
        <h3 style="margin-top: 60px;">Motivo del rechazo</h3>
    </div>

    <div class="form-wrapper">
        <div class="content-wrapper">

            <div class="container-fluid d-flex justify-content-center">
                <div class="form-container mt-4 custom-login" style="max-width: 50%; margin-bottom: 100px">

                    <div class="row g-3">
                        <div class="col-12">
                            <label for="texNombreDonante" class="form-label">Nombre Donante</label>
                            <asp:TextBox ID="TexNombreDonante" runat="server" type="text" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <label for="ApellidoDonante" class="form-label">Apellido Donante</label>
                            <asp:TextBox ID="TexApellidoDonante" runat="server" type="text" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <label for="DniDonante" class="form-label">DNI Donante</label>
                            <asp:TextBox ID="TexDIN" runat="server" type="text" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <label for="txtMotivo" class="form-label">Motivo Rechazo</label>
                            <asp:TextBox ID="txtMotivo" runat="server" type="text" TextMode="MultiLine" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtMotivo" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator ErrorMessage="Solo se permiten letras y espacios. Máximo 200 caracteres."  ControlToValidate="txtMotivo" runat="server" ValidationExpression="^[a-zA-Z\s]{1,200}$" Display="Dynamic" ForeColor="Red" />
                        </div>
                    </div>

                    <div class="col-12 d-flex justify-content-evenly align-items-center mt-4" style="margin-top: 25px;">

                        <asp:Button ID="btnCrear" runat="server" CssClass="btn btn-customContinuar " Text="Aceptar" OnClick="btnCrear_Click" />
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-customEliminar " Text="Cancelar" OnClick="btnCancelar_Click"  CausesValidation="false"/>

                    </div>
                </div>
            </div>
        </div>

    </div>



</asp:Content>
