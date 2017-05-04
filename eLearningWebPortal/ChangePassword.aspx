<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="eLearningWebPortal.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h1><strong>Change Your Password</strong></h1>
    </div>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
      
    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
    <asp:Label runat="server" ID="LblMsg" CssClass="alert alert-danger" Visible="false"></asp:Label>
     <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
    <div class=" form">
        <div class=" form-group">
          
            <asp:Label runat="server" ID="lblCurrentPassword" Text="Current Password" CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox runat="server" ID="txtCurrentPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvCurrentPassword" ControlToValidate="txtCurrentPassword" ErrorMessage=" Enter your Current Password " Display="None"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <asp:Label runat="server" ID="lblNewPassword" Text="New Password" CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox runat="server" ID="txtNewPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvNewPassword" ControlToValidate="txtNewPassword" ErrorMessage=" Enter your new password" Display="None"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">

            <asp:Label runat="server" ID="lblCPassword" Text="Confirm Password" CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox runat="server" ID="txtCPassswd" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvCPassswd" ControlToValidate="txtCPassswd" ErrorMessage="Confirmation of Password is Required!" Display="None"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToCompare="txtNewPassword" ControlToValidate="txtCPassswd"
                ErrorMessage="New Password doesn't match"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
            <a href="Default.aspx" class="btn btn-default">Cancel</a>
        </div>
    </div>

</asp:Content>
