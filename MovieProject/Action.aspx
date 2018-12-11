<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Action.aspx.cs" Inherits="MovieProject.Action" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Action Movies</title>  
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
         <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand active" href="Index.aspx">The Open Movie Database</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li class="active"><a href="Action.aspx">Action</a></li>
      <li><a href="#">Science-Fiction</a></li>
      <li><a href="#">Thriller</a></li>
        <li><a href="#">Animated</a></li>
    </ul>
  </div>
</nav>
        <div class="row">
        <div class="GridviewMoviesDiv col-sm-4" style="height: 70vh; width: 25vw; overflow-y: auto; overflow-x: hidden; margin-left:2vw;">
            <asp:GridView ID="GridViewMovies" runat="server" AutoGenerateColumns="False" CssClass="mygrdContent" PagerStyle-CssClass="pagerGrid" HeaderStyle-CssClass="headerGrid" RowStyle-CssClass="rowsGrid">
                <HeaderStyle />
                <PagerStyle />
                <Columns>
        <asp:TemplateField>
            <ItemTemplate >
               <a href="#" style="display:flex; justify-content:center;" runat="server" id="anchor1" onserverclick="anchor1_ServerClick"><%# Eval("MovieName") %>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

<RowStyle CssClass="rowsGrid"></RowStyle>

            </asp:GridView>
            </div>
        <div class="info col-sm-8">
            <div class="row">
            <div class="col-sm-6" style="display:flex; justify-content:center;">
             <asp:Image ID="ImagePoster" runat="server" Height="481px" ImageUrl="~/img/placehold.jpg" Width="369px" />
            </div>
           <div class="col-sm-6">
                   <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelResult" runat="server" Text="Here you can find all Action Movies" CssClass="resultStyle"></asp:Label>
            <br /> </div>

                 <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelDirected" runat="server"></asp:Label> </div>
            <br />      
                      <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelActors" runat="server"></asp:Label> </div>
                <br />
                
                           

                <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelDescription" runat="server"></asp:Label> </div>
            <br />
               <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelRating" runat="server"></asp:Label> </div>
                                <div class="row" style="display:flex; justify-content:center;">
                 <asp:Label ID="LabelMessages" runat="server"></asp:Label>
</div>
               </div>
            </div>
           </div>
            <br />
          
           </div>
        <div class="row Trailer">

              <iframe id="youTubeTrailer" runat="server" width="650" height="380" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen= "allowfullscreen"></iframe>
            <br />
            <asp:Label ID="LabelTralier" runat="server"></asp:Label>

        </div>
      
    </form>
</body>
</html>
