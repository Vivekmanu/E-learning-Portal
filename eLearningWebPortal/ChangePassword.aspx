<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="eLearningWebPortal.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1><strong>Change Your Password</strong></h1>
    </div>
    <div class="form horizontal">
        <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
        <div class=" form-group">
            <label for="currentpasswd">Current Password</label>
            <asp:TextBox runat="server" ID="txtcurrentpasswd" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="cupasswd" ControlToValidate="txtcurrentpasswd" ErrorMessage="Please enter your current password " Display="None"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="Newpassswd">New Password</label>
            <asp:TextBox runat="server" ID="txtNewpasswd" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="nwpasswrd" ControlToValidate="txtNewpasswd" ErrorMessage="Please enter your new password" Display="None"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">

            <label for="confrmpassswd">Confirm Password</label>
            <asp:TextBox runat="server" ID="txtconfrmpassswd" CssClass="form-control" TextMode="Password"></asp:TextBox>

            <asp:RequiredFieldValidator runat="server" ID="conpasswrd" ControlToValidate="txtconfrmpassswd" ErrorMessage="Please confirm your password " Display="None"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">

            <asp:Button runat="server" ID="btnsave" Text="Save Settings" CssClass="btn btn-primary" OnClick="btnsave_Click"/>
        </div>
        <div class="col-md-3">
            <asp:Button runat="server" ID="btncancel" Text="Cancel Settings" CssClass="btn btn-primary" OnClick="Page_Load"/>

        </div>
    </div>
</asp:Content>
