<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Administrar_Perfil.aspx.cs" Inherits="WEB.W_Administrar_Perfil" %>

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
            $('#ContentPlaceHolder1_GVPerfil').DataTable({
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
            $('#ContentPlaceHolder1_GVPerfil').DataTable
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
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="upLista" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                            <ContentTemplate>
                                <div class="card">
                                    <div class="card-header card-header-icon" data-background-color="black">
                                        <i class="material-icons">assignment</i> Administrar Perfil
                                    </div>
                                    <div class="card-content">
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-1 text-center">
                                                <asp:Button runat="server" Text="REGISTRAR" ID="btnRegistrar" CssClass="btn bg-info waves-effect glyphicon-plus" OnClick="btnRegistrar_Click" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">
                                                <asp:GridView ID="GVPerfil" runat="server" AutoGenerateColumns="False"
                                                    DataKeyNames="PK_VU_Dni,VU_Nombre,VU_APaterno,VU_AMaterno,VU_Correo,VU_Celular,VTU_nombreTipoUsuario,FK_ITU_TipoUsuario,VU_Contrasenia"
                                                    CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" OnRowCommand="GVPerfil_RowCommand"
                                                    Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" RowStyle-CssClass="small">
                                                    <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                    <Columns>
                                                        <asp:BoundField DataField="PK_VU_Dni" HeaderText="Código" />
                                                        <asp:BoundField DataField="VU_Nombre" HeaderText="Nombre" />
                                                        <asp:BoundField DataField="VU_APaterno" HeaderText="Apellido" />
                                                        <asp:BoundField DataField="VU_AMaterno" HeaderText="Apellido" />
                                                        <asp:BoundField DataField="VU_Correo" HeaderText="Correo" Visible="false" />
                                                        <asp:BoundField DataField="VU_Celular" HeaderText="Correo" Visible="false" />
                                                        <asp:BoundField DataField="VTU_nombreTipoUsuario" HeaderText="Usuario" />
                                                        <asp:BoundField DataField="FK_ITU_TipoUsuario" HeaderText="CodTipo" Visible="false" />
                                                        <asp:BoundField DataField="VU_Contrasenia" HeaderText="contrasenia" Visible="false" />

                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button runat="server" Text="✏️"
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
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" ID="UpDatos" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="HFOperacion" runat="server" ClientIDMode="Static" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <%-- Modal --%>
        <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
                <div class="modal-content">
                    <asp:UpdatePanel runat="server" ID="updPanelModal" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                                <h2 class="modal-title" id="myModalLabel" runat="server"></h2>
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">Codigo: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtCodigo" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">Nombre: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">Apellido Paterno: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtApeP" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">Apellido Materno: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtApeM" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">correo: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtCorreo" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">contraseña: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtContrasenia" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">Celular: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:TextBox ID="txtCelular" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <label class="col-md-2 label-on-left">Tipo Usuario: </label>
                                    <div class="form-group label-floating is-empty">
                                        <label class="control-label"></label>
                                        <asp:DropDownList ID="ddlTipoUsuario" runat="server">
                                            <asp:ListItem Value="2" Text="Gerente" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Staff"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Jurado"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Presentador"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="modal-footer text-center">
                                    <asp:UpdatePanel ID="upBotonEnviar" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnAceptar" runat="server" Text="Guardar" class="btn btn-success btn-round" OnClick="btnAceptar_Click" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <button type="button" class="btn btn-info btn-round" data-dismiss="modal">Cerrar</button>
                                </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
