<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="eLearningWebPortal.Question" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row form">
        <div class="col-md-12">
            <asp:Label runat="server" ID="lblQuestion" Text="Question"></asp:Label>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtQuestion" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <asp:RadioButton runat="server" ID="radioAnsOne" GroupName="answer" /> <span>Answer </span>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerOne" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <asp:RadioButton runat="server" ID="radioAnsTwo" GroupName="answer" /> <span>Answer </span>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerTwo" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <asp:RadioButton runat="server" ID="radioAnsThree" GroupName="answer" /> <span>Answer </span>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerThree" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <asp:RadioButton runat="server" ID="radioAnsFour" GroupName="answer" /> <span>Answer </span>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerFour" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-12">
            <asp:Button runat="server" ID="btnSaveQuestion" CssClass="btn btn-primary" Text="Save Question" />
        </div>
    </div>
</asp:Content>
