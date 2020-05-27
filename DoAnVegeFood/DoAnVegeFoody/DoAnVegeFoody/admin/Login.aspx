<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnVegeFoody.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="<%=Page.ResolveUrl("~/admin/")%>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="<%=Page.ResolveUrl("~/admin/")%>css/sb-admin-2.min.css" rel="stylesheet"/>
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" runat="server">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtUS" runat="server" CssClass="form-control form-control-user" placeholder="Enter UserName"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name Is Not Null" ControlToValidate="txtUS" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-user" placeholder="Enter PassWord"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Is Not Null" ControlToValidate="txtPassword" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <asp:CheckBox ID="CheckBox1" runat="server" CssClass="custom-control-input" />
                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
                                            </div>
                                        </div>
                                        <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-user btn-block" OnClick="ButtonLogin_Click" />
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i>Login with Google
                    </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i>Login with Facebook
                    </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Thông Báo</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblModal" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" id="myButton" class="btn btn-danger" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="<%=Page.ResolveUrl("~/admin/")%>vendor/jquery/jquery.min.js"></script>
    <script src="<%=Page.ResolveUrl("~/admin/")%>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=Page.ResolveUrl("~/admin/")%>vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=Page.ResolveUrl("~/admin/")%>js/sb-admin-2.min.js"></script>
    <%--<script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
        }
        $(document).ready(function () {
            $('#myButton').click(function () {
                window.location.href = "member.aspx";
            });
        });
    </script>--%>
</body>
</html>
