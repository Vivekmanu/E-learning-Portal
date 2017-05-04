<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuestionSelection.aspx.cs" Inherits="eLearningWebPortal.QuestionSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1>Select Questions For Quiz</h1>
       
    </div>
   
    <asp:GridView runat="server" ID="grid" CssClass="table table-bordered" DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" >
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Question" InsertVisible="False" ReadOnly="True" SortExpression="Title" />
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="btn-group btn-group-sm">
                          <asp:LinkButton runat="server" ID="btnSelection" Text='<%#(Eval("Id").ToString() == "True" ? "Remove" : "Select")%>' CssClass='<%#(Eval("Id").ToString() == "True" ? "btn btn-success" : "btn btn-warning")%>'   CommandArgument='<%#Eval("Id")%>'  OnCommand="btnSelection_Command" ></asp:LinkButton>
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
     <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" SelectCommand="SELECT * FROM [Questions] ORDER BY [Title]" DeleteCommand="DELETE FROM Questions where Id = @Id">
         <DeleteParameters>
             <asp:ControlParameter ControlID="grid" Name="Id" PropertyName="Id" />
         </DeleteParameters>
     </asp:SqlDataSource>
</asp:Content>
