<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OMDB_UseService.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open Movie Database</title>
  <%--  <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
     <link href="Content/bootstrap2.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
     <link href="Scripts/animate.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src ="Scripts/popper.min.js"></script>
    <script src ="Scripts/index.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        
           
     <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand active" href="Index.aspx">The Open Movie Database</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="Action.aspx">Action</a></li>
      <li><a href="#">Science-Fiction</a></li>
      <li><a href="#">Thriller</a></li>
        <li><a href="#">Animated</a></li>
    </ul>
  </div>
</nav>
        
        <div class="row animated fadeIn" style="margin:auto; display:flex; justify-content:center;">
          
           
            <asp:TextBox ID="TextBoxName" runat="server" placeholder="Search by name.."></asp:TextBox>
        
            <asp:Button ID="ButtonFind" runat="server" OnClick="ButtonFind_Click" Text="Find Movie!" />
            </div>
            <br />
            <br />
        
        <div class="searchresult animated fadeIn" id="results">
             <div class="row" style="display:flex; justify-content:center;">
         <asp:Image ID="ImagePoster" runat="server" ImageUrl="~/img/placehold.jpg" Width="311px" Height="205px" /></div>
            
             <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelResult" runat="server" Text="Result"></asp:Label></div>
          
            <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelDirected" runat="server" Text="Directed by: "></asp:Label> </div>
               
                      <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelActors" runat="server" Text="Starring: "></asp:Label> </div>
               
                
                           <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelRating" runat="server" Text="Rating: "></asp:Label> </div>
        </div>
    </form>
</body>
</html>
