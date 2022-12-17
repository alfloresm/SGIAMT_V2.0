<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Validar_Inscripcion.aspx.cs" Inherits="WEB.W_Validar_Inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/momentjs/moment.js"></script>
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />
    <script src="assets/sweetalert/sweetalert.min.js"></script>
    <link href="assets/sweetalert/sweetalert.css" rel="stylesheet" />
    <link href="assets/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <script src="assets/jquery-datatable/jquery.dataTables.js"></script>
    <script src="assets/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ContentPlaceHolder1_GVInscripciones').DataTable({
                "pagingType": "full_numbers",
                "lengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records",
                }

            });
            $('.card .material-datatables label').addClass('form-group');
        });

        function tableLoad() {
            $('#ContentPlaceHolder1_GVInscripciones').DataTable
                ({
                    "pagingType": "full_numbers",
                "lengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records",
                }
                });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
        <div class="col-lg-12 col-md-12 col-sm-12 card-header">
            <h2>Validar Entradas</h2>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <div class="card">
                            <div class="card-header card-header-icon" data-background-color="black">
                                <i class="material-icons">assignment</i>
                            </div>
                            <h3>Lista Concurso</h3>
                            <div class="card-content">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-1 form-group label-floating is-empty">
                                        <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4 col-md-offset-2 form-group label-floating is-empty">
                                        <asp:UpdatePanel ID="UpBtnIr" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="btnIr" runat="server" CssClass="btn btn-primary btn-round btn-just-icon" OnClick="btnIr_Click">
                                                    <i class="material-icons">arrow_right_alt</i>
                                                    <div class="ripple-container"></div>
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <asp:UpdatePanel ID="upLista" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                            <ContentTemplate>

                                                <asp:GridView ID="GVInscripciones" runat="server" AutoGenerateColumns="False"
                                                    DataKeyNames="VC_NombreCon,PK_IUM_CodPart,VM_NombreMod,VCA_NomCategoria,Estado,DI_Monto,VB_ArchivoPago,Participante,Pareja"
                                                    CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" OnRowCommand="GVInscripciones_RowCommand"
                                                    Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small">
                                                    <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                    <Columns>
                                                        <asp:BoundField DataField="VC_NombreCon" HeaderText="Dni" Visible="false" />
                                                        <asp:BoundField DataField="PK_IUM_CodPart" HeaderText="Codigo Participante" />
                                                        <asp:BoundField DataField="VM_NombreMod" HeaderText="Modalidad" />
                                                        <asp:BoundField DataField="VCA_NomCategoria" HeaderText="categoría" />                                                     
                                                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                                        <asp:BoundField DataField="DI_Monto" HeaderText="Total (S/.)" />                                                        
                                                        <asp:BoundField DataField="VB_ArchivoPago" HeaderText="archivo" Visible="false" />
                                                        <asp:BoundField DataField="Participante" HeaderText="Nombre de Participante" />
                                                        <asp:BoundField DataField="Pareja" HeaderText="Nombre de Pareja" />
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button runat="server" Text="🔎"
                                                                    Visible='<%#ValidacionEstado(Eval("Estado").ToString())%>'
                                                                    CommandName="Validar" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-sm btn-success" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button runat="server" Text="📧"
                                                                    Visible='<%#ValidacionEstado2(Eval("Estado").ToString())%>'
                                                                    CommandName="EnviarCorreo" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-sm btn-default" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
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
        <%-- Popup Ver Imagen --%>
        <div class="modal fade" id="ValidarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                        <h2 class="modal-title" id="H1" runat="server">Validar Compra de entradas
                        </h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <asp:UpdatePanel runat="server" ID="upDatos" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label class="col-md-2 label-on-left">Modalidad:</label>
                                        <div class="form-group label-floating is-empty">
                                            <label class="control-label"></label>
                                            <asp:TextBox ID="txtModalidad" runat="server" class="form-control " Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label class="col-md-2 label-on-left">Monto:</label>
                                        <div class="form-group label-floating is-empty">
                                            <label class="control-label"></label>
                                            <asp:TextBox ID="txtMonto" runat="server" class="form-control " Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                                <asp:UpdatePanel runat="server" ID="UPImagen" UpdateMode="Always">
                                    <ContentTemplate>
                                        <asp:Image ID="Image1" Height="300px" Width="300px" runat="server" class="rounded" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:UpdatePanel runat="server" ID="upValidacion" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <asp:LinkButton ID="btnAprobar" runat="server" class="btn btn-success btn-round" OnClick="btnAprobar_Click">Aprobar</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <asp:LinkButton ID="btnRechazar" runat="server" class="btn btn-danger btn-round" OnClick="btnRechazar_Click">Rechazar</asp:LinkButton>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <%-- Popup Aprobacion --%>
        <div class="modal fade" id="AprobarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                        <h2 class="modal-title" id="H3" runat="server">Aprobar Compra
                        </h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h4 id="h4" runat="server">¿Está seguro que desea aprobar la inscripción?</h4>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:UpdatePanel runat="server" ID="upAprobar" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:LinkButton ID="btnAceptar" runat="server" class="btn btn-success btn-round" OnClick="btnAceptar_Click">Aprobar</asp:LinkButton>
                                <button type="button" class="btn btn-danger btn-round" data-dismiss="modal">Cancelar</button>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <%-- Popup Aprobacion --%>
        <div class="modal fade" id="RechazarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                        <h2 class="modal-title" id="H5" runat="server">Rechazar Compra
                        </h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <h4 id="h6" runat="server">¿Está seguro que desea Rechazar la inscripción?</h4>
                        </div>
                        <%--<div class="row">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="col-md-6 col-md-offset-3">
                                        <div class="form-group">
                                            <label>Descripción del rechazo</label>
                                            <div class="form-group label-floating is-empty">
                                                <asp:TextBox ID="txtDescripcion" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>--%>
                    </div>
                    <div class="modal-footer">
                        <asp:UpdatePanel runat="server" ID="upRechazar" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:LinkButton ID="RechazarButton1" runat="server" class="btn btn-warning btn-round" OnClick="RechazarButton1_Click">Rechazar</asp:LinkButton>
                                <button type="button" class="btn btn-danger btn-round" data-dismiss="modal">Cancelar</button>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" ID="upHiddenfields" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="hfCod" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hfEstado" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hfEmail" runat="server" ClientIDMode="Static" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script>
        function showSA(title) {
            swal({
                title: title,
                buttonsStyling: false,
                confirmButtonClass: "btn btn-success"
            });
        }
    </script>
    <script src="../../assets/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.print.min.js"></script>
</asp:Content>
