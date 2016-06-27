<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eLearningWebPortal.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1>Login</h1>
    </div>
    <div class="form form-horizontal">
        <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label" aria-label="Left Align">Email / User Name </label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"  TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" ErrorMessage="Please enter email address" Display="None"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label" aria-label="Left Align">
                Password
            </label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="txtPwd" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqPwd" ControlToValidate="txtPwd" ErrorMessage="Please enter password" Display="None"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">
                        Remember me
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button runat="server" ID="btnSubmit" Text="Sign in" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
       
</asp:Content>
