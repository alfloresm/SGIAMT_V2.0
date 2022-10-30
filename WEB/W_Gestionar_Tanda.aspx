<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Gestionar_Tanda.aspx.cs" Inherits="WEB.W_Gestionar_Tanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/momentjs/moment.js"></script>
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />

    <link href="assets/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <script src="assets/jquery-datatable/jquery.dataTables.js"></script>
    <script src="assets/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ContentPlaceHolder1_GVTanda').DataTable({
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="card">
            <div class="card-header card-header-icon" data-background-color="black">
                <i class="material-icons">assignment</i>
            </div>
            <h3>GESTIONAR TANDA</h3>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div class="card-content">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-1 ">
                                <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker">
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-4 col-md-offset-2 text-center">
                                <asp:Button runat="server" Text="Asignar Tanda" ID="btnAsignar" CssClass="btn btn-info waves-effect glyphicon-plus" OnClick="btnAsignar_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-content">
                                <div class="col-md-10 col-md-offset-1 table-responsive">
                                    <asp:GridView ID="GVTanda" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="PK_IT_CodTan,VT_Tipo_Tanda,VT_Descripcion"
                                        CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable"
                                        AllowPaging="True" Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" EmptyDataText="No hay Registros">
                                        <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                        <Columns>
                                            <asp:BoundField DataField="PK_IT_CodTan" HeaderText="Codigo" />
                                            <asp:BoundField DataField="VT_Tipo_Tanda" HeaderText="Tipo Tanda" />
                                            <asp:BoundField DataField="VT_Descripcion" HeaderText="Categoría" />
                                            <asp:TemplateField HeaderText="Elegir Marinera">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="btnElegirM" Text="↪" CommandName="Elegir" CommandArgument='<%# Container.DataItemIndex %>'
                                                        CssClass="btn btn-sm btn-success" OnClick="btnElegirM_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
    
    <script src="../../assets/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="../../assets/jquery-datatable/extensions/export/buttons.print.min.js"></script>
</asp:Content>
