<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="W_Inscribir_Participante.aspx.cs" Inherits="WEB.PAG_WEB.W_Inscribir_Participante" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/js/SweetAlert/sweetalert.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/dropzone/dropzone.css">
    <link rel="stylesheet" href="assets/css/wave/button.css">
    <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <%-- Data Table --%>
    <link rel="stylesheet" href="assets/css/jquery.dataTables.min.css">
    <script src="assets/js/data-table/jquery.dataTables.min.js"></script>
    <script>(function ($) {
            "use strict";
            $(document).ready(function () {
                $('#GVInscribir').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            });
        })(jQuery);
        function DataTableload() { $('#GVInscribir').prepend($('<thead></thead>').append($(this).find('tr:first')).DataTable()); }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src='http://ksylvest.github.io/jquery-growl/javascripts/jquery.growl.js' type='text/javascript'></script>
    <script src="assets/js/SweetAlert/sweetalert.min.js" type='text/javascript'></script>
    <script src="assets/js/notification/bootstrap-growl.min.js"></script>
    <script src="assets/js/dropzone/dropzone.js"></script>
    <script src="assets/js/notification/notificacion.js" type='text/javascript'></script>
    <script src="assets/js/UploadFileInscripcion.js" type='text/javascript'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Breadcomb area Start-->
        <div class="breadcomb-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcomb-list">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-form"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Inscribirse a Concurso</h2>
                                            <p>Selecccione el concurso al que quiere participar y la modalidad.<span class="bread-ntd"></span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcomb area End-->
        <div class="form-element-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form-element-list mg-t-30">
                            <div class="cmp-tb-hd bcs-hd">
                                <h2>Seleccione el concurso:</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12 genero">
                                    <div class="form-group ic-cmp-int">
                                        <div class="form-ic-cmp" style="color: #9f9f9f;">
                                            <p class="text-center" style="color: #9f9f9f;">Concurso</p>
                                        </div>
                                        <asp:DropDownList ID="ddlConcurso" runat="server" CssClass="select-css" Font-Size="Medium" Width="280px">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">
                                    </br>
                                    <asp:LinkButton ID="btnIr" runat="server" OnClick="btnIr_Click" CssClass="btn btn-info notika-btn-info">
                                        <i class="notika-icon notika-right-arrow"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="row">
                                <asp:UpdatePanel runat="server" ID="UPTable" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <asp:GridView ID="GVInscribir" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="PK_IM_CodigoMod,VM_NombreMod,DCP_Monto" EmptyDataText="No hay Registros"
                                            CssClass="table table-responsive table-bordered table-hover js-basic-example dataTable table-striped"
                                            AllowPaging="True" OnRowCommand="GVInscribir_RowCommand"
                                            Font-Size="Small" HeaderStyle-ForeColor="#FF5050" HeaderStyle-CssClass="small" ClientIDMode="Static">
                                            <Columns>
                                                <asp:BoundField DataField="PK_IM_CodigoMod" HeaderText="codigo_Modalidad" Visible="false" />
                                                <asp:BoundField DataField="VM_NombreMod" HeaderText="Modalidad" />
                                                <asp:BoundField DataField="DCP_Monto" HeaderText="Precio por persona" />
                                                <asp:TemplateField HeaderText="Inscribir">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                            CommandName="Inscribir" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-xs btn-success">🔼</asp:LinkButton>
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
        <div class="modal fade" id="inscripcionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modals-default">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" id="H1" runat="server">Inscribir Participante
                        </h2>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server" ID="UpSelecion" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:HiddenField ID="hfModalidad" runat="server" ClientIDMode="Static"/>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-md-12">
                            </br>
                        </div>
                        <asp:UpdatePanel runat="server" ID="upPareja" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="PanelPareja" runat="server">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <label class="col-md-3 label-on-left">DNI</label>
                                            <div class="nk-int-st">
                                                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12 center-block text-center">
                                                </br>
                                            </div>
                                            <div class="col-md-12 center-block text-center">
                                                <asp:UpdatePanel ID="upnBotonBuscar2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:LinkButton ID="btnBuscar" runat="server" CssClass="btn btn-info info-icon-notika btn-reco-mg btn-button-mg waves-effect" OnClick="btnBuscar_Click">
                                                    <i class="notika-icon notika-search"></i>
                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <asp:UpdatePanel ID="updPanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <label class="col-md-3 label-on-left">Nombre</label>
                                                        <div class="col-md-9">
                                                            <div class="form-group label-floating is-empty">
                                                                <label class="control-label"></label>
                                                                <asp:TextBox ID="txtNombre2" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <label class="col-md-3 label-on-left">Categoria</label>
                                                        <div class="col-md-9">
                                                            <div class="form-group label-floating is-empty">
                                                                <label class="control-label"></label>
                                                                <asp:TextBox ID="txtCategoria2" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                                <asp:TextBox ID="txtCodCatN" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel runat="server" ID="upCosto" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label class="col-md-3 label-on-left">Costo de la inscripción:</label>
                                        <asp:Label ID="lblCosto" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 text-center">
                                <p>Subir la imagen del boucher: <span class="bread-ntd"></span></p>
                            </div>
                            <div class="col-lg-12 col-md-12 text-center">
                                <%--<asp:UpdatePanel runat="server">
                                    <ContentTemplate>--%>
                                <img id="imgPreview">
                                <%--</ContentTemplate>
                                </asp:UpdatePanel>--%>
                            </div>
                            <input name="fileAnexo" type="file" id="FileUpload1" runat="server" accept=".png,.jpg" class="bbtn btn-primary img-cropper-cp btn-sm" style="width: 100%;" onchange="previewImage(event, '#imgPreview')" />
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
    </form>
    <style type="text/css">
        .select-css {
            display: block;
            font-size: 14px;
            font-weight: 400;
            color: #444;
            line-height: 1.3;
            padding: .4em 1.4em .3em .8em;
            width: 400px;
            max-width: 100%;
            box-sizing: border-box;
            margin: 20px auto;
            border: 1px solid #aaa;
            box-shadow: 0 1px 0 1px rgba(0,0,0,.03);
            border-radius: .3em;
            -moz-appearance: none;
            -webkit-appearance: none;
            appearance: none;
            background-color: #fff;
            background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'), linear-gradient(to bottom, #ffffff 0%,#f7f7f7 100%);
            background-repeat: no-repeat, repeat;
            background-position: right .7em top 50%, 0 0;
            background-size: .65em auto, 100%;
        }

            .select-css::-ms-expand {
                display: none;
            }

            .select-css:hover {
                border-color: #888;
            }

            .select-css:focus {
                border-color: #aaa;
                box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
                box-shadow: 0 0 0 3px -moz-mac-focusring;
                color: #222;
                outline: none;
            }

            .select-css option {
                font-weight: normal;
            }
    </style>
    <script type='text/javascript'>
        function showErrorCategoriaInscripcion() {
            setTimeout(function () {
                swal({
                    title: "Actualice su categoría",
                    text: "Actualice en su perfil la categoría a la que pertenece",
                    type: "error"
                }, function () {
                    window.location = "W_Mi_Perfil.aspx";
                });
            }, 1000);
        };
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
