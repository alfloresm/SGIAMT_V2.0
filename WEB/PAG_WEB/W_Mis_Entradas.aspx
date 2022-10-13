<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Mis_Entradas.aspx.cs" Inherits="WEB.PAG_WEB.W_Mis_Entradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/css/dropzone/dropzone.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/wave/button.css">
    <link href="assets/js/SweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <%-- Data Table --%>
    <link rel="stylesheet" href="assets/css/jquery.dataTables.min.css">
    <script src="assets/js/data-table/jquery.dataTables.min.js"></script>
    <script>(function ($) {
            "use strict";
            $(document).ready(function () {
                $('#GVEntradas').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            });
        })(jQuery); </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src='http://ksylvest.github.io/jquery-growl/javascripts/jquery.growl.js' type='text/javascript'></script>
    <script src="assets/js/notification/bootstrap-growl.min.js"></script>
    <script src="assets/js/dropzone/dropzone.js"></script>
    <script src="assets/js/notification/notificacion.js" type='text/javascript'></script>
    <script src="assets/js/SweetAlert/sweetalert.min.js" type='text/javascript'></script>
    <script src="assets/js/UploadFile.js" type='text/javascript'></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server">
        <div class="data-table-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="data-table-list">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-tax"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Mis Entradas</h2>
                                            <asp:HiddenField ID="hfDNI" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel runat="server" ID="UPTable" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <asp:GridView ID="GVEntradas" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="PK_VES_cod,VC_NombreCon,IES_NumEntrada,Monto,VES_Estado"
                                            CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable table-striped"
                                            AllowPaging="True" OnRowCommand="GVEntradas_RowCommand" PageIndex="5"
                                            Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" ClientIDMode="Static">
                                            <Columns>
                                                <asp:BoundField DataField="PK_VES_cod" HeaderText="Codigo" Visible="false" />
                                                <asp:BoundField DataField="VC_NombreCon" HeaderText="Concurso" />
                                                <asp:BoundField DataField="IES_NumEntrada" HeaderText="# Entradas" />
                                                <asp:BoundField DataField="Monto" HeaderText="Total (S/.)" />
                                                <asp:BoundField DataField="VES_Estado" HeaderText="Estado" />
                                                <asp:TemplateField HeaderText="Subida de Archivo">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" Visible='<%# ValidacionEstado(Eval("VES_Estado").ToString()) %>'
                                                            CommandName="subirVoucher" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-xs btn-warning">🔼</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="imagenmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modals-default">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="H1" runat="server">Subir Voucher
                        </h2>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server" ID="upDatos" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="nk-int-mk">
                                            <h5>#Cantidad de entradas</h5>
                                        </div>
                                        <div class="form-group ic-cmp-int">
                                            <div class="form-ic-cmp">
                                                <i class="notika-icon notika-support"></i>
                                            </div>
                                            <div class="nk-int-st">
                                                <asp:TextBox ID="txtCant" runat="server" Enabled="false" CssClass="form-control input-sm"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="nk-int-mk">
                                            <h5>#Cantidad de entradas</h5>
                                        </div>
                                        <div class="form-group ic-cmp-int">
                                            <div class="form-ic-cmp">
                                                <i class="notika-icon notika-dollar"></i>
                                            </div>
                                            <div class="nk-int-st">
                                                <asp:TextBox ID="txtMonto" runat="server" Enabled="false" CssClass="form-control  input-sm"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 text-center">
                                <%--<asp:UpdatePanel runat="server">
                                    <ContentTemplate>--%>
                                <img id="imgPreview">
                                <%--</ContentTemplate>
                                </asp:UpdatePanel>--%>
                            </div>
                            <input name="fileAnexo" type="file" id="FileUpload1" runat="server" accept=".png,.jpg" class="bbtn btn-primary img-cropper-cp btn-sm" style="width: 100%;" onchange="previewImage(event, '#imgPreview')"/>
                        </div>
                        <div class="row">
                            </br>
                            
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <div class="row">
                            <asp:UpdatePanel ID="UpRegistrarVoucher" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                        <p></p>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                        <asp:LinkButton ID="btnGuardar1" runat="server" CssClass="btn btn-success btn-sm" OnClick="btnGuardar1_Click">Enviar voucher</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                        <button type="button" class="btn btn-danger notika-btn-danger btn-sm" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" ID="upHiddenfields" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="hfCodEntrada" runat="server" ClientIDMode="Static" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script>
        function previewImage(event, querySelector) {

            //Recuperamos el input que desencadeno la acción
            const input = event.target;

            //Recuperamos la etiqueta img donde cargaremos la imagen
            $imgPreview = document.querySelector(querySelector);

            // Verificamos si existe una imagen seleccionada
            if (!input.files.length) return

            //Recuperamos el archivo subido
            file = input.files[0];

            //Creamos la url
            objectURL = URL.createObjectURL(file);

            //Modificamos el atributo src de la etiqueta img
            $imgPreview.src = objectURL;

        }
    </script>
</asp:Content>
