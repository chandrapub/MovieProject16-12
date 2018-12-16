<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="MovieProject.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Results for ...</title>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container repeaterDiv">
                           <h3>What we found</h3>
            <asp:Repeater ID="RepeaterMovies" runat="server" DataSourceID="SqlDataSourceSearch">
                 <HeaderTemplate>
                <table class="row container">
                    
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="col-xs-12 col-sm-6 col-lg-2" style="display:inline-block;">                                   
                    <div class="wrapper">
                    <td class="poster" style="display:flex; justify-content:center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url" /></td>
                        </div>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceSearch" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBConnectionStringNoDuplicate %>" ></asp:SqlDataSource>
                           <br />
                           <asp:Label ID="LabelSearch" runat="server" Text="Label"></asp:Label>
                           <br />
            <br />
        </div>
    </form>
</body>
</html>
