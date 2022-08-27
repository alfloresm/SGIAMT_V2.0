<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Inscribir_ParticipanteP.aspx.cs" Inherits="WEB.W_Inscribir_ParticipanteP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="card-header card-header-text" data-background-color="red">
                            <h4 id="txtPagina" runat="server" class="card-title">Inscribir Participante</h4>
                        </div>
                        <div class="card-content">
                            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="col-md-12 label-on-left">Concurso</label>
                                    <div class="col-md-8 form-group label-floating is-empty">
                                        <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="selectpicker">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="col-md-12 label-on-left">Modalidad</label>
                                    <div class="col-md-8 form-group label-floating is-empty">
                                        <asp:DropDownList ID="ddlModalidades" runat="server" CssClass="selectpicker">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4 form-group label-floating is-empty">
                                        <asp:UpdatePanel ID="UpBtnIr2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="btnIr2" runat="server" CssClass="btn btn-primary btn-round btn-just-icon" OnClick="btnIr2_Click">
                                                    <i class="material-icons">arrow_right_alt</i>
                                                    <div class="ripple-container"></div>
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <asp:UpdatePanel ID="UpParticipanteInd" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlParticipanteIndividual" runat="server" CssClass="col-lg-12 col-md-12 col-sm-12">
                                                <div class="col-md-6">
                                                    <div class="col-md-8 form-group form-search is-empty">
                                                        <asp:TextBox ID="txtDni" runat="server" class="form-control" placeholder="Buscar" MinLength="8" MaxLength="8"></asp:TextBox>
                                                        <span class="material-input"></span>
                                                        <asp:Label ID="lblMensaje1" runat="server" Text=""></asp:Label>
                                                    </div>
                                                    <asp:UpdatePanel ID="upnBotonBuscar1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:LinkButton ID="btnBuscar1" runat="server" CssClass="btn btn-white btn-round btn-just-icon" OnClick="btnBuscar1_Click">
                                                    <i class="material-icons">search</i>
                                                    <div class="ripple-container"></div>
                                                            </asp:LinkButton>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:UpdatePanel ID="updPanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="row">

                                                                <label class="col-md-3 label-on-left">Nombre</label>
                                                                <div class="col-md-9">
                                                                    <div class="form-group label-floating is-empty">
                                                                        <label class="control-label"></label>
                                                                        <asp:TextBox ID="txtNombre1" runat="server" CssClass="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col-md-3 label-on-left">Categoria</label>
                                                                <div class="col-md-9">
                                                                    <div class="form-group label-floating is-empty">
                                                                        <label class="control-label"></label>
                                                                        <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        <asp:TextBox ID="txtGen" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                                                        <asp:TextBox ID="txtcodCat" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="row">
                                    <asp:UpdatePanel ID="UpParticipantePareja" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlParticipantePareja" runat="server">
                                                <div class="col-md-6">
                                                    <div class="col-md-8 form-group form-search is-empty">
                                                        <asp:TextBox ID="txtdni2" runat="server" class="form-control" placeholder="Buscar" MinLength="8" MaxLength="8"></asp:TextBox>
                                                        <asp:Label ID="lblmensaje2" runat="server" Text=""></asp:Label>
                                                        <span class="material-input"></span>
                                                    </div>
                                                    <asp:UpdatePanel ID="upnBotonBuscar2" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:LinkButton ID="btnBuscar2" runat="server" CssClass="btn btn-white btn-round btn-just-icon" OnClick="btnBuscar2_Click">
                                                    <i class="material-icons">search</i>
                                                    <div class="ripple-container"></div>
                                                            </asp:LinkButton>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:UpdatePanel ID="updPanel2" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <label class="col-md-3 label-on-left">Nombre</label>
                                                                <div class="col-md-9">
                                                                    <div class="form-group label-floating is-empty">
                                                                        <label class="control-label"></label>
                                                                        <asp:TextBox ID="txtNombre2" runat="server" CssClass="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col-md-3 label-on-left">Categoria</label>
                                                                <div class="col-md-9">
                                                                    <div class="form-group label-floating is-empty">
                                                                        <label class="control-label"></label>
                                                                        <asp:TextBox ID="txtCategoria2" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCodCatN" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8 col-md-8 col-sm-12">
                                        <p></p>
                                    </div>
                                    <asp:UpdatePanel ID="upBotonEnviar" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-lg-2 col-md-2 col-sm-6">
                                                <asp:Button ID="btnInscribir" runat="server" Text="Inscribir" CssClass="btn btn-fill btn-success" OnClick="btnInscribir_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-fill btn-danger" OnClick="btnRegresar_Click" />
                                    </div>
                                </div>
                                <asp:UpdatePanel ID="Uppago" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-1 col-md-1 col-sm-12">
                                                <p></p>
                                            </div>
                                            <div class="col-md-11">
                                                <h3 class="text-left">PAGAR: </h3>
                                                <h1 id="H1" runat="server" class="card-title"></h1>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpDatos" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="hdPrecio" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
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
        };
    </script>
</asp:Content>
