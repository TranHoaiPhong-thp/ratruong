<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="FoodShop.admin.member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <%--<input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">--%>
                        <asp:TextBox ID="exampleFirstName" runat="server" type="text" CssClass="form-control form-control-user" placeholder="First Name"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <%--<input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">--%>
                        <asp:TextBox ID="exampleLastName" runat="server" type="text" CssClass="form-control form-control-user" placeholder="Last Name"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <%--<input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">--%>
                        <asp:TextBox ID="exampleInputEmail" runat="server" type="email" CssClass="form-control form-control-user" placeholder="Email Address"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <%--<input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">--%>
                        <asp:TextBox ID="exampleInputPassword" runat="server" type="password" CssClass="form-control form-control-user" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <%--<input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">--%>
                        <asp:TextBox ID="exampleRepeatPassword" runat="server" type="password" CssClass="form-control form-control-user" placeholder="Repeat Password"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <%--<input type="tel" name="sdt" class="form-control form-control-user" id="sdt" placeholder="Phone Number" />--%>
                        <asp:TextBox ID="sdt" runat="server" type="tel" CssClass="form-control form-control-user" placeholder="Phone Number" ></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-6 col-sm-6">
                        <%--<div class="dropdown mb-4">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Status
                            </button>
                            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">1</a>
                                <a class="dropdown-item" href="#">0</a>
                            </div>
                        </div>--%>
                        <asp:DropDownList ID="dropdownMenuButton" runat="server"  CssClass="btn btn-primary dropdown-toggle" type="button" >
                            <asp:ListItem>Status</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>0</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="form-group row">

                        <%--<div class="dropdown mb-4">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Role
                            </button>
                            <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">Xóa</a>
                                <a class="dropdown-item" href="#">Không xóa</a>
                            </div>
                        </div>--%>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>Role</asp:ListItem>
                            <asp:ListItem>Xóa</asp:ListItem>
                            <asp:ListItem>Không xóa</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <a href="login.html" class="btn btn-primary btn-user btn-block">Register Account
                </a>
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                    <i class="fab fa-google fa-fw"></i>Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                    <i class="fab fa-facebook-f fa-fw"></i>Register with Facebook
                </a>

                <hr>
                <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                </div>
                <div class="text-center">
                    <a class="small" href="login.html">Already have an account? Login!</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctp_script" runat="server">
</asp:Content>
