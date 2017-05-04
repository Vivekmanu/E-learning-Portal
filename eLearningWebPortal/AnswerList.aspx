<%@ Import Namespace="eLearningWebPortal.Models" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AnswerList.aspx.cs" Inherits="eLearningWebPortal.AnswerList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="page-header">
        <h1>Answers</h1>
         
    </div>
     <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="QuestionList.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
    <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Always">
        <Triggers>
            <asp:PostBackTrigger ControlID="ddlQuestions" />
        </Triggers>
        <ContentTemplate>
             <div class="well">
             <div class="input-group">
            <strong>Select a question : </strong><asp:DropDownList runat="server" ID="ddlQuestions" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceQuestion" DataTextField="Title" DataValueField="Id" OnSelectedIndexChanged="ddlQuestions_SelectedIndexChanged">

                                                 </asp:DropDownList>
                 </div>
                 </div>
            <asp:GridView runat="server" ID="grid" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:CheckBoxField DataField="IsCorrect" HeaderText="Is Correct" SortExpression="IsCorrect" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
     <asp:SqlDataSource ID="SqlDataSourceQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [Questions]"></asp:SqlDataSource>
     
     <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Answers] ORDER BY [Title]" OnDataBinding="data_bind" OnSelecting="SqlDataSource_Selecting"></asp:SqlDataSource>
</asp:Content>


