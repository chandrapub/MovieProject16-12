<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index1.aspx.cs" Inherits="MovieProject.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open Movie Database</title>
    <%--  <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="Content/bootstrap2.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <link href="Scripts/animate.css" rel="stylesheet" />
    <link href="Content/normalize.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/index.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/Style.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css" />
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="site-content">
            <header class="site-header">
                <div class="container">
                    <a href="index1.html" id="branding">
                        <img src="img/logo1.jpg" alt="" class="logo" />
                        <div class="logo-copy">
                            <h1 class="site-title">MIC-MAX</h1>
                            <small class="site-description">Happy to see you...Enjoy your time....</small>
                        </div>
                    </a>
                    <!-- #branding -->

                    <div class="main-navigation">
                        <button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
                        <ul class="menu">
                            <li class="menu-item current-menu-item"><a href="index1.html">Home</a></li>
                            <%--<li class="menu-item"><a href="about.html">About</a></li>--%>
                            <li class="menu-item"><a href="Action.html">Action</a></li>
                            <li class="menu-item"><a href="Animation.html">Animation</a></li>
                            <li class="menu-item"><a href="Thriller.html">Thriller</a></li>
                            <li class="menu-item"><a href="Science.html">Science Fiction</a></li>
                            <%--<li class="menu-item"><a href="joinus.html">Join us</a></li>
							<li class="menu-item"><a href="review.html">Movie reviews</a></li>
							<li class="menu-item"><a href="joinus.html">Join us</a></li>--%>
                            <li class="menu-item"><a href="contact.html">Contact</a></li>
                        </ul>
                        <!-- .menu -->

                    </div>
                    <!-- .main-navigation -->

                    <div class="mobile-navigation"></div>
                </div>
            </header>
            <div>
            <asp:MultiView ID="MultiViewMovies" runat="server" ActiveViewIndex="0">
                <asp:View ID="ViewSearch" runat="server">
                    <main class="main-content">
                        <div class="container">
                            <%--<div class="container-fluid"> </div>--%>
                            <div class="page">
                                <div class="row">
                                    <%--<div class="col-xs-12"> </div>--%>
                                    <div id="Search" class="col-md-12" style="height: 80px; display: flex; align-items: center; padding-left: 10%;">
                                        <form action="#" class="search-form" style="height: 50px; display: center; align-items: center;">
                                            <input style="width: 200px" type="text" placeholder="Search by movie name..."/>
                                            <button>
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <!-- <div class="container"> -->

                                <%--	<div id="Search" class="col-md-8" style="height: 80px; display:flex; align-items: center; padding-left: 10%;">
							<form action="#" class="search-form" style="height: 50px; display:center; align-items: center;">
								<input style = "width:200px;" type="text" placeholder="Search by movie name...">
								<button><i class="fa fa-search"></i>
								</button>
							</form>


							</div> --%>

                                <%--                      <div class="search" style="display:flex; justify-content:center; margin-bottom:5vh;">
                       <asp:TextBox ID="TextBoxName" runat="server" placeholder="Search by name.."></asp:TextBox>
                         <asp:Button ID="ButtonFind" runat="server" OnClick="ButtonFind_Click" CssClass="buttonStyle"  />
                      </div>
                     </div>--%>
                                <%--</div>--%>

                                <%--	<div id="Search" class="col-md-4" style="height: 80px; display:flex; padding-left: 10%; align-items: center;">
							<form action="#" class="search-form" style="height: 50px; display:center; align-items: center;">
								<input type="text" placeholder="Search..."/>
								<button><i class="fa fa-search"></i></button>
							</form>

							</div>
							</div>--%>
                                <%--<div class="row">--%>
                                <%--<div id="Top-10-Action" class="col-md-12">
	
</div>--%>
                                <div class="row">
                                    
                                    <h3>Most popular Action Movies</h3>
                                    <%--</div>--%>


                                    <asp:Repeater ID="RepeaterMovies" runat="server" DataSourceID="SqlDataSourceAction">
                                        <HeaderTemplate>
                                            <table <%--class="row container"--%>>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr class="col-sm-6 col-md-2" style="display: inline-block;">
                                                <div class="latest-movie">                        
                                                <td class="poster" style="display: flex; justify-content: center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url" /></td>

                                                </div>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSourceAction" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="SELECT TOP (6) MovieName, PosterUrl FROM Movies WHERE (FilmCategoryId = 1) ORDER BY Counter DESC"></asp:SqlDataSource>
                                    <br />
                                        
                                    <%-- </div>--%>
                                </div>
                                <%--</asp:View>--%>

                                <div class="row">
                                    <%-- <asp:View ID="View1" runat="server">--%>

                                    <h3>Most popular Animation Movies</h3>
                                    <asp:Repeater ID="RepeaterAnimation" runat="server" DataSourceID="SqlDataSourceAnimation">
                                        <HeaderTemplate>
                                            <table<%-- class="row container"--%>>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="col-sm-6 col-md-2" style="display: inline-block;">
                                                <%--<div class="wrapper"></div>--%>
                                                    <td class="poster" style="display: flex; justify-content: center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url" /></td>
                                                
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSourceAnimation" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="Select top 6 MovieName, PosterUrl from Movies WHERE FilmCategoryId = 2 order by counter desc"></asp:SqlDataSource>
                                    <br />
                                </div>

                                <%--class="row container"--%>
                                <div class="row">
                                    <h3>Most popular Thriller Movies</h3>
                                    <asp:Repeater ID="RepeaterThriller" runat="server" DataSourceID="SqlDataSourceThriller">
                                        <HeaderTemplate>
                                            <table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="col-xs-12 col-sm-6 col-md-2" style="display: inline-block;">
                                                <%--<div class="wrapper"></div>--%>
                                                    <td class="poster" style="display: flex; justify-content: center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url" /></td>
                                                <%--</div>--%>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSourceThriller" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="Select top 6 MovieName, PosterUrl from Movies WHERE FilmCategoryId = 3 order by counter desc"></asp:SqlDataSource>
                                    <br />
                                </div>


                                <div class="row">
                                    <h3>Most popular Science-Fiction Movies</h3>
                                    <asp:Repeater ID="RepeaterScience" runat="server" DataSourceID="SqlDataSourceScience">
                                        <HeaderTemplate>
                                            <table <%--class="row container"--%>>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="col-sm-6 col-md-2" style="display: inline-block;">
                                                <%--<div class="wrapper"></div>--%>
                                                    <td class="poster" style="display: flex; justify-content: center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url" /></td>
                                                <%--</div>--%>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSourceScience" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="Select top 6 MovieName, PosterUrl from Movies WHERE FilmCategoryId = 4 order by counter desc"></asp:SqlDataSource>
                                    <br />
                                </div>


                            </div>
                        </div>
                        <%--</div>--%>
                    </main>

                </asp:View>

            </asp:MultiView>
        </div>
        </div>
    </form>


    <%--</div>--%>
    <!-- .container -->

    <footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia tempore vitae mollitia nesciunt saepe cupiditate</p>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">Recent Review</h3>
                        <ul class="no-bullet">
                            <li><a href="#">Lorem ipsum dolor</a></li>
                            <li><a href="#">Sit amet consecture</a></li>
                            <li><a href="#">Dolorem respequem</a></li>
                            <li><a href="#">Invenore veritae</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">Help Center</h3>
                        <ul class="no-bullet">
                            <li><a href="#">Lorem ipsum dolor</a></li>
                            <li><a href="#">Sit amet consecture</a></li>
                            <li><a href="#">Dolorem respequem</a></li>
                            <li><a href="#">Invenore veritae</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">Join Us</h3>
                        <ul class="no-bullet">
                            <li><a href="#">Lorem ipsum dolor</a></li>
                            <li><a href="#">Sit amet consecture</a></li>
                            <li><a href="#">Dolorem respequem</a></li>
                            <li><a href="#">Invenore veritae</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">Social Media</h3>
                        <ul class="no-bullet">
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Google+</a></li>
                            <li><a href="#">Pinterest</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">Newsletter</h3>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Email Address" />
                        </form>
                    </div>
                </div>
            </div>
            <!-- .row -->

            <div class="colophon">Copyright 2014 Company name, Designed by Themezy. All rights reserved</div>
        </div>
        <!-- .container -->
    </footer>
    <%--</div>--%>

    <%--<div class="container repeaterDiv">
             <%--              <h3>Most popular Animation Movies</h3>
            <asp:Repeater ID="RepeaterAnimation" runat="server" DataSourceID="SqlDataSourceAnimation">
                 <HeaderTemplate>
                <table class="row container">
                    
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="col-sm-6 col-lg-2" style="display:inline-block;">                                   
                    <div class="wrapper">
                   <td class="poster" style="display:flex; justify-content:center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url"/></td>
                        </div>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceAnimation" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="Select top 6 MovieName, PosterUrl from Movies WHERE FilmCategoryId = 2 order by counter desc"></asp:SqlDataSource>
            <br />
        </div>--%>

    <%--<div class="container repeaterDiv">
                           <h3>Most popular Thriller Movies</h3>
            <asp:Repeater ID="RepeaterThriller" runat="server" DataSourceID="SqlDataSourceThriller">
                 <HeaderTemplate>
                <table class="row container">
                    
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="col-sm-6 col-md-3 col-lg-2" style="display:inline-block;">                                   
                    <div class="wrapper">
                    <td class="poster" style="display:flex; justify-content:center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url" /></td>
                        </div>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceThriller" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="Select top 6 MovieName, PosterUrl from Movies WHERE FilmCategoryId = 3 order by counter desc"></asp:SqlDataSource>
            <br />
        </div>--%>
    <%--<div class="container repeaterDiv">
                           <h3>Most popular Science-Fiction Movies</h3>
            <asp:Repeater ID="RepeaterScience" runat="server" DataSourceID="SqlDataSourceScience">
                 <HeaderTemplate>
                <table class="row container">
                    
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="col-sm-6 col-md-3 col-lg-2" style="display:inline-block;">                                   
                    <div class="wrapper">
                   <td class="poster" style="display:flex; justify-content:center;"><a class="caption" href="#" runat="server" id="anchor2" onserverclick="anchor2_ServerClick"><%# Eval("MovieName") %></a><img src="<%# Eval("PosterUrl") %>" alt="Poster-url"/></td>
                        </div>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceScience" runat="server" ConnectionString="<%$ ConnectionStrings:MovieDBCSPopular %>" SelectCommand="Select top 6 MovieName, PosterUrl from Movies WHERE FilmCategoryId = 4 order by counter desc"></asp:SqlDataSource>
            <br />
        </div>--%>



    <%--</asp:View>--%>
    <%--<asp:View ID="ViewResult" runat="server">



                <div class="searchresult animated fadeIn row" id="results">                    

                         
            
            <div class="col-sm-6 col-lg-4 imagePoster" style="display:flex; justify-content:center; padding:0;">
             <asp:Image ID="ImagePoster" runat="server" />
            </div>
           <div class="movieinfo col-sm-6 col-lg-8">
                   <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelResult" runat="server" CssClass="resultStyle"></asp:Label>
             </div>

                 <div class="row" style="display:flex; justify-content:center; padding:1vw;">
            <asp:Label ID="LabelDirected" runat="server"></asp:Label> </div>
            
                      <div class="row" style="display:flex; justify-content:center; padding:1vw;">
                <asp:Label ID="LabelActors" runat="server"></asp:Label> </div>
               
               <div class="row" style="display:flex; justify-content:center; padding:2vw;">
                <asp:Label ID="LabelDescription" runat="server"></asp:Label> </div>  
               <br />
              
               <div class="row infoStyle">
                  <asp:Label ID="LabelLanguage" runat="server"></asp:Label> 
                 <br /><br />
                <asp:Label ID="LabelImdbRating" runat="server"></asp:Label> 
               <br /><br />
                   
                <asp:Label ID="LabelRating" runat="server"></asp:Label> 
                   <br /><br />
                    <asp:Label ID="LabelRuntime" runat="server"></asp:Label>
               
               </div>

           </div>                
               
               <div class="row" style="display:flex; justify-content:center;">
                 <asp:Label ID="LabelMessages" runat="server"></asp:Label>
</div>
               <div class="row Trailer" style="bottom: 20vh;">

            <br />
            <asp:Label ID="LabelTralier" runat="server"></asp:Label>

                   <iframe id="youTubeTrailer" runat="server" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen" frameborder="0" style="margin:291px 0 0 0; padding:0; height: 790px;" width="100%"></iframe>

        </div>
            
                  




            
        </div>
                    </asp:View>--%>
    <!-- Default snippet for navigation -->



    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/app.js"></script>


    <%--   <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
--%></body>
</html>
