<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizPage.aspx.cs" Inherits="eLearningWebPortal.QuizPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:HiddenField runat="server" ID="hdnId"  />
     <div class="page-header">
        <h1><strong>QUIZ</strong></h1>
    </div>
  
      
            <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
      <div class="form">
            <div class="form-group">
                <label for="quiz_topic">Enter the Quiz Title:</label>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" TextMode="SingleLine" Height="38px" Width="1191px" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rfvTitle" ControlToValidate="txtTitle" ErrorMessage=" Quiz Title is required." Display="None"></asp:RequiredFieldValidator>
            </div>
            </div>
    <div class="form">
            <div class="form-group">
                <label for="quiz_SDate">Enter the Starting Date:</label>
                <asp:TextBox runat="server" ID="txtStart" CssClass="form-control" TextMode="Date" Height="38px" Width="1191px" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtStart" ErrorMessage=" Quiz Start Date is required." Display="None"></asp:RequiredFieldValidator>
            </div>
            </div>
      <div class="form">
            <div class="form-group">
                <label for="quiz_EDate">Enter the End Date:</label>
                <asp:TextBox runat="server" ID="txtEnd" CssClass="form-control" TextMode="Date" Height="38px" Width="1191px" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtEnd" ErrorMessage=" Quiz End Date is required." Display="None"></asp:RequiredFieldValidator>
            </div>
            </div>
            
            <div class="form-group">
                <div class="panel panel-default">
                    <div class="panel-heading">Select questions</div>
                    <div class="panel-body">
                        <asp:CheckBoxList runat="server" ID="chkQuestions"  DataSourceID="SqlDataSourceQuestions" DataTextField="Title" DataValueField="Id" ></asp:CheckBoxList>
                    </div>
                    </div>
                </div>
            
            <div class="form-group">
                <asp:Button runat="server" ID="btnCreate" Text="Create Quiz" CssClass="btn btn-primary"  OnClick="btnCreate_Click"/>
                <a href="QuizList.aspx" class="btn btn-default">Cancel</a>
            </div>
      
    <asp:SqlDataSource ID="SqlDataSourceQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Questions]"></asp:SqlDataSource>
 
</asp:Content>
