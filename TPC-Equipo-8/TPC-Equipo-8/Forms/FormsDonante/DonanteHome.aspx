<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonanteHome.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonanteHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Barra de búsqueda por nombre de Filial-->
    <!-- Aclaración: luego de re-hacer la DB, la búsqueda será por nombre de localidad, de momento solo es por nombre de filiar.-->
    <div class="container" style="margin-top: 35px;">
        <div class="row justify-content-start">
            <div class="col-auto">
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Style="border-radius: 30px; width: 400px;" placeholder="Buscar por nombre de Filial.." AutoPostBack="false" OnTextChanged="txtBuscar_TextChanged" oninput="buscarFiliales()"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-custom" OnClick="btnBuscar_Click" Text="Buscar" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sección con cartas de las Filiales -->
    <div class="container" style="margin-top: 25px;">
        <div class="row justify-content-center">
            <asp:Repeater ID="repFiliales" runat="server">
                <ItemTemplate>
                    <div class="col-12 col-md-4 mb-4 d-flex align-items-stretch">
                        <div class="card shadow-sm" style="width: 100%; margin: auto; border: 2px solid rgba(128, 128, 128, 0.1);">
                            <img src='<%# Eval("urlImagen") %>' class="card-img-top" alt="Imagen de la filial" style="height: 200px; object-fit: cover; margin: auto; width: auto;" onerror="this.onerror=null;this.src='https://simacolor.com.gt/sistema/files/articulos/no.png';">
                            <div class="card-body">
                                <p class="card-title"><%# Eval("nombre") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <h3>FILIAL X</h3>
    <a href="DonanteDetalleFilial.aspx">VER DETALLE</a>

</asp:Content>
