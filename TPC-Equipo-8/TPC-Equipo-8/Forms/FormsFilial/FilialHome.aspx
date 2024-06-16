<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialHome.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>HOME DE LA FILIAL</h1>
    <asp:Label ID="LabelPrueba" runat="server" Text="ID FILIAL"></asp:Label>
    <asp:TextBox ID="TextBoxPrueba" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonPrueba" runat="server" Text="Login" OnClick="ButtonPrueba_Click" />


    <div class="container" style="margin-top: 35px;">
        <asp:GridView ID="dgvHomeFilial" CssClass="table" AutoGenerateColumns="false" runat="server">

            <Columns>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <%# Eval("Nombre") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Calle">
                    <ItemTemplate>
                        <%# Eval("Direccion.calle") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Telefono">
                    <ItemTemplate>
                        <%# Eval("Telefono") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%# Eval("Correo") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="container" style="margin-top: 35px;">
        <asp:Repeater ID="RepHomeFilial" runat="server">

            <ItemTemplate>
                <%# Eval("Nombre") %>
                <%# Eval("Apellido") %>
                <%# Eval("FechaRealizada") %>
            </ItemTemplate>
        </asp:Repeater>

    </div>



</asp:Content>
