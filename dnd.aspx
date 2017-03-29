<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dnd.aspx.cs" Inherits="dnd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="/styles/dnd.css" />
    <script src="/Scripts/dnd.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <div class="dropBox"> 
                    <img id="gameIcon" src=" "/> 
                </div>
            </td>
            <td>
                <div>
                   <div class="dropBox"> 

                       <h2>Name</h2>
                   </div>
                   <div class="dropBox"> <h4>by</h4></div>
                   <div>
                       <div class="dropBox"> class</div>
                       <br/>
                       <div class="dropBox"> semester </div>
                       <div class="dropBox"> genres </div>
                   </div>
                </div>
            </td>
        </tr>
        <tr>
            <td> <div class="dropBox"> </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="dropBox" id="slideshow"> 
                    image Slideshow
                    <span class="glyphicon glyphicon-cloud-upload cloud"></span>
				Drop files here or click to <span id="browse">browse</span>.  
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h2>Description:</h2>
                <div class="dropBox" id="desc">

                </div>

                <h3>Requirements:</h3>
                <div class="dropBox" id="req">
                    
                </div>
            </td>
        </tr>
    </table>
    <input id="fileBox" type="file"/> 
   <asp:FileUpload ID="fileUpload" runat="server" />
</asp:Content>

