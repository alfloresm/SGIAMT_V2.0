<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Asignar_Tanda.aspx.cs" Inherits="WEB.W_Asignar_Tanda" %>

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
                    <div class="col-md-5">
                        <label class="col-md-12 label-on-left">Modalidad</label>
                        <div class="col-md-5 form-group label-floating is-empty">
                            <asp:DropDownList ID="ddlModalidad" runat="server" CssClass="selectpicker">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label class="col-md-12 label-on-left">Categoria:</label>
                        <div class="col-md-5 form-group label-floating is-empty">
                            <asp:DropDownList ID="ddlCat" runat="server" CssClass="selectpicker">
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
                    <div class="col-md-2">
                        <br />
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
    </form>
</asp:Content>
