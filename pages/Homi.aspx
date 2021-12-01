<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homi.aspx.cs" Inherits="GrocerySite.Homi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link rel="stylesheet" href="style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-black">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">GrocerySite</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="Homi.aspx">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="regi.aspx">Register</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="logi.aspx">Log In</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Options
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="Edit.aspx">Edit</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
              </li>
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>
      <div class="regT">
        <h1>Home Page</h1>
    </div>
    <form id="form1" runat="server">
        
        <div class="text-center">
            <asp:Label ID="homitxt" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="Edit" runat="server" Text="Edit" CssClass="btn btn-primary" PostBackUrl="~/pages/Edit.aspx" />
        </div>
        <br />
        <br />

        <div class="text-center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>" SelectCommand="SELECT * FROM [contTB]"></asp:SqlDataSource>
            
            <asp:GridView runat="server" ID="CardView" AutoGenerateColumns="False" CssClass="ms-auto me-auto" OnRowDataBound="CardView_RowDataBound" >
                <Columns>
                    <asp:TemplateField HeaderText="Image" >
                        <ItemTemplate>  
                            <asp:Image ID="img" runat="server" style="width:auto;height:150px;" />
                           <!-- <img  scr="" runat="server" width="150" height="150" /> -->
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
                    <asp:BoundField DataField="Pdisc" HeaderText="Pdisc" SortExpression="Pdisc" />
                    <asp:BoundField DataField="Pprice" HeaderText="Pprice" SortExpression="Pprice" />
                </Columns>
            </asp:GridView>   
    </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>
