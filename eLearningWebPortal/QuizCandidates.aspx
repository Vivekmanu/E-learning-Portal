<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizCandidates.aspx.cs" Inherits="eLearningWebPortal.QuizCandidates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
             <asp:HiddenField runat="server" ID="hdnId"  />
        <h1>Select Students for Quiz</h1>
    </div>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="QuizList.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
      
            <div class="form-group">
                <div class="panel panel-default">
                    <div class="panel-heading">Select Students</div>
                    <div class="panel-body">
                        <asp:CheckBoxList runat="server" ID="chkStudents" DataSourceID="SqlDataCandidates" DataTextField="Name" DataValueField="Id" OnDataBinding="chkStudents_DataBinding" Height="20px" OnDataBound="chkStudents_DataBound"></asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataCandidates" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Members] WHERE ([RoleName] = 'student' )" OnSelected="SqlDataCandidates_Selected">
                            
                        </asp:SqlDataSource>
                    </div>
                    </div>
                </div>
            
            <div class="form-group">
                <asp:Button runat="server" ID="btnSave" Text="SAVE" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
                <a href="QuizList.aspx" class="btn btn-default">Cancel</a>
            </div>
</asp:Content>
