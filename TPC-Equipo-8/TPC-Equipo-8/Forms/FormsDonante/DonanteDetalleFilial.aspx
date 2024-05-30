<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonanteDetalleFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonanteDetalleFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Content/styles/StyleDonanteDetalleFilial.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="text-center mt-4">
        <p class="titulo">Detalle de la Filial</p>
    </div>

    <div class="container">
        <div class="row row-cols-1 row-cols-lg-1 g-4 galeria">
            <asp:Repeater ID="repDetalle" runat="server" ClientIDMode="Static">
                <ItemTemplate>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="<%# Eval("UrlImagen") %>" class="img-fluid rounded-start" alt="Imagen de la filial" style="height: 200px; object-fit: cover;">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                        <p class="card-text"><%# Eval("HorarioAtencion") %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
