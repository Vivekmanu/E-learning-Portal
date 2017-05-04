
<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubjecctList.aspx.cs" Inherits="eLearningWebPortal.SubjecctList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div class="page-header">
        <h1 runat="server" id="h1">Subjects</h1>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -70px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
    </div>
      <% if (SessionManager.Role().Equals("admin"))
        {%>
            
    <div class="btn-group btn-group-sm pull-right" style="margin-top: -60px">
        <a href="CreateSubject.aspx" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Create</a>
    </div>
 


    <%} %>
  
    <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Always">
        <Triggers>
            <asp:PostBackTrigger ControlID="ddlCourses" />
        </Triggers>
        <ContentTemplate>
             <div class="well">
             <div class="input-group">
            <strong>Select a Course  </strong>
            <asp:DropDownList runat="server" ID="ddlCourses" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id" ></asp:DropDownList>
            
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
            </div>
                 </div>
           <asp:GridView runat="server" ID="grid" CssClass="table table-bordered" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"  >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        

                    <asp:TemplateField>
                <ItemTemplate>
                     <div class="btn-group btn-group-sm">
                        <asp:LinkButton runat="server" ID="btnactive" Text='<%#(Eval("IsActive").ToString() == "True" ? "Inactive" : "Active")%>' CssClass='<%#(Eval("IsActive").ToString() == "True" ? "btn btn-success" : "btn btn-warning")%>'  CommandArgument='<%#Eval("Id")%>' OnCommand="btnactive_Command" ></asp:LinkButton>
                        <a href="/CreateSubject.aspx?id=<%#Eval("Id") %>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                        <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger"  CommandArgument='<%#Eval("Id")%>' OnCommand="btnDelete_Command" ><i class="glyphicon glyphicon-trash"></i> Delete</asp:LinkButton>
                
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Subjects] WHERE (FkCourseId= @FkCourseId)" DeleteCommand="DELETE FROM  Subjects Where Id = @Id ">
          <SelectParameters>
              <asp:ControlParameter ControlID="ddlCourses" Name="FkCourseId" />
           
          </SelectParameters>
                <SelectParameters>
                       <asp:ControlParameter ControlID="grid" Name="ID" PropertyName="Id" />
                </SelectParameters>
                
                </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
