<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="food.aspx.cs" Inherits="DoAnVegeFoody.admin.food1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_container" runat="server">
    <div class="row">
        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Create  Food</h1>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <%-- <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">--%>
                        <asp:TextBox ID="exeFood_Name" CssClass="form-control form-control-user" placeholder="Food Name " runat="server"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="rfv_Name" ValidationGroup="add" runat="server" ErrorMessage="Food Name is not valid" CssClass="text-danger" ControlToValidate="exeFood_Name"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exeDecription" CssClass="form-control form-control-user" placeholder="mô tả" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_decription" ValidationGroup="add" runat="server" ErrorMessage="mô tả không hợp lệ"  ControlToValidate="exeDecription" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exePrice" CssClass="form-control form-control-user" placeholder="Giá" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_pos" ValidationGroup="add" runat="server" ErrorMessage="Price is not valid" ControlToValidate="exePrice" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox ID="exePrice_promo" CssClass="form-control form-control-user" placeholder="Price promo" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="add" runat="server" ErrorMessage="Price promo is not valid" ControlToValidate="exePrice_promo" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exethumb" CssClass="form-control form-control-user" placeholder="thumb" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="add" runat="server" ErrorMessage="thumb is not valid" ControlToValidate="exethumb" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exefood_img" CssClass="form-control form-control-user" placeholder="Hình Ảnh"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="add" ControlToValidate="exefood_img" runat="server" ErrorMessage="Hình is not valid"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox ID="exefood_unit" CssClass="form-control form-control-user" placeholder="food_unit" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="add" runat="server" ErrorMessage="food_unit is not valid" ControlToValidate="exefood_unit" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exepercent_promo" CssClass="form-control form-control-user" placeholder="percent promo" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="add" runat="server" ErrorMessage="percent promo is not valid" ControlToValidate="exepercent_promo" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:Label ID="Label3" runat="server" Text="Label">Rating:</asp:Label>
                        <asp:DropDownList CssClass="form-control form-control-user" ID="exampleRating" runat="server">
                            <asp:ListItem Text="thật tệ" Value="1"></asp:ListItem>
                            <asp:ListItem Text="tệ" Value="2"></asp:ListItem>
                            <asp:ListItem Text="tạm" Value="3"></asp:ListItem>
                            <asp:ListItem Text="tốt" Value="4"></asp:ListItem>
                            <asp:ListItem Text="rất tốt" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:Label ID="Label2" runat="server" Text="Label">sold:</asp:Label>
                        <asp:DropDownList CssClass="form-control form-control-user" ID="exampleSold" runat="server">
                            <asp:ListItem Text="Đã bán" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Chưa bán" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        

                        <asp:Label ID="Label1" runat="server" Text="Label">Status:</asp:Label>
                        <asp:DropDownList CssClass="form-control form-control-user" ID="exempleStatus" runat="server">
                            <asp:ListItem Text="còn hàng" Value="1"></asp:ListItem>
                            <asp:ListItem Text="hết hàng" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:Label ID="Label4" runat="server" Text="Label">Type:</asp:Label>
                        <asp:DropDownList CssClass="form-control form-control-user" ID="exampleType" runat="server">
                            <asp:ListItem Text="khuôn 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="khuôn 2" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox ID="exePoint" CssClass="form-control form-control-user" placeholder="point" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="add" runat="server" ErrorMessage="point is not valid" ControlToValidate="exePoint" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exeUsername" CssClass="form-control form-control-user" placeholder="Username" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="add"  runat="server" ErrorMessage="Username is not valid" ControlToValidate="exeUsername" CssClass="text-danger"></asp:RequiredFieldValidator>

                        
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exeModified" CssClass="form-control form-control-user" placeholder="Modified" TextMode="DateTime" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="exeModified" runat="server" ValidationGroup="add" ErrorMessage="Modified is not valid"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:Button ID="Addfood" runat="server" Text="Add_FoodType" ValidationGroup="add" OnClick="Addfood_Click" />
                <div runat="server" id="txtResult">
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="add" runat="server" CssClass="text-danger" />
                </div>
                <hr>

                <div>
                    <asp:TextBox ID="txtTim" runat="server"></asp:TextBox>
                    <asp:Button ID="tim" runat="server" Text="tìm theo Name" onclick="tim_Click"/>
                    <table class="form-group col-lg-12">
                        <thead>
                                <tr role="row">
                                    <th class="auto-style2">ID</th>
                                    <th class="auto-style2">Name</th>
                                    <th class="auto-style2">Description</th>
                                    <th class="auto-style2">price</th>
                                    <th class="auto-style2">price_promo</th>
                                    <th class="auto-style2">thumb</th>
                                    <th class="auto-style2">Hình</th>
                                    <th class="auto-style2">unit</th>
                                    <th class="auto-style2">percent_promo</th>
                                    <th class="auto-style2">rating</th>
                                    <th class="auto-style2">sold</th>
                                    <th class="auto-style2">point</th>
                                    <th class="auto-style2">type</th>
                                    <th class="auto-style2">status</th>
                                    <th class="auto-style2">username</th>
                                    <th class="auto-style2">modified</th>
                                    <th class="auto-style2">Operation</th>
                                </tr>
                         </thead>
                        <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" >
                    
                        <ItemTemplate>
                            <div class="item">
                                <tr role="row" class="odd">
                                    <td class="sorting_1"><%# Eval("id") %></td>
                                    <td><%#Eval("name") %></td>
                                    <td><%#Eval("description") %></td>
                                    <td><%#Eval("price") %></td>
                                    <td><%#Eval("price_promo") %></td>
                                    <td><%#Eval("thumb") %></td>
                                    <td><image src="images/<%# Eval("img") %>" heigh="75px" width="75px"></image></td>
                                    <td><%#Eval("unit") %></td>
                                    <td><%#Eval("percent_promo") %></td>
                                    <td><%#Eval("rating") %></td>
                                    <td><%#Eval("sold") %></td>
                                    <td><%#Eval("point") %></td>
                                    <td><%#Eval("type") %></td>
                                    <td><%#Eval("status") %></td>
                                    <td><%#Eval("username") %></td>
                                    <td><%#Eval("modified") %></td>
                                    <td>
                                        <asp:LinkButton ID="Linkedit" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="Linkedit_Click">Edit</asp:LinkButton>
                                        <asp:LinkButton ID="LinkDelete" runat="server" CommandArgument='<%# Eval("name") %>' OnClick="LinkDelete_Click">Delete</asp:LinkButton>
                                    </td>
                                </tr>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                            </tbody>
                        </table>
                    <table>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <a href="?page=<%#Eval("index")%>" style='background-color: <%#(Eval("active").ToString()=="1"?"yellow":"white")%>'><%#Eval("index") %></a>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
                    </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString8 %>" SelectCommand="SELECT * FROM [food1]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
