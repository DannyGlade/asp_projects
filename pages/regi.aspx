<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="regi.aspx.cs" Inherits="GrocerySite.regi" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Registration Page</title>
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
                            <a class="nav-link active" href="regi.aspx">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logi.aspx">Log In</a>
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
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <div class="regT">
            <h1>Registration Form</h1>
        </div>
        <form id="form1" runat="server">

            <div>
                <table class="ftable">
                    <tr>
                        <td>
                            <asp:TextBox ID="fname" runat="server" placeholder="First Name" Width="100%"
                                CssClass="form-controle finput"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lname" runat="server" placeholder="Last Name" Width="100%"
                                CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="pnum" runat="server" placeholder="Phone Number" Width="100%"
                                TextMode="Phone" CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="email" runat="server" placeholder="Email" Width="100%" TextMode="Email"
                                CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="bday" runat="server" placeholder="Birthdate" Width="100%"
                                onfocus="(this.type='Date')" CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="uname" runat="server" placeholder="User-Name" Width="100%"
                                CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="pswd" runat="server" placeholder="Password" Width="100%"
                                TextMode="Password" CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="cpswd" runat="server" placeholder="Confirm Password" Width="100%"
                                TextMode="Password" CssClass="form-controle finput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="register" runat="server" Text="Register" OnClick="register_Click"
                                CssClass="btn btn-primary" />
                        </td>
                        <td><input id="Reset1" type="reset" value="Reset" class="btn btn-outline-primary" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a href="logi.aspx"><input id="login" type="button" value="Log-In"
                                    class="btn btn-secondary" /></a>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="dbshow">

            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>" SelectCommand="SELECT * FROM [regiTB]">
            </asp:SqlDataSource>

        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    </body>

    </html>