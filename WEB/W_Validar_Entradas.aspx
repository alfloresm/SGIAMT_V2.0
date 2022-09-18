<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Validar_Entradas.aspx.cs" Inherits="WEB.W_Validar_Entradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                            <ContentTemplate>
                                <div class="card">
                                    <div class="card-header card-header-icon" data-background-color="black">
                                        <i class="material-icons">assignment</i>
                                    </div>
                                    <h3>Lista Concurso</h3>
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-1 text-center">
                                            <label class="control-label"></label>
                                            <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div class="card-content">
                                                <asp:GridView ID="GVEntrada" runat="server" AutoGenerateColumns="False"
                                                    DataKeyNames="PK_VES_Dni,VES_NombreCompleto,VES_Email,IES_NumEntrada,VES_Estado"
                                                    CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" PageSize="10"
                                                    AllowPaging="True" OnPageIndexChanging="GVEntrada_PageIndexChanging" OnRowCommand="GVEntrada_RowCommand"
                                                    Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small">
                                                    <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                    <Columns>
                                                        <asp:BoundField DataField="PK_VES_Dni" HeaderText="Dni" Visible="false" />
                                                        <asp:BoundField DataField="VES_NombreCompleto" HeaderText="Nombres" />
                                                        <asp:BoundField DataField="VES_Email" HeaderText="Correo" />
                                                        <asp:BoundField DataField="IES_NumEntrada" HeaderText="Cantidad de Entradas" />
                                                        <asp:BoundField DataField="VES_Estado" HeaderText="Estado" />
                                                        <%--<asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button runat="server" Text="✏️"
                                                                    Visible='<%# ValidacionEstado(Eval("VC_Estado").ToString()) %>'
                                                                    CommandName="Actualizar" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-sm btn-warning" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button runat="server" Text="↪"
                                                                    Visible='<%# ValidacionEstado2(Eval("VC_Estado").ToString()) %>'
                                                                    CommandName="CambiarEstado" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-sm btn-default" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:ButtonField ButtonType="button" AccessibleHeaderText="btnDetalle" Text="📄" CommandName="Detalle">
                                                            <ControlStyle CssClass="btn btn-sm btn-info " />
                                                        </asp:ButtonField>--%>
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
        <%-- Popup Detalles --%>
        <%-- Popup Detalles --%>
        <div class="modal fade" id="EstadoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                        <h2 class="modal-title" id="H1" runat="server">Cambio de estado
                        </h2>
                    </div>
                    <div class="modal-body">
                        <h4 id="h2" runat="server">¿Está seguro que desea cambiar el estado?</h4>
                    </div>
                    <div class="modal-footer text-center">
                        <asp:LinkButton ID="btnAceptar" runat="server" class="btn btn-success btn-round"></asp:LinkButton>
                        <button type="button" class="btn btn-danger btn-round" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
