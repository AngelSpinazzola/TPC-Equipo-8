<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonanteHome.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonanteHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>HOME DEL DONANTE</h1>
    <div class="container">
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
