<%-- 
    Date:               11/22/2019
    Name:               Basir Qurbani
    Project:            SWDV-235 CD_DVD Page  
    --------------------------------------------------------------------------------------------------------------------------------
    --%>

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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  HeaderText="* means that the field is required" CssClass="text-danger" />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="DiskID" DataSourceID="lvDisk" InsertItemPosition="LastItem">
        <%-- Alternating Item Template --%>
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2;color: #284775;">
                <td>
                    <asp:Button class="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                <td>                   
                    <asp:Button class="btn btn-secondary" ID="Button6" runat="server" CommandName="Edit" Text="Edit" />
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
        <%-- Edit Item Template --%>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66;color: #000080;">
                <td>
                    <asp:Button class="btn btn-danger" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />                   
                </td>
                <td>                    
                    <asp:Button class="btn btn-secondary" ID="Button5" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel1" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiskNameTextBox" runat="server" Text='<%# Bind("DiskName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DiskNameTextBox" Text="*" CssClass="text-danger" Display="Dynamic" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="DiskReleaseDateTextBox" runat="server" Text='<%# Bind("DiskReleaseDate") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="DiskReleaseDateTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>

                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Date you entered is not Valid" CssClass="text-danger" Display="Dynamic"
                        type="Date" MaximumValue="12/31/9999 " MinimumValue="01/01/0001" ControlToValidate="DiskReleaseDateTextBox" ValidationGroup="edit" ></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("TypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="TypeIDTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="StatusIDTextBox" runat="server" Text='<%# Bind("StatusID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="StatusIDTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" CssClass="text-danger" Display="Dynamic"  
                        ControlToValidate="GenreIDTextBox" ValidationGroup="edit" ></asp:RequiredFieldValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <%-- Empty Data Template --%>
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
                    <asp:Button class="btn btn-danger" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" />                  
                </td>
                <td>                    
                    <asp:Button class="btn btn-secondary" ID="Button4" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="DiskNameTextBox" runat="server" Text='<%# Bind("DiskName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DiskNameTextBox" Text="*" CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="DiskReleaseDateTextBox" runat="server" Text='<%# Bind("DiskReleaseDate") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="DiskReleaseDateTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Date you entered is not Valid" CssClass="text-danger" Display="Dynamic"
                        type="Date" MaximumValue="12/31/9999" MinimumValue="01/01/0001" ControlToValidate="DiskReleaseDateTextBox" ValidationGroup="insert" ></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("TypeID") %>' />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="TypeIDTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="StatusIDTextBox" runat="server" Text='<%# Bind("StatusID") %>' />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="StatusIDTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" CssClass="text-danger" Display="Dynamic"  
                        ControlToValidate="GenreIDTextBox" ValidationGroup="insert" ></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <%-- Item Template --%>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                <td>
                    <asp:Button class="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                <td>                    
                    <asp:Button class="btn btn-secondary" ID="Button3" runat="server" CommandName="Edit" Text="Edit" />
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
            <table runat="server" class="container">
                <tr runat="server">
                    <td runat="server">
                        <table class="container" id="itemPlaceholderContainer" runat="server" border="1" style=" background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: black;color: white; height:50px;">
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
                    <td runat="server" style="text-align: center;background-color: white;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields >
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary" />
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
                    <asp:Button class="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                 <td>                    
                    <asp:Button class="btn btn-secondary" ID="Button2" runat="server" CommandName="Edit" Text="Edit" />
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
        DeleteCommand="execute sp_delDisk @DiskID" 
        InsertCommand="execute sp_InsDisk @DiskName, @DiskReleaseDate, @TypeID, @StatusID, @GenreID" 
        SelectCommand="SELECT [DiskID], [DiskName], convert(varchar(10),[DiskReleaseDate], 120) as DiskReleaseDate, [TypeID], [StatusID], [GenreID] FROM [CD_DVD] WHERE (([TypeID] = @TypeID) AND ([GenreID] = @GenreID) AND ([StatusID] = @StatusID)) ORDER BY [DiskName]" 
        UpdateCommand="execute sp_updDisk @DiskID, @DiskName, @DiskReleaseDate, @TypeID, @StatusID, @GenreID">
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
