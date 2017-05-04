<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="eLearningWebPortal.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
    <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>

    <asp:HiddenField runat="server" ID="hdnId" />

    <div class="form">
    <div class="form-group">
        <asp:Label runat="server" ID="lblQuestion" Text="Question"></asp:Label>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtQuestion" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvQuestion" ControlToValidate="txtQuestion" ErrorMessage="Question is requred." Display="None"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:Label runat="server" ID="Label1" Text="Marks"></asp:Label>
        <asp:TextBox runat="server" TextMode="Number" ID="txtMarks" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvMarks" ControlToValidate="txtMarks" ErrorMessage="Marks are required." Display="None"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:RadioButton runat="server" ID="radioAnsOne" GroupName="answer" />
        <span>Answer </span>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerOne" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvanswer1" ControlToValidate="txtAnswerOne" ErrorMessage="Answer is required." Display="None"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <asp:RadioButton runat="server" ID="radioAnsTwo" GroupName="answer" />
        <span>Answer </span>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerTwo" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvanswer2" ControlToValidate="txtAnswerTwo" ErrorMessage="Answer is required." Display="None"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <asp:RadioButton runat="server" ID="radioAnsThree" GroupName="answer" />
        <span>Answer </span>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerThree" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvanswer3" ControlToValidate="txtAnswerThree" ErrorMessage="Answer is required." Display="None"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <asp:RadioButton runat="server" ID="radioAnsFour" GroupName="answer" />
        <span>Answer </span>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAnswerFour" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvanswer4" ControlToValidate="txtAnswerFour" ErrorMessage="Answer is required." Display="None"></asp:RequiredFieldValidator>
    </div>


    <div class="form-group">
        <asp:Button runat="server" ID="btnSaveQuestion" CssClass="btn btn-primary" Text="Save Question" OnClick="btnSubmit_Click" />
        <a href="QuestionList.aspx" class="btn btn-default">Cancel</a>
    </div>
    </div>

</asp:Content>
