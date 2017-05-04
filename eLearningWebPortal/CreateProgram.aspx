<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateProgram.aspx.cs" Inherits="eLearningWebPortal.CreateProgram" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="hdnId" />
    <div class="page-header">
        <h1><strong>Create New Programs</strong></h1>
    </div>
    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
    <div class="form">
        <div class="form-group">
            <asp:Label runat="server" ID="lblName" CssClass="col-sm-2 control-label" Text="Program Name"></asp:Label>
            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtName" ErrorMessage=" Program name is required." Display="None"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button runat="server" ID="btnSubmit" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmit_Click1" />
            <a href="ProgramList.aspx" class="btn btn-default">Cancel</a>
        </div>
    </div>
</asp:Content>
