<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Mis_Inscripciones.aspx.cs" Inherits="WEB.PAG_WEB.W_Mis_Inscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/css/dropzone/dropzone.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/wave/button.css">
    <link href="assets/js/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <%-- Data Table --%>
    <link rel="stylesheet" href="assets/css/jquery.dataTables.min.css">
    <script src="assets/js/data-table/jquery.dataTables.min.js"></script>
    <%--<script>(function ($) {
            "use strict";
            $(document).ready(function () {
                $('#gvInscritos').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
                $('#gvParticipados').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            });
        })(jQuery);
        function DataTableload() { $('#gvInscritos').prepend($('<thead></thead>').append($(this).find('tr:first')).DataTable()); $('#gvParticipados').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable(); }
    </script>--%>
    <%--<script>$(function () {
            $(".dataTable").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                "bProcessing": false,
                "bLengthChange": false,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Buscar registros",
                    lengthMenu: "Mostrar _MENU_ registros",
                    paginate: {
                        first: "Primero",
                        last: "&Uacute;ltimo",
                        next: "Siguiente",
                        previous: "Anterior"
                    },

                }, "bLengthChange": false,
                "bFilter": true,
                "bInfo": false,
                "bAutoWidth": false,
                responsive: true,
                order: [[2, 'desc']],
            });
        });</script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src='http://ksylvest.github.io/jquery-growl/javascripts/jquery.growl.js' type='text/javascript'></script>
    <script src="assets/js/notification/bootstrap-growl.min.js"></script>
    <script src="assets/js/dropzone/dropzone.js"></script>
    <script src="assets/js/notification/notificacion.js" type='text/javascript'></script>
    <script src="assets/js/SweetAlert/sweetalert.min.js" type='text/javascript'></script>
    <script src="assets/js/UploadFile.js" type='text/javascript'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="data-table-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="data-table-list">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-tax"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Mis Inscripciones</h2>
                                            <asp:HiddenField ID="hfDNI" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="widget-tabs-int tab-ctm-wp mg-t-30">
                                        <div class="widget-tabs-list">
                                            <ul class="nav nav-tabs tab-nav-right">
                                                <li class="active"><a data-toggle="tab" href="#home2">Concursos Inscritos</a></li>
                                                <li><a data-toggle="tab" href="#menu22">Concursos Participados</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="home2" class="tab-pane fade in active">
                                                    <div class="tab-ctn">
                                                        <asp:UpdatePanel ID="upListaIns" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <ContentTemplate> 
                                                                <asp:GridView ID="gvInscritos" runat="server" AutoGenerateColumns="False" ClientIDMode="Static"
                                                                    DataKeyNames="VC_NombreCon,PK_IUM_CodPart,VM_NombreMod,VCA_NomCategoria,Estado,DI_Monto,VB_ArchivoPago"
                                                                    CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable"
                                                                    Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" EmptyDataText="No existe inscrpciones para concursos de la academia">
                                                                    <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="VC_NombreCon" HeaderText="Concurso"/>
                                                                        <asp:BoundField DataField="PK_IUM_CodPart" HeaderText="Codigo Participante" />
                                                                        <asp:BoundField DataField="VM_NombreMod" HeaderText="Modalidad" />
                                                                        <asp:BoundField DataField="VCA_NomCategoria" HeaderText="categoría" />
                                                                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                                                        <asp:BoundField DataField="DI_Monto" HeaderText="Total (S/.)" />
                                                                        <asp:BoundField DataField="VB_ArchivoPago" HeaderText="archivo" Visible="false" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                                <div id="menu22" class="tab-pane fade">
                                                    <div class="tab-ctn">
                                                        <asp:UpdatePanel ID="UpListaPart" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                            <ContentTemplate>
                                                                <asp:GridView ID="gvParticipados" runat="server" AutoGenerateColumns="False" ClientIDMode="Static"
                                                                    DataKeyNames="PK_IUCP_Cod,VCPA_NombreConcurso,VCPA_NombreAcademia,VM_NombreMod,IUCP_PuntajeTotal,IUCP_Puesto"
                                                                    CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable"
                                                                    Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" EmptyDataText="No existe inscrpciones para concursos en otras academias">
                                                                    <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="PK_IUCP_Cod" HeaderText="codigo" Visible="false"/>
                                                                        <asp:BoundField DataField="VCPA_NombreConcurso" HeaderText="Concurso Participado" />
                                                                        <asp:BoundField DataField="VCPA_NombreAcademia" HeaderText="Academia Organizadora" />
                                                                        <asp:BoundField DataField="VM_NombreMod" HeaderText="Modalidad" />
                                                                        <asp:BoundField DataField="IUCP_PuntajeTotal" HeaderText="Puntaje total" />
                                                                        <asp:BoundField DataField="IUCP_Puesto" HeaderText="Puesto" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </div>
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
