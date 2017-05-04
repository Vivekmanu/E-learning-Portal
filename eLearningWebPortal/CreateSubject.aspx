<%@ Import Namespace="eLearningWebPortal.Models" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateSubject.aspx.cs" Inherits="eLearningWebPortal.CreateSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="hdnId" />
    <div class="page-header">
        <h1><strong>Create New Subjects for Courses</strong></h1>
    </div>
      <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Always">
        <Triggers>
            <asp:PostBackTrigger ControlID="ddlCourses" />
        </Triggers>
        <ContentTemplate>
            <strong>Select a program  </strong>
            <asp:DropDownList runat="server" ID="ddlCourses" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
            <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
            <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
            <div class="form">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblName" CssClass="col-sm-2 control-label" Text="Subject Name"></asp:Label>
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtName" ErrorMessage=" Subject name is required." Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnSubmit" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmit_Ccrsublick1" />
                    <a href="SubjecctList.aspx" class="btn btn-default">Cancel</a>
                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

