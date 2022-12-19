<%@ Page Title="SGIAMT" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Comprar_Entradas.aspx.cs" Inherits="WEB.PAG_WEB.W_Comprar_Entradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src='http://ksylvest.github.io/jquery-growl/javascripts/jquery.growl.js' type='text/javascript'></script>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="assets/js/notification/bootstrap-growl.min.js"></script>
    <link href="../PAG_WEB/assets/css/bootstrap-select/bootstrap-select.css" rel="stylesheet" />
    <link href="../PAG_WEB/assets/css/wave/button.css" rel="stylesheet" />
    <link href="../PAG_WEB/assets/css/wave/waves.min.css" rel="stylesheet" />
    <script src="../PAG_WEB/assets/js/notification/notificacion.js" type='text/javascript'></script>
    <link href="assets/js/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="assets/js/SweetAlert/sweetalert.min.js" type='text/javascript'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server" method="POST" class="form">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="breadcomb-area">
            <div class="container">
                <div class="row">
                    <div class="form-element-list mg-t-30">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="breadcomb-wp">
                                    <div class="breadcomb-icon">
                                        <i class="notika-icon notika-tax"></i>
                                    </div>
                                    <div class="breadcomb-ctn">
                                        <h2>Comprar Entradas</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="form-element-list mg-t-30">
                    <div class="cmp-tb-hd">
                        <h2>Elegir Concurso</h2>
                        <div class="row">
                            <div class="col-md-6 label-on-left">
                                <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="select-css">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6 text-center">
                                </br>
                                <asp:UpdatePanel ID="upBtnIr" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="btnVerInfo" runat="server" OnClick="btnVerInfo_Click" CssClass="btn btn-info notika-btn-info" BackColor="SkyBlue">
                                    <i class="notika-icon notika-search"></i>
                                        </asp:LinkButton>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="form-element-list">
                    <div class="cmp-tb-hd">
                        
                        <asp:UpdatePanel ID="UpinfoConcurso" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="btn-demo-notika">
                                    <div class="btn-list">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <h4 runat="server" id="Nombre" class="text-center"></h4>
                                            <h5 runat="server" id="Lugar" class="text-center"></h5>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <h5 runat="server" id="Fecha1" class="text-center"></h5>
                                                <h5 runat="server" id="CantEntrada1" class="text-center text-primary"></h5>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <h5 runat="server" id="Fecha2" class="text-center"></h5>
                                                <h5 runat="server" id="CantEntrada2" class="text-center text-primary"></h5>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <h4 runat="server" id="Precio" class="text-center text-danger"></h4>
                                        </div>
                                        <asp:HiddenField ID="HFCosto" runat="server" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-element-list mg-t-30">
                    <div class="cmp-tb-hd">
                        <h>Complete los siguientes datos para comprar sus entradas:</h>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <div class="form-group ic-cmp-int">
                                <div class="form-ic-cmp">
                                    <i class="notika-icon notika-support"></i>
                                </div>
                                <div class="nk-int-st">
                                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" TextMode="Number" size="8" placeholder="DNI" MinLength="8" MaxLength="8"></asp:TextBox>
                                    <asp:Label ID="lblDoc" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <div class="form-group ic-cmp-int">
                                <div class="form-ic-cmp">
                                    <i class="notika-icon notika-support"></i>
                                </div>
                                <div class="nk-int-st">
                                    <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form-control" placeholder="Nombres"></asp:TextBox>
                                    <asp:Label ID="lblNombre" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <div class="form-group ic-cmp-int">
                                <div class="form-ic-cmp">
                                    <i class="notika-icon notika-mail"></i>
                                </div>
                                <div class="nk-int-st">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Correo Electrónico" TextMode="Email"></asp:TextBox>
                                    <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <div class="form-group ic-cmp-int">
                                <div class="form-ic-cmp">
                                    <i class="notika-icon notika-phone"></i>
                                </div>
                                <div class="nk-int-st">
                                    <asp:TextBox ID="txtCantEntradas" runat="server" class="form-control" placeholder="# Entradas" size="2" TextMode="Number"></asp:TextBox>
                                    <asp:RangeValidator ID="rango1" runat="server"
                                        ControlToValidate="txtCantEntradas"
                                        MinimumValue="1"
                                        MaximumValue="50"
                                        Type="Integer"
                                        ForeColor="#CC0000"
                                        Text="la maxima cantidad de entradas que puede comprar es 50!" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <div class="form-group ic-cmp-int float-lb form-elet-mg">
                                <div class="form-ic-cmp">
                                    <i class="notika-icon notika-calendar"></i>
                                </div>
                                <%--<div class="nk-int-st">--%>
                                <asp:DropDownList ID="ddlFecha" runat="server" CssClass="select-css" Font-Size="Small" Width="280px">
                                    <asp:ListItem Text="Seleccione" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Fecha 1" Value="fecha1"></asp:ListItem>
                                    <asp:ListItem Text="Fecha 2" Value="fecha2"></asp:ListItem>
                                </asp:DropDownList>
                                <%-- </div>--%>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <asp:LinkButton ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click1" CssClass="btn btn-success notika-btn-success" Width="120px">
                                        <i class="notika-icon notika-checked"></i> Registrar
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnRegresar" runat="server" OnClick="btnRegresar_Click1" class="btn btn-danger notika-btn-danger" Width="120px">
                                <i class="notika-icon notika-close">Regresar</i>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

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
