<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentQuiz.aspx.cs" Inherits="eLearningWebPortal.StudentQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="StudentQuizId" />

      <div class="btn-group btn-group-sm pull-right" style="margin-bottom: -50px " >
        <a href="StudentQuizList.aspx" class="btn btn-default"><i class="glyphicon glyphicon-arrow-left"></i><strong> Back</strong></a>
     </div >
    <asp:GridView runat="server" ShowHeader="false" ID="grid"
         CssClass="table" DataSourceID="SqlDataQuizQuestion" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SQId"
         OnPageIndexChanging="grid_PageIndexChanging" OnRowDataBound="grid_RowDataBound" PageSize="1" >
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <strong>Question: </strong><p><asp:Literal runat="server" Text='<%#Eval("Title") %>'></asp:Literal></p>
                    Marks: <span class="badge"><asp:Literal runat="server" Text='<%#Eval("Marks") %>'></asp:Literal></span>
                    <asp:GridView CssClass="table" runat="server" ID="childGrid" DataSourceID="SqlDataQuizQuestionAnswer" AutoGenerateColumns="false" ShowHeader="false">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdnSQId" Value='<%#Eval("SQId") %>' />
                                    <asp:HiddenField runat="server" ID="hdnAId" Value='<%#Eval("Id") %>' />
                                    <asp:RadioButton GroupName="answers" runat="server" ID="chk" Checked='<%#Eval("IsSelected") %>'  />
                                    <asp:Label runat="server" ID="lblAnswer" Text='<%#Eval("Title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         
                    </asp:GridView>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings Mode="NextPrevious" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataQuizQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT sq.FkQuizId, sq.FkStudentId, sq.Status, s.SQId, q.Title, q.Marks, q.Id, sq.StudentQuizId From StudentQuiz sq join [StudentQuizQuestions] s on sq.StudentQuizId = s.FkStudentQuizId left outer join Questions q on s.QId = q.Id WHERE sq.StudentQuizId = @Id" >
        <SelectParameters>
             <asp:ControlParameter ControlID="StudentQuizId" Name="Id"  />
         </SelectParameters>
     </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataQuizQuestionAnswer" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT s.*, a.Id, a.Title, a.FkQuestionId, cast(CASE when AId = Id Then 1 Else 0 End as bit) as IsSelected
From [StudentQuizQuestions] s
join Answers a on s.QId = a.FkQuestionId" >
     </asp:SqlDataSource>
    <div class="btn-group btn-group-sm pull-right" style="margin-bottom: -50px " >
        <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    <script type="text/javascript">
        $(function () {
            //on radio button selection, Unselect all other radio butttons.
            $('input[type=radio]').on("change", function () {
                $('input[type=radio]').not(this).prop("checked", false);
            });
        });
    </script>
</asp:Content>
