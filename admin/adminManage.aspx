<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminManage.aspx.cs" Inherits="admin_adminS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Options:</h1>

    <a href="./adminDev.aspx"><h2>Add and View Developers</h2> </a>  
  <!--  <a  href="editUsers.aspx" class="btn btn-primary ">Edit developers</a>
 -->    
    <a href="./adminGames.aspx"><h2>Add and View Games</h2></a>

    <a href="./adminGroup.aspx"><h2>Add and View Groups</h2></a>

    <a href="./adminOther.aspx"><h2>Add and View Courses, Genres, and Platforms</h2></a>



</asp:Content>

