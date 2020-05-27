<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="DoAnVegeFoody.admin.member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_container" runat="server">
    <div class="row">
        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Create an Account</h1>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <%-- <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">--%>
                        <asp:TextBox ID="exampleUserName" CssClass="form-control form-control-user" placeholder="User Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_user" runat="server" ErrorMessage="Username is not valid" ControlToValidate="exampleUserName" CssClass="text-danger" ValidationGroup="them"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exampleName" CssClass="form-control form-control-user" placeholder="Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="Name is not valid" ControlToValidate="exampleName" CssClass="text-danger" ValidationGroup="them"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exampleInputEmail" CssClass="form-control form-control-user" placeholder="Email" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_email" runat="server"  ErrorMessage="Email is not valid" ValidationGroup="them" ControlToValidate="exampleInputEmail" CssClass="text-danger"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is not valid" ValidationGroup="them" CssClass="text-danger"  ControlToValidate="exampleInputEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox ID="exampleInputPassword" CssClass="form-control form-control-user" placeholder="Password"  TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev_pas" runat="server" ErrorMessage="Password phải từ 6-32 ký tự  " ValidationExpression="[a-zA-Z0-9]{6,32}" ControlToValidate="exampleInputPassword" ValidationGroup="them" CssClass="text-danger"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pass is not valid" ControlToValidate="exampleInputPassword" ValidationGroup="them" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="exampleRepeatPassword" CssClass="form-control form-control-user" placeholder="Repeat Password"  TextMode="Password" runat="server" ></asp:TextBox>
                        <asp:CompareValidator ID="cmp_repas" runat="server" ErrorMessage="Repassword phải trùng với Password" ControlToCompare="exampleInputPassword" ControlToValidate="exampleRepeatPassword" ValidationGroup="them" CssClass="text-danger" ></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Re-pass is not valid" ValidationGroup="them" CssClass="text-danger" ControlToValidate="exampleRepeatPassword"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">

                        <asp:TextBox ID="examplePhone" CssClass="form-control form-control-user" placeholder="Phone"  runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev_phone" runat="server" ErrorMessage="Phone is 10 numbers" ControlToValidate="examplePhone" CssClass="text-danger" ValidationGroup="them" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone is not valid" ValidationGroup="them" ControlToValidate="examplePhone"></asp:RequiredFieldValidator>
                        
                    </div>
                </div>
                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6">
                      <asp:Label ID="Label2" runat="server" Text="Label">Status:</asp:Label>  <asp:DropDownList CssClass="form-control form-control-user"  ID="exampleStatus" runat="server">
                          <asp:ListItem Text="Đang hoạt động" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Khóa" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        
                        <asp:Label ID="Label1" runat="server" Text="Label">Role:</asp:Label>   <asp:DropDownList CssClass="form-control form-control-user" ID="exampleRole"  runat="server">
                          
                          <asp:ListItem Value="1">Admin</asp:ListItem>
                          <asp:ListItem Value="2">Editor</asp:ListItem>
                      
                        </asp:DropDownList>
                    </div>
                </div>
                    <asp:Button ID="register" runat="server" Text="Đăng ký" ValidationGroup="them" CssClass="btn btn-primary btn-user btn-block" OnClick="register_Click" />
                <asp:Button ID="Huy" runat="server" Text="Hủy" Onclick="Huy_Click" CssClass="btn btn-primary btn-user btn-block" />
                   <div runat="server" id="txtResult" >
                       <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="them" runat="server" cssClass="text-danger"/>
                   </div>
       
                <hr>
                <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                </div>
                <div class="text-center">
                    <a class="small" href="login.html">Already have an account? Login!</a>
                    <br />
                    
                </div>
                <asp:TextBox ID="txtTim" runat="server"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" Text="Tìm Kiếm" OnClick="btnTim_Click"/>
                <div>
                    <asp:HiddenField ID="hfID" runat="server" />
                    <table Class="form-group col-lg-12"" >
                        <thead>
                                <tr role="row">
                                    <th class="auto-style2">UserName</th>
                                    <th class="auto-style2">Name</th>
                                    <th class="auto-style2">Phone</th>
                                    <th class="auto-style2">Status</th>
                                    <th class="auto-style2">Role</th>
                                    <th class="auto-style2">Email</th>
                                    <th class="auto-style2">Operation</th>
                                </tr>
                         </thead>
                         <tbody>
                            <asp:Repeater ID="Repeater1" runat="server"  >
                                <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("username") %></td>
                                                <td><%#Eval("name") %></td>
                                                <td><%#Eval("phone") %></td>
                                                <td><%#Eval("status") %></td>
                                                <td><%#Eval("role") %></td>
                                                <td><%#Eval("email") %></td>
                                                <td>
                                                    <asp:LinkButton ID="Linkedit" CommandArgument='<%#Eval("username") %>' runat="server" OnClick="Linkedit_Click">Edit</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkDelete" CommandArgument='<%#Eval("username") %>' OnClick="LinkDelete_Click" runat="server" >Delete</asp:LinkButton>
                                                </td>
                                            </tr>
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
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
