<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.master" AutoEventWireup="true" CodeBehind="W_RegistrarParticipante.aspx.cs" Inherits="WEB.PAG_WEB.W_RegistrarParticipante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../PAG_WEB/assets/css/bootstrap-select/bootstrap-select.css" rel="stylesheet" />
    <%--    <link rel="stylesheet" href="../PAG_WEB/assets/css/formulario.css?1.0">--%>
    <%--<link href="../PAG_WEB/assets/css/wave/button.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--                            <asp:UpdatePanel ID="upUsuario" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        --%>
        <%--        <ContentTemplate>--%>
        <div class="wizard-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="wizard-wrap-int">
                            <div class="wizard-hd">
                                <h2>Registrar Participante</h2>
                            </div>
                            <div id="rootwizard">
                                <div class="navbar">
                                    <div class="navbar-inner">
                                        <div class="container-pro wizard-cts-st">
                                            <ul>
                                                <li><a href="#tab1" data-toggle="tab">Datos Personales</a></li>
                                                <li><a href="#tab2" data-toggle="tab">Contacto</a></li>
                                                <li><a href="#tab3" data-toggle="tab">Categoría</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane wizard-ctn" id="tab1">
                                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 dni">
                                            <div class="form-group ic-cmp-int">
                                                <div class="form-ic-cmp">
                                                    <i class="notika-icon notika-support"></i>
                                                </div>
                                                <div class="nk-int-st">
                                                    <asp:TextBox ID="TextBoxDni" runat="server" class="form-control" TextMode="Number" MaxLength="9" placeholder="DNI"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 nombres">
                                            <div class="form-group ic-cmp-int">
                                                <div class="form-ic-cmp">
                                                    <i class="notika-icon notika-support"></i>
                                                </div>
                                                <div class="nk-int-st">
                                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Nombres"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 apellido-paterno">
                                            <div class="form-group ic-cmp-int">
                                                <div class="form-ic-cmp">
                                                    <i class="notika-icon notika-support"></i>
                                                </div>
                                                <div class="nk-int-st">
                                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Apellido Paterno"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 apellido-materno">
                                            <div class="form-group ic-cmp-int">
                                                <div class="form-ic-cmp">
                                                    <i class="notika-icon notika-support"></i>
                                                </div>
                                                <div class="nk-int-st">
                                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Apellido-Materno"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="text-center">
                                                <p>Género</p>
                                            </div>
                                            <asp:DropDownList ID="ddlGenero" runat="server" CssClass="select-css">
                                                <asp:ListItem Text="---Seleccione----" Value="0" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Femenino" Value="F"></asp:ListItem>
                                                <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab2">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 telefono">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-phone"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox5" runat="server" class="form-control" data-mask="(999) 999-9999" placeholder="Telefono"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 nombre-academia">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-support"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Nombre Academia"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-4 col-xs-12 correo-electronico">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-mail"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox7" runat="server" class="form-control" placeholder="Correo Electrónico"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 contrasenia">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-support"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox8" runat="server" class="form-control" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab3">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 text-center">
                                                    <p>Fecha de nacimiento</p>
                                                </div>
                                                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 fecha-nacimiento">
                                                    <div class="form-group ic-cmp-int">
                                                        <div class="nk-int-st">
                                                            <asp:TextBox ID="TextBox10" runat="server" class="form-control" type="date" data-mask="99/99/9999" placeholder="dd/mm/aaaa"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 text-center">
                                                <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>--%>
                                                <asp:LinkButton ID="btnCategoria" runat="server" OnClick="btnCategoria_Click" CssClass="btn waves-effect" BackColor="#a3423b" Font-Bold="true" ForeColor="#FFFFFF">
                                                    <i class="notika-icon notika-checked"></i> 
                                                </asp:LinkButton>
                                                <%--   </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                            </div>
                                            <asp:UpdatePanel ID="UpCategoria" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                        <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true"></asp:Label>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                    </div>
                                </div>
                                <div class="wizard-action-pro">
                                    <ul class="wizard-nav-ac">
                                        <li><a class="button-first a-prevent" href="#"><i class="notika-icon notika-more-button"></i></a></li>
                                        <li><a class="button-previous a-prevent" href="#"><i class="notika-icon notika-back"></i></a></li>
                                        <li><a class="button-next a-prevent" href="#"><i class="notika-icon notika-next-pro"></i></a></li>
                                        <li><a class="button-last a-prevent" href="#"><i class="notika-icon notika-more-button"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row mg-t-30">
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <p></p>
                        </div>
                        <asp:UpdatePanel ID="upBotonEnviar" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="col-lg-2 col-md-2 col-sm-6">
                                    <%--<asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-success notika-btn-success" OnClick="btnRegistrar_Click" />--%>
                                    <%--<button id="btnRegistrar" class="btn btn-success notika-btn-success" runat="server" onclick="btnRegistrar_Click">Success</button>--%>
                                    <asp:LinkButton ID="btnReg" runat="server" OnClick="btnRegistrar_Click" CssClass="btn btn-success notika-btn-success">
                                        <i class="notika-icon notika-checked"></i> Registrar
                                    </asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-lg-2 col-md-2 col-sm-6">
                            <asp:LinkButton ID="btnRegreso" runat="server" OnClick="btnRegreso_Click" CssClass="btn btn-danger notika-btn-danger">
                                <i class="notika-icon notika-close"></i> Regresar
                            </asp:LinkButton>
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
    <style type="text/css">
        .select-css {
            display: block;
            font-size: 14px;
            font-weight: 400;
            color: #444;
            line-height: 1.3;
            padding: .4em 1.4em .3em .8em;
            width: 400px;
            max-width: 100%;
            box-sizing: border-box;
            margin: 20px auto;
            border: 1px solid #aaa;
            box-shadow: 0 1px 0 1px rgba(0,0,0,.03);
            border-radius: .3em;
            -moz-appearance: none;
            -webkit-appearance: none;
            appearance: none;
            background-color: #fff;
            background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'), linear-gradient(to bottom, #ffffff 0%,#f7f7f7 100%);
            background-repeat: no-repeat, repeat;
            background-position: right .7em top 50%, 0 0;
            background-size: .65em auto, 100%;
        }

            .select-css::-ms-expand {
                display: none;
            }

            .select-css:hover {
                border-color: #888;
            }

            .select-css:focus {
                border-color: #aaa;
                box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
                box-shadow: 0 0 0 3px -moz-mac-focusring;
                color: #222;
                outline: none;
            }

            .select-css option {
                font-weight: normal;
            }
    </style>
</asp:Content>
