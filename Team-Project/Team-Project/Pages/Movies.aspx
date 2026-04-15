<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Team_Project._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Movies</h1>
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
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Movie] WHERE [MOV_code] = @MOV_code" InsertCommand="INSERT INTO [Movie] ([MOV_code], [MOV_title], [MOV_releasedate], [MOV_duration], [MOV_price], [MOV_genre]) VALUES (@MOV_code, @MOV_title, @MOV_releasedate, @MOV_duration, @MOV_price, @MOV_genre)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movie]" UpdateCommand="UPDATE [Movie] SET [MOV_title] = @MOV_title, [MOV_releasedate] = @MOV_releasedate, [MOV_duration] = @MOV_duration, [MOV_price] = @MOV_price, [MOV_genre] = @MOV_genre WHERE [MOV_code] = @MOV_code">
    <DeleteParameters>
        <asp:Parameter Name="MOV_code" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MOV_code" Type="String" />
        <asp:Parameter Name="MOV_title" Type="String" />
        <asp:Parameter Name="MOV_releasedate" Type="DateTime" />
        <asp:Parameter Name="MOV_duration" Type="Int32" />
        <asp:Parameter Name="MOV_price" Type="Decimal" />
        <asp:Parameter Name="MOV_genre" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="MOV_title" Type="String" />
        <asp:Parameter Name="MOV_releasedate" Type="DateTime" />
        <asp:Parameter Name="MOV_duration" Type="Int32" />
        <asp:Parameter Name="MOV_price" Type="Decimal" />
        <asp:Parameter Name="MOV_genre" Type="String" />
        <asp:Parameter Name="MOV_code" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>