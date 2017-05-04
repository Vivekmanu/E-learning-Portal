<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgramList.aspx.cs" Inherits="eLearningWebPortal.ProgramList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label runat="server" ID="lblMessage" Visible="false" CssClass="alert alert-danger"></asp:Label>
    <div class="page-header">
        <h1 runat="server" id="h1">Programs</h1>
    </div>
     <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
   
   
    <% if (SessionManager.Role().Equals("admin"))
        {%>
   
     <div class="btn-group btn-group-sm pull-right" style="margin-top: -60px">
        <a href="CreateProgram.aspx" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Create</a>
    </div>

    <%} %>

    
    <asp:GridView runat="server" ID="grid" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" >
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
           
             <asp:TemplateField>
                <ItemTemplate>
                     <div class="btn-group btn-group-sm">
                        <asp:LinkButton runat="server" ID="btnactive" Text='<%#(Eval("IsActive").ToString() == "True" ? "Inactive" : "Active")%>' CssClass='<%#(Eval("IsActive").ToString() == "True" ? "btn btn-success" : "btn btn-warning")%>'  CommandArgument='<%#Eval("Id")%>'  OnCommand="btnactive_Command"></asp:LinkButton>
                         <a href="/CreateProgram.aspx?id=<%#Eval("Id") %>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                        <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger" CommandArgument='<%#Eval("Id")%>' OnCommand="btnDelete_Command"><i class="glyphicon glyphicon-trash"></i> Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
           
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Program]"  DeleteCommand="DELETE FROM Program where Id = @Id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="grid" Name="Id" PropertyName="Id" />
        </DeleteParameters>
            
    </asp:SqlDataSource>

</asp:Content>
