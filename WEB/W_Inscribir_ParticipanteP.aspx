<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="W_Inscribir_ParticipanteP.aspx.cs" Inherits="WEB.W_Inscribir_ParticipanteP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header card-header-text" data-background-color="red">
                                <h4 id="txtPagina" runat="server" class="card-title">Inscribir Participante</h4>
                            </div>
                            <div class="card-content">
                                <form id="form1" runat="server">
                                    <asp:scriptmanager id="ScriptManager1" runat="server" asyncpostbacktimeout="3600"></asp:scriptmanager>

                                    <div class="row">

                                        <div class="col-md-6">
                                            <label class="col-md-12 label-on-left">Concurso</label>
                                            <div class="col-md-8 form-group label-floating is-empty">
                                                <asp:dropdownlist id="ddlConcurso" runat="server" cssclass="selectpicker">
                                            </asp:dropdownlist>
                                            </div>
                                            <div class="col-md-4 form-group label-floating is-empty">
                                                <asp:updatepanel id="UpBtnIr" runat="server" updatemode="Conditional">
                                                <ContentTemplate>
                                                    <asp:LinkButton ID="btnIr" runat="server" CssClass="btn btn-primary btn-round btn-just-icon" OnClick="btnIr_Click">
                                                    <i class="material-icons">arrow_right_alt</i>
                                                    <div class="ripple-container"></div>
                                                    </asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:updatepanel>
                                            </div>
                                        </div>
                                        <asp:updatepanel id="UpPrecios" runat="server" updatemode="Conditional">
                                        <ContentTemplate>
                                            <asp:Label ID="lblprecioS" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:Label ID="lblprecioN" runat="server" Text="" Visible="false"></asp:Label>
                                        </ContentTemplate>
                                    </asp:updatepanel>

                                        <div class="col-md-6 checkbox-radios">
                                            <label class="col-md-12 label-on-left">Modalidad</label>
                                            </br>
                                         </br>
                                            
                                         <div class="col-md-4">

                                             <asp:radiobutton id="RbSeriado" runat="server" text="Seriado" groupname="modalidad"
                                                 autopostback="True" oncheckedchanged="RbSeriado_CheckedChanged" enabletheming="True" cssclass="radio-inline"
                                                 forecolor="Black" />
                                         </div>
                                            <div class="col-md-4">
                                                <asp:radiobutton id="RbNovel" runat="server" text="Novel" groupname="modalidad"
                                                    autopostback="True" oncheckedchanged="RbNovel_CheckedChanged" cssclass="radio-inline"
                                                    forecolor="Black" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:radiobutton id="RbAmbos" runat="server" text="Ambos" groupname="modalidad"
                                                    autopostback="True" oncheckedchanged="RbAmbos_CheckedChanged" cssclass="radio-inline"
                                                    forecolor="Black" />
                                            </div>
                                        </div>

                                    </div>
                                    <br />
                                    <br />
                                    <div class="row">
                                        <asp:panel id="pnlParticipanteS" runat="server" cssclass="col-lg-12 col-md-12 col-sm-12">
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
                                    </asp:panel>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <asp:panel id="pnlParticipanteN" runat="server">
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
                                                    <div class="row">
                                                        <div class="col-md-6 checkbox-radios">
                                                            <label class="col-md-12 label-on-left">¿Participa seriado?</label>
                                                            </br>
                                         </br>
                                                             <div class="col-md-6">
                                                                 <asp:RadioButton ID="rbSi" runat="server" Text="SI" GroupName="seriado"
                                                                     AutoPostBack="True" OnCheckedChanged="rbSi_CheckedChanged" EnableTheming="True" CssClass="radio-inline"
                                                                     ForeColor="Black" />
                                                             </div>
                                                            <div class="col-md-6">
                                                                <asp:RadioButton ID="rbNo" runat="server" Text="NO" GroupName="seriado"
                                                                    AutoPostBack="True" CssClass="radio-inline" OnCheckedChanged="rbNo_CheckedChanged"
                                                                    ForeColor="Black" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                        </div>
                                    </asp:panel>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-8 col-md-8 col-sm-12">
                                            <p></p>
                                        </div>
                                        <asp:updatepanel id="upBotonEnviar" runat="server" updatemode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-lg-2 col-md-2 col-sm-6">
                                                <asp:Button ID="btnInscribir" runat="server" Text="Inscribir" CssClass="btn btn-fill btn-success" OnClick="btnInscribir_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:updatepanel>
                                        <div class="col-lg-2 col-md-2 col-sm-6">
                                            <asp:button id="btnRegresar" runat="server" text="Regresar" cssclass="btn btn-fill btn-danger" onclick="btnRegresar_Click" />
                                        </div>
                                    </div>
                                    <asp:updatepanel id="Uppago" runat="server" updatemode="Conditional">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3 class="text-left">PAGAR: </h3>
                                                <h1 id="H1" runat="server" class="card-title"></h1>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:updatepanel>
                                </form>
                            </div>
                        </div>
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
        };
    </script>
</asp:Content>
