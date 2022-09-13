<%@ Page Title="SGIAMT" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Comprar_Entradas.aspx.cs" Inherits="WEB.PAG_WEB.W_Comprar_Entradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server" method="POST" class="form">
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
                        <%--<p>Seleccionar concurso:</p>--%>
                        <%-- <div class="bootstrap-select fm-cmp-mg" typeof="selectpicker">
                                    <select class="selectpicker">
                                        <option>--- Seleccione ---</option>
                                        <option>Cariska</option>
                                    </select>
                                </div>--%>
                        <%-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">--%>

                        <%--</div>--%>
                        <%--<button class="btn btn-info" id="btnVerInfoConcurso">Ver Información</button>--%>

                        <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker" Font-Size="Small" Width="280px">
                            <asp:ListItem Text="---SELECCIONAR----" Value="0" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:LinkButton ID="btnVerInfo" runat="server" OnClick="btnVerInfo_Click" CssClass="btn btn-info notika-btn-info" BackColor="SkyBlue">
                            <i class="notika-icon notika-search"></i> Ver Información
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="form-element-list mg-t-30">
                    <div class="cmp-tb-hd">
                        <h2>Información del Concurso</h2>
                        <%--<p>Complete los siguientes datos para comprar sus entradas: </p>--%>
                        <%--<div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="card-content">
                                    <asp:GridView ID="GVConcurso" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="PK_IC_IdConcurso,VC_NombreCon,DTC_FechaInicio,IC_Capacidad1,IC_Capacidad1"
                                        CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" PageSize="10"
                                        AllowPaging="True" OnPageIndexChanging="GVConcurso_PageIndexChanging" OnRowCommand="GVConcurso_RowCommand"
                                        Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small">
                                        <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                        <Columns>
                                            <asp:BoundField DataField="PK_IC_IdConcurso" HeaderText="Concurso" Visible="false" />
                                            <asp:BoundField DataField="VC_NombreCon" HeaderText="Nombre" />
                                            <asp:BoundField DataField="DTC_FechaInicio" HeaderText="Fecha" />
                                            <asp:BoundField DataField="IC_Capacidad1" HeaderText="Capacidad 1" />
                                            <asp:BoundField DataField="IC_Capacidad2" HeaderText="Capacidad 2" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>--%>

                        <div class="col-md-11">
                            <h1 id="H1" runat="server" class="card-title"></h1>
                        </div>
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
                                    <i class="notika-icon notika-edit"></i>
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
                                    <i class="notika-icon notika-tax"></i>
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
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <button class="btn btn-success notika-btn-success">Registrar</button>
                            <button class="btn btn-danger notika-btn-danger">Regresar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
