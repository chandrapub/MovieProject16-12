<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="MovieProject.Animation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Animated Movies</title>  
    <%--  <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
     <link href="Content/bootstrap2.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
     <link href="Scripts/animate.css" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet"/>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src ="Scripts/popper.min.js"></script>
    <script src ="Scripts/index.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Index.aspx">The Open Movie Database</a>
    </div>
    <ul class="nav navbar-nav navigation">
      
      <li><a href="Action.aspx">Action</a></li>
      <li><a href="Science.aspx">Science-Fiction</a></li>
      <li><a href="Thriller.aspx">Thriller</a></li>
       <li class="active"><a href="Animation.aspx">Animated</a></li>
    </ul>
  </div>
</nav>
        <div class="container main" style="width:90%;">
        <div class="GridviewMoviesDiv col-sm-4" style="height: 65vh; width: 25vw; overflow-y: auto; overflow-x: hidden; margin-left:2vw;">
            <asp:GridView ID="GridViewMovies" runat="server" AutoGenerateColumns="False" CssClass="mygrdContent" PagerStyle-CssClass="pagerGrid" HeaderStyle-CssClass="headerGrid" RowStyle-CssClass="rowsGrid">
                <HeaderStyle />
                <PagerStyle />
                <Columns>
        <asp:TemplateField>
            <ItemTemplate >
               <a href="#" style="text-align:left;" runat="server" id="anchor1" onserverclick="anchor1_ServerClick"><%# Eval("MovieName") %>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

<RowStyle CssClass="rowsGrid"></RowStyle>

            </asp:GridView>
            </div>
        <div class="info col-sm-8">     
            
            <div class="col-sm-5 imagePoster" style="display:flex; justify-content:center; padding:0;">
             <asp:Image ID="ImagePoster" runat="server" Height="481px" Width="369px" />
            </div>
           <div class="movieinfo col-sm-7 col align-self-end">
                   <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelResult" runat="server" Text="Here you can find all Animated Movies" CssClass="resultStyle"></asp:Label>
             </div>

                 <div class="row" style="display:flex; justify-content:center; padding:1vw;">
            <asp:Label ID="LabelDirected" runat="server"></asp:Label> </div>
            
                      <div class="row" style="display:flex; justify-content:center; padding:1vw;">
                <asp:Label ID="LabelActors" runat="server"></asp:Label> </div>
               
               <div class="row" style="display:flex; justify-content:center; padding:2vw;">
                <asp:Label ID="LabelDescription" runat="server"></asp:Label> </div>  
               <br />
              
               <div class="row infoStyle" style="text-align:center; padding:1.5vw; position:absolute; bottom:0px;">
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
              
            </div>
             <div class="row Trailer">

              <iframe id="youTubeTrailer" runat="server" width="100%" height="500" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen= "allowfullscreen" style="margin:0; padding:0;"></iframe>
            <br />
            <asp:Label ID="LabelTralier" runat="server"></asp:Label>

        </div>
           </div>
            <br />
          
          
        
      
    </form>
</body>
</html>

