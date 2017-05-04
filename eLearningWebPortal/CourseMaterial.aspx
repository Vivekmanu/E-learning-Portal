<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseMaterial.aspx.cs" Inherits="eLearningWebPortal.CourseMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="hdnUserId" />
     <asp:HiddenField runat="server" ID="hdnCourse"  />
    <asp:HiddenField runat="server" ID="hdnUsername"  />

     <div class="page-header">
        <h1>Course Material</h1>
        <p>..........</p>
           <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
         <h2>Courses</h2>
        <p>Select the  Course for the Course Material </p>
   
                 <% if (SessionManager.Role().Equals("professor"))
                { %>
                 <asp:FileUpload runat="server" ID="fileUpload" CssClass="form-control"   />
        <div class="btn-group btn-group-sm pull-right" style="margin-top: +1px " >
                <asp:Button runat="server" Text ="Upload" ID="btnUpload" OnClick="UploadFile" CssClass="btn btn-info" />
            </div>
                 <%} %>
                </div>
   
   
     <div class="well">
             <div class="input-group">
                   <asp:DropDownList runat="server" ID="ddlSubject" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataCourse" DataTextField="Name" DataValueField="CId" ></asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataCourse" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="select *, c.Id as CId from Subjects s JOIN Courses c on s.FkCourseId = c.Id AND s.FkCourseId IN (
select c.Id from Members s  JOIN Courses c on s.FkCourseId = c.Id where c.IsActive  = 1 AND s.Id =@UserId ) ">
                      
      <SelectParameters>
                        <asp:ControlParameter ControlID="hdnUserId" Name="UserId" PropertyName="Value" />
          </SelectParameters>
                   </asp:SqlDataSource>
                   
             </div>
       </div>
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" ErrorMessage="No file selected" EnableClientScript="false"></asp:CustomValidator>
   
           <asp:GridView runat="server" ID="grid" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSourceCourseMaterial" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"  >
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" InsertVisible="False" ReadOnly="True" SortExpression="Title" />
            <asp:BoundField DataField="CreationDate" HeaderText="Created On" InsertVisible="False" ReadOnly="True" SortExpression="CreationDate" />
            <asp:BoundField DataField="professorname" HeaderText="Created By" InsertVisible="False" ReadOnly="True" SortExpression="professorname" />
           
            <asp:TemplateField>
                <ItemTemplate>
                    <a href="../uploads/<%# Eval("Name") %>"  target ="_blank">Download</a>
                     <% if (SessionManager.Role().Equals("professor"))
                { %>
                     <div class="btn-group btn-group-sm">
                        <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger" CommandArgument='<%#Eval("Id")%>' OnCommand="btnDelete_Command"><i class="glyphicon glyphicon-trash"></i>Delete</asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSourceCourseMaterial" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT c.*,m.name AS professorname FROM CourseMaterial  c JOIN Members m on c.CreatedBy=M.Id">
  <SelectParameters>
      <asp:ControlParameter ControlID="ddlSubject" Name="FkCourseId" />
      <asp:ControlParameter ControlID="hdnUserId" Name="UserId" PropertyName="Value" />
      <asp:ControlParameter ControlID="hdnCourse" Name="FkCourse" PropertyName="Value" />
      </SelectParameters>
      </asp:SqlDataSource>
     </asp:Content>
        

             
       
  
    
     
    
 

