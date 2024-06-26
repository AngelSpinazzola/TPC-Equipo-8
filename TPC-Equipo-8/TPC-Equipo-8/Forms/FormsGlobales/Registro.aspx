<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .text-center h3 {
            margin-top: 60px;
        }

        .form-container {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 10px 10px -5px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            margin-top: 50px !important;
        }

        .footer-container {
            margin-top: 274px !important; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h3>Completá los datos para crear tu cuenta</h3>
            </div>
            <div class="container d-flex justify-content-center">
                <div class="form-container mt-4">
                    <div class="mb-3">
                        <label for="txtRegistroEmail" class="form-label">Email</label>
                        <asp:TextBox runat="server" placeholder="Email.." ID="txtRegistroEmail" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtRegistroDni" class="form-label">Dni</label>
                        <asp:TextBox runat="server" placeholder="Dni.." ID="txtRegistroDni" CssClass="form-control" />
                    </div>
                    <div class="mb-5">
                        <label for="txtRegistroPass" class="form-label">Contraseña</label>
                        <asp:TextBox runat="server" placeholder="******" ID="txtRegistroPass" CssClass="form-control" type="password" />
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="Default.aspx">Cancelar</a>
                        <asp:Button Text="Continuar" ID="btnContinuarRegistro" OnClick="btnContinuarRegistro_Click" runat="server" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
