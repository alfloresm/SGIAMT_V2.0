<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Mostrar_Resultado.aspx.cs" Inherits="WEB.W_Mostrar_Resultado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />
    <link href="../assets/css/demo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <form id="form1" runat="server">
                        <asp:scriptmanager id="ScriptManager1" runat="server" asyncpostbacktimeout="3600"></asp:scriptmanager>

                        <div class="card">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3" hidden="hidden">
                                    <div class="col-md-6 text-center">
                                        <h5 class="text-danger">La ultima tanda calificada fue: </h5>
                                    </div>
                                    <div class="col-md-6">
                                        <br />
                                        <asp:label id="lblNumTanda" runat="server" text="Label" cssclass="text-danger" font-bold="True" font-size="Large"></asp:label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-header card-header-text" data-background-color="red">
                                <h4 class="card-title">Buscar Tanda</h4>
                            </div>
                            <div class="card-content">

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="col-md-8 form-group form-search is-empty">
                                            <asp:textbox id="txtTanda" runat="server" class="form-control" placeholder="Buscar Tanda" maxlength="8" textmode="Number" font-size="Large" required></asp:textbox>
                                            <span class="material-input"></span>
                                            <asp:label id="lblMensaje1" runat="server" text=""></asp:label>
                                        </div>
                                        <asp:updatepanel id="upnBotonBuscar1" runat="server" updatemode="Conditional">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="btnBuscar1" runat="server" CssClass="btn btn-white btn-round btn-just-icon" OnClick="btnBuscar1_Click">
                                                    <i class="material-icons">search</i>
                                                    <div class="ripple-container"></div>
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:updatepanel>
                                    </div>
                                    <asp:updatepanel runat="server" id="UpdatePanelInfo" updatemode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-md-6">
                                                <div class="col-md-6">
                                                    <label class="col-md-3 label-on-left">Categoria</label>
                                                    <div class="col-md-9">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <asp:Label ID="lblCategoria" runat="server" Text="" CssClass="text-uppercase" Font-Size="X-Large"></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="col-md-3 label-on-left">Modalidad</label>
                                                    <div class="col-md-9">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <asp:Label ID="lblModalidad" runat="server" Text="" CssClass="text-uppercase" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:updatepanel>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header card-header-text" data-background-color="red">
                                <h4 class="card-title">Mostrar Resultado</h4>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    <asp:updatepanel runat="server" id="UpdatePanelCalificacion" updatemode="Conditional">
                                        <ContentTemplate>
                                            <asp:Literal ID="LiteralParticipantes" runat="server"></asp:Literal>
                                            </ContentTemplate>
                                    </asp:updatepanel>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
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
