<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_8.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <!-- Imagen principal -->
        <div class="container image-container">
            <img src="../Content/Pics/salvaVidas.jpg" class="d-block img-fluid" alt="Salva Vidas 1">
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
