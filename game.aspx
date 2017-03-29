<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="game.aspx.cs" Inherits="game" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/styles/game.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DataList ID="DataList1" runat="server" DataSourceID="gameDataSource" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
         <!--   id
            gameName:

            game:
            developerID:
            <asp:Label Text='<%# Eval("developerID") %>' runat="server" ID="developerIDLabel" /><br />
            groupId:
            <asp:Label Text='<%# Eval("groupId") %>' runat="server" ID="groupIdLabel" /><br />
            courseId:
            yr:
            <asp:Label Text='<%# Eval("yr") %>' runat="server" ID="yrLabel" /><br />
            description:           
            requirements:    
            video:
            <asp:Label Text='<%# Eval("video") %>' runat="server" ID="videoLabel" /><br />
            firstName:
        
            name:
            
             --->

              <div id="table">
                <tr>
                    
                    <div id="topDiv">
                        <div id="iconDiv"> 
                            <asp:Image src='<%# Eval("icon") %>' runat="server" ID="iconLabel" /> 
                        </div>
                        <div id="titleDiv">
                            <h1 id="gameTitle">
                                <asp:Label Text='<%# Eval("gameName") %>' runat="server" ID="gameNameLabel" />
                            </h1>
                            <h2>
                                by   
                                <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" />
                                <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" />
                                <asp:Label Text='<%# Eval("name") %>' runat="server" ID="groupNameLabel" />

                            </h2>
                            <div>
                                <asp:HiddenField Value='<%# Eval("id") %>' runat="server" ID="hiddenIdLabel" />
                                Course: <asp:Label Text='<%# Eval("course") %>' runat="server" ID="courseIdLabel" /> 
                                
                                <br />
                               Genre(s):
                                <asp:ListView ID="genreDataList2" runat="server" DataSourceID="genreSqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("genre") %>' runat="server" ID="genreLabel" />
                                        <br />
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource runat="server" ID="genreSqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' SelectCommand="SELECT Genres.genre FROM Genres INNER JOIN GameGenres ON Genres.id = GameGenres.genreId WHERE (GameGenres.gameId = @gameid)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hiddenIdLabel" PropertyName="Value" Name="gameid"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </tr>
                <tr>
                    <td>
                        <a class="btn btn-primary"  href='<%# Eval("game") %>' runat="server" ID="gameLabel" >Download</a><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="accordion"> 
                            <ul>
                            <asp:ListView ID="ListView1" runat="server">
                                <ItemTemplate>
                                   <li>
                                      <asp:LinkButton runat="server" href='<%# Eval("Value") %>'> 
                                          <asp:Image ID="PicsNameLbl" runat="server" src='<%# Eval("Value") %>' />
                                    </asp:LinkButton>
                                   </li>
                                </ItemTemplate>
                            </asp:ListView>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2>Description:</h2>
                        <p>
                            <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /><br />
                        </p>
                        <h3>Requirements:</h3>
                        <p>
                           <asp:Label Text='<%# Eval("requirements") %>' runat="server" ID="requirementsLabel" /><br />
                        </p>

                    </td>
                </tr>
            </div>
        </ItemTemplate>
    </asp:DataList>



    <asp:SqlDataSource ID="gameDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' SelectCommand="SELECT Games.id, Games.gameName, Games.game, Games.icon, Games.developerID, Games.groupId, Games.courseId, Games.yr, Games.description, Games.requirements, Games.pics, Games.video, Developers.firstName, Developers.lastName, Developers.id AS Expr1, Groups.name, Courses.course FROM Games INNER JOIN Courses ON Games.courseId = Courses.id LEFT OUTER JOIN Developers ON Games.developerID = Developers.id LEFT OUTER JOIN Groups ON Games.groupId = Groups.id WHERE (Games.id = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" DbType="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>

