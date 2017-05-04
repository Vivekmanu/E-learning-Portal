<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizList.aspx.cs" Inherits="eLearningWebPortal.QuizList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
   <div class="page-header">
        <h1>Quiz</h1>
        <p>Create Quiz for Students</p>
    </div>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -60px">
        <a href="QuizPage.aspx" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Create New</a>
    </div>
   
    <asp:GridView runat="server" ID="grid" CssClass="table table-bordered" DataSourceID="SqlDataSourceQuiz" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
             <asp:BoundField DataField="From" HeaderText="StartDate" InsertVisible="False" ReadOnly="True" SortExpression="From" />
             <asp:BoundField DataField="To" HeaderText="EndDate" InsertVisible="False" ReadOnly="True" SortExpression="To" />
         
             <asp:TemplateField>
                <ItemTemplate>
                       <div class="btn-group btn-group-sm">
                        <asp:LinkButton runat="server" ID="btnactive" Text='<%#(Eval("IsActive").ToString() == "True" ? "Inactive" : "Active")%>' CssClass='<%#(Eval("IsActive").ToString() == "True" ? "btn btn-success" : "btn btn-warning")%>' CommandArgument='<%#Eval("Id")%>' OnCommand="btnactive_Command" ></asp:LinkButton>
                   
                    <div class="btn-group btn-group-sm">
                        <a href="/Quizquestions.aspx?id=<%#Eval("Id") %>" class="btn btn-default">Questions</a>
                        <a href="/QuizCandidates.aspx?id=<%#Eval("Id") %>" class="btn btn-default">Students</a>
                        <a href="/QuizPage.aspx?id=<%#Eval("Id") %>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i>Edit</a>
                        <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%=Eval("Id")%>' OnClick="btnDelete_Click" ><i class="glyphicon glyphicon-trash"></i>Delete</asp:LinkButton>
                     
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
          
           
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

         <asp:SqlDataSource ID="SqlDataSourceQuiz" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Quiz]"  DeleteCommand="DELETE FROM Quiz where Id = @Id">

         <DeleteParameters>
             <asp:ControlParameter ControlID="grid" Name="Id" PropertyName="Id" />
         </DeleteParameters>

     </asp:SqlDataSource>
   </asp:Content>