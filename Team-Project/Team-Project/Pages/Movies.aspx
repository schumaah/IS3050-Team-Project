<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Team_Project.Pages.Movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Movies</h1>

    <asp:Label ID="lblDeleteMessage" runat="server" ForeColor="Red"></asp:Label>
    <br />

    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="MOV_code" DataSourceID="SqlDataSource1" Width="507px">
        <EditItemTemplate>
            Code:
            <asp:Label ID="MOV_codeLabel1" runat="server" Text='<%# Eval("MOV_code") %>' />
            <br />
            Title:
            <asp:TextBox ID="MOV_titleTextBox" runat="server" Text='<%# Bind("MOV_title") %>' />
            <asp:RequiredFieldValidator ID="MovietitleNotNull" runat="server" ControlToValidate="MOV_titleTextBox" ErrorMessage="*Enter a Title"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVTitleLengthEdit" runat="server" ControlToValidate="MOV_titleTextBox" ErrorMessage="*Title must be 1-50 characters" ValidationExpression="^.{1,50}$"></asp:RegularExpressionValidator>
            <br />
            Release Date:
            <asp:TextBox ID="MOV_releasedateTextBox" runat="server" Text='<%# Bind("MOV_releasedate") %>' />
            <asp:RequiredFieldValidator ID="MOVReleaseDateRequiredEdit" runat="server" ControlToValidate="MOV_releasedateTextBox" ErrorMessage="*Enter a Release Date"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="MOV_releasedateTextBox" ErrorMessage="*Enter date in MM/DD/YYYY format" ValidationExpression="^(0?[1-9]|1[0-2])\/(0?[1-9]|[12][0-9]|3[01])\/\d{4}$"></asp:RegularExpressionValidator>
            <br />
            Duration:
            <asp:TextBox ID="MOV_durationTextBox" runat="server" Text='<%# Bind("MOV_duration") %>' />
            <asp:RequiredFieldValidator ID="MOVDurationRequiredEdit" runat="server" ControlToValidate="MOV_durationTextBox" ErrorMessage="*Enter a Duration"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVDurationValidEdit" runat="server" ControlToValidate="MOV_durationTextBox" ErrorMessage="*Enter whole numbers only" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <br />
            Price:
            <asp:TextBox ID="MOV_priceTextBox" runat="server" Text='<%# Bind("MOV_price") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MOV_priceTextBox" ErrorMessage="*Enter a Price"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="PriceNotNull" runat="server" ControlToValidate="MOV_priceTextBox" ErrorMessage="*Enter a valid Price: XX.XX" ValidationExpression="^\d+(\.\d{2})?$"></asp:RegularExpressionValidator>
            <br />
            Genre:
            <asp:TextBox ID="MOV_genreTextBox" runat="server" Text='<%# Bind("MOV_genre") %>' />
            <asp:RequiredFieldValidator ID="MOVGenreRequiredEdit" runat="server" ControlToValidate="MOV_genreTextBox" ErrorMessage="*Enter a Genre Code"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVGenreLengthEdit" runat="server" ControlToValidate="MOV_genreTextBox" ErrorMessage="*Genre code must be exactly 4 characters" ValidationExpression="^.{4}$"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>

        <InsertItemTemplate>
            Code:
            <asp:TextBox ID="MOV_codeTextBox" runat="server" Text='<%# Bind("MOV_code") %>' />
            <asp:RequiredFieldValidator ID="MovieCodeNotNull" runat="server" ControlToValidate="MOV_codeTextBox" ErrorMessage="*Enter a Movie Code"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVCodeLengthInsert" runat="server" ControlToValidate="MOV_codeTextBox" ErrorMessage="*Movie code must be exactly 6 characters" ValidationExpression="^.{6}$"></asp:RegularExpressionValidator>
            <asp:CustomValidator
                ID="CustomValidator1"
                runat="server"
                ControlToValidate="MOV_codeTextBox"
                OnServerValidate="ValidateUniqueID"
                ErrorMessage="*Enter a unique ID"
                Display="Dynamic"></asp:CustomValidator>
            <br />
            Title:
            <asp:TextBox ID="MOV_titleTextBox" runat="server" Text='<%# Bind("MOV_title") %>' />
            <asp:RequiredFieldValidator ID="TitleNotNull" runat="server" ControlToValidate="MOV_titleTextBox" ErrorMessage="*Enter a Movie Title"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVTitleLengthInsert" runat="server" ControlToValidate="MOV_titleTextBox" ErrorMessage="*Title must be 1-50 characters" ValidationExpression="^.{1,50}$"></asp:RegularExpressionValidator>
            <br />
            Releasedate:
            <asp:TextBox ID="MOV_releasedateTextBox" runat="server" Text='<%# Bind("MOV_releasedate") %>' />
            <asp:RequiredFieldValidator ID="MOVReleaseDateRequiredInsert" runat="server" ControlToValidate="MOV_releasedateTextBox" ErrorMessage="*Enter a Release Date"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="MOV_releasedateTextBox" ErrorMessage="*Enter date in MM/DD/YYYY format" ValidationExpression="^(0?[1-9]|1[0-2])\/(0?[1-9]|[12][0-9]|3[01])\/\d{4}$"></asp:RegularExpressionValidator>
            <br />
            Duration:
            <asp:TextBox ID="MOV_durationTextBox" runat="server" Text='<%# Bind("MOV_duration") %>' />
            <asp:RequiredFieldValidator ID="MOVDurationRequiredInsert" runat="server" ControlToValidate="MOV_durationTextBox" ErrorMessage="*Enter a Duration"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVDurationValidInsert" runat="server" ControlToValidate="MOV_durationTextBox" ErrorMessage="*Enter whole numbers only" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <br />
            Price:
            <asp:TextBox ID="MOV_priceTextBox" runat="server" Text='<%# Bind("MOV_price") %>' />
            <asp:RequiredFieldValidator ID="PriceNotNull" runat="server" ControlToValidate="MOV_priceTextBox" ErrorMessage="*Enter a Price"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="MOV_priceTextBox" ErrorMessage="*Enter a Valid Price: XX.XX" ValidationExpression="^\d+(\.\d{2})?$"></asp:RegularExpressionValidator>
            <br />
            Genre:
            <asp:TextBox ID="MOV_genreTextBox" runat="server" Text='<%# Bind("MOV_genre") %>' />
            <asp:RequiredFieldValidator ID="MOVGenreRequiredInsert" runat="server" ControlToValidate="MOV_genreTextBox" ErrorMessage="*Enter a Genre Code"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="MOVGenreLengthInsert" runat="server" ControlToValidate="MOV_genreTextBox" ErrorMessage="*Genre code must be exactly 4 characters" ValidationExpression="^.{4}$"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>

        <ItemTemplate>
            Code:
            <asp:Label ID="MOV_codeLabel" runat="server" Text='<%# Eval("MOV_code") %>' />
            <br />
            Title:
            <asp:Label ID="MOV_titleLabel" runat="server" Text='<%# Bind("MOV_title") %>' />
            <br />
            Release Date:
            <asp:Label ID="MOV_releasedateLabel" runat="server" Text='<%# Bind("MOV_releasedate") %>' />
            <br />
            Duration:
            <asp:Label ID="MOV_durationLabel" runat="server" Text='<%# Bind("MOV_duration") %>' />
            <br />
            Price:
            <asp:Label ID="MOV_priceLabel" runat="server" Text='<%# Bind("MOV_price") %>' />
            <br />
            Genre:
            <asp:Label ID="MOV_genreLabel" runat="server" Text='<%# Bind("MOV_genre") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM [Movie]"
        InsertCommand="INSERT INTO [Movie] ([MOV_code], [MOV_title], [MOV_releasedate], [MOV_duration], [MOV_price], [MOV_genre]) VALUES (@MOV_code, @MOV_title, @MOV_releasedate, @MOV_duration, @MOV_price, @MOV_genre)"
        UpdateCommand="UPDATE [Movie] SET [MOV_title] = @MOV_title, [MOV_releasedate] = @MOV_releasedate, [MOV_duration] = @MOV_duration, [MOV_price] = @MOV_price, [MOV_genre] = @MOV_genre WHERE [MOV_code] = @MOV_code"
        DeleteCommand="DELETE FROM [Movie] WHERE [MOV_code] = @MOV_code"
        OnDeleting="SqlDataSource1_Deleting">

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