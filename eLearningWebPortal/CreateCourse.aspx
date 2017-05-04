<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateCourse.aspx.cs" Inherits="eLearningWebPortal.CreateCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <asp:HiddenField runat="server" ID="hdnId"  />
    <div class="page-header">
        <h1><strong>Create New Courses for Programs</strong></h1>
    </div>
        
<asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Always">
        <Triggers>
            <asp:PostBackTrigger ControlID="ddlPrograms" />
        </Triggers>
        <ContentTemplate>
            <strong>Select a program  </strong>
            <asp:DropDownList runat="server" ID="ddlPrograms" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id" ></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Program]"></asp:SqlDataSource>
  
    </div>
    <div class="form form-horizontal">
        <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
        <div class="form">
        <div class="form-group">
                 <asp:Label runat="server" ID="lblName" CssClass="col-sm-2 control-label" Text="Course Name"></asp:Label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtName" ErrorMessage=" Course name is required." Display="None"></asp:RequiredFieldValidator>
                </div>
        <div class="form-group">
        
            <asp:Button runat="server" ID="btnSubmit" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmit_Click1" />
            <a href="CourseList.aspx" class="btn btn-default">Cancel</a>
        </div>
    </div>
             
         
            
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
