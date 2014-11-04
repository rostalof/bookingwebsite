<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyChange.aspx.cs" Inherits="Currency_Rate_Update.CurrencyChange" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="currencystyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .auto-style1 { width: 700px;
            height: 594px; background-color:gray; border-radius:15px; box-shadow: 10px 10px 5px #000000 }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
    <div>
    
        <h1>FOR ADMINISTRATOR USE ONLY</h1>
       <p> <strong>Select The Currency Rate You Wish To Edit Or Delete</strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        FROM <asp:DropDownList ID="ddlFrom" CssClass="ddl" runat="server">
            <asp:ListItem Value="1">$USD</asp:ListItem>
            <asp:ListItem Value="2">£GBP</asp:ListItem>
            <asp:ListItem Value="3">$AUD</asp:ListItem>
            <asp:ListItem Value="4">$CAD</asp:ListItem>
            <asp:ListItem Value="5">€EUR</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TO
        <asp:DropDownList ID="ddlTo" CssClass="ddl" runat="server">
            <asp:ListItem Value="1">$USD</asp:ListItem>
            <asp:ListItem Value="2">£GBP</asp:ListItem>
            <asp:ListItem Value="3">$AUD</asp:ListItem>
            <asp:ListItem Value="4">$CAD</asp:ListItem>
            <asp:ListItem Value="1">€EUR</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        To Update This Exchange Rate, Enter The New Rate In The Textbox Below And Click Update Rate<asp:TextBox ID="txtNewRate" runat="server" Width="120px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update Rate" Width="128px" Height="28px" OnClick="btnUpdate_Click" />
&nbsp;&nbsp;
        <br />
        <br />
        To Delete This Exchange Rate, Click Delete Rate
        <br />
        (<strong>WARNING</strong> : THIS WILL COMPLETELY DELETE THIS RATE FROM THE TABLE
        <br />
        AND MAY CAUSE CONFILICTS WITH OTHER TABLES AND RECORDS).<br />
        <asp:Button ID="btnDelete" runat="server" Text="Delete Rate" Width="128px" Height="28px" OnClick="btnDelete_Click" />
    </p>
        <p> <strong>To Enter A New Exchange Rate Please Enter The Details Below<br />
    &nbsp;&nbsp; </strong>FOR &#39;Currency From&#39; And &#39;Currency To&#39; Please Enter The Currency Symbol Followed By The Internationally&nbsp;&nbsp; Recognised Identifier CODE&nbsp; e.g. &#39;€EUR&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;</strong></p>
        <p> For Rate Please Enter The Numerical Rate in Whole Number or Decimal Form e.g. 1 or 1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </strong>FROM&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbxFrom" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TO&nbsp;
            <asp:TextBox ID="tbxto" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; RATE&nbsp;
            <asp:TextBox ID="tbxrate" runat="server"></asp:TextBox>
    </p>
        <p> 
            <asp:Button ID="btnnewRate" runat="server" OnClick="Button1_Click" Width="128px" Height="28px" Text="Add New Rate" />
    </p>
        <p> 
            <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
    </div>
            </div>
    </form>
</body>
</html>
