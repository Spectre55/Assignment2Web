<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminDev.aspx.cs" Inherits="adminDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Developers</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' SelectCommand="SELECT Developers.* FROM Developers" UpdateCommand="UPDATE Developers SET firstName = @firstName, lastName = @lastName, pic = @pic WHERE (id = @id)" DeleteCommand="DELETE FROM Developers WHERE (id = @id)" InsertCommand="INSERT INTO Developers(pic, firstName, lastName) VALUES (@pic, @firstName, @lastName)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pic"></asp:Parameter>
            <asp:Parameter Name="firstName"></asp:Parameter>
            <asp:Parameter Name="lastName"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName"></asp:Parameter>
            <asp:Parameter Name="lastName"></asp:Parameter>
            <asp:Parameter Name="pic"></asp:Parameter>

            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id" InsertItemPosition="LastItem" ConvertEmptyStringToNull="true">
       
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button CssClass="btn btn-danger updateBtn" runat="server" CommandName="Update" ToolTip="Update" ID="UpdateButton"   />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Bind("pic") %>' ID="picHiddenField" runat="server"  />
                    <asp:FileUpload  CssClass="btn btn-danger upload" BackColor="White" ForeColor="Black" ID="FileUpload1" runat="server" />
                    <asp:Button  CssClass="btn btn-danger upload" runat="server" id="UploadButton" CommandName="Upload" text="Upload"  />
                    <br/>
                    <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("firstName") %>' runat="server" ID="firstNameTextBox" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("lastName") %>' runat="server" ID="lastNameTextBox" />
                </td>  
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No Developers were found.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button CssClass="btn btn-danger insertBtn" runat="server" CommandName="Insert" ToolTip="Insert" ID="InsertButton" OnClick="EditButton_Click" />
                    <asp:Button CssClass="btn btn-danger cancelBtn" runat="server" CommandName="Cancel" ToolTip="Clear" ID="CancelButton" />
                </td>
                 <td>
                     <asp:HiddenField ID="picHiddenField" runat="server" Value='<%# Bind("pic") %>' />
                    <asp:FileUpload CssClass="btn btn-danger upload" BackColor="White" ForeColor="Black" ID="FileUpload1" runat="server"  />
                    <asp:Button  CssClass="btn btn-danger upload" runat="server" id="UploadButton" CommandName="Insert" text="Upload" onclick="EditButton_Click" />
                    <br/>
                    <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("firstName") %>' runat="server" ID="firstNameTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("lastName") %>' runat="server" ID="lastNameTextBox" /></td>
       
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" ToolTip="Delete" ID="DeleteButton" />
                    <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" ToolTip="Edit" ID="EditButton" />
                </td>
                 <td>
                    <asp:Image CssClass="icon" src='<%# Eval("pic") %>' runat="server" ID="picLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" />
                </td>
                 <td>
                     <asp:HiddenField ID="devIdField" Value='<%# Eval("id") %>' runat="server" />
                     <asp:SqlDataSource ID="gamesDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' SelectCommand="SELECT [gameName], [id], [icon] FROM [Games] WHERE ([developerID] = @developerID) ORDER BY [gameName], [id]" DeleteCommand="DELETE FROM Games WHERE (id = @ID)">
                         <DeleteParameters>
                             <asp:Parameter Name="ID"></asp:Parameter>
                         </DeleteParameters>
                         <SelectParameters>
                             <asp:ControlParameter ControlID="devIdField" PropertyName="Value" Name="developerID" Type="Decimal"></asp:ControlParameter>
                         </SelectParameters>
                     </asp:SqlDataSource>
    <!---- games data ----------->
                     <asp:ListView ID="ListView2" runat="server" DataSourceID="gamesDataSource" DataKeyNames="id">
                        
                         <EmptyDataTemplate>
                             <table runat="server" style="">
                                 <tr>
                                     <td>This dev hasn't been very productive :/</td>
                                 </tr>
                             </table>
                         </EmptyDataTemplate>
                       
                         <ItemTemplate>
                             <tr style="">
                                 <td>
                                     <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete this game" ToolTip="Delete" ID="DeleteButton" />
                                 </td>
                                 <td>
                                     <asp:Image CssClass="miniIcon" src='<%# Eval("icon") %>' runat="server" ID="iconLabel" /></td>
                                 <td>
                                     <asp:Label Text='<%# Eval("gameName") %>' runat="server" ID="gameNameLabel" />
                                 
                                     <asp:HiddenField Value='<%# Eval("id") %>' runat="server" ID="idLabel" />
                                 </td>
                                 
                             </tr>
                         </ItemTemplate>
                         <LayoutTemplate>
                             <table runat="server">
                                 <tr runat="server">
                                     <td runat="server">
                                         <table class="table-condensed " runat="server" id="itemPlaceholderContainer" style="" border="0">
                                         
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
    <!---- game data end -->
                </td> 
                <td>
                   <a href='adminView.aspx?bnxb=<%# Eval("id") %>'>Add Game</a>
                </td>
                <td>
  <!----group data------------------>
                      <asp:ListView ID="GroupListView2" runat="server" DataSourceID="groupDataSource">
                        
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>This Dev doesn't play well with others :/</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                      
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" Text="" ID="DeleteButton" />
                                </td>
                                <td>
                                    <asp:Image CssClass="miniIcon" src='<%# Eval("icon") %>' runat="server" ID="iconLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("name") %>' runat="server" ID="nameLabel" /></td>
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
                    <asp:SqlDataSource runat="server" ID="groupDataSource" ConnectionString='<%$ ConnectionStrings:dbGameConnectionString %>' DeleteCommand="DELETE FROM DeveloperGroups FROM DeveloperGroups INNER JOIN Groups ON Groups.id = DeveloperGroups.groupId WHERE (DeveloperGroups.developerId = @devid)" SelectCommand="SELECT Groups.icon, Groups.name FROM Groups INNER JOIN DeveloperGroups ON Groups.id = DeveloperGroups.groupId WHERE (DeveloperGroups.developerId = @devid)">
                        <DeleteParameters>
                            <asp:Parameter Name="devid"></asp:Parameter>
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="devIdField" PropertyName="Value" Name="devid"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
<!-- ///group end-------------------------------------------->
          <!-------      <td>
                     <a href='adminGroup.aspx?bnxb=<%# Eval("id") %>'>Add to Group</a>
                </td>
   --->
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
                                <th runat="server">First Name</th>
                                <th runat="server">Last Name</th>
                                <th runat="server">Games</th>
                                <th runat="server">Add Game</th>
                                <th runat="server">Groups</th>



     
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
        <SelectedItemTemplate>
            <tr style="background-color:blueviolet">
                <td>
                    <asp:Button CssClass="btn btn-danger delBtn" runat="server" CommandName="Delete" Text="" ID="DeleteButton" />
                    <asp:Button CssClass="btn btn-danger editBtn" runat="server" CommandName="Edit" Text="" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("pic") %>' runat="server" ID="picLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /></td>
                
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>