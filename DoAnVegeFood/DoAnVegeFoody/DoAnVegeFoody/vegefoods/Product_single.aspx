<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Product_single.aspx.cs" Inherits="DoAnVegeFoody.vegefoods.Product_single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home</a></span> <span class="mr-2"><a href="index.aspx">Product</a></span> <span>Product Single</span></p>
                    <h1 class="mb-0 bread">Product Single</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater1_ItemCommand" DataSourceID="SqlDataSource1" >
                    <ItemTemplate>
                        <div class="col-lg-6 mb-5 ftco-animate">
                            <asp:HiddenField ID="hf_id" Value='<%#Eval("id") %>' runat="server" />
                            <asp:HiddenField ID="hf_name" Value='<%#Eval("name") %>' runat="server" />
                            <asp:HiddenField ID="hf_img" runat="server" value='<%# Eval("img") %>'/>
                            <a href="images/<%#Eval("img") %>" class="image-popup">
                                <img src="images/<%#Eval("img") %>" class="img-fluid" alt="Colorlib Template"></a>
                            
                        </div>
                        <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                            <h3><%#Eval("name") %></h3>
                            <div class="rating d-flex">
                                <p class="text-left mr-4">
                                    <a href="#" class="mr-2">5.0</a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                </p>
                                <p class="text-left mr-4">
                                    <a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
                                </p>
                                <p class="text-left">
                                    <a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
                                </p>
                            </div>
                            <p class="price">
                                <%--<span class="mr-2 price-dc">$<%# Eval("price") %></span>--%>
                                <span class="price-sale">$<%# Eval("price_promo") %></span></p>
                                <asp:HiddenField ID="hf_price" runat="server" Value='<%# Eval("price") %>'/>
                                                    <asp:HiddenField ID="hf_price_promo" runat="server" value='<%# Eval("price_promo") %>'/>
                            <p>
                                A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until.
					
                            </p>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group d-flex">
                                        <div class="select-wrap">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="" id="" class="form-control">
                                                <option value="">Small</option>
                                                <option value="">Medium</option>
                                                <option value="">Large</option>
                                                <option value="">Extra Large</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="input-group col-md-6 d-flex mb-3">
                                    <span class="input-group-btn mr-2">
                                        <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                            <i class="ion-ios-remove"></i>
                                        </button>
                                    </span>
                                    <%--<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">--%>
                                    <asp:TextBox ID="quantity" CssClass="form-control input-number" runat="server" Value='<%#Eval("thumb") %>' min="1" max="100"></asp:TextBox>
                                    <asp:HiddenField ID="hf_quan" Value='<%#Eval("thumb") %>' runat="server" />
                                    <span class="input-group-btn ml-2">
                                        <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="" onclick="plus">
                                            <asp:Button ID="Button2" CssClass="quantity-right-plus btn" runat="server" Text="+" onclick="Button2_Click"/>
                                            <i class="ion-ios-add"></i>
                                        </button>
                                    </span>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <p style="color: #000;">600 kg available</p>
                                </div>
                            </div>
                            <p>
                                <%--<a href="Cart.aspx" class="btn btn-black py-3 px-5">Add to Cart</a>--%>
                                <asp:Button ID="Button1" Cssclass="btn btn-black py-3 px-5" runat="server" CommandName="Add_to_cart" Text="Add To Cart" />
                                <%--<asp:LinkButton ID="LinkButton1" CssClass="buy-now d-flex justify-content-center align-items-center mx-1"  runat="server" CommandName="Add_to_cart"><span><i class="ion-ios-cart"></i></span></asp:LinkButton>--%>
                            </p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString10 %>" SelectCommand="SELECT * FROM [food] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Products</span>
                    <h2 class="mb-4">Related Products</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="Product_single.aspx?id=<%#Eval("id") %>" class="img-prod"><%--<img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template">--%>
                                    <img src="images/<%#Eval("img") %>" class="img-fluid" alt="Colorlib Template">
                                    <span class="status">30%</span>
                                    <div class="overlay"></div>
                                </a>
                                &nbsp;&nbsp;&nbsp;<div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#"><%#Eval("name") %></a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price">
                                                <span class="mr-2 price-dc">$<%# Eval("price") %></span><span class="price-sale">$<%# Eval("price_promo") %></span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                <span><i class="ion-ios-menu"></i></span>
                                            </a>
                                            <%--<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                <span><i class="ion-ios-cart"></i></span>
                                            </a>--%>
                                            <asp:LinkButton ID="LinkButton1" CssClass="buy-now d-flex justify-content-center align-items-center mx-1" CommandName="Add_to_cart" runat="server">

                                                <span><i class="ion-ios-cart"></i></span>
                                            </asp:LinkButton>

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
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
