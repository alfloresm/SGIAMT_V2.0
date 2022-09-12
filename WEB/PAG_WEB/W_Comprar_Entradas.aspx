<%@ Page Title="SGIAMT" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Comprar_Entradas.aspx.cs" Inherits="WEB.PAG_WEB.W_Comprar_Entradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list mg-t-30">
                <div class="cmp-tb-hd">
                    <h2>Comprar Entradas</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-element-list mg-t-30">
                <div class="cmp-tb-hd">
                    <h2>Elegir Concurso</h2>
                    <p>Seleccionar concurso:</p>
                    <button class="btn btn-info" id="btnVerInfoConcurso">Ver Información</button>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-element-list mg-t-30">
                <div class="cmp-tb-hd">
                    <h2>Información del Concurso</h2>
                    <%--<p>Complete los siguientes datos para comprar sus entradas: </p>--%>
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
                        <div class="form-group ic-cmp-int float-lb floating-lb">
                            <div class="form-ic-cmp">
                                <i class="notika-icon notika-support"></i>
                            </div>
                            <div class="nk-int-st">
                                <input type="text" class="form-control">
                                <label class="nk-label">Dni</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group ic-cmp-int float-lb floating-lb">
                            <div class="form-ic-cmp">
                                <i class="notika-icon notika-support"></i>
                            </div>
                            <div class="nk-int-st">
                                <input type="text" class="form-control">
                                <label class="nk-label">Nombre Completo</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group ic-cmp-int float-lb floating-lb">
                            <div class="form-ic-cmp">
                                <i class="notika-icon notika-mail"></i>
                            </div>
                            <div class="nk-int-st">
                                <input type="text" class="form-control">
                                <label class="nk-label">Correo Electrónico</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group ic-cmp-int float-lb form-elet-mg">
                            <div class="form-ic-cmp">
                                <i class="notika-icon notika-house"></i>
                            </div>
                            <div class="nk-int-st">
                                <input type="text" class="form-control">
                                <label class="nk-label">Cantidad de Entradas</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group ic-cmp-int float-lb form-elet-mg">
                            <div class="form-ic-cmp">
                                <i class="notika-icon notika-calendar"></i>
                            </div>
                            <div class="nk-int-st">
                                <input type="date" class="form-control">
                                <%--<label class="nk-label">Fecha</label>--%>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group ic-cmp-int float-lb form-elet-mg">
                            <div class="row">
                                <i class="notika-icon notika-calendar"></i>
                                <label class="nk-label">Fecha del Concurso</label>
                            </div>
                            <div class="bootstrap-select fm-cmp-mg">
                                <label class="nk-label">Fecha del Concurso</label>
                            </div>
                        </div>
                    </div>--%>
                    <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="form-element-list mg-t-30">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select class="selectpicker">
                                            <option>Fecha 1</option>
                                            <option>Fecha 2</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>

                <br />
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <button class="btn btn-success notika-btn-success">Success</button>

                        <button class="btn btn-danger notika-btn-danger">Danger</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>$(function () {
            $(".dataTable").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "bProcessing": false,
                "bLengthChange": false,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Buscar registros",
                    lengthMenu: "Mostrar _MENU_ registros",
                    paginate: false,

                },
                "paging": false,
                "info": false,
                responsive: true
            });
        });
    </script>
</asp:Content>
