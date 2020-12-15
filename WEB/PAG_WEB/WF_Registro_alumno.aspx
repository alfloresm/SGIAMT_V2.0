<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/PaginaWEB.Master" AutoEventWireup="true" CodeBehind="WF_Registro_alumno.aspx.cs" Inherits="WEB.WF_Registro_alumno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .form {
            width: 100%;
            height: 48px;
            border-radius: 2px;
            background: #2d2d2d;
            border: none;
            padding-left: 20px;
            margin-bottom: 30px;
            font-size: 16px;
            color: #a6a6a6;
            -webkit-transition: all 0.3s;
            -webkit-transition: 0.3s;
            -o-transition: 0.3s;
            transition: 0.3s;
            border: 1px solid #131313;
        }
    </style>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg spad" data-setbg="img/bread.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Registro de alumno</h2>
                        <div class="breadcrumb-controls">
                            <a href="index.aspx"><i class="fa fa-home"></i>Inicio</a>
                            <span>Registro de Alumno</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
    <section class="contact-section">
        <div class="container">
            <form runat="server">
                <div id="smartwizard">
                    <ul class="nav">
                        <li class="nav-item"><a class="nav-link" href="#step1">Paso 1<br />
                            <small>Datos Generales</small></a></li>
                        <li class="nav-item"><a class="nav-link" href="#step2">Paso 2<br />
                            <small>Datos Extras </small></a></li>
                        <li class="nav-item"><a class="nav-link" href="#step3">Paso 3<br />
                            <small>Datos de la clase </small></a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="contact-form">
                            <div class="tab-pane row" id="step1" role="tabpanel">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtDni" runat="server" placeholder="DNI" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtApellidoP" runat="server" placeholder="Apellido Materno" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtApellidoM" runat="server" placeholder="Apellido Paterno" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <p></p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="Label1" runat="server" Text="Genero:" Font-Bold="True"></asp:Label>
                                    <asp:RadioButton ID="rbMasculino" runat="server" GroupName="genero" ForeColor="#a6a6a6" />Masculino
                                    <asp:RadioButton ID="rbFemenino" runat="server" GroupName="genero" ForeColor="#a6a6a6" />Femenino
                                </div>
                                <div class="col-md-3">
                                    <p></p>
                                </div>
                            </div>
                            <div class="tab-pane row" id="step2" role="tabpanel">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtDireccion" runat="server" placeholder="Direccion" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCelular" runat="server" placeholder="Número Celular" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo Electrónico" TextMode="Email" CssClass="form"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtContraseña" runat="server" placeholder="Contraseña" TextMode="Password" CssClass="form"></asp:TextBox>
                                </div>
                            </div>
                            <div class="tab-pane row" id="step3" role="tabpanel">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtfecha" runat="server" placeholder="Fecha de Nacimiento" CssClass="form" type="Datepicker"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form"></asp:DropDownList>
                                </div>
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="ddlNivel" runat="server" CssClass="form"></asp:DropDownList>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox ID="txtHorario" runat="server" placeholder="Fecha de Nacimiento" TextMode="MultiLine" CssClass="form"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </section>
    <script src="js/jquery-3.3.1.min.js"></script>
    <%--<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.smartWizard.js"></script>--%>
    <%--<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/smartwizard@5.1.1/dist/js/jquery.smartWizard.min.js" integrity="sha256-ZDS9YBVOz85XYQvtiZg1ZMZOk+4dLz/MpYxxzsg5GdQ=" crossorigin="anonymous"></script>--%>

    <script>
        $(document).ready(function () {

            // SmartWizard initialize
            $('#smartwizard').smartWizard();

        });
    </script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#txtfecha").datepicker();
        });
    </script>
</asp:Content>

