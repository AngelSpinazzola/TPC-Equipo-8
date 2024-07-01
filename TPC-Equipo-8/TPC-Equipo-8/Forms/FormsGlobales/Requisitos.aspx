<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Requisitos.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.Requisitos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="text-center" style="margin-bottom: -15px; margin-top: 15px">Requisitos para donar sangre</h2>

    <div class="container" style="background-color: white; border-radius: 50px; box-shadow: 4px 4px 8px 4px rgba(0,0,0,0.4);">
        <div class="text-center" style="margin: 30px 30px 30px 30px; padding: 15px; color: #c12222;">

            <div class="row align-items-start">
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-user" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">Tener entre 16 y 65 años</p>
                </div>
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-weight-scale" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">Pesar más de 50 Kilos</p>
                </div>
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-id-card" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">Presentarse con DNI</p>
                </div>
            </div>

            <div class="row align-items-center">
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-person-pregnant" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">No estar embarazada o en período de lactancia</p>
                </div>
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-droplet" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">No estar anémico (bajos glóbulos rojos)</p>
                </div>
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-bed" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">Dormir más de 6 horas</p>
                </div>
            </div>

            <div class="row align-items-end">
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-calendar" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">No haber donado sangre en los últimos 2 meses</p>
                </div>
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-mug-saucer" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">Concurrir habiendo ingerido el desayuno habitual</p>
                </div>
                <div class="col" style="margin: 10px;">
                    <i class="fa-solid fa-hand-dots" style="font-size: 50px;"></i>
                    <p style="margin: 10px; font-weight: bold;">6 meses desde el último tatuaje</p>

                </div>
            </div>

        </div>
    </div>

</asp:Content>
