<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="foodtype.aspx.cs" Inherits="DoAnVegeFoody.admin.food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_container" runat="server">
    <div class="row">
        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Create  foodType</h1>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <%-- <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">--%>
                        <asp:TextBox ID="Type_img" CssClass="form-control form-control-user" placeholder="Ảnh "  runat="server" ></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="IMG is not valid" CssClass="text-danger" ValidationGroup="them" ControlToValidate="Type_img"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="Type_name" CssClass="form-control form-control-user" placeholder="Type_Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="Type_name is not valid" ControlToValidate="Type_name" ValidationGroup="them" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:TextBox ID="Type_Pos" CssClass="form-control form-control-user" placeholder="Type_pos" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_pos" runat="server"  ErrorMessage="Type_Pos is not valid" ControlToValidate="Type_Pos" ValidationGroup="them" CssClass="text-danger"></asp:RequiredFieldValidator> 
                    </div>
                </div>

                <div class="form-group row">
                    <div class=" col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox ID="UserName" CssClass="form-control form-control-user" placeholder="UserName"  runat="server"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is not valid" ControlToValidate="UserName" ValidationGroup="them" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                        <asp:Label ID="Label2" runat="server" Text="Label">Status:</asp:Label>  <asp:DropDownList CssClass="form-control form-control-user"  ID="exampleStatus" runat="server">
                          <asp:ListItem Text="còn hàng" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Đã hết" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class=" col-lg-4 col-sm-6">
                       <asp:TextBox ID="Modified" CssClass="form-control form-control-user" placeholder="Modified" TextMode="DateTime" ValidationGroup="them" runat="server" ></asp:TextBox>
                        
                    </div>
                </div>
                
                <asp:Button ID="Addfoodtype" runat="server" ValidationGroup="them" Text="Add_FoodType" onclick="Add_foodtype" CssClass="btn btn-primary btn-user btn-block"/>
                <asp:Button ID="Huy" runat="server" Text="Huy" onclick="Huy_Click"/>
                   <div runat="server" id="txtResult" >
                       <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="them" runat="server" cssClass="text-danger"/>
                   </div>
                <hr>
                
            </div>
                <asp:TextBox ID="txtTim" placeholder="Tìm Theo Type Name" runat="server"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" Text="Tìm Kiếm" OnClick="btnTim_Click"/>
            <div>
                <asp:HiddenField ID="hfID" runat="server" />
                <table Class="form-group col-lg-12" >
                        <thead>
                                <tr role="row">
                                    <th class="auto-style2">Type_id</th>
                                    <th class="auto-style2">Type_name</th>
                                    <th class="auto-style2">Type_pos</th>
                                    <th class="auto-style2">Type_img</th>
                                    <th class="auto-style2">Status</th>
                                    <th class="auto-style2">UserName</th>
                                    <th class="auto-style2">Modified</th>
                                    <th class="auto-style2">Operation</th>
                                </tr>
                         </thead>
                    <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("Type_id")%></td>
                            <td><%#Eval("Type_name")%></td>
                            <td><%#Eval("Type_pos")%></td>
                            <td><image src="img/<%# Eval("Type_img") %>" heigh="75px" width="75px"></image></td>
                            <td><%#Eval("Status")%></td>
                            <td><%#Eval("Username")%></td>
                            <td><%#Eval("Modified")%></td>
                            <td>
                                <asp:LinkButton ID="Linkedit" CommandArgument='<%#Eval("Type_name")%>' runat="server" OnClick="Linkedit_Click">Edit</asp:LinkButton>

                                <asp:LinkButton ID="LinkDelete" CommandArgument='<%#Eval("Type_name")%>'  runat="server" OnClick="LinkDelete_Click">Delete</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    
                </asp:Repeater>
                        </tbody>
                    </table>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>