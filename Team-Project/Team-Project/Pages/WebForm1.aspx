<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Team_Project._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    Adjustments<br />
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="MOV_code" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            MOV_code:
            <asp:Label ID="MOV_codeLabel1" runat="server" Text='<%# Eval("MOV_code") %>' />
            <br />
            MOV_title:
            <asp:TextBox ID="MOV_titleTextBox" runat="server" Text='<%# Bind("MOV_title") %>' />
            <br />
            MOV_releasedate:
            <asp:TextBox ID="MOV_releasedateTextBox" runat="server" Text='<%# Bind("MOV_releasedate") %>' />
            <br />
            MOV_duration:
            <asp:TextBox ID="MOV_durationTextBox" runat="server" Text='<%# Bind("MOV_duration") %>' />
            <br />
            MOV_price:
            <asp:TextBox ID="MOV_priceTextBox" runat="server" Text='<%# Bind("MOV_price") %>' />
            <br />
            MOV_genre:
            <asp:TextBox ID="MOV_genreTextBox" runat="server" Text='<%# Bind("MOV_genre") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            MOV_code:
            <asp:TextBox ID="MOV_codeTextBox" runat="server" Text='<%# Bind("MOV_code") %>' />
            <br />
            MOV_title:
            <asp:TextBox ID="MOV_titleTextBox" runat="server" Text='<%# Bind("MOV_title") %>' />
            <br />
            MOV_releasedate:
            <asp:TextBox ID="MOV_releasedateTextBox" runat="server" Text='<%# Bind("MOV_releasedate") %>' />
            <br />
            MOV_duration:
            <asp:TextBox ID="MOV_durationTextBox" runat="server" Text='<%# Bind("MOV_duration") %>' />
            <br />
            MOV_price:
            <asp:TextBox ID="MOV_priceTextBox" runat="server" Text='<%# Bind("MOV_price") %>' />
            <br />
            MOV_genre:
            <asp:TextBox ID="MOV_genreTextBox" runat="server" Text='<%# Bind("MOV_genre") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            MOV_code:
            <asp:Label ID="MOV_codeLabel" runat="server" Text='<%# Eval("MOV_code") %>' />
            <br />
            MOV_title:
            <asp:Label ID="MOV_titleLabel" runat="server" Text='<%# Bind("MOV_title") %>' />
            <br />
            MOV_releasedate:
            <asp:Label ID="MOV_releasedateLabel" runat="server" Text='<%# Bind("MOV_releasedate") %>' />
            <br />
            MOV_duration:
            <asp:Label ID="MOV_durationLabel" runat="server" Text='<%# Bind("MOV_duration") %>' />
            <br />
            MOV_price:
            <asp:Label ID="MOV_priceLabel" runat="server" Text='<%# Bind("MOV_price") %>' />
            <br />
            MOV_genre:
            <asp:Label ID="MOV_genreLabel" runat="server" Text='<%# Bind("MOV_genre") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;C:\Users\AdamS\Documents\GitHub\IS3050 Team Project\Team-Project\Team-Project\movies.mdf&quot;;Integrated Security=True;Connect Timeout=30;Encrypt=False" ProviderName="<%$ ConnectionStrings:moviesConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
&nbsp;
</asp:Content>