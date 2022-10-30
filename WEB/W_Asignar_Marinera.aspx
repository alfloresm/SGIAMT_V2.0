<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Asignar_Marinera.aspx.cs" Inherits="WEB.W_Asignar_Marinera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/momentjs/moment.js"></script>
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />
    <link href="assets/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    <script src="assets/jquery-datatable/jquery.dataTables.js"></script>
    <script src="assets/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ContentPlaceHolder1_GVTandaMarinera').DataTable({
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
    <form id="form1" runat="server" class="form">
        <div class="card">
            <div class="card-header card-header-text" data-background-color="red">
                <h4 id="txtPagina" runat="server" class="card-title">Elegir Marinera</h4>
            </div>
            <div class="card-content">
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1 ">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-4 col-md-offset-2 text-center">
                        <asp:Button runat="server" Text="Ir ▶" ID="btnIr" CssClass="btn btn-info waves-effect glyphicon-plus" OnClick="btnIr_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="card-content">
                        <div class="col-md-10 col-md-offset-1 table-responsive">
                            <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>
                                    <asp:GridView ID="GVTandaMarinera" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="PK_IT_CodTan,VM_NombreMod,VT_Descripcion,VT_Estado,FK_IM_CodMar"
                                        CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" OnRowCommand="GVTandaMarinera_RowCommand"
                                        AllowPaging="True" Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" EmptyDataText="No hay Registros">
                                        <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                        <Columns>
                                            <asp:BoundField DataField="PK_IT_CodTan" HeaderText="Codigo" />
                                            <asp:BoundField DataField="VM_NombreMod" HeaderText="Tipo Tanda" />
                                            <asp:BoundField DataField="VT_Descripcion" HeaderText="Categoría" />
                                            <asp:BoundField DataField="VT_Estado" HeaderText="Estado" Visible="false" />
                                            <asp:BoundField DataField="FK_IM_CodMar" HeaderText="codMar" Visible="false" />
                                            <asp:TemplateField HeaderText="Marinera">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="btnElegirM" Text="↪" CommandName="Elegir" CommandArgument='<%# Container.DataItemIndex %>'
                                                        Visible='<%#ValidacionElegirMarinera(Eval("FK_IM_CodMar").ToString()) %>' CssClass="btn btn-sm btn-success" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ver">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="btnVerM" Text="👁" CommandName="Ver" CommandArgument='<%# Container.DataItemIndex %>'
                                                        Visible='<%# ValidacionVerMarinera(Eval("FK_IM_CodMar").ToString()) %>' CssClass="btn btn-sm btn-info" />
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
    </form>
</asp:Content>
