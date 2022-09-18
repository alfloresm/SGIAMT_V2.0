<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_ActivarCuenta.aspx.cs" Inherits="WEB.PAG_WEB.W_ActivarCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/activar-cuenta.css?1.0">

<%-- agregado --%>
    <script src="../PAG_WEB/assets/js/js_ActivarCuenta.js"></script>
<%-- fin agregado --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="preloader" >
            <div class="preloader-container"></div>
            <img class="image" src="assets/images/loader.gif" alt="Alternate Text" />
            <p id="TextoAyuda" runat="server" class="center-block">Por favor espere.....</p>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnIngresar_Click" CssClass="btn btn-success notika-btn-success">
                 <i class="notika-icon notika-checked"></i> Ingresar
            </asp:LinkButton>
        </div>


    </form>
</asp:Content>
