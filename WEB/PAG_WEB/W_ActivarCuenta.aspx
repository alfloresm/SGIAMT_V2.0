<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_ActivarCuenta.aspx.cs" Inherits="WEB.PAG_WEB.W_ActivarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/js/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="assets/js/SweetAlert/sweetalert.min.js"></script>
    <script>
        function Confirmacion() {

            setTimeout(function () {
                swal({
                    title: 'Cuenta activada',
                    text: 'Pulse en el botón OK',
                    type: "success"
                }, function () {
                    window.location = "W_Iniciar_Sesion.aspx";
                });
            }, 1000);
        }


        function ErrorConfirmacion() {
            swal({
                title: 'Existe un error',
                text: 'Pulse en el link nuevamente de su correo para activar la cuenta',
                type: "error"
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="preloader" runat="server">
            <div class="spinner-border text-danger" role="status">
                <p class="sr-only" id="TextoAyuda" runat="server" style="color: #000000">Loading...</p>
            </div>

            <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnIngresar_Click" CssClass="btn btn-success notika-btn-success">
                 <i class="notika-icon notika-checked"></i> Ingresar 
            </asp:LinkButton>--%>
        </div>
    </form>
</asp:Content>
