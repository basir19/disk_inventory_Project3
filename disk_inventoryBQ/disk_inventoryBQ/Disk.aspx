<%@ Page Title="Disk" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Disk.aspx.cs"
    Inherits="disk_inventoryBQ.Disk" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Welcom to my Disk Inventory Management System</h1>
    </div>
    <%-- dropdown list for dist type --%>
    <div class="form-group">
         <label class="col-sm-3 control-label">Disk Type</label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ddlDiskType" DataTextField="TypeDescription" DataValueField="TypeID"></asp:DropDownList>
    <asp:SqlDataSource ID="ddlDiskType" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" SelectCommand="SELECT [TypeID], [TypeDescription] FROM [DiskType]"></asp:SqlDataSource>
        </div>
<%-- Dropdown List for disk Genre --%>
    <div class="form-group">
         <label class="col-sm-3 control-label">Disk Genre</label>
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="ddlDiskGenre" DataTextField="GenreDesciption" DataValueField="GenreID"></asp:DropDownList>
    <asp:SqlDataSource ID="ddlDiskGenre" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" SelectCommand="SELECT [GenreID], [GenreDesciption] FROM [Genre]"></asp:SqlDataSource>
    </div>
        <%-- Dropdown List for Disk Status --%>
    <div class="form-group">
         <label class="col-sm-3 control-label">Disk Status</label>
    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="ddlDiskStatus" DataTextField="StatusDescription" DataValueField="StatusID"></asp:DropDownList>
    <asp:SqlDataSource ID="ddlDiskStatus" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" SelectCommand="SELECT [StatusID], [StatusDescription] FROM [DiskStatus]"></asp:SqlDataSource>
   </div>
        <%-- List of Disk sorted by disk name --%>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="DiskID" DataSourceID="lvDisk" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskNameLabel" runat="server" Text='<%# Eval("DiskName") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskReleaseDateLabel" runat="server" Text='<%# Eval("DiskReleaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeIDLabel" runat="server" Text='<%# Eval("TypeID") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusIDLabel" runat="server" Text='<%# Eval("StatusID") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66;color: #000080;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel1" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiskNameTextBox" runat="server" Text='<%# Bind("DiskName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiskReleaseDateTextBox" runat="server" Text='<%# Bind("DiskReleaseDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("TypeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="StatusIDTextBox" runat="server" Text='<%# Bind("StatusID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <%-- Insert Item Template --%>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />                  
                </td>
                <td>                    
                    <asp:Button ID="Button4" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="DiskNameTextBox" runat="server" Text='<%# Bind("DiskName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiskReleaseDateTextBox" runat="server" Text='<%# Bind("DiskReleaseDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("TypeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="StatusIDTextBox" runat="server" Text='<%# Bind("StatusID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <%-- Item Template --%>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                <td>                    
                    <asp:Button ID="Button3" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskNameLabel" runat="server" Text='<%# Eval("DiskName") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskReleaseDateLabel" runat="server" Text='<%# Eval("DiskReleaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeIDLabel" runat="server" Text='<%# Eval("TypeID") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusIDLabel" runat="server" Text='<%# Eval("StatusID") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <%-- Layout Template --%>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                <th runat="server">Delete</th>
                                <th runat="server">Edite</th>
                                <th runat="server">DiskID</th>
                                <th runat="server">DiskName</th>
                                <th runat="server">DiskReleaseDate</th>
                                <th runat="server">TypeID</th>
                                <th runat="server">StatusID</th>
                                <th runat="server">GenreID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <%-- Select Item Template --%>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                 <td>                    
                    <asp:Button ID="Button2" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskNameLabel" runat="server" Text='<%# Eval("DiskName") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskReleaseDateLabel" runat="server" Text='<%# Eval("DiskReleaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeIDLabel" runat="server" Text='<%# Eval("TypeID") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusIDLabel" runat="server" Text='<%# Eval("StatusID") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="lvDisk" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" 
        DeleteCommand="sp_delDisk @DiskID" 
        InsertCommand="sp_InsDisk @DiskName, @DiskReleaseDate, @TypeID, @StatusID, @GenreID)" 
        SelectCommand="SELECT [DiskID], [DiskName], [DiskReleaseDate], [TypeID], [StatusID], [GenreID] FROM [CD_DVD] WHERE (([TypeID] = @TypeID) AND ([GenreID] = @GenreID) AND ([StatusID] = @StatusID)) ORDER BY [DiskName]" 
        UpdateCommand="sp_updDisk @DiskID, @DiskName, [@DiskReleaseDate, @TypeID, @StatusID, @GenreID">
        <DeleteParameters>
            <asp:Parameter Name="DiskID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DiskName" Type="String" />
            <asp:Parameter DbType="Date" Name="DiskReleaseDate" />
            <asp:Parameter Name="TypeID" Type="Int32" />
            <asp:Parameter Name="StatusID" Type="Int32" />
            <asp:Parameter Name="GenreID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="TypeID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList2" Name="GenreID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList3" Name="StatusID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DiskID" Type="Int32" />
            <asp:Parameter Name="DiskName" Type="String" />
            <asp:Parameter DbType="Date" Name="DiskReleaseDate" />
            <asp:Parameter Name="TypeID" Type="Int32" />
            <asp:Parameter Name="StatusID" Type="Int32" />
            <asp:Parameter Name="GenreID" Type="Int32" />            
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
