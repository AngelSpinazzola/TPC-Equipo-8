<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .text-center h3{
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
            margin-top: 360px !important; 
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h3>Ingresá tu cuenta</h3>
            </div>
            <div class="container d-flex justify-content-center">
                <div class="form-container mt-4">
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Email</label>
                        <asp:TextBox runat="server" placeholder="Email.." ID="txtEmail" CssClass="form-control" />
                    </div>
                    <div class="mb-5">
                        <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                        <asp:TextBox runat="server" type="password" placeholder="******" ID="txtPass" CssClass="form-control" />
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="Default.aspx">Cancelar</a>
                        <asp:Button Text="Continuar" ID="btnContinuar" OnClick="btnContinuar_Click" runat="server" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
