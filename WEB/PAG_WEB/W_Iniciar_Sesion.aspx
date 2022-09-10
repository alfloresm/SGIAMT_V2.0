<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="W_Iniciar_Sesion.aspx.cs" Inherits="WEB.PAG_WEB.W_Iniciar_Sesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login Tusuy Peru</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="../PAG_WEB/assets/img/favicon.ico" />
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet" />
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/bootstrap.min.css" />
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/font-awesome.min.css" />
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/owl.carousel.css" />
    <link rel="stylesheet" href="../PAG_WEB/assets/css/owl.theme.css" />
    <link rel="stylesheet" href="../PAG_WEB/assets/css/owl.transitions.css" />
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/animate.css" />
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/normalize.css" />
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/scrollbar/jquery.mCustomScrollbar.min.css" />
    <!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/wave/waves.min.css" />
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/notika-custom-icon.css" />
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/main.css" />
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/style.css" />
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="../PAG_WEB/assets/css/responsive.css" />
    <!-- modernizr JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-content">
            <div class="nk-block toggled" id="l-login">
                <div class="nk-form">
                    <div class="input-group">
                        <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
                        <div class="nk-int-st">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                        </div>
                    </div>
                    <div class="input-group mg-t-15">
                        <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-edit"></i></span>
                        <div class="nk-int-st">
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                        </div>
                    </div>
                    <asp:LinkButton ID="btnLogin" runat="server" class="btn btn-login btn-success btn-float" OnClick="btnLogin_Click"><i class="notika-icon notika-right-arrow right-arrow-ant"></i></asp:LinkButton>
                </div>

                <div class="nk-navigation nk-lg-ic">
                    <asp:LinkButton ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click"><i class="notika-icon notika-plus-symbol"></i> <span></span></asp:LinkButton>
                    <asp:LinkButton ID="btnForgotPassword" runat="server" OnClick="btnForgotPassword_Click"><i>?</i> <span></span></asp:LinkButton>
                    <%--<a href="#" data-ma-action="nk-login-switch" data-ma-block="#l-register"><i class="notika-icon notika-plus-symbol"></i> <span>Register</span></a>
                <a href="#" data-ma-action="nk-login-switch" data-ma-block="#l-forget-password"><i>?</i> <span>Forgot Password</span></a>--%>
                </div>
            </div>
        </div>
    </form>

    <!-- jquery
		============================================ -->
    <script src="../PAG_WEB/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/owl.carousel.min.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/counterup/jquery.counterup.min.js"></script>
    <script src="../PAG_WEB/assets/js/counterup/waypoints.min.js"></script>
    <script src="../PAG_WEB/assets/js/counterup/counterup-active.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="../PAG_WEB/assets/js/sparkline/sparkline-active.js"></script>
    <!-- flot JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/flot/jquery.flot.js"></script>
    <script src="../PAG_WEB/assets/js/flot/jquery.flot.resize.js"></script>
    <script src="../PAG_WEB/assets/js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/knob/jquery.knob.js"></script>
    <script src="../PAG_WEB/assets/js/knob/jquery.appear.js"></script>
    <script src="../PAG_WEB/assets/js/knob/knob-active.js"></script>
    <!--  Chat JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/chat/jquery.chat.js"></script>
    <!--  wave JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/wave/waves.min.js"></script>
    <script src="../PAG_WEB/assets/js/wave/wave-active.js"></script>
    <!-- icheck JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/icheck/icheck.min.js"></script>
    <script src="../PAG_WEB/assets/js/icheck/icheck-active.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/todo/jquery.todo.js"></script>
    <!-- Login JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/login/login-action.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="../PAG_WEB/assets/js/main.js"></script>
</body>
<script src="assets/sweetalert/sweetalert.min.js"></script>
<script>
    function showErrorMessage() {
        swal({
            title: "ERROR!",
            text: "Usuario o contraseña incorrecta",
            type: "error"
        });
    }
</script>
</html>
