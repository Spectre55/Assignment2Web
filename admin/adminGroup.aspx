<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminGroup.aspx.cs" Inherits="admin_adminGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Groups</h2>
    <asp:ListView ID="groupListView1" runat="server" DataSourceID="groupSqlDataSource1" DataKeyNames="id" InsertItemPosition="LastItem">
        <EditItemTemplate>
            <tr style="">
                 <td>
                    <asp:Button CssClass="btn btn-danger updateBtn" runat="server" CommandName="Update" ToolTip="Update" ID="UpdateButton" />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("icon") %>' runat="server" ID="iconTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" /></td>
                <td>
                    <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /></td>
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
                    <asp:TextBox Text='<%# Bind("icon") %>' runat="server" ID="iconTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" /></td>
                <td>&nbsp;</td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
               <td>
                   <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                    <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" ToolTip="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label CssClass="icon" Text='<%# Eval("icon") %>' runat="server" ID="iconLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("name") %>' runat="server" ID="nameLabel" /></td>
                <td>
  <!--memeber---->   <asp:HiddenField Value='<%# Eval("id") %>' runat="server" ID="hiddenidLabel" />
                    <asp:ListView ID="memberListView1" runat="server" DataSourceID="memberSqlDataSource1">
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No one's here :/</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                   <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                                </td>
                                <td>
                                    <asp:Image CssClass="miniIcon" Src='<%# Eval("pic") %>' runat="server" ID="picLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table class="table-condensed" runat="server" id="itemPlaceholderContainer" style="" border="0">
                                          
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="memberSqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' DeleteCommand="DELETE FROM DeveloperGroups WHERE (developerId = @devid) AND (groupId = @groupId)" SelectCommand="SELECT Developers.pic, Developers.firstName, Developers.lastName FROM DeveloperGroups INNER JOIN Developers ON DeveloperGroups.groupId = @groupId AND Developers.id = DeveloperGroups.developerId
order by Developers.lastName, Developers.firstName">
                        <DeleteParameters>
                            <asp:Parameter Name="devid"></asp:Parameter>
                            <asp:Parameter Name="groupId"></asp:Parameter>
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hiddenidLabel" PropertyName="Value" Name="groupId"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
 <!--//memeber--->               </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table table-bordered table-inverse" runat="server" id="itemPlaceholderContainer" style="" border="0">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Icon</th>
                                <th runat="server">Name</th>
                                <th runat="server">Memebers</th>
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
    <asp:SqlDataSource runat="server" ID="groupSqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' DeleteCommand="DELETE FROM Groups WHERE (id = @id)" InsertCommand="INSERT INTO Groups(icon, name) VALUES (@icon, @name)" SelectCommand="SELECT icon, name, id FROM Groups order by name" UpdateCommand="UPDATE Groups SET icon = @icon, name = @icon">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="icon"></asp:Parameter>
            <asp:Parameter Name="name"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="icon"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

