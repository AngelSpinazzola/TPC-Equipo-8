<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VerFiliales.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.VerFiliales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top: 35px;">
        <div class="row justify-content-start">
            <div class="col">
                <div class="input-group mb-3" style="">
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Style="border-radius: 30px;" OnTextChanged="txtBuscar_TextChanged" AutoPostBack="true" placeholder="Buscar por localidad.."></asp:TextBox>
                    <div style="margin-left: 5px">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-customBuscar" OnClick="btnBuscar_Click" Text="Buscar" />
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
                            <img src='<%# Eval("urlImagen") %>' class="card-img-top" alt="Imagen de la filial" style="height: 200px; object-fit: cover; margin: auto; max-width: 100%;" onerror="this.onerror=null;this.src='https://simacolor.com.gt/sistema/files/articulos/no.png';">
                            <div class="card-body">
                                <h5 class="card-title"><strong><%# Eval("nombre") %></strong></h5>
                                <p class="card-text"><%# Eval("direccion.calle") %> <%# Eval("direccion.altura") %>, <%# Eval("direccion.localidad") %> </p>
                            </div>
                            <div class="card-body text-center">
                                <asp:Button ID="btnVerDetalle" runat="server" Text="Ver detalle" OnClick="btnVerDetalle_Click" CssClass="btn btn-customDetalle" CommandArgument='<%# Eval("idFilial") %>' CommandName="idFilial" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
