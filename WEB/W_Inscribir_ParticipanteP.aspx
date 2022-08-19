﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Inscribir_ParticipanteP.aspx.cs" Inherits="WEB.W_Inscribir_ParticipanteP" %>

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
                                    <div class="col-md-4 form-group label-floating is-empty">
                                        <asp:UpdatePanel ID="UpBtnIr" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="btnIr" runat="server" CssClass="btn btn-primary btn-round btn-just-icon" OnClick="btnIr_Click">
                                                    <i class="material-icons">arrow_right_alt</i>
                                                    <div class="ripple-container"></div>
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="col-md-12 label-on-left">Modalidad</label>
                                    <div class="col-md-8 form-group label-floating is-empty">
                                        <asp:DropDownList ID="ddlModalidades" runat="server" CssClass="selectpicker">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4 form-group label-floating is-empty">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
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
                                </div>
                                <div class="row">
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

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</asp:Content>
