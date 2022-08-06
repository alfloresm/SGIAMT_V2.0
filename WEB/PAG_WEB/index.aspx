<%@ Page Title="" Language="C#" MasterPageFile="~/PAG_WEB/Master_Externa.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../PAG_WEB/assets/css/Inicio.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero">
        <h1 id="h1_1">Aprende marinera
            <br />
            con los mejores</h1>
        <button>INSCRIBETE</button>
    </section>
    <section id="quienes-somos">
        <div class="container">
            <div class="img-container"></div>
            <div class="texto">
                <h2>Quienes <span class="color-acento">somos</span></h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent bibendum sem a mi ultricies, nec ullamcorper nunc euismod. Maecenas iaculis suscipit eleifend. Donec iaculis metus ac quam rutrum, a eleifend diam efficitur. Vestibulum felis diam, suscipit eu magna eu, iaculis blandit ipsum. Mauris vitae mauris lorem. Duis sodales tristique porttitor. Cras sit amet aliquam ipsum. Donec blandit condimentum metus, ut efficitur magna vehicula ut. Proin ut leo eget quam venenatis ullamcorper id at quam. Nam consequat convallis odio. Nulla dolor nibh, scelerisque nec efficitur ac, dignissim sit amet ligula. Nam dapibus semper urna rutrum volutpat.</p>
            </div>
        </div>
    </section>
    <section class="cursos">
        <div class="imagenes">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-8 col-sm-7 col-xs-12">
                        <div class="mg-tb-30">
                            <img src="assets/images/1.jpg" alt="img1" />
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-7 col-xs-12">
                        <div class="mg-tb-30">
                            <img src="assets/images/2.jpg" alt="img2" />
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-7 col-xs-12">
                        <div class="mg-tb-30">
                            <img src="assets/images/3.jpg" alt="img3" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="objetivos">
    </section>
    <section class="inscribete2">
    </section>
</asp:Content>
