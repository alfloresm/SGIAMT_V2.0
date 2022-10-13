<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Registrar_Participante.aspx.cs" Inherits="WEB.W_Registrar_Participante" %>

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
                                            <h2>Registrar Usuario</h2>
                                            <p>Registrese para poder inscribirse a un concurso <span class="bread-ntd">!!!</span></p>
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
                                <h2>Datos Personales</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-support"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="TextBoxDni" runat="server" CssClass="form-control" TextMode="Number" size="8" placeholder="DNI"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevDocumento" runat="server" ErrorMessage="Por favor ingrese solo numeros" ControlToValidate="TextBoxDni" ForeColor="#CC0000" ValidationExpression="([0-9]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequDocumento" runat="server" ErrorMessage="ingrese Documento" ControlToValidate="TextBoxDni" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
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
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Nombres"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevNombre" runat="server" ErrorMessage="ingrese solo letras" ControlToValidate="TextBox1" ForeColor="#CC0000" ValidationExpression="([a-zA-Z\s]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequNombre" runat="server" ErrorMessage="ingrese Nombre" ControlToValidate="TextBox1" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-support"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Apellido Paterno"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevAP" runat="server" ErrorMessage="ingrese solo letras" ControlToValidate="TextBox2" ForeColor="#CC0000" ValidationExpression="([a-zA-Z\s]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequAP" runat="server" ErrorMessage="ingrese Nombre" ControlToValidate="TextBox2" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 apellido-materno">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-support"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Apellido-Materno"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevAM" runat="server" ErrorMessage="Por favor ingrese solo letras" ControlToValidate="TextBox3" ForeColor="#CC0000" ValidationExpression="([a-zA-Z\s]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequAM" runat="server" ErrorMessage="ingrese Apellido Materno" ControlToValidate="TextBox3" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 genero">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp" style="color: #9f9f9f;">
                                            <p class="text-center" style="color: #9f9f9f;">Género</p>
                                        </div>
                                        <asp:DropDownList ID="ddlGenero" runat="server" CssClass="select-css" Font-Size="Small" Width="280px">
                                            <asp:ListItem Text="---Seleccione----" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Femenino" Value="F"></asp:ListItem>
                                            <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="lblGenero" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <p></p>
                                </div>
                                <div class="col-lg-4">
                                    <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12">
                                        <p class="text-center" style="color: #9f9f9f;">Fecha de nacimiento</p>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form-group ic-cmp-int">
                                            <div class="nk-int-st">
                                                <asp:TextBox ID="TextBox10" runat="server" Font-Size="Small" CssClass="form-control" type="date" data-mask="99/99/9999" placeholder="dd/mm/aaaa" Width="300"></asp:TextBox>
                                                <asp:Label ID="lblFecha" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <p></p>
                                </div>
                            </div>
                            <div class="cmp-tb-hd bcs-hd">
                                <h2>Datos de contacto</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 telefono">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-phone"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="TextBox5" runat="server" class="form-control" data-mask="(999) 999-9999" placeholder="Telefono" size="9" TextMode="Phone"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevCelular" runat="server" ErrorMessage="Por favor ingrese solo numeros" ControlToValidate="TextBox5" ForeColor="#CC0000" ValidationExpression="([0-9]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequCelular" runat="server" ErrorMessage="ingrese Celular" ControlToValidate="TextBox5" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rango1" runat="server"
                                            ControlToValidate="TextBox5"
                                            MinimumValue="900000000"
                                            MaximumValue="999999999"
                                            Type="Integer"
                                            ForeColor="#CC0000"
                                            Text="El valor es invalido!" Display="Dynamic" />
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
                                            <asp:RegularExpressionValidator ID="RevNA" runat="server" ErrorMessage="Por favor ingrese solo letras" ControlToValidate="TextBox6" ForeColor="#CC0000" ValidationExpression="([a-zA-Z\s]{1,})" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequNA" runat="server" ErrorMessage="ingrese Nombre de academia" ControlToValidate="TextBox6" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 correo-electronico">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-mail"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="TextBox7" runat="server" class="form-control" placeholder="Correo Electrónico"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RevCorreo" runat="server" ErrorMessage="correo incorrecto" ControlToValidate="TextBox7" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequCorreo" runat="server" ErrorMessage="ingrese Correo" ControlToValidate="TextBox7" ForeColor="#CC0000" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row mg-t-30">
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <p></p>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-6">
                        <%--<asp:UpdatePanel ID="upnBotonRegistrar" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>--%>
                                <asp:LinkButton ID="btnReg" runat="server" OnClick="btnReg_Click" CssClass="btn btn-success notika-btn-success">
                                        <i class="notika-icon notika-checked"></i> Registrar
                                </asp:LinkButton>
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-6">
                        <asp:LinkButton ID="btnRegreso" runat="server" OnClick="btnRegreso_Click" CssClass="btn btn-danger notika-btn-danger">
                                <i class="notika-icon notika-close"></i> Regresar
                        </asp:LinkButton>
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
