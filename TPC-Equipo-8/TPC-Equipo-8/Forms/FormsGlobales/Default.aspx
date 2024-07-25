<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_8.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Estilos/EstilosGlobales.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="default-div">
        <div class="text-center">
            <h1 id="logo">sanguis</h1>
        </div>
        <div style="margin: 30px 30px 30px 30px;">
            <div class="row justify-content-between">
                <div class="col-6" style="padding-left: 150px;">
                    <h1 style="font-size: 150px;">Doná</h1>
                    <h1 style="font-size: 150px; margin-top: -80px;">Sangre</h1>
                    <h2 style="margin-top: -30px;">y salvá vidas</h2>
                    <div class="justify-content-start mt-5">
                        <a href="Registro.aspx" class="btn btn-customQuiero btn-lg">¡Quiero donar!</a>
                    </div>
                </div>
                <div class="col-6">
                    <img src="../../Contenidos/Imagenes/manosgota.png" alt="ManosGota" class="rounded float-end" style="height: 600px;" />
                </div>
            </div>
        </div>
    </div>
    <div class="container text-center hero-sobre-nosotros" id="hero-sobre-nosotros"">
        <div class="row align-items-start">
            <div class="col mt-4">
                <i class="bi bi-people-fill" style="color: #0C69EB; font-size: 40px;"></i>
                <h3 style="color: black;">Sobre Nosotros</h3>
                <p style="padding: 20px; font-size: 13px;">
                    Sanguis es una iniciativa dedicada a salvar vidas a través de la donación de sangre. 
    Nuestra misión es facilitar y promover la donación de sangre, 
    conectando a donantes voluntarios con aquellos que más lo necesitan.
                </p>
            </div>
            <div class="col mt-4">
<%--                <i class="bi bi-globe-americas planet-icon" class="planet-icon" "></i>--%>
                 <img src="../../Contenidos/Imagenes/planeta-tierra.png" alt="Icono de la tierra" style="width: 40px;"/>
                <h3 style="color: black; padding-top: 20px;">Nuestro Impacto</h3>
                <p style="padding: 20px; font-size: 13px;">
                    Cada donación de sangre tiene el potencial de salvar hasta tres vidas. 
    Gracias a nuestros donantes, hemos podido ayudar a miles de personas en situaciones críticas. 
    En Sanguis, creemos en la fuerza de la comunidad y en el impacto positivo que podemos tener cuando trabajamos juntos.
                </p>
            </div>
            <div class="col mt-4">
                <i class="bi bi-heart-fill" style="color: #EA3321; font-size: 40px;"></i>
                <h3 style="color: black;">Sumate</h3>
                <p style="padding: 20px; font-size: 13px;">
                    Tu donación puede hacer una gran diferencia. 
    Regístrate hoy y sé parte de nuestra misión de salvar vidas. 
    Juntos, podemos construir un futuro más saludable y seguro para todos.
                    </p>
            </div>
        </div>
    </div>

    <div class="mt-5 container" id="hero-info-default"">
        <h4>¿En qué consiste la donación?</h4>
        <ul>
            <li>Recibirás un breve chequeo de salud antes de la donación para asegurar que estás en condiciones óptimas para donar.</li>
            <li>La donación de sangre es un proceso rápido y seguro que puede ayudar a salvar vidas en tu comunidad.</li>
            <li>Después de donar, se te proporcionará información sobre cómo mantener una dieta saludable y equilibrada para recuperar la energía.</li>
        </ul>
        <p>
            Los donantes que concurran serán atendidos con amabilidad y eficiencia, 
                    saldrán con la satisfacción de haber realizado un acto de solidaridad.
           
        </p>
    </div>

</asp:Content>
