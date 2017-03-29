<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminGames.aspx.cs" Inherits="admin_adminView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../styles/admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h2>Games</h2>
     <asp:ListView  ID="ListView1" runat="server" DataSourceID="GameDataSource" DataKeyNames="id" InsertItemPosition="LastItem">

        <EditItemTemplate>
            <tr style="">
                <td>
                   <asp:Button CssClass="btn btn-danger updateBtn" runat="server" CommandName="Update" ToolTip="Update" ID="UpdateButton" />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("icon") %>' runat="server" ID="iconTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("gameName") %>' runat="server" ID="gameNameTextBox" />
                </td>
                 <td>
                    <asp:Label Text='<%# Bind("firstName") %>' runat="server" ID="firstNameTextBox" />
                    <asp:Label Text='<%# Bind("lastName") %>' runat="server" ID="lastNameTextBox" />
                </td>
                 <td>
                    <asp:Label Text='<%# Bind("name") %>' runat="server" ID="groupIdTextBox" />
                 </td>
                <td>
                <asp:DropDownList SelectedValue='<%# Bind("courseId") %>'  CssClass="btn btn-primary"  ID="courseEditDropDownList" runat="server" DataSourceID="courseDataSource" DataTextField="course" DataValueField="id"></asp:DropDownList>
                </td>              
                <td>
                    <asp:TextBox Text='<%# Bind("game") %>' runat="server" ID="gameTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("yr") %>' runat="server" ID="yrTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("requirements") %>' runat="server" ID="requirementsTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("pics") %>' runat="server" ID="picsTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("video") %>' runat="server" ID="videoTextBox" />
                </td>
               
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                   <asp:Button CssClass="btn btn-danger insertBtn" runat="server" CommandName="Insert" ToolTip="Insert" ID="InsertButton" />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("icon") %>' runat="server" ID="iconTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("gameName") %>' runat="server" ID="gameNameTextBox" />
                </td>  
                <td>
                    <asp:Label Text='<%# Bind("firstName") %>' runat="server" ID="firstNameTextBox" />
                    <asp:Label Text='<%# Bind("lastName") %>' runat="server" ID="lastNameTextBox" />
                </td>
               <td>
                    <asp:Label Text='<%# Bind("name") %>' runat="server" ID="groupIdTextBox" />
               </td>
               <td>
                    <asp:DropDownList CssClass="btn btn-primary" ID="courseInsertDropDownList" runat="server" DataSourceID="courseDataSource" DataTextField="course" DataValueField="id"></asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("game") %>' runat="server" ID="gameTextBox" />
                </td>

                <td>
                    <asp:TextBox Text='<%# Bind("yr") %>' runat="server" ID="yrTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("requirements") %>' runat="server" ID="requirementsTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("pics") %>' runat="server" ID="picsTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("video") %>' runat="server" ID="videoTextBox" />
                </td>
                
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                    <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" ToolTip="Edit" ID="EditButton" />

                </td>
                <td>
                    <asp:Image Src='<%# Eval("icon") %>' runat="server" ID="iconLabel" CssClass="miniIcon" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("gameName") %> ' runat="server" ID="gameNameLabel" />
                </td>
                 <td>
                    <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" />

                    <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" />
                </td>
                 <td>
                    <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="groupIdLabel" />
                </td>
                <td>
                  <asp:DropDownList  Enabled="false" SelectedValue='<%# Bind("courseId") %>'  CssClass="disabled btn btn-primary"  ID="courseEditDropDownList" runat="server" DataSourceID="courseDataSource" DataTextField="course" DataValueField="id"></asp:DropDownList>
                </td>                
                <td>
                    <asp:Label Text='<%# Eval("game") %>' runat="server" ID="gameLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("yr") %>' runat="server" ID="yrLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("requirements") %>' runat="server" ID="requirementsLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("pics") %>' runat="server" ID="picsLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("video") %>' runat="server" ID="videoLabel" />
                </td>
               
            </tr>


        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table table-bordered table-inverse" runat="server" id="itemPlaceholderContainer" >
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Icon</th>
                                <th runat="server">Game Name</th>
                                <th runat="server">Dev Name</th>
                                <th runat="server">Group Name</th>
                                <th runat="server">course</th>            
                                <th runat="server">Game Location</th>
                                <th runat="server">Year</th>
                                <th runat="server">Description</th>
                                <th runat="server">Requirements</th>
                                <th runat="server">Pics Location</th>
                                <th runat="server">Video</th>
                                
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" ></td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>


    <asp:SqlDataSource runat="server" ID="courseDataSource" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' SelectCommand="SELECT [id], [course] FROM [Courses]"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="groupDataSource" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' SelectCommand="SELECT [id], [name] FROM [Groups]"></asp:SqlDataSource>


    <asp:SqlDataSource runat="server" ID="GameDataSource" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>'
        SelectCommand="SELECT Games.courseId, Developers.firstName, Developers.lastName, Games.id, Games.gameName, Games.game, Games.icon, Games.yr, Games.description, Games.requirements, Games.pics, Games.video, Games.groupId, Groups.name FROM Games LEFT OUTER JOIN Developers ON Games.developerID = Developers.id LEFT OUTER JOIN Groups ON Groups.id = Games.groupId WHERE (ISNULL(@devId, -1) = -1) OR (Games.developerID = @devId)"
        DeleteCommand="DELETE FROM Games"
        InsertCommand="INSERT INTO Games(gameName, game, icon, yr, description, requirements, pics, video) VALUES (@gameName, @game, @icon, @yr, @description, @requirements, @pics, @video)"
        UpdateCommand="UPDATE Games SET gameName = @gamename, game = @game, icon = @icon, yr = @yr, courseId = @courseid, description = @description, requirements = @requirements, pics = @pics, video = @video where games.id = @id ">
        <InsertParameters>
            <asp:Parameter Name="gameName"></asp:Parameter>
            <asp:Parameter Name="game"></asp:Parameter>
            <asp:Parameter Name="icon"></asp:Parameter>
            <asp:Parameter Name="yr"></asp:Parameter>
            <asp:Parameter Name="description"></asp:Parameter>
            <asp:Parameter Name="requirements"></asp:Parameter>
            <asp:Parameter Name="pics"></asp:Parameter>
            <asp:Parameter Name="video"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="bnxb" Name="devId" DefaultValue="-1"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="gamename"></asp:Parameter>
            <asp:Parameter Name="game"></asp:Parameter>
            <asp:Parameter Name="icon"></asp:Parameter>
            <asp:Parameter Name="yr"></asp:Parameter>
            <asp:Parameter Name="courseid"></asp:Parameter>
            <asp:Parameter Name="description"></asp:Parameter>
            <asp:Parameter Name="requirements"></asp:Parameter>
            <asp:Parameter Name="pics"></asp:Parameter>
            <asp:Parameter Name="video"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

