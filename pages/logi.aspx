<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logi.aspx.cs" Inherits="GrocerySite.logi" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>LogIn Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
            <style>
                @import url(style.css);
    
                .finput {
                    border-radius: 0.5px;
                }
            </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-black">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">GrocerySite</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="Homi.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="regi.aspx">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="logi.aspx">Log In</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Options
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="Edit.aspx">Edit</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <div class="regT">
            <h1>LogIn Form</h1>
        </div>
            <form id="form1" runat="server">

                <div>
                    <table class="ftable">
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="userid" runat="server" placeholder="User-Name" Width="100%"
                                    CssClass="form-controle finput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="password" runat="server" placeholder="Password" Width="100%"
                                    TextMode="Password" CssClass="form-controle finput"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="login" runat="server" Text="Log-In" OnClick="login_Click"
                                    CssClass="btn btn-primary" />
                            </td>
                            <td><a href="regi.aspx"><input id="signup" type="button" value="Sign-Up"
                                        class="btn btn-secondary" /></a></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="logtxt" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>"
                    SelectCommand="SELECT [uname], [pswd] FROM [regiTB]"></asp:SqlDataSource>

            </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    </body>

    </html>