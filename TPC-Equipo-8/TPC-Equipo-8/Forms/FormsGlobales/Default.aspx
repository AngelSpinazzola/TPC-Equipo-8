<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_8.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <%--<!-- Imagen principal -->
        <div class="container image-container">
            <img src="../Content/Pics/salvaVidas.jpg" class="d-block img-fluid" alt="Salva Vidas 1">
        </div>--%>
        <!-- Sección de Barra de búsqueda por localidad | pd: hay que reve--> 
        
        <div class="container" style="margin-top: 35px;">
            <div class="row justify-content-start">
                <div class="col-auto">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Style="border-radius: 30px; width: 400px;" OnTextChanged="txtBuscar_TextChanged" AutoPostBack="true" placeholder="Buscar por localidad.."></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click" Text="Buscar" />
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
                                    <p class="card-title"><%# Eval("nombre") %></p>
                                </div>
                                <div class="card-body text-center">
                                    <asp:Button ID="btnVerDetalle" runat="server" Text="Ver detalle" OnClick="btnVerDetalle_Click" CssClass="btn btn-primary" CommandArgument='<%# Eval("idFilial") %>' CommandName="idFilial" />

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Información en general -->
        <div class="container mt-4">
            <h2>¿En qué consiste la donación?</h2>
            <ol>
                <li>Recibirás un breve chequeo de salud antes de la donación para asegurar que estás en condiciones óptimas para donar.</li>
                <li>La donación de sangre es un proceso rápido y seguro que puede ayudar a salvar vidas en tu comunidad.</li>
                <li>Después de donar, se te proporcionará información sobre cómo mantener una dieta saludable y equilibrada para recuperar la energía.</li>
            </ol>

            <p>Los donantes que concurran serán atendidos con amabilidad y eficiencia, saldrán con la satisfacción de haber realizado un acto de solidaridad.</p>

            <h2>Requisitos para donar sangre:</h2>
            <ul>
                <li>Tener entre 16 y 65 años</li>
                <li>Pesar más de 50 Kilos</li>
                <li>6 meses desde el último tatuaje</li>
                <li>No estar embarazada o en período de lactancia</li>
                <li>No estar anémico (bajos glóbulos rojos)</li>
                <li>Dormir más de 6 horas</li>
                <li>No haber donado sangre en los últimos 2 meses</li>
                <li>Concurrir habiendo ingerido el desayuno habitual</li>
                <li>Presentarse con DNI</li>
            </ul>
        </div>
    </div>

</asp:Content>
