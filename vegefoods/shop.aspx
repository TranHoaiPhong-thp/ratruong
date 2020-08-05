<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="DoAnVegeFoody.vegefoods.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home</a></span> <span>Products</span></p>
                    <h1 class="mb-0 bread">Products</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-5 text-center">
                    <ul class="product-category">
                        <li><%--<a href="#" >All</a>--%>
                            <asp:LinkButton ID="LinkButton2" OnClick="showAll_Click" runat="server">All</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="showVegetables" OnClick="showVegetables_Click" runat="server">Vegetables</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="showFruits" OnClick="showFruits_Click" runat="server">Fruits</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="showJuice" OnClick="showJuice_Click" runat="server">Juice</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="showDried" OnClick="showDried_Click" runat="server">Dried</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="Product_single.aspx?id=<%#Eval("id") %>" class="img-prod">
                                    <asp:HiddenField ID="hf_id" Value='<%#Eval("id") %>' runat="server" />
                                    <asp:HiddenField ID="hf_name" Value='<%#Eval("name") %>' runat="server" />
                                    <%-- <img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template">--%>
                                    <image src="images/<%# Eval("img") %>" class="img-fluid" alt="Colorlib Template"></image>
                                    <asp:HiddenField ID="hf_img" runat="server" Value='<%# Eval("img") %>' />
                                    </td>
                            <span class="status">30%</span>
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#"><%#Eval("name") %></a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price">
                                                <span class="mr-2 price-dc">$<%# Eval("price") %></span>

                                                <span class="price-sale">$<%# Eval("price_promo") %></span>
                                                <asp:HiddenField ID="hf_price" runat="server" Value='<%# Eval("price") %>' />
                                                <asp:HiddenField ID="hf_price_promo" runat="server" Value='<%# Eval("price_promo") %>' />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                <span><i class="ion-ios-menu"></i></span>
                                            </a>
                                            <%--<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i>
                                            <asp:Button ID="Add_to_cart" CommandName="Add_to_cart" runat="server"  />
                                        </span>
                                    </a>--%>
                                            <asp:LinkButton ID="LinkButton1" CssClass="buy-now d-flex justify-content-center align-items-center mx-1" CommandName="Add_to_cart" runat="server"><span><i class="ion-ios-cart"></i></span></asp:LinkButton>
                                            <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                <span><i class="ion-ios-heart"></i></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                            <%--
                            <li class="active"><span>1</span></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                           --%>
                            <li><a href="#">&lt;</a></li>
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="?page=<%#Eval("index")%>" style='background-color: <%# (Eval("active").ToString()=="1"?"yellow":"white")%>'><%#Eval("index") %></a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                             <li><a href="#">&gt;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
