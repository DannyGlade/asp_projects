<%@ Page Title="" Language="C#" MasterPageFile="~/pages/masters/HDes.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="GrocerySite.pages.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!- Header ->
    <title>CMS</title>
    <link rel="stylesheet" href="style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="regT text-center">
        <h1>Content Edit Page</h1>
        <br />
        <asp:Button ID="Add" runat="server" Text="Add" CssClass="btn btn-primary" PostBackUrl="~/pages/Add.aspx" />
        <asp:Button ID="Update" runat="server" Text="Update" CssClass="btn btn-secondary" PostBackUrl="~/pages/Update.aspx" />
        <asp:Button ID="Delete" runat="server" Text="Delete" CssClass="btn btn-danger" PostBackUrl="~/pages/Delete.aspx" />
    </div>
    <br />
    <div class="text-center">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>" SelectCommand="SELECT * FROM [contTB]"></asp:SqlDataSource>
            
            <asp:GridView runat="server" ID="CardView" AutoGenerateColumns="False" CssClass="ms-auto me-auto" OnRowDataBound="CardView_RowDataBound" >
                <Columns>
                    <asp:BoundField DataField="Pid" HeaderText="Pid" InsertVisible="False" ReadOnly="True" SortExpression="Pid" />
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
</asp:Content>
