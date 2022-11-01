<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_RestablecerContrasena.aspx.cs" Inherits="WEB.PAG_WEB.W_RestablecerContrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="form-element-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form-element-list mg-t-30">
                            <div class="cmp-tb-hd bcs-hd">
                                <h2>Restablecimiento de contraseña</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 contrasenia">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-support"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="txtNuevaContrasena" runat="server" class="form-control" TextMode="Password" placeholder="Nueva Contraseña"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 contrasenia">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                            <i class="notika-icon notika-support"></i>
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:TextBox ID="txtConfirmarNuevaContrasena" runat="server" class="form-control" TextMode="Password" placeholder="Confirmar Contraseña"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp">
                                        </div>
                                        <div class="nk-int-st">
                                            <asp:LinkButton ID="btnCambiarContrasena" runat="server" OnClick="btnCambiarContrasena_Click" CssClass="btn btn-success notika-btn-success">
                                        <i class="notika-icon notika-checked"></i>  Cambiar contraseña
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
