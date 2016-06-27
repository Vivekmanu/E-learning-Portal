<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="eLearningWebPortal.Quiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="hero" class="jumbotron">
       <h1><strong>QUIZ</strong></h1>
        <div class="row">
         <p class="lead">
         Enter the subject name.
        </p>
        <div class="form-group">
                <label for="name_of_subject">Subject:</label>
                <input type="text" class="form-control" id="name_of_subject" placeholder=" cse">
              </div>
            </div>
        <div class="row">
         <p class="lead">
         Enter the Quiz Number:
        </p>
        <div class="form-group">
                <label for="quiz_no">Quiz no.:</label>
                <input type="text" class="form-control" id="quiz_no" placeholder=" cse">
              </div>
            </div>
          <div class="row">
        <p class="lead">
         Select the number of questions in the quiz.
        </p>
        <div class="control-group">
         <label for="no_question" class="control-label">Number of Question:</label>
             <div class="controls">
                 <div class="col-md-4">
          <select name="no_question" id="no_question" class="form-control">
      <option value="">Question</option>
      <option value="">---</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option>
      <option value="25">25</option>
      <option value="26">26</option>
      <option value="27">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>
      <option value="31">31</option>
      <option value="32">32</option>
      <option value="33">33</option>
      <option value="34">34</option>
      <option value="35">35</option>
      <option value="36">36</option>
      <option value="37">37</option>
      <option value="38">38</option>
      <option value="39">39</option>
      <option value="40">40</option>
      <option value="41">41</option>
      <option value="42">42</option>
      <option value="43">43</option>
      <option value="44">44</option>
      <option value="45">45</option>
      <option value="46">46</option>
      <option value="47">47</option>
      <option value="48">48</option>
      <option value="49">49</option>
      <option value="50">50</option>
    
    </select>
                     </div>
                 </div>
            </div>
              </div>
          <div class="row">
              <p class="lead">
         Select the quiz type.
        </p>
        
        <div class="control-group">
         <label for="type" class="control-label">QUIZ TYPE:</label>
             <div class="controls">
                 <div class="col-md-4">
          <select name="type" id="type" class="form-control">
      <option value="">Type</option>
      <option value="">---</option>
      <option value="01">Multiple Choice</option>
      <option value="02">Subjective</option>
              </select>
                     </div>
                 </div>
              </div>
              </div>

        <div class="row">
                   <p class="lead">
         Enter the last date of quiz submission:
        </p>
                  
               <div class="form-group">
                <label for="dateofsubmission">Last date of submission :</label>
                <input type="text" class="form-control" id="dateofsubmission" placeholder=" cse">
              </div>
            </div>
       
        <p>
        <a href="  Question" class="btn btn-lg btn-primary">Create </a>

        </p>
      </div>

  
</asp:Content>
 