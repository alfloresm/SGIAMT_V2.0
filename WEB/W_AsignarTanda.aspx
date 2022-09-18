<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_AsignarTanda.aspx.cs" Inherits="WEB.W_AsignarTanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/material-dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="form">
        <div class="card">
            <div class="card-header card-header-text" data-background-color="red">
                <h4 id="txtPagina" runat="server" class="card-title">Información de Tanda</h4>
            </div>
            <div class="card-content">
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>
                <div class="row">
                    <asp:HiddenField ID="HdIdConcurso" runat="server" />
                    <div class="col-lg-5 col-md-5">
                        <div class="col-md-5 form-group label-floating is-empty">
                            <asp:DropDownList ID="ddlModalidad" runat="server" CssClass="selectpicker">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div class="col-md-5 form-group label-floating is-empty">
                            <asp:DropDownList ID="ddlCat" runat="server" CssClass="selectpicker">
                                <asp:ListItem Value="-1" Text="Seleccione categoría"></asp:ListItem>
                                <asp:ListItem Value="Pre Infante" Text="Pre Infante"></asp:ListItem>
                                <asp:ListItem Value="Infante" Text="Infante"></asp:ListItem>
                                <asp:ListItem Value="Infantil" Text="Infantil"></asp:ListItem>
                                <asp:ListItem Value="Junior" Text="Junior"></asp:ListItem>
                                <asp:ListItem Value="Juvenil" Text="Juvenil"></asp:ListItem>
                                <asp:ListItem Value="Adulto" Text="Adulto"></asp:ListItem>
                                <asp:ListItem Value="Senior" Text="Senior"></asp:ListItem>
                                <asp:ListItem Value="Master" Text="Master"></asp:ListItem>
                                <asp:ListItem Value="Oro" Text="Oro"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2">
                        <br />
                        <%-- <asp:UpdatePanel ID="UpBtnIr" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>--%>
                        <asp:LinkButton ID="btnIr" runat="server" OnClick="btnIr_Click" CssClass="btn btn-success btn-round btn-fab btn-fab-mini">
                            <i class="material-icons">done_outline</i>
                        </asp:LinkButton>
                        <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HFidTanda" runat="server" />
        <%-- Panel Individual --%>
        <asp:Panel ID="PanelIndividual" runat="server">
            <div class="card">
                <div class="card-header card-header-text" data-background-color="red">
                    <h4 id="H1" class="card-title">Asignación de Tanda</h4>
                </div>
                <div class="card-content">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 1A</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista1A" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista1A" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista1A" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista1A_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 2A</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista2A" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista2A" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista2A" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista2A_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 3A</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista3A" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista3A" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista3A" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista3A_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 1B</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista1B" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista1B" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista1B" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista1B_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 2B</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista2B" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista2B" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista2B" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista2B_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 3B</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista3B" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista3B" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista3B" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista3B_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 1C</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista1C" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista1C" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista1C" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista1C_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 2C</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista2C" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista2C" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista2C" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista2C_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 3C</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista3C" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista3C" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista3C" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista3C_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <%-- Panel En parejas --%>
        <asp:Panel ID="PanelParejas" runat="server">
            <div class="card">
                <div class="card-header card-header-text" data-background-color="red">
                    <h4 id="H" class="card-title">Asignación de Tanda</h4>
                </div>
                <div class="card-content">

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 1</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista1" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista1" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista1_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 2</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista2" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista2" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista2_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 3</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista3" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista3" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista3_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="card card-pricing card-raised">
                                <h2 class="card-title">PISTA N° 4</h2>
                                <br />
                                <div class="col-md-8 form-group label-floating is-empty">
                                    <asp:TextBox ID="txtCodPista4" runat="server" placeholder="Código" CssClass="form-control" Font-Size="Large"></asp:TextBox>
                                </div>
                                <asp:UpdatePanel ID="updPista4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnPista4" runat="server" Text="OK" CssClass="btn btn-success btn-round btn-fab btn-fab-mini" OnClick="BtnPista4_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <asp:LinkButton ID="btnReset" runat="server" CssClass="btn btn-danger btn-round btn-fab btn-fab-mini"><i class="material-icons">restore</i></asp:LinkButton>
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
        }
    </script>
</asp:Content>
