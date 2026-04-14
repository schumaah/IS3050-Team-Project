<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Team_Project.Pages.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="MOV_titleLabel" runat="server" Text='<%# Eval("MOV_title") %>' />
                </td>
                <td>
                    <asp:Label ID="CUST_nameLabel" runat="server" Text='<%# Eval("CUST_name") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="MOV_titleTextBox" runat="server" Text='<%# Bind("MOV_title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CUST_nameTextBox" runat="server" Text='<%# Bind("CUST_name") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="MOV_titleTextBox" runat="server" Text='<%# Bind("MOV_title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CUST_nameTextBox" runat="server" Text='<%# Bind("CUST_name") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="MOV_titleLabel" runat="server" Text='<%# Eval("MOV_title") %>' />
                </td>
                <td>
                    <asp:Label ID="CUST_nameLabel" runat="server" Text='<%# Eval("CUST_name") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">MOV_title</th>
                                <th runat="server">CUST_name</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="MOV_titleLabel" runat="server" Text='<%# Eval("MOV_title") %>' />
                </td>
                <td>
                    <asp:Label ID="CUST_nameLabel" runat="server" Text='<%# Eval("CUST_name") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Customers %>" SelectCommand="SELECT Movie.MOV_title, customer.CUST_name FROM Movie INNER JOIN rental ON Movie.MOV_code = rental.RENT_movie INNER JOIN customer ON rental.RENT_customer = customer.CUST_ssn WHERE ([MOV_title] = @MOV_title)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="MOV_title" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MOV_title" DataValueField="MOV_title">
    </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Customers %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT [MOV_title] FROM [Movie]"></asp:SqlDataSource>
    <br />
</asp:Content>
