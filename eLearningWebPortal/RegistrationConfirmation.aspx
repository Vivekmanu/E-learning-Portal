<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationConfirmation.aspx.cs" Inherits="eLearningWebPortal.RegistrationConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Congratulations! </h1>
        <div class="alert alert-success">You have registered successfully.</div>
        <p> Click the following link to login.</p>
        <p><a class="btn btn-primary btn-lg" href="Login" role="button">Sign In</a></p>
    </div>
</asp:Content>
