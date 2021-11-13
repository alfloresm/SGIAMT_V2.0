<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Gestionar_Concurso.aspx.cs" Inherits="WEB.W_Gestionar_Concurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/momentjs/moment.js"></script>

    <link href="assets/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-lg-12 col-md-12 col-sm-12 card-header">
            <h2>Gestionar Concurso</h2>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                            <ContentTemplate>
                                <div class="card">
                                    <div class="card-header card-header-icon" data-background-color="black">
                                        <i class="material-icons">assignment</i>
                                    </div>
                                    <h3>Lista Concurso</h3>
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-1 text-center">
                                            <asp:Button runat="server" Text="REGISTRAR" ID="btnRegistrar" CssClass="btn bg-info waves-effect glyphicon-plus" OnClick="btnRegistrar_Click" />
                                        </div>
                                        <%--<div class="col-md-4 col-md-offset-2 text-center">
                                            <asp:Button runat="server" Text="ACTUALIZAR CATEGORIAS" ID="btnActualizarC" CssClass="btn bg-indigo waves-effect" OnClick="btnActualizarCat_Click" />
                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div class="card-content">
                                                <asp:GridView ID="GVConcurso" runat="server" AutoGenerateColumns="False"
                                                    DataKeyNames="PK_IC_IdConcurso,VC_NombreCon,DC_PrecioSeriado,DC_PrecioNovel,VC_Estado"
                                                    CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" PageSize="5"
                                                    AllowPaging="True" OnPageIndexChanging="GVConcurso_PageIndexChanging" OnRowCommand="GVConcurso_RowCommand"
                                                    Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small">
                                                    <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                    <Columns>
                                                        <asp:BoundField DataField="PK_IC_IdConcurso" HeaderText="Concurso" />
                                                        <asp:BoundField DataField="VC_NombreCon" HeaderText="Nombre" />
                                                        <asp:BoundField DataField="DC_PrecioSeriado" HeaderText="Cantidad Seriado" />
                                                        <asp:BoundField DataField="DC_PrecioNovel" HeaderText="Cantidad Novel" />
                                                        <asp:BoundField DataField="VC_Estado" HeaderText="Estado" />
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button runat="server" Text="✏️"
                                                                    Visible='<%# ValidacionEstado(Eval("VC_Estado").ToString()) %>'
                                                                    CommandName="Actualizar" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-sm btn-warning" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:ButtonField ButtonType="button" AccessibleHeaderText="btnDetalle" Text="📄" CommandName="Detalle">
                                                            <ControlStyle CssClass="btn btn-sm btn-info " />
                                                        </asp:ButtonField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
