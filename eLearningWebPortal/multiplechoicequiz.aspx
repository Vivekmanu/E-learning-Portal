﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="multiplechoicequiz.aspx.cs" Inherits="eLearningWebPortal.multiplechoicequiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
     <p class="question">1. What is the answer to this question?</p>
<div class="answers">
<input type="radio" name="q1" value="a" id="q1a"><label for="q1a">Answer 1</label><br/>
<input type="radio" name="q1" value="b" id="q1b"><label for="q1b">Answer 2</label><br/>
<input type="radio" name="q1" value="c" id="q1c"><label for="q1c">Answer 3</label><br/>
<input type="radio" name="q1" value="d" id="q1d"><label for="q1d">Answer 4</label><br/>
</div>
      
</asp:Content>
