<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsAdmin/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminEdicionPublicacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsAdmin.AdminEdicionPublicacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">

            <h1 class="text-center" style="margin-top:40px; margin-bottom: 40px;">Edicion de la publicación</h1>

            <div class="container custom-login" style="max-width: 80%; margin: auto;">
                <div class="row g-3">
                    <asp:TextBox ID="txtIdPublicacion" runat="server" type="text" class="form-control" Visible="false"></asp:TextBox>
                    <div class="col-12">
                        <label for="txtFilial" class="form-label">Filial</label>
                        <asp:TextBox ID="txtFilial" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtNombreReceptor" class="form-label">Nombre del receptor</label>
                        <asp:TextBox ID="txtNombreReceptor" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="grupoSanguineo" class="form-label">Grupo Sanguineo</label>
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
                        <label for="txtDonantesNecesarios" class="form-label">Donantes necesarios</label>
                        <asp:TextBox ID="txtDonantesNecesarios" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtHorarios" class="form-label">Horarios</label>
                        <asp:TextBox ID="txtHorarios" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label for="txtFechaLimite" class="form-label">Fecha límite</label>
                        <asp:TextBox ID="txtFechaLimite" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <asp:TextBox ID="txtEstado" runat="server" type="text" class="form-control" Visible="false"></asp:TextBox>

                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-customContinuar" OnClick="btnAceptar_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
