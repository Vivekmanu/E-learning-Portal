<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizQuestions.aspx.cs" Inherits="eLearningWebPortal.QuizQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <asp:HiddenField runat="server" ID="hdnQuizId" />
    <div class="page-header">
        <h1 runat="server" id="h1">Quiz Questions</h1>
    </div>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="QuizList.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
             <strong>Select a Quiz : </strong>
     <div class="well">
             <div class="input-group">
                   <asp:DropDownList runat="server" ID="ddlQuiz" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataTest" DataTextField="Title" DataValueField="Id" ></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataTest" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Quiz]"></asp:SqlDataSource>
             </div>
       </div>
           <asp:GridView runat="server" ID="grid" CssClass="table table-bordered" DataSourceID="SqlDataQuizQuestion" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" >
               
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" InsertVisible="False" />
            
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
           
            <asp:SqlDataSource ID="SqlDataQuizQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT Q.*, C.Title as Title FROM QuizQuestions as Q LEFT OUTER JOIN Questions AS C ON  Q.FkQuestionId = C.Id WHERE Q.FkQuizId=@QuizId ">
 
           <SelectParameters>
      
      <asp:ControlParameter ControlID="ddlQuiz" Name="QuizId"  />
               
      </SelectParameters>
                </asp:SqlDataSource>
      
</asp:Content>


