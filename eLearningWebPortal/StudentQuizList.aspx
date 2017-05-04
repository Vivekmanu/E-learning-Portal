<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentQuizList.aspx.cs" Inherits="eLearningWebPortal.StudentQuizList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="TakeQuizId" />
    <asp:HiddenField runat="server" ID="MemberId" />
     <div class="page-header">
        <h1><strong>Quiz</strong></h1>
      </div>
   
      <div class="btn-group btn-group-sm pull-right" style="margin-top: -100px " >
        <a href="Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
     </div>
        <%--<div class="btn-group btn-group-sm pull-right" style="margin-top: -60px" >
            <asp:Button runat="server" ID="pending" Text="Unattempated" OnClick="pending_Click" />
            <asp:Button runat="server" ID="started" Text="Unattempated" OnClick="pending_Click" />
            <asp:Button runat="server" ID="completed" Text="Attempted" OnClick="pending_Click" />
    </div>--%>
    

    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" OnRowDataBound="grid_RowDataBound" DataKeyNames="Id" DataSourceID="SqlDataSourceQuiz"  CssClass="table table-bordered"  AllowPaging="True" AllowSorting="True" BackColor="White"  BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
        <Columns>
            
             <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
             <asp:BoundField DataField="To" HeaderText="To" SortExpression="To" />
            <asp:BoundField DataField="From" HeaderText="From" SortExpression="From" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="btn-group btn-group-sm">
                        
                      <asp:LinkButton  runat="server" ID="lbTakeQuiz"  CommandArgument='<%#Eval("Id")%>' CommandName='<%#Eval("AId") %>' CssClass="btn btn-primary" OnCommand="lbTakeQuiz_Command1"> Take Quiz</asp:LinkButton>
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

     <asp:SqlDataSource ID="SqlDataSourceQuiz" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM (SELECT q.Id, q.[From], q.[To], q.Title, isnull(s.Status, 'pending') as [Status], c.FkMemberId, isnull(s.StudentQuizId, 0) as AId 
FROM Quiz q join QuizCandidates c on q.Id = c.FkQuizId
left outer join StudentQuiz s on q.Id = s.FkQuizId where q.IsActive= 1) TBL where FkMemberId = @UserId">
         <SelectParameters>
             <asp:ControlParameter ControlID="MemberId" Name="UserId" />
         </SelectParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataTest" runat="server"></asp:SqlDataSource>

</asp:Content>
