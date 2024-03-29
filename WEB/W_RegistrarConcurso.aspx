﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_RegistrarConcurso.aspx.cs" Inherits="WEB.W_RegistrarConcurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server" method="POST" class="form">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-header card-header-text" data-background-color="red">
                            <h4 id="txtPagina" runat="server" class="card-title">Registrar Concurso</h4>
                        </div>
                        <div class="card-content">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="upConcurso" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel2" runat="server" CssClass="col-lg-6 col-md-6 col-sd-12">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sd-12">
                                                <label class="col-md-2 label-on-left">Codigo</label>
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <asp:TextBox ID="txtCodigo" runat="server" class="form-control " Enabled="False"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sd-6">
                                            <label class="col-md-2 label-on-left">Nombre</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtNombre" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sd-6">
                                            <label class="col-md-2 label-on-left">Lugar</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtlugar" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sd-6">
                                            <label class="col-md-2 label-on-left">Fecha Inicial</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtFechaI" runat="server" class="form-control datepicker" type="date" required></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sd-6">
                                            <label class="col-md-2 label-on-left">Fecha Final</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtFechaF" runat="server" class="form-control datepicker" type="date" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2"></div>
                                        <div class="col-lg-5 col-md-5 col-sd-6">
                                            <label class="col-md-2 label-on-left">Capacidad del Lugar</label>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label"></label>
                                                <asp:TextBox ID="txtcant" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3"></div>
                                        <asp:Panel ID="Panel1" runat="server" CssClass="col-lg-6 col-md-6 col-sd-12">
                                            <div class="col-lg-5 col-md-5 col-sd-6">
                                                <label class="col-md-2 label-on-left">Estado</label>
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="selectpicker">
                                                        <asp:ListItem Text="---Seleccione----" Value="0" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="No Realizado" Value="No Realizado"></asp:ListItem>
                                                        <asp:ListItem Text="En Proceso" Value="En Proceso"></asp:ListItem>
                                                        <asp:ListItem Text="Realizado" Value="Realizado"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="col-lg-3 col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-8 col-md-8 col-sm-12">
                                            <p></p>
                                        </div>
                                        <asp:UpdatePanel ID="upBotonEnviar" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="col-lg-2 col-md-2 col-sm-6">
                                                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-fill btn-success" OnClick="btnRegistrar_Click" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="col-lg-2 col-md-2 col-sm-6">
                                            <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-fill btn-danger" OnClick="btnRegresar_Click" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header card-header-text" data-background-color="red">
                                <h4 id="H1" runat="server" class="card-title">Asignar Precios</h4>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    <div class="col-lg-9 col-md-9 col-sd-9">
                                        <label class="col-md-2 label-on-left">Precios</label>
                                        <div class="form-group label-floating is-empty">
                                            <label class="control-label"></label>
                                            <asp:DropDownList ID="ddlPrecios" runat="server" CssClass="selectpicker">
                                                <asp:ListItem Text="---Seleccione----" Value="0" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sd-3">
                                        <label class="col-md-2 label-on-left">Monto</label>
                                        <div class="form-group label-floating is-empty">
                                            <asp:TextBox ID="txtMonto" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-8">
                                        <asp:Button ID="btnRegistrarPrecio" runat="server" Text="➡" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="btnRegistrarPrecio_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header card-header-text" data-background-color="red">
                                <h4 id="H2" runat="server" class="card-title">Lista Precios</h4>
                            </div>
                            <asp:UpdatePanel ID="UpListaPrecios" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="card-content">
                                        <div class="col-lg-12 col-md-2 col-sm-12">
                                            <asp:GridView ID="GVVerPrecios" runat="server" AutoGenerateColumns="False"
                                                DataKeyNames="VPRE_Descripcion,DCP_Monto"
                                                CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable" PageSize="5"
                                                AllowPaging="True" OnPageIndexChanging="GVVerPrecios_PageIndexChanging"
                                                Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" EmptyDataText="No hay datos">
                                                <RowStyle HorizontalAlign="center" CssClass="table table-striped table-bordered" />
                                                <Columns>
                                                    <asp:BoundField DataField="VPRE_Descripcion" HeaderText="Precio" />
                                                    <asp:BoundField DataField="DCP_Monto" HeaderText="Monto" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hfIdConcurso" runat="server" ClientIDMode="Static" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script>
        function showSuccessMessage2() {
            setTimeout(function () {
                swal({
                    title: "Todo guardado",
                    text: "Pulsa el botón y se te redirigirá",
                    type: "success"
                }, function () {
                    window.location = "GestionCatalogo.aspx";
                });
            }, 1000);
        }
        function showMessage(from, align, message, type) {
            $.notify({
                icon: "notifications",
                message: message

            }, {
                    type: type,
                    timer: 3000,
                    placement: {
                        from: from,
                        align: align
                    }
                });
        }

    </script>
</asp:Content>
