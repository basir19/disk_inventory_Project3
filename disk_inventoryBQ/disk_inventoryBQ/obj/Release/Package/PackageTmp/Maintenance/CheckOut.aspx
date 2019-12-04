<%-- 
    Date:               12/04/2019
    Name:               Basir Qurbani
    Project:            SWDV-235 Artist Page  
    --------------------------------------------------------------------------------------------------------------------------------
    --%>
<%-- Connects to the master page and maintenance folder--%>
<%@ Page Title="CheckOut" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs"
    Inherits="disk_inventoryBQ.Maintenance.CheckOut" %>

<%-- take the header and footer style and links from the master page --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">  
    <%-- the general welcome message --%>
    <div class="jumbotron">
        <h1>Welcom to my Disk Inventory Management System</h1>
    </div>
    <%-- contains all elements for the disk chechout page --%>
    <div class="container">
        <h1>Checkout a Disk
        </h1>

        <h4>Select a Disk
        </h4>
        <%-- selects data from CD_DVD table only with available ID --%>
        <p>
            <asp:DropDownList class="col-md-3" ID="ddlDisk" runat="server" DataSourceID="SqlDataSource1" DataTextField="DiskName" 
                DataValueField="DiskID" OnDataBound="ddlDisk_DataBound">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlDisk"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" 
                SelectCommand="SELECT [DiskName], [DiskID] FROM [CD_DVD] WHERE ([StatusID] = @StatusID)">
                
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="StatusID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>

        <h4>Select A borrower
        </h4>
        <%-- select data from Borrower sorted by last name --%>
        <p>
            <asp:DropDownList class="col-md-3" ID="ddlBorrower" runat="server" DataSourceID="SqlDataSource2" DataTextField="BorrowerLastName" DataValueField="BorrowerID" OnDataBound="ddlBorrower_DataBound"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlBorrower"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryBQConnectionString %>" SelectCommand="SELECT [BorrowerID], [BorrowerLastName], [BorrowerFirstName] FROM [Borrower] ORDER BY [BorrowerLastName]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>

        <h4>Select a checkout Date</h4>
        <%-- date selector --%>
        <p>
            <asp:TextBox class="col-md-3" ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDate" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Select a valid date" 
                ControlToValidate="txtDate" Operator="LessThanEqual" Type="Date" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <%-- checks out the disk and assign it to selected borrower in the selected date --%>
        <p>
            <asp:Button class="btn btn-primary" ID="Button1" runat="server" OnClick="Button1_Click" Text="Checkout" />
        
        </p>
        <p>
            &nbsp;
        </p>
        <%-- display a message when a disk checked out by the selected borrower
             display an error message if the disk chechout was not successfull--%>
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
    </div>   
</asp:Content>

