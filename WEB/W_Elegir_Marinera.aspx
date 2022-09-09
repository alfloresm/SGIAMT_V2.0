<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Elegir_Marinera.aspx.cs" Inherits="WEB.W_Elegir_Marinera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="form">
        <div class="card">
            <div class="card-header card-header-text" data-background-color="red">
                <h4 id="txtPagina" runat="server" class="card-title">Elegir Marinera</h4>
            </div>
            <div class="card-content">
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>
                <div class="row">
                    <div class="col-lg-7 col-md-7">
                        <p>Seleccione la dificultad: </p>
                        <asp:DropDownList ID="ddlDificultad" runat="server" CssClass="select-css" Font-Size="Small" Width="280px">
                            <asp:ListItem Text="---Seleccione----" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Baja" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Media" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Alta" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="lblMarinera" runat="server"><br />
                        </asp:Label>
                        <p>(*) La marinera a bailar será elegida de manera aleatoria de acuerdo a la dificulatad seleccionada.</p>
                        <br />
                    </div>

                    <div class="container">
                        <div class="row">
                            <asp:UpdatePanel ID="upBotonEnviar" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="row">
                                        <asp:LinkButton ID="btnElegir" runat="server" OnClick="btnElegir_Click1" OnClientClick="showSuccessMessage2()" CssClass="btn btn-success notika-btn-success">
                                            <i class="notika-icon notika-checked"></i> Elegir
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnRegreso_Click" CssClass="btn btn-danger notika-btn-danger">
                                            <i class="notika-icon notika-close"></i> Regresar
                                        </asp:LinkButton>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row">
                                <asp:Label ID="lblMarinera" runat="server"><br />
                                    <h4>La marinera que se bailará será: </h4><br />
                                </asp:Label>
                                <asp:TextBox ID="txtMarinera" runat="server" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
            </div>
        </div>
    </form>

    <script>
        function showMessage(from, align, message, type) {
            $.notify({
                icon: "notifications",
                message: message
            }, {
                type: type,
                timer: 3000,
                placement: {
                    from: from,
                    align: align
                }
            });
        }
    </script>
</asp:Content>
