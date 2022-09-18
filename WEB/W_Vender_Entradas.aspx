<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Vender_Entradas.aspx.cs" Inherits="WEB.W_Vender_Entradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server" method="POST" class="form">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-header card-header-text" data-background-color="red">
                            <h4 id="txtPagina" runat="server" class="card-title">Vender Entradas</h4>
                        </div>
                        <div class="card-content">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="upEntrada" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sd-6">
                                            <label class="col-md-2 label-on-left">Concurso</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sd-6">
                                            <label class="col-md-2 label-on-left">Fecha</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:DropDownList ID="ddlFechaConcurso" runat="server" CssClass="selectpicker">
                                                    <asp:ListItem Text="Seleccione" Value="0" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Fecha 1" Value="fecha1"></asp:ListItem>
                                                    <asp:ListItem Text="Fecha 2" Value="fecha2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sd-6">
                                            <label class="col-md-2 label-on-left">Dni</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtDni" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sd-6">
                                            <label class="col-md-2 label-on-left">Nombres</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtNombreCompleto" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sd-6">
                                            <label class="col-md-2 label-on-left">Correo</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtCorreo" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sd-6">
                                            <label class="col-md-2 label-on-left">Cantidad Entradas</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtCantEntradas" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sd-6">
                                            <p></p>
                                        </div>
                                        <asp:UpdatePanel ID="upBotonEnviar" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="col-lg-2 col-md-2 col-sm-6">
                                                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-fill btn-success" OnClick="btnRegistrar_Click" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="col-lg-2 col-md-4 col-sd-6">
                                            <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-fill btn-danger" OnClick="btnRegresar_Click" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function showSuccessMessage2() {
            setTimeout(function () {
                swal({
                    title: "Todo guardado",
                    text: "Pulsa el botón y se te redirigirá",
                    type: "success"
                }, function () {
                    window.location = "GestionCatalogo.aspx";
                });
            }, 1000);
        }
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
