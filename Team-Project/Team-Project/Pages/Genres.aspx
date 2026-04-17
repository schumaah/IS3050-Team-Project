<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="Genres.aspx.cs" Inherits="Team_Project.Pages.Genres" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Genres</h1>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="GEN_code" DataSourceID="SqlDataSource1" AllowPaging="True">
        <EditItemTemplate>
            Code:
                <asp:Label ID="GEN_codeLabel1" runat="server" Text='<%# Eval("GEN_code") %>' />
            <br />
            Name:
                <asp:TextBox ID="GEN_nameTextBox" runat="server" Text='<%# Bind("GEN_name") %>' />
            <asp:RequiredFieldValidator ID="GENNameRequiredEdit" runat="server" ControlToValidate="GEN_nameTextBox" ErrorMessage="*Enter a Name"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="GENNameLengthEdit" runat="server" ControlToValidate="GEN_nameTextBox" ErrorMessage="*Name must be 1-50 characters" ValidationExpression="^.{1,50}$"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Code:
                <asp:TextBox ID="GEN_codeTextBox" runat="server" Text='<%# Bind("GEN_code") %>' />
            <asp:RequiredFieldValidator ID="GENCodeRequiredInsert" runat="server" ControlToValidate="GEN_codeTextBox" ErrorMessage="*Enter a Genre Code"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="GENCodeLengthInsert" runat="server" ControlToValidate="GEN_codeTextBox" ErrorMessage="*Code must be exactly 4 characters" ValidationExpression="^.{4}$"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="ValidateUniqueCode" ControlToValidate="GEN_codeTextBox" ErrorMessage="*Code must be Unique"></asp:CustomValidator>
            <br />
            Name:
                <asp:TextBox ID="GEN_nameTextBox" runat="server" Text='<%# Bind("GEN_name") %>' />
            <asp:RequiredFieldValidator ID="GENNameRequiredInsert" runat="server" ControlToValidate="GEN_nameTextBox" ErrorMessage="*Enter a Name"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="GENNameLengthInsert" runat="server" ControlToValidate="GEN_nameTextBox" ErrorMessage="*Name must be 1-50 characters" ValidationExpression="^.{1,50}$"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Code:
                <asp:Label ID="GEN_codeLabel" runat="server" Text='<%# Eval("GEN_code") %>' />
            <br />
            Name:
                <asp:Label ID="GEN_nameLabel" runat="server" Text='<%# Bind("GEN_name") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Customers %>" DeleteCommand="DELETE FROM [genre] WHERE [GEN_code] = @GEN_code" InsertCommand="INSERT INTO [genre] ([GEN_code], [GEN_name]) VALUES (@GEN_code, @GEN_name)" SelectCommand="SELECT * FROM [genre]" UpdateCommand="UPDATE [genre] SET [GEN_name] = @GEN_name WHERE [GEN_code] = @GEN_code">
        <DeleteParameters>
            <asp:Parameter Name="GEN_code" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GEN_code" Type="String" />
            <asp:Parameter Name="GEN_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GEN_name" Type="String" />
            <asp:Parameter Name="GEN_code" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
