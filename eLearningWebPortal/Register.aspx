<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="eLearningWebPortal.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h1><strong>Registration now</strong></h1>
        <small>Personal info </small>
    </div>
   
        <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="List" CssClass="alert alert-danger" />
        <asp:CustomValidator runat="server" ID="customValidation" Display="None" EnableClientScript="false"></asp:CustomValidator>
          <div class="form">
        <div class="form-group">
                 <asp:Label runat="server" ID="lblName" CssClass="col-sm-2 control-label" Text=" Name"></asp:Label>
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtName" ErrorMessage="Name is required." Display="None"></asp:RequiredFieldValidator>
                </div>
              <div class="form-group">
         <asp:Label runat="server" ID="lblMN" Text="Mobile Number" CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox runat="server" ID="txtMN" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvMN" ControlToValidate="txtMN" ErrorMessage="Mobile number is required." Display="None"></asp:RequiredFieldValidator>
        </div>
                  <div class="form-group">
           <asp:Label runat="server" ID="lblDOB" Text="Date of Birth" CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvDOB" ControlToValidate="txtDOB" ErrorMessage="Date of birth is required" Display="None"></asp:RequiredFieldValidator>
        </div>
        <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="ddlProgram" />
        </Triggers>
        <ContentTemplate>
              <div class="form-group">
                <asp:Label runat="server" ID="lblProgram" Text="Program" CssClass="col-sm-2 control-label"></asp:Label>
  
        
        <asp:DropDownList runat="server" ID="ddlProgram" CssClass="form-control" DataSourceID="SqlDataSourceProgram" DataTextField="Name" AutoPostBack="true" DataValueField="Id" >
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceProgram" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>"  SelectCommand="SELECT [Id], [Name] FROM [Program] WHERE ([IsActive] = @IsActive)">
             <SelectParameters>
           
                <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
               </SelectParameters>

        </asp:SqlDataSource>
        <asp:RequiredFieldValidator runat="server" ID="rfvProgram" ControlToValidate="ddlProgram" ErrorMessage="Program is required." Display="None"></asp:RequiredFieldValidator>
    </div>
              <div class="form-group">
   
             <asp:Label runat="server" ID="lblCourse" Text="Course" CssClass="col-sm-2 control-label"></asp:Label> 

        <asp:DropDownList runat="server" ID="ddlCourse" Cssclass="form-control" DataSourceID="SqlDataSourceCourse" DataTextField="Name" DataValueField="Id" >
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>"  SelectCommand="SELECT * FROM [Courses] WHERE (FkProgramId = @FkProgramId  AND  [IsActive] = 1)">
       <SelectParameters>
                <asp:ControlParameter ControlID="ddlProgram" Name="FkProgramId" />
               </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:RequiredFieldValidator runat="server" ID="rfvcourse" ControlToValidate="ddlCourse" ErrorMessage="Course is required." Display="None"></asp:RequiredFieldValidator>
  </div>
             </ContentTemplate>
    </asp:UpdatePanel>

   <div class="form-group">
                <asp:Label runat="server" ID="lblEmail" Text="Email" CssClass="col-sm-2 control-label"></asp:Label>
    
        
        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail" ErrorMessage="Email is required" Display="None"></asp:RequiredFieldValidator>
    </div>
                <div class="form-group">
                <asp:Label runat="server" ID="lblPassword" Text="Password" CssClass="col-sm-2 control-label"></asp:Label>
  
        
        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control " TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword" ErrorMessage="Password is required" Display="None"></asp:RequiredFieldValidator>
    </div>
                <div class="form-group">
                <asp:Label runat="server" ID="lblCPassword" Text="Confirm Password" CssClass="col-sm-2 control-label"></asp:Label>
  
        
        <asp:TextBox runat="server" ID="txtCPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvCPassword" ControlToValidate="txtCPassword" ErrorMessage="Password confirmation is required." Display="None"></asp:RequiredFieldValidator>
        <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Password do not match" Operator="Equal"></asp:CompareValidator>
    </div>
    <div class="form-group">

            <asp:Button runat="server" ID="btnSubmit" Text="Register" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        <a href="Default.aspx" class="btn btn-default">Cancel</a>
        </div>
    </div>
   
</asp:Content>


