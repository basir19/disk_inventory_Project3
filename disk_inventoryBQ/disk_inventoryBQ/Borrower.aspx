<%@ Page Title="Borrower" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Borrower.aspx.cs"
    Inherits="disk_inventoryBQ.Borrower" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- *********************************************************** --%>
    <h3>Borrower information</h3>
    <div class="form-group row">
        <label class="col-sm-3 control-label">First Name</label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                ControlToValidate="txtFirstName" Text="*" CssClass="text-danger" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 control-label">Last Name</label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                ControlToValidate="txtLastName" Text="*" CssClass="text-danger" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 control-label">Telephone number</label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"
                CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                ControlToValidate="txtPhone" Text="*" CssClass="text-danger" Display="Dynamic">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                ControlToValidate="txtPhone" Text="Use this format: 999-999-9999"
                Display="Dynamic" CssClass="text-danger"
                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
            </asp:RegularExpressionValidator>
        </div>
    </div>
    <%-- Submit and Clear buttons --%>
    <div class="form-group row">
        <div class="col-sm-offset-3 col-sm-9">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </div>

    <%-- message label --%>
    <div class="form-group row">
        <div class="col-sm-offset-1 col-sm-11">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
        </div>
    </div>
</asp:Content>
