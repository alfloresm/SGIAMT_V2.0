﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.master" AutoEventWireup="true" CodeBehind="W_RegistrarParticipante.aspx.cs" Inherits="WEB.PAG_WEB.W_RegistrarParticipante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../PAG_WEB/assets/css/formulario.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="content col-md-8 col-md-offset-2">
            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-header card-header-text" data-background-color="red">
                            <h4 id="txtPagina" runat="server" class="card-title">Registrar Participante</h4>
                        </div>
                        <div class="card-content">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wizard-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="wizard-wrap-int">
                            <div class="wizard-hd">
                                <h2>Formulario</h2>
                            </div>
                            <div id="rootwizard">
                                <div class="navbar">
                                    <div class="navbar-inner">
                                        <div class="container-pro wizard-cts-st">
                                            <ul>
                                                <li><a href="#tab1" data-toggle="tab">Primero</a></li>
                                                <li><a href="#tab2" data-toggle="tab">Segundo</a></li>
                                                <li><a href="#tab3" data-toggle="tab">Tercero</a></li>
                                                <li><a href="#tab4" data-toggle="tab">Cuarto</a></li>
                                                <%--<li><a href="#tab5" data-toggle="tab">Fifth</a></li>
                                                <li><a href="#tab6" data-toggle="tab">Sixth</a></li>
                                                <li><a href="#tab7" data-toggle="tab">Seventh</a></li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane wizard-ctn" id="tab1">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nombre">
                                                    <div class="form-group ic-cmp-int">
                                                        <div class="form-ic-cmp">
                                                            <i class="notika-icon notika-support"></i>
                                                        </div>
                                                        <div class="nk-int-st">
                                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Nombres"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 apellido-paterno">
                                                    <div class="form-group ic-cmp-int">
                                                        <div class="form-ic-cmp">
                                                            <i class="notika-icon notika-support"></i>
                                                        </div>
                                                        <div class="nk-int-st">
                                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Apellido Paterno"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 apellido-materno">
                                                    <div class="form-group ic-cmp-int">
                                                        <div class="form-ic-cmp">
                                                            <i class="notika-icon notika-support"></i>
                                                        </div>
                                                        <div class="nk-int-st">
                                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Apellido Materno"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 sexo">
                                                    <div class="form-group ic-cmp-int">
                                                        <div class="form-ic-cmp">
                                                            <i class="notika-icon notika-support"></i>
                                                        </div>
                                                        <div class="nk-int-st">
                                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Sexo"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab2">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 correo-electronico">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-mail"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Correo Electrónico"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 fecha-nacimiento">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-calendar"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox6" runat="server" class="form-control"  data-mask="99/99/9999" placeholder="dd/mm/aaaa"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 telefono">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-phone"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox7" runat="server" class="form-control"  data-mask="(999) 999-9999" placeholder="Telefono"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 nombre-academia">
                                                <div class="form-group ic-cmp-int">
                                                    <div class="form-ic-cmp">
                                                        <i class="notika-icon notika-support"></i>
                                                    </div>
                                                    <div class="nk-int-st">
                                                        <asp:TextBox ID="TextBox8" runat="server" class="form-control" placeholder="Nombre Academia"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab3">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus purus sapien, cursus et egestas at, volutpat sed dolor. Aliquam sollicitudin dui ac euismod hendrerit. Phasellus quis lobortis dolor. Sed massa massa, sagittis nec fermentum eu, volutpat non lectus. Nullam vitae tristique nunc. Aenean vel placerat augue. Aliquam pharetra mauris neque, sitan amet egestas risus semper non. Proin egestas egestas ex sed gravida. Suspendisse commodo nisl sit amet risus volutpat volutpat. Phasellus vitae turpis a elit tinciduntansan ornare. Praesent non libero quis libero scelerisque eleifend. Ut eleifend laoreet vulputate.</p>
                                        <p class="wizard-mg-ctn">
                                            Duis eu eros vitae risus sollicitudin blandit in non nisi. Phasellus rhoncus ullamcorper pretium. Etiam et viverra neque, aliquam imperdiet velit. Nam a scelerisque justo, id tristique diam. Aenean ut vestibulum velit,
                                        vel ornare augue. Nullam eu est malesuada, vehicula ex in, maximus massa. Sed sit amet massa venenatis, tristique orci sed, eleifend arcu.
                                        </p>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab4">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus purus sapien, cursus et egestas at, volutpat sed dolor. Aliquam sollicitudin dui ac euismod hendrerit. Phasellus quis lobortis dolor. Sed massa massa, sagittis nec fermentum eu, volutpat non lectus. Nullam vitae tristique nunc. Aenean vel placerat augue. Aliquam pharetra mauris neque, sitan amet egestas risus semper non. Proin egestas egestas ex sed gravida. Suspendisse commodo nisl sit amet risus volutpat volutpat. Phasellus vitae turpis a elit tinciduntansan ornare. Praesent non libero quis libero scelerisque eleifend. Ut eleifend laoreet vulputate.</p>
                                        <p class="wizard-mg-ctn">
                                            Duis eu eros vitae risus sollicitudin blandit in non nisi. Phasellus rhoncus ullamcorper pretium. Etiam et viverra neque, aliquam imperdiet velit. Nam a scelerisque justo, id tristique diam. Aenean ut vestibulum velit,
                                        vel ornare augue. Nullam eu est malesuada, vehicula ex in, maximus massa. Sed sit amet massa venenatis, tristique orci sed, eleifend arcu.
                                        </p>
                                    </div>
                                    <%--<div class="tab-pane wizard-ctn" id="tab5">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus purus sapien, cursus et egestas at, volutpat sed dolor. Aliquam sollicitudin dui ac euismod hendrerit. Phasellus quis lobortis dolor. Sed massa massa, sagittis nec fermentum eu, volutpat non lectus. Nullam vitae tristique nunc. Aenean vel placerat augue. Aliquam pharetra mauris neque, sitan amet egestas risus semper non. Proin egestas egestas ex sed gravida. Suspendisse commodo nisl sit amet risus volutpat volutpat. Phasellus vitae turpis a elit tinciduntansan ornare. Praesent non libero quis libero scelerisque eleifend. Ut eleifend laoreet vulputate.</p>
                                        <p class="wizard-mg-ctn">
                                            Duis eu eros vitae risus sollicitudin blandit in non nisi. Phasellus rhoncus ullamcorper pretium. Etiam et viverra neque, aliquam imperdiet velit. Nam a scelerisque justo, id tristique diam. Aenean ut vestibulum velit,
                                        vel ornare augue. Nullam eu est malesuada, vehicula ex in, maximus massa. Sed sit amet massa venenatis, tristique orci sed, eleifend arcu.
                                        </p>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab6">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus purus sapien, cursus et egestas at, volutpat sed dolor. Aliquam sollicitudin dui ac euismod hendrerit. Phasellus quis lobortis dolor. Sed massa massa, sagittis nec fermentum eu, volutpat non lectus. Nullam vitae tristique nunc. Aenean vel placerat augue. Aliquam pharetra mauris neque, sitan amet egestas risus semper non. Proin egestas egestas ex sed gravida. Suspendisse commodo nisl sit amet risus volutpat volutpat. Phasellus vitae turpis a elit tinciduntansan ornare. Praesent non libero quis libero scelerisque eleifend. Ut eleifend laoreet vulputate.</p>
                                        <p class="wizard-mg-ctn">Duis eu eros vitae risus sollicitudin blandit in non nisi. Phasellus rhoncus ullamcorper pretium. Etiam et viverra neque, aliquam imperdiet velit. Nam a scelerisque justo, id tristique diam. Aenean ut vestibulum velit.</p>
                                    </div>
                                    <div class="tab-pane wizard-ctn" id="tab7">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus purus sapien, cursus et egestas at, volutpat sed dolor. Aliquam sollicitudin dui ac euismod hendrerit. Phasellus quis lobortis dolor. Sed massa massa, sagittis nec fermentum eu, volutpat non lectus. Nullam vitae tristique nunc. Aenean vel placerat augue. Aliquam pharetra mauris neque, sitan amet egestas risus semper non. Proin egestas egestas ex sed gravida. Suspendisse commodo nisl sit amet risus volutpat volutpat. Phasellus vitae turpis a elit tinciduntansan ornare. Praesent non libero quis libero scelerisque eleifend. Ut eleifend laoreet vulputate.</p>
                                        <p class="wizard-mg-ctn">
                                            Duis eu eros vitae risus sollicitudin blandit in non nisi. Phasellus rhoncus ullamcorper pretium. Etiam et viverra neque, aliquam imperdiet velit. Nam a scelerisque justo, id tristique diam. Aenean ut vestibulum velit,
                                        vel ornare augue. Nullam eu est malesuada, vehicula ex in, maximus massa. Sed sit amet massa venenatis, tristique orci sed, eleifend arcu.
                                        </p>
                                    </div>--%>
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
                </div>
            </div>
        </div>
    </form>
</asp:Content>
