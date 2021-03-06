<%@ Page Title="" Language="C#" MasterPageFile="~/pages/masters/HDes.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="GrocerySite.pages.Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Content</title>
     <link rel="stylesheet" href="style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>" SelectCommand="SELECT * FROM [contTB]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="regT text-center">
        <h1>Add Content Page</h1>
        <br />
            <table class="ftable">
                <tr>
                    <td><asp:TextBox ID="Pname" runat="server" placeholder="Product Name" CssClass="form-control finput" Width="100%"></asp:TextBox></td>
                    </tr>
                <tr>
                    <td><asp:TextBox ID="Pdisc" runat="server" placeholder="Product Discreption" CssClass="form-control finput"></asp:TextBox></td>
                    </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileU" runat="server" CssClass="form-control finput" /></td>
                    </tr>
                <tr>
                    <td><asp:TextBox ID="Pprice" runat="server" placeholder="Product Price" CssClass="form-control finput"></asp:TextBox></td>
                </tr>
            </table><br />
        <asp:Button ID="addItm" runat="server" Text="Add Item" CssClass="btn btn-primary" OnClick="addItm_Click" />
        <a href="Homi.aspx" class="btn btn-secondary">Home</a>
        <br />
        <asp:Label ID="addRes" runat="server" Text="Adding Success!" CssClass="text-success" Font-Size="Large"></asp:Label>
        
    </div>
    <br />
    <div class="text-center">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>" SelectCommand="SELECT * FROM [contTB]"></asp:SqlDataSource>
            
            <asp:GridView runat="server" ID="CardView" AutoGenerateColumns="False" CssClass="ms-auto me-auto" OnRowDataBound="CardView_RowDataBound" >
                <Columns>
                    <asp:TemplateField HeaderText="Image" >
                        <ItemTemplate>  
                            <asp:Image ID="img" runat="server" style="width:auto;height:150px;" />
                           <!-- <img  scr="" runat="server" width="150" height="150" /> -->
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Pid" HeaderText="Pid" InsertVisible="False" ReadOnly="True" SortExpression="Pid" />
                    <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
                    <asp:BoundField DataField="Pdisc" HeaderText="Pdisc" SortExpression="Pdisc" />
                    <asp:BoundField DataField="Pprice" HeaderText="Pprice" SortExpression="Pprice" />
                </Columns>
            </asp:GridView>   
    </div>
</asp:Content>
