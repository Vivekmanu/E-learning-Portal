<%@ Import Namespace="eLearningWebPortal.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuestionList.aspx.cs" Inherits="eLearningWebPortal.QuestionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="hdnUserId" />
      <div class="page-header">
        <h1 runat="server" id="h1">Questions</h1>
          <p>Create questions to be used later on in the quiz.</p>
    </div>
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
    </div>

        <div class="btn-group btn-group-sm pull-right" style="margin-top: -60px">
        <a href="Question.aspx" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Create New</a>
    </div>
   
    <asp:GridView runat="server" ID="grid" CssClass="table table-bordered" DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" OnSelectedIndexChanged="grid_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="Question" InsertVisible="False" ReadOnly="True" SortExpression="Title" />
           
            <asp:TemplateField>
                <ItemTemplate>

                    <div class="btn-group btn-group-sm">
                        <a href="/AnswerList.aspx?id=<%#Eval("Id") %>"class="btn btn-default">Answers</a>
                        <a href="/Question.aspx?id=<%#Eval("Id") %>"class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i>Edit</a>
                        <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%=Eval("Id")%>' OnClick="btnDelete_Click" ><i class="glyphicon glyphicon-trash"></i>Delete</asp:LinkButton>
 
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
     <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Questions] AS Q WHERE Q.CreatedBy=@UserId ORDER BY [Title]" DeleteCommand="DELETE FROM Questions where Id = @Id">
         <DeleteParameters>
             <asp:ControlParameter ControlID="grid" Name="Id" PropertyName="Id" />
         </DeleteParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="hdnUserId" Name="UserId" PropertyName="Value" />
         </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
