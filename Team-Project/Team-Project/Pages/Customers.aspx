<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Team_Project.Pages.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Customers</h1>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <br />

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CUST_ssn" DataSourceID="SqlDataSource1" AllowPaging="True">

        <EditItemTemplate>
            SSN:
            <asp:Label ID="CUST_ssnLabel1" runat="server" Text='<%# Eval("CUST_ssn") %>' />
            <br />

            Name:
            <asp:TextBox ID="CUST_nameTextBox" runat="server" Text='<%# Bind("CUST_name") %>' />
            <asp:RequiredFieldValidator ID="CUSTNameRequiredEdit" runat="server"
                ControlToValidate="CUST_nameTextBox"
                ErrorMessage="*Enter a Name" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTNameFormatEdit" runat="server"
                ControlToValidate="CUST_nameTextBox"
                ErrorMessage="*Invalid name"
                ValidationExpression="^[A-Za-z]+([ '-][A-Za-z]+)*$"
                Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTNameLengthEdit" runat="server"
                ControlToValidate="CUST_nameTextBox"
                ErrorMessage="*Max 50 characters"
                ValidationExpression="^.{1,50}$"
                Display="Dynamic" />
            <br />

            Date of Birth:
            <asp:TextBox ID="CUST_dobTextBox" runat="server" Text='<%# Bind("CUST_dob") %>' />
            <asp:RequiredFieldValidator ID="CUSTDOBRequiredEdit" runat="server"
                ControlToValidate="CUST_dobTextBox"
                ErrorMessage="*Enter DOB" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTDOBFormatEdit" runat="server"
                ControlToValidate="CUST_dobTextBox"
                ErrorMessage="*MM/DD/YYYY"
                ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$"
                Display="Dynamic" />
            <br />

            Member Date:
            <asp:TextBox ID="CUST_memberdateTextBox" runat="server" Text='<%# Bind("CUST_memberdate") %>' />
            <asp:RequiredFieldValidator ID="CUSTMemberRequiredEdit" runat="server"
                ControlToValidate="CUST_memberdateTextBox"
                ErrorMessage="*Enter Member Date" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTMemberFormatEdit" runat="server"
                ControlToValidate="CUST_memberdateTextBox"
                ErrorMessage="*MM/DD/YYYY"
                ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$"
                Display="Dynamic" />
            <br />

            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CausesValidation="True" Text="Update" />
            &nbsp;
            <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="False" Text="Cancel" />
        </EditItemTemplate>

        <InsertItemTemplate>
            SSN:
            <asp:TextBox ID="CUST_ssnTextBox" runat="server" Text='<%# Bind("CUST_ssn") %>' />
            <asp:RequiredFieldValidator ID="CUSTSSNRequired" runat="server"
                ControlToValidate="CUST_ssnTextBox"
                ErrorMessage="*Enter SSN" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTSSNFormat" runat="server"
                ControlToValidate="CUST_ssnTextBox"
                ErrorMessage="*Format: XXX-XX-XXXX"
                ValidationExpression="^\d{3}-\d{2}-\d{4}$"
                Display="Dynamic" />
            <asp:CustomValidator ID="CUSTSSNUnique" runat="server"
                ControlToValidate="CUST_ssnTextBox"
                OnServerValidate="ValidateUniqueSSN"
                ErrorMessage="*SSN must be unique"
                Display="Dynamic" />
            <br />

            Name:
            <asp:TextBox ID="CUST_nameTextBox" runat="server" Text='<%# Bind("CUST_name") %>' />
            <asp:RequiredFieldValidator ID="CUSTNameRequired" runat="server"
                ControlToValidate="CUST_nameTextBox"
                ErrorMessage="*Enter Name" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTNameFormat" runat="server"
                ControlToValidate="CUST_nameTextBox"
                ErrorMessage="*Invalid name"
                ValidationExpression="^[A-Za-z]+([ '-][A-Za-z]+)*$"
                Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTNameLength" runat="server"
                ControlToValidate="CUST_nameTextBox"
                ErrorMessage="*Max 50 characters"
                ValidationExpression="^.{1,50}$"
                Display="Dynamic" />
            <br />

            Date of Birth:
            <asp:TextBox ID="CUST_dobTextBox" runat="server" Text='<%# Bind("CUST_dob") %>' />
            <asp:RequiredFieldValidator ID="CUSTDOBRequired" runat="server"
                ControlToValidate="CUST_dobTextBox"
                ErrorMessage="*Enter DOB" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTDOBFormat" runat="server"
                ControlToValidate="CUST_dobTextBox"
                ErrorMessage="*MM/DD/YYYY"
                ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$"
                Display="Dynamic" />
            <br />

            Member Date:
            <asp:TextBox ID="CUST_memberdateTextBox" runat="server" Text='<%# Bind("CUST_memberdate") %>' />
            <asp:RequiredFieldValidator ID="CUSTMemberRequired" runat="server"
                ControlToValidate="CUST_memberdateTextBox"
                ErrorMessage="*Enter Member Date" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="CUSTMemberFormat" runat="server"
                ControlToValidate="CUST_memberdateTextBox"
                ErrorMessage="*MM/DD/YYYY"
                ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$"
                Display="Dynamic" />
            <br />

            <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" CausesValidation="True" Text="Insert" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" CausesValidation="False" Text="Cancel" />
        </InsertItemTemplate>

        <ItemTemplate>
            SSN:
            <asp:Label ID="CUST_ssnLabel" runat="server" Text='<%# Eval("CUST_ssn") %>' />
            <br />

            Name:
            <asp:Label ID="CUST_nameLabel" runat="server" Text='<%# Bind("CUST_name") %>' />
            <br />

            DOB:
            <asp:Label ID="CUST_dobLabel" runat="server" Text='<%# Bind("CUST_dob") %>' />
            <br />

            Member Date:
            <asp:Label ID="CUST_memberdateLabel" runat="server" Text='<%# Bind("CUST_memberdate") %>' />
            <br />

            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CausesValidation="False" Text="Edit" />
            &nbsp;
            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="False" Text="Delete" />
            &nbsp;
            <asp:LinkButton ID="NewButton" runat="server" CommandName="New" CausesValidation="False" Text="New" />
        </ItemTemplate>

    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:Customers %>"
        ProviderName="<%$ ConnectionStrings:Customers.ProviderName %>"
        SelectCommand="SELECT * FROM [customer]"
        InsertCommand="INSERT INTO [customer] ([CUST_ssn], [CUST_name], [CUST_dob], [CUST_memberdate]) VALUES (@CUST_ssn, @CUST_name, @CUST_dob, @CUST_memberdate)"
        UpdateCommand="UPDATE [customer] SET [CUST_name]=@CUST_name, [CUST_dob]=@CUST_dob, [CUST_memberdate]=@CUST_memberdate WHERE [CUST_ssn]=@CUST_ssn"
        DeleteCommand="DELETE FROM [customer] WHERE [CUST_ssn]=@CUST_ssn"
        OnDeleted="SqlDataSource1_Deleted">

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

        <DeleteParameters>
            <asp:Parameter Name="CUST_ssn" Type="String" />
        </DeleteParameters>

    </asp:SqlDataSource>

</asp:Content>