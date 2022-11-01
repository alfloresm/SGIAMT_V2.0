<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Forgot_Password.aspx.cs" Inherits="WEB.PAG_WEB.W_Forgot_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src='http://ksylvest.github.io/jquery-growl/javascripts/jquery.growl.js' type='text/javascript'></script>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="assets/js/notification/bootstrap-growl.min.js"></script>
    <link href="assets/js/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="assets/js/SweetAlert/sweetalert.min.js" type='text/javascript'></script>
    <script src="assets/js/notification/notificacion.js" type='text/javascript'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Breadcomb area Start-->
        <div class="breadcomb-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcomb-list">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-form"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Restablecimiento de contraseña</h2>
                                            <p>¿Perdiste tu contraseña? Por favor, introduce tu correo electrónico y DNI. Recibirás un enlace para crear una contraseña nueva por correo electrónico. <span class="bread-ntd"></span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcomb area End-->
        <!-- Form Element area Start-->
        <div class="form-element-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form-element-list mg-t-30">
                            <div class="cmp-tb-hd bcs-hd">
                                <h2>Ingrese los siguientes datos personales</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-support"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" TextMode="Number" size="8" placeholder="DNI"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevDocumento" runat="server" ErrorMessage="Por favor ingrese solo numeros" ControlToValidate="txtDni" ForeColor="#CC0000" ValidationExpression="([0-9]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequDocumento" runat="server" ErrorMessage="ingrese Documento" ControlToValidate="txtDni" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:Label ID="lblDoc" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 correo-electronico">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-mail"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Correo Electrónico"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevCorreo" runat="server" ErrorMessage="correo incorrecto" ControlToValidate="txtemail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequCorreo" runat="server" ErrorMessage="ingrese Correo" ControlToValidate="txtemail" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:LinkButton ID="btnRes" runat="server" OnClick="btnRes_Click" CssClass="btn btn-success notika-btn-success">
                                        <i class="notika-icon notika-checked"></i>  Restablecer contraseña
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
