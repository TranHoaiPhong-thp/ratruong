<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DoAnVegeFoody.admin._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_container" runat="server">

    <div>
                    <asp:TextBox ID="txtTim" runat="server"></asp:TextBox>
                    <asp:Button ID="tim" runat="server" Text="tìm theo Name" onclick="tim_Click"/>
                    <table class="form-group col-lg-12">
                        <thead>
                                <tr role="row">
                                    <th class="auto-style1">ID</th>
                                    <th class="auto-style1">Name</th>
                                    <th class="auto-style1">Description</th>
                                    <th class="auto-style1">price</th>
                                    <th class="auto-style1">price_promo</th>
                                    <th class="auto-style1">thumb</th>
                                    <th class="auto-style1">Hình</th>
                                    <th class="auto-style1">unit</th>
                                    <th class="auto-style1">percent_promo</th>
                                    <th class="auto-style1">rating</th>
                                    <th class="auto-style1">sold</th>
                                    <th class="auto-style1">point</th>
                                    <th class="auto-style1">type</th>
                                    <th class="auto-style1">status</th>
                                    <th class="auto-style1">username</th>
                                    <th class="auto-style1">modified</th>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
