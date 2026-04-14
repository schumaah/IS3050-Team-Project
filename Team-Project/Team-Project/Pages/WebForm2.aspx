<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Team_Project.Pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CUST_ssn" DataSourceID="SqlDataSource1" AllowPaging="True">
    <EditItemTemplate>
        CUST_ssn:
        <asp:Label ID="CUST_ssnLabel1" runat="server" Text='<%# Eval("CUST_ssn") %>' />
        <br />
        CUST_name:
        <asp:TextBox ID="CUST_nameTextBox" runat="server" Text='<%# Bind("CUST_name") %>' />
        <br />
        CUST_dob:
        <asp:TextBox ID="CUST_dobTextBox" runat="server" Text='<%# Bind("CUST_dob") %>' />
        <br />
        CUST_memberdate:
        <asp:TextBox ID="CUST_memberdateTextBox" runat="server" Text='<%# Bind("CUST_memberdate") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        CUST_ssn:
        <asp:TextBox ID="CUST_ssnTextBox" runat="server" Text='<%# Bind("CUST_ssn") %>' />
        <br />
        CUST_name:
        <asp:TextBox ID="CUST_nameTextBox" runat="server" Text='<%# Bind("CUST_name") %>' />
        <br />
        CUST_dob:
        <asp:TextBox ID="CUST_dobTextBox" runat="server" Text='<%# Bind("CUST_dob") %>' />
        <br />
        CUST_memberdate:
        <asp:TextBox ID="CUST_memberdateTextBox" runat="server" Text='<%# Bind("CUST_memberdate") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        CUST_ssn:
        <asp:Label ID="CUST_ssnLabel" runat="server" Text='<%# Eval("CUST_ssn") %>' />
        <br />
        CUST_name:
        <asp:Label ID="CUST_nameLabel" runat="server" Text='<%# Bind("CUST_name") %>' />
        <br />
        CUST_dob:
        <asp:Label ID="CUST_dobLabel" runat="server" Text='<%# Bind("CUST_dob") %>' />
        <br />
        CUST_memberdate:
        <asp:Label ID="CUST_memberdateLabel" runat="server" Text='<%# Bind("CUST_memberdate") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Customers %>" DeleteCommand="DELETE FROM [customer] WHERE [CUST_ssn] = @CUST_ssn" InsertCommand="INSERT INTO [customer] ([CUST_ssn], [CUST_name], [CUST_dob], [CUST_memberdate]) VALUES (@CUST_ssn, @CUST_name, @CUST_dob, @CUST_memberdate)" ProviderName="<%$ ConnectionStrings:Customers.ProviderName %>" SelectCommand="SELECT * FROM [customer]" UpdateCommand="UPDATE [customer] SET [CUST_name] = @CUST_name, [CUST_dob] = @CUST_dob, [CUST_memberdate] = @CUST_memberdate WHERE [CUST_ssn] = @CUST_ssn">
    <DeleteParameters>
        <asp:Parameter Name="CUST_ssn" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CUST_ssn" Type="String" />
        <asp:Parameter Name="CUST_name" Type="String" />
        <asp:Parameter Name="CUST_dob" Type="DateTime" />
        <asp:Parameter Name="CUST_memberdate" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CUST_name" Type="String" />
        <asp:Parameter Name="CUST_dob" Type="DateTime" />
        <asp:Parameter Name="CUST_memberdate" Type="DateTime" />
        <asp:Parameter Name="CUST_ssn" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
