<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Listar_Tandas_Marinera.aspx.cs" Inherits="WEB.W_Listar_Tandas_Marinera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/momentjs/moment.js"></script>
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />

    <link href="assets/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="card">
            <div class="card-header card-header-icon" data-background-color="black">
                <i class="material-icons">assignment</i>
            </div>
            <h3>LISTADO DE TANDAS Y MARINERA</h3>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div class="card-content">
                        <div class="row">
                            <div class="card-content">
                                <div class="col-md-10 col-md-offset-1 table-responsive">
                                    <asp:GridView ID="GVTandaMar" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="PK_IT_CodTan,VT_Tipo_Tanda,VT_Descripcion,VM_Nombre"
                                        CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" PageSize="10"
                                        AllowPaging="True" OnPageIndexChanging="GVTanda_PageIndexChanging"
                                        Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" EmptyDataText="No hay Registros">
                                        <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                        <Columns>
                                            <asp:BoundField DataField="PK_IT_CodTan" HeaderText="Codigo" />
                                            <asp:BoundField DataField="VT_Tipo_Tanda" HeaderText="Tipo Tanda" />
                                            <asp:BoundField DataField="VT_Descripcion" HeaderText="Categoría" />
                                            <asp:BoundField DataField="VM_Nombre" HeaderText="Marinera" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
    <script src="assets/jquery-datatable/jquery.dataTables.js"></script>
    <script src="assets/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.print.min.js"></script>
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
