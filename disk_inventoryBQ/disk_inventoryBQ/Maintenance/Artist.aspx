<%-- 
    Date:               11/22/2019
    Name:               Basir Qurbani
    Project:            SWDV-235 Artist Page  
    --------------------------------------------------------------------------------------------------------------------------------
    --%>

<%@ Page Title="Artist" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Artist.aspx.cs"
    Inherits="disk_inventoryBQ.Artist" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Welcom to my Disk Inventory Management System</h1>
    </div>
    <%-- Dropdwon list for artis type --%>
    <div class="form-group">
        <label class="col-sm-3 control-label">Select the Artist Type</label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ddlArtist" DataTextField="ArtistDesciption" DataValueField="ArtistTypeID"></asp:DropDownList>
        <asp:SqlDataSource ID="ddlArtist" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" SelectCommand="SELECT [ArtistTypeID], [ArtistDesciption] FROM [ArtistType]"></asp:SqlDataSource>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* Means that the field is required, Please check the field and try again" CssClass="text-danger" />
    <%-- list view for list of artist sorted by last name --%>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ArtistID" DataSourceID="lvArtist" InsertItemPosition="LastItem">
        <%-- Alternating Item template --%>
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2; color: #284775;">
                <td>
                    <asp:Button ID="Button5" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistFirstNameLabel" runat="server" Text='<%# Eval("ArtistFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistLastNameLabel" runat="server" Text='<%# Eval("ArtistLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistTypeIDLabel" runat="server" Text='<%# Eval("ArtistDesciption") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <%-- Edit Item template --%>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66; color: #000080;">
                <td>
                    <asp:Button ID="Button4" runat="server" CommandName="Update" Text="Update" ValidationGroup="edit" />
                </td>
                <td>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel1" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ArtistFirstNameTextBox" runat="server" Text='<%# Bind("ArtistFirstName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" CssClass="text-danger"
                        ControlToValidate="ArtistFirstNameTextBox" Display="Dynamic" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="ArtistLastNameTextBox" runat="server" Text='<%# Bind("ArtistLastName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ArtistTypeIDTextBox" runat="server" Text='<%# Bind("ArtistTypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" CssClass="text-danger"
                        ControlToValidate="ArtistTypeIDTextBox" Display="Dynamic" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <%-- Empty Item template --%>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <%-- Intert Item Template --%>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="Button3" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert"/>
                </td>
                <td>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="ArtistFirstNameTextBox" runat="server" Text='<%# Bind("ArtistFirstName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" CssClass="text-danger"
                        ControlToValidate="ArtistFirstNameTextBox" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="ArtistLastNameTextBox" runat="server" Text='<%# Bind("ArtistLastName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ArtistTypeIDTextBox" runat="server" Text='<%# Bind("ArtistTypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" CssClass="text-danger"
                        ControlToValidate="ArtistTypeIDTextBox" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <%-- Item Template --%>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6; color: #333333;">
                <td>
                    <asp:Button ID="Button2" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistFirstNameLabel" runat="server" Text='<%# Eval("ArtistFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistLastNameLabel" runat="server" Text='<%# Eval("ArtistLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistTypeIDLabel" runat="server" Text='<%# Eval("ArtistDesciption") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <%-- Layout Template --%>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                <th runat="server">Delete</th>
                                <th runat="server">Edit</th>
                                <th runat="server">ArtistID</th>
                                <th runat="server">ArtistFirstName</th>
                                <th runat="server">ArtistLastName</th>
                                <th runat="server">ArtistTypeID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
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
            <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                <td>
                    <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistFirstNameLabel" runat="server" Text='<%# Eval("ArtistFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistLastNameLabel" runat="server" Text='<%# Eval("ArtistLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="ArtistTypeIDLabel" runat="server" Text='<%# Eval("[ArtistType].ArtistDesciption") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <%-- sql data source and sp execution commands--%>
    <asp:SqlDataSource ID="lvArtist" runat="server"
        ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>"
        DeleteCommand="execute sp_delArtist @ArtistID"
        InsertCommand="execute sp_InsArtist @ArtistFirstName, @ArtistTypeID, @ArtistLastName"
        SelectCommand="SELECT [ArtistID], [ArtistFirstName], [ArtistLastName], [ArtistType].ArtistDesciption , Artist.ArtistTypeID
                FROM [Artist] 
                join ArtistType on artist.ArtistTypeID = ArtistType.ArtistTypeID
                WHERE (ArtistType.[ArtistTypeID] = @ArtistTypeID) 
                ORDER BY [ArtistLastName]"
        UpdateCommand="execute sp_updArtist @ArtistID, @ArtistFirstName,  @ArtistTypeID,  @ArtistLastName">
        <DeleteParameters>
            <asp:Parameter Name="ArtistID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ArtistFirstName" Type="String" />
            <asp:Parameter Name="ArtistTypeID" Type="Int32" />
            <asp:Parameter Name="ArtistLastName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ArtistTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ArtistID" Type="Int32" />
            <asp:Parameter Name="ArtistFirstName" Type="String" />
            <asp:Parameter Name="ArtistTypeID" Type="Int32" />
            <asp:Parameter Name="ArtistLastName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
