<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Action.aspx.cs" Inherits="MovieProject.Action" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Action Moviessss</title>  
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
      
      <li class="active"><a href="Action.aspx">Action</a></li>
      <li><a href="#">Science-Fiction</a></li>
      <li><a href="#">Thriller</a></li>
        <li><a href="#">Animated</a></li>
    </ul>
  </div>
</nav>
        <div class="row">
        <div class="GridviewMoviesDiv col-sm-4" style="height: 70vh; width: 366px; overflow-y: scroll; overflow-x: hidden;">
            <asp:GridView ID="GridViewMovies" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
                <Columns>
        <asp:TemplateField>
            <ItemTemplate >
               <a href="#" style="display:flex; justify-content:center;" runat="server" id="anchor1" onserverclick="anchor1_ServerClick"><%# Eval("Name") %>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
            </asp:GridView>
            </div>
        <div class="info col-sm-8">
            <div class="row" style="display:flex; justify-content:center;">
             <asp:Image ID="ImagePoster" runat="server" Height="481px" ImageUrl="~/img/placehold.jpg" Width="369px" />
            </div>
           
                   <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelResult" runat="server" Text="Result"></asp:Label>
            <br /> </div>

                 <div class="row" style="display:flex; justify-content:center;">
            <asp:Label ID="LabelDirected" runat="server" Text="Directed by: "></asp:Label> </div>
            <br />      
                      <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelActors" runat="server" Text="Starring: "></asp:Label> </div>
                <br />
                
                           <div class="row" style="display:flex; justify-content:center;">
                <asp:Label ID="LabelRating" runat="server" Text="Rating: "></asp:Label> </div>
            <br />
                                <div class="row" style="display:flex; justify-content:center;">
                 <asp:Label ID="LabelMessages" runat="server" Text=" "></asp:Label>

            </div>
           </div>
            <br />
          
           </div>
        </div>
    </form>
</body>
</html>
