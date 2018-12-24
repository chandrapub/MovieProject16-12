<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Action.aspx.cs" Inherits="MovieProject.Action" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Action Movies</title>
    <%--  <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="Content/bootstrap2.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <link href="Scripts/animate.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/index.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        .myitem{
            display:flex; 
            justify-content:center;
            font-size:15px;
            font-weight:bold;
            height:100px;
            width:100px;
            
        }
        .shadow{
            box-shadow:20px 20px 50px grey;
            /*width:20%;
            height:30%;*/
        }
        .mytable{
            background-color :green;
            /*max-width:300px;*/
            border-bottom-style:groove;
        }

        .commercialArea{
            background-color:#fbfbfd;
            /*display:flex;*/
            text-align:center;
            font-size:25px;
            margin-top:42%;
            height: 500px;
           border:solid 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                   
                    
                    <a class="navbar-brand" href="Index.aspx">The Open Movie Database</a>
                </div>
                <ul class="nav navbar-nav navigation">

                    <li class="active"><a href="Action.aspx">Action</a></li>
                    <li><a href="Science.aspx">Science-Fiction</a></li>
                    <li><a href="Thriller.aspx">Thriller</a></li>
                    <li><a href="Animation.aspx">Animated</a></li>
                </ul>
            </div>
        </nav>
        <div class="container main">
            <div class="row">
            <div class="GridviewMoviesDiv col-md-4 col-sm-12 col-xs-12">
                <asp:GridView ID="GridViewMovies" runat="server" AutoGenerateColumns="False" CssClass="mygrdContent" PagerStyle-CssClass="pagerGrid" HeaderStyle-CssClass="headerGrid" RowStyle-CssClass="rowsGrid">
                    <HeaderStyle />
                    <PagerStyle />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="#" style="text-align: left;" runat="server" id="anchor1" onserverclick="anchor1_ServerClick"><%# Eval("MovieName") %>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <RowStyle CssClass="rowsGrid"></RowStyle>

                </asp:GridView>
            </div>
            <div class="info col-md-8 col-sm-12 col-xs-12">

                <div class="col-xs-12 col-sm-5 imagePoster" style="display: flex; justify-content: center; padding: 0;">
                    <asp:Image ID="ImagePoster" runat="server" />
                </div>
                <div class="movieinfo col-xs-12 col-sm-7 col align-self-end">
                    <div class="row" style="display: flex; justify-content: center;">
                        <asp:Label ID="LabelResult" runat="server" Text="Here you can find all Action Movies" CssClass="resultStyle"></asp:Label>
                    </div>

                    <div class="row" style="display: flex; justify-content: center; padding: 1vw;">
                        <asp:Label ID="LabelDirected" runat="server"></asp:Label>
                    </div>

                    <div class="row" style="display: flex; justify-content: center; padding: 1vw;">
                        <asp:Label ID="LabelActors" runat="server"></asp:Label>
                    </div>

                    <div class="row" style="display: flex; justify-content: center; padding: 2vw;">
                        <asp:Label ID="LabelDescription" runat="server"></asp:Label>
                    </div>
                    <br />

                    <div class="row infoStyle" style="text-align: center; padding: 1.5vw; position: absolute; bottom: 0px;">
                        <asp:Label ID="LabelLanguage" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="LabelImdbRating" runat="server"></asp:Label>
                        <br />
                        <br />

                        <asp:Label ID="LabelRating" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="LabelRuntime" runat="server"></asp:Label>

                    </div>

                </div>

                <div class="row" style="display: flex; justify-content: center;">
                    <asp:Label ID="LabelMessages" runat="server"></asp:Label>
                </div>

            </div>
            </div>

            <div class="row" style="display:flex;">
                   <div class="col-md-4 commercialArea" style="">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="SELECT TOP (1) ID, CompanyName, Website, Address, Telephone, CompanyLogo, Count FROM Commercial ORDER BY NEWID()"></asp:SqlDataSource>
                     <asp:Repeater ID="RepeaterCommercial" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <%--<table class="mytable">--%>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="shadow">
                                <td class="myitem"><%# Eval("CompanyName") %></td> </br>
                                <td class="myitem"><%# Eval("Website") %></td> </br>
                                <td class="myitem"><%# Eval("Address") %></td> </br>
                                <td class="myitem"><%# Eval("Telephone") %></td> </br>
                                <td class="myitem">
                                <img src="logo/<%# Eval("Companylogo") %>" alt="logo" /></td>
                            </tr>

                        </ItemTemplate>

                        <FooterTemplate>
                            <%--</table>--%>
                        </FooterTemplate>

                    </asp:Repeater>

                </div>
                <div class ="col-md-8 Trailer">
                <iframe id="youTubeTrailer" runat="server" width="100%" height="500" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen" style="margin: 0; padding: 0;"></iframe>
                <br />
                <asp:Label ID="LabelTralier" runat="server"></asp:Label>
            </div>
             
            </div>
        </div>
        <br />




    </form>
</body>
</html>
