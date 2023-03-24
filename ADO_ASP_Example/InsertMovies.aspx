<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="InsertMovies.aspx.cs" Inherits="ADO_ASP_Example.InsertMovies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource runat="server" ID="MySqlSource"
        ProviderName="System.Data.SqlClient"
        ConnectionString="Data Source=LAPTOP-GIVRBI76\SQLEXPRESS; Initial Catalog= MovieDetailsDB; Integrated Security=True"
        SelectCommand="Select * from MovieDetail" />
    <div>
        <asp:GridView ID="gv_Movies" runat="server"></asp:GridView>
    </div>
    <asp:DetailsView ID="dv_Movie" runat="server" Height="50px" Width="125px" DataSourceID="MySqlSource"></asp:DetailsView>
    <br />
    <div>
        <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMovieId" runat="server" Text="ID:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMovieId" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMovieName" runat="server" Text="Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMovieName" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblGenre" runat="server" Text="Genre:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Database" OnClick="btnAdd_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <asp:Menu ID="m_AdminAndCustomer" runat="server">
        <Items>
            <asp:MenuItem Text="Admin" NavigateUrl="~/Contact.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Customer" NavigateUrl="~/About.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>
