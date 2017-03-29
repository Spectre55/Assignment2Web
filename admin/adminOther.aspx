<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminOther.aspx.cs" Inherits="admin_adminOther" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="cDiv">
        <h2>Courses</h2>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="courseSqlDataSource1" DataKeyNames="id" InsertItemPosition="LastItem">
            <EditItemTemplate>
                <tr style="">
                    <td>
                    <asp:Button CssClass="btn btn-danger updateBtn" runat="server" CommandName="Update" ToolTip="Update" ID="UpdateButton" />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Cancel" ID="CancelButton" />
                </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("course") %>' runat="server" ID="courseTextBox" /></td>
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
                        <asp:TextBox Text='<%# Bind("course") %>' runat="server" ID="courseTextBox" /></td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                   <td>
                        <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                        <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" ToolTip="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("course") %>' runat="server" ID="courseLabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table class="table table-bordered table-inverse"  runat="server" id="itemPlaceholderContainer" style="" border="0">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">course</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager runat="server" ID="DataPager1">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    <asp:NumericPagerField></asp:NumericPagerField>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="courseSqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' DeleteCommand="DELETE FROM Courses WHERE (id = @id)" InsertCommand="INSERT INTO Courses(course) VALUES (@course)" SelectCommand="SELECT [course], [id] FROM [Courses] ORDER BY [course]" UpdateCommand="UPDATE Courses SET course = @course WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="course"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="course"></asp:Parameter>
                <asp:Parameter Name="id"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div id="gDiv">
        <h2>Genre</h2>
        <asp:ListView ID="ListView2" runat="server" DataSourceID="genreSqlDataSource1" DataKeyNames="id" InsertItemPosition="LastItem">
           
            <EditItemTemplate>
                <tr style="">
                    <td>
                    <asp:Button CssClass="btn btn-danger updateBtn" runat="server" CommandName="Update" ToolTip="Update" ID="UpdateButton" />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Cancel" ID="CancelButton" />
                </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("genre") %>' runat="server" ID="genreTextBox" /></td>
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
                        <asp:TextBox Text='<%# Bind("genre") %>' runat="server" ID="genreTextBox" /></td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                        <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" ToolTip="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("genre") %>' runat="server" ID="genreLabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table class="table table-bordered table-inverse" runat="server" id="itemPlaceholderContainer" style="" border="0">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">Genre</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager runat="server" ID="DataPager2">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    <asp:NumericPagerField></asp:NumericPagerField>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="genreSqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' DeleteCommand="DELETE FROM Genres WHERE (id = @id)" InsertCommand="INSERT INTO Genres(genre) VALUES (@genre)" SelectCommand="SELECT [genre], [id] FROM [Genres] ORDER BY [genre]" UpdateCommand="UPDATE Genres SET genre = @genre where id = @id">
            <DeleteParameters>
                <asp:Parameter Name="id"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="genre"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="genre"></asp:Parameter>
                <asp:Parameter Name="id"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div id="pDiv">
        <h2>Platform</h2>
        <asp:ListView ID="ListView3" runat="server" DataSourceID="platformSqlDataSource1" DataKeyNames="id" InsertItemPosition="LastItem">
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button CssClass="btn btn-danger updateBtn" runat="server" CommandName="Update" ToolTip="Update" ID="UpdateButton" />
                        <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Cancel" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("platform") %>' runat="server" ID="platformTextBox" /></td>
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
                        <asp:TextBox Text='<%# Bind("platform") %>' runat="server" ID="platformTextBox" /></td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                        <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" ToolTip="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("platform") %>' runat="server" ID="platformLabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table class="table table-bordered table-inverse" runat="server" id="itemPlaceholderContainer" style="" border="0">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">platform</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager runat="server" ID="DataPager3">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    <asp:NumericPagerField></asp:NumericPagerField>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="platformSqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' DeleteCommand="DELETE FROM Platforms WHERE (id = @id)" InsertCommand="INSERT INTO Platforms(platform) VALUES (@platform)" SelectCommand="SELECT platform, id FROM Platforms ORDER BY platform" UpdateCommand="UPDATE Platforms SET platform = @platform where id = @id">
            <DeleteParameters>
                <asp:Parameter Name="id"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="platform"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="platform"></asp:Parameter>
                <asp:Parameter Name="id"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

