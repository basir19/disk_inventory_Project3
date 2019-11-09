<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" 
    Inherits="disk_inventoryBQ._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcom to my Disk Inventory Management System</h1>
        <p class="lead">Listening to your favorite music has never been easier. Just search your favorite music, borrow it and return it once you’re done, easy as that.</p>
        <p><a href="#" class="btn btn-primary btn-lg">Available Disk &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4 bg-primary">
            <h2>New Music</h2>
            <p>
                We update our music list every week. You can find the latest music album in here. 
            </p>
            <p>
                <a class="btn btn-default" href="#">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4 bg-success">
            <h2>Top 10 Song of the week</h2>
            <p>
                Listen to the top the 100 songs of the week. Don’t forget to vote for your best song of the week as well
            </p>
            <p>
                <a class="btn btn-default" href="#">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4 bg-info">
            <h2>My Favorite Music</h2>
            <p>
                Save your favorite songs in your favorite list, we will have a customized disk just for you 
            </p>
            <p>
                <a class="btn btn-default" href="#">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
