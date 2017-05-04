<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="eLearningWebPortal.MemberList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class="page-header">
        <h1 runat="server" id="heading">Members</h1>
    </div>
    <asp:HiddenField runat="server" ID="hdnRole" Value="" />
    <asp:HiddenField runat="server" ID="hdnCourse" Value="" />
    <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
    <% if (SessionManager.Role().Equals("admin"))
        {%>

    <div class="btn-group btn-group-sm pull-right" style="margin-top: -60px">
        <a href="RegisterProfessor.aspx" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Create</a>
    </div>

    <%} %>
    
    <asp:GridView runat="server" ID="grid" OnRowDataBound="grid_RowDataBound"  CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" OnSelectedIndexChanged="grid_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Registration ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="CourseName" HeaderText="Course" SortExpression="CourseName" />
            <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" SortExpression="PhoneNo" />
            <asp:BoundField DataField="RoleName" HeaderText="Role Name" SortExpression="RoleName" />
            <asp:TemplateField>
             <ItemTemplate>
                 
                       <% if (SessionManager.Role().Equals("admin"))
                { %>
                    <div class="btn-group btn-group-sm">
                            <a href="/RegisterProfessor?id=<%#Eval("Id") %>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                     <asp:LinkButton runat="server" ID="lbtnDelete" Text="Delete" CssClass="btn btn-danger" CommandArgument='<%#Eval("Id")%>' OnCommand="lbtnDelete_Command"><i class="glyphicon glyphicon-trash"></i> Delete</asp:LinkButton>
                    </div>
                   <%} %>     
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT M.*, C.Name as CourseName FROM [Members] as M LEFT OUTER JOIN Courses AS C ON M.FkCourseId = C.Id where RoleName <> 'admin'"></asp:SqlDataSource>
</asp:Content>
