<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_ActivarCuenta.aspx.cs" Inherits="WEB.PAG_WEB.W_ActivarCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/activar-cuenta.css?1.0">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="preloader" >
            <div class="preloader-container"></div>
            <img src="assets/images/loader.gif" alt="Alternate Text" width: 100px height: 100px/>
            <p id="TextoAyuda" runat="server" class="center-block">Por favor espere.....</p>
        </div>
    </form>
</asp:Content>
