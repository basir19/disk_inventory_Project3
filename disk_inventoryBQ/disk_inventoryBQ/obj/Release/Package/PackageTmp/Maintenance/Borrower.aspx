<%-- 
    Date:               11/22/2019
    Name:               Basir Qurbani
    Project:            SWDV-235 Borrower Page  
    --------------------------------------------------------------------------------------------------------------------------------
    --%>
<%@ Page Title="Borrower" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Borrower.aspx.cs"
    Inherits="disk_inventoryBQ.Borrower" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- *********************************************************** --%>
    <h3>Borrower information</h3>
   <%-- Borrower list table sorted by last name --%>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" CssClass="text-danger" />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="BorrowerID" DataSourceID="lvBorrower" InsertItemPosition="LastItem">
        <%-- Alternating Item Template --%>
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2;color: #284775;">
                <td>
                    <asp:Button class="btn btn-danger" ID="Button5" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                <td>                   
                    <asp:Button class="btn btn-secondary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="BorrowerFirstNameLabel" runat="server" Text='<%# Eval("BorrowerFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerLastNameLabel" runat="server" Text='<%# Eval("BorrowerLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerPhoneNumLabel" runat="server" Text='<%# Eval("BorrowerPhoneNum") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerIDLabel" runat="server" Text='<%# Eval("BorrowerID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <%-- Edite Item Template --%>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66;color: #000080;">
                 <td>
                    <asp:Button class="btn btn-danger" ID="Button4" runat="server" CommandName="Update" Text="Update" ValidationGroup="edit" />                   
                </td>
                <td>                    
                    <asp:Button class="btn btn-secondary" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                </td>
                <td>
                    <asp:TextBox ID="BorrowerFirstNameTextBox" runat="server" Text='<%# Bind("BorrowerFirstName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" Cssclass="text-danger" Display="Dynamic"
                        ControlToValidate="BorrowerFirstNameTextBox"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="BorrowerLastNameTextBox" runat="server" Text='<%# Bind("BorrowerLastName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" Cssclass="text-danger" Display="Dynamic"
                        ControlToValidate="BorrowerLastNameTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="BorrowerPhoneNumTextBox" runat="server" Text='<%# Bind("BorrowerPhoneNum") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" Cssclass="text-danger" Display="Dynamic" 
                        ControlToValidate="BorrowerPhoneNumTextBox" ValidationGroup="edit"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Text="Enter a valid phone number" 
                        ControlToValidate="BorrowerPhoneNumTextBox" Cssclass="text-danger" 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="edit"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Label ID="BorrowerIDLabel1" runat="server" Text='<%# Eval("BorrowerID") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <%-- Empty Template --%>
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
                    <asp:Button class="btn btn-danger" ID="Button3" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert"/>                    
                </td>
                <td>                   
                    <asp:Button class="btn btn-secondary" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="BorrowerFirstNameTextBox" runat="server" Text='<%# Bind("BorrowerFirstName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" Cssclass="text-danger" Display="Dynamic"
                        ControlToValidate="BorrowerFirstNameTextBox"  ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="BorrowerLastNameTextBox" runat="server" Text='<%# Bind("BorrowerLastName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" Cssclass="text-danger" Display="Dynamic"
                        ControlToValidate="BorrowerLastNameTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="BorrowerPhoneNumTextBox" runat="server" Text='<%# Bind("BorrowerPhoneNum") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" Cssclass="text-danger" Display="Dynamic" 
                        ControlToValidate="BorrowerPhoneNumTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Text="Enter a valid phone number" 
                        ControlToValidate="BorrowerPhoneNumTextBox" Cssclass="text-danger" 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="insert"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
        </InsertItemTemplate>
        <%-- Item Template --%>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                 <td>
                    <asp:Button class="btn btn-danger" ID="Button2" runat="server" CommandName="Delete" Text="Delete" />                    
                </td>
                <td>                   
                    <asp:Button class="btn btn-secondary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="BorrowerFirstNameLabel" runat="server" Text='<%# Eval("BorrowerFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerLastNameLabel" runat="server" Text='<%# Eval("BorrowerLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerPhoneNumLabel" runat="server" Text='<%# Eval("BorrowerPhoneNum") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerIDLabel" runat="server" Text='<%# Eval("BorrowerID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <%-- Layout Template --%>
        <LayoutTemplate>
            <table runat="server" class="container">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" class="container" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: black;color: white; height: 50px;">
                                <th runat="server">Delete</th>
                                <th runat="server">Edite</th>
                                <th runat="server">First Name</th>
                                <th runat="server">Last Name</th>
                                <th runat="server">Phone</th>
                                <th runat="server">Borrower ID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: white;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <%-- Insert Item Template --%>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                <td>
                    <asp:Button class="btn btn-danger" ID="Button1" runat="server" CommandName="Delete" Text="Delete" />                   
                </td>
                <td>                   
                    <asp:Button class="btn btn-secondary" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="BorrowerFirstNameLabel" runat="server" Text='<%# Eval("BorrowerFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerLastNameLabel" runat="server" Text='<%# Eval("BorrowerLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerPhoneNumLabel" runat="server" Text='<%# Eval("BorrowerPhoneNum") %>' />
                </td>
                <td>
                    <asp:Label ID="BorrowerIDLabel" runat="server" Text='<%# Eval("BorrowerID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="lvBorrower" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" 
        DeleteCommand="execute sp_delBorrower @BorrowerID" 
        InsertCommand="execute sp_InsBorrower @BorrowerFirstName, @BorrowerLastName, @BorrowerPhoneNum" 
        SelectCommand="SELECT [BorrowerFirstName], [BorrowerLastName], [BorrowerPhoneNum], [BorrowerID] FROM [Borrower] ORDER BY [BorrowerLastName]" 
        UpdateCommand="execute sp_updBorrower @BorrowerID, @BorrowerFirstName, @BorrowerLastName,  @BorrowerPhoneNum">
        <DeleteParameters>
            <asp:Parameter Name="BorrowerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BorrowerFirstName" Type="String" />
            <asp:Parameter Name="BorrowerLastName" Type="String" />
            <asp:Parameter Name="BorrowerPhoneNum" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BorrowerID" Type="Int32" />
            <asp:Parameter Name="BorrowerFirstName" Type="String" />
            <asp:Parameter Name="BorrowerLastName" Type="String" />
            <asp:Parameter Name="BorrowerPhoneNum" Type="String" />            
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
