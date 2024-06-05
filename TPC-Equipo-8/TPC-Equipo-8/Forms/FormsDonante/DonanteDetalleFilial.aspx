<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonanteDetalleFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonanteDetalleFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Content/styles/StyleDonanteDetalleFilial.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="text-center mt-4">
        <p class="titulo">Detalle de la Filial</p>
    </div>

    <div class="container">
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <asp:Repeater ID="repDetalle" runat="server" ClientIDMode="Static">
                <ItemTemplate>
                    <div class="col mb-3">
                        <div class="card" style="height: 650px; border: 0;">
                            <img src='<%# Eval("UrlImagen") %>' class="card-img-top" style="height: 410px; object-fit: cover; max-width: 100%; margin: auto;" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text">Teléfono: <%# Eval("Telefono") %></p>
                                <p class="card-text">Horario de atención: <%# Eval("HorarioAtencion") %></p>
                                <p class="card-text">Correo: <%# Eval("Correo") %></p>

                                <div class="mt-3 text-center">
                                    <asp:Button ID="btnVerPublicaciones" Text="Ver publicaciones" runat="server" OnClick="btnVerPublicaciones_Click" CssClass="btn btn-customVerPublicaciones" CommandArgument='<%# Eval("IdFilial") %>' CommandName="IdFilial" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- API MAP -->
                    <div id="map-<%# Container.ItemIndex %>" class="w-50" style="height: 410px;" data-direccion='<%# ObtenerDireccionFilial(Convert.ToInt32(Eval("IdFilial"))) %>'>
                        <p>Mapa</p>
                    </div>
                    </div>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            var mapId = 'map-<%# Container.ItemIndex %>';
                            var direccion = document.getElementById(mapId).getAttribute('data-direccion');

                            var mapElement = document.getElementById(mapId);
                            if (mapElement) {
                                fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(direccion)}`)
                                    .then(response => response.json())
                                    .then(data => {
                                        if (data && data.length > 0) {
                                            var latlng = [data[0].lat, data[0].lon];
                                            var map = L.map(mapId).setView(latlng, 15);
                                            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                                attribution: '&copy; OpenStreetMap contributors'
                                            }).addTo(map);
                                            L.marker(latlng).addTo(map);
                                        } else {
                                            console.error('Geocode was not successful');
                                        }
                                    })
                                    .catch(error => {
                                        console.error('Error fetching geocode: ', error);
                                    });
                            }
                        });
                    </script>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>


</asp:Content>
