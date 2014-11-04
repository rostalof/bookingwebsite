<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exchange.aspx.cs" Inherits="Exchange" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exchange Rates</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .auto-style1 { width: 759px;
            height: 594px;
        }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <br />
        <div class="auto-style1">
            <div id="navbar"> 
  <ul> 
	<li><a href="Client.aspx">Home</a></li> 
	<li><a href="Football.aspx">Football</a></li> 
	<li><a href="Hurling.aspx">Hurling</a></li> 
	<li><a href="Exchange.aspx">Exchange Rates</a></li>
	</ul>
</div>
             <h2>
                Please Select The Currencies You Wish To Convert From and To

           
                </h2>
            <p>
                From
                <asp:DropDownList ID="ddlCurrencyFrom2" runat="server" CssClass="ddl">
                <asp:ListItem Value="1">$USD</asp:ListItem>
                <asp:ListItem Value="2">£GBP</asp:ListItem>
                <asp:ListItem Value="3">$AUD</asp:ListItem>
                <asp:ListItem Value="4">$CAD</asp:ListItem>
                <asp:ListItem Value="5">€EUR</asp:ListItem>
            </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;To
            <asp:DropDownList ID="ddlCurrencyTo2" runat="server" CssClass="ddl">
                <asp:ListItem Value="1">$USD</asp:ListItem>
                <asp:ListItem Value="2">£GBP</asp:ListItem>
                <asp:ListItem Value="3">$AUD</asp:ListItem>
                <asp:ListItem Value="4">$CAD</asp:ListItem>
                <asp:ListItem Value="5">€EUR</asp:ListItem>
            </asp:DropDownList>

            
       </p>
            <p>
                &nbsp;</p>
            <h2>
                Please Enter The Amount Of Currency You Wish To Convert&nbsp;</h2>
            <p>
                &nbsp;<asp:TextBox ID="txtInput" runat="server" Height="22px" Width="99px" style="margin-right: 7px"></asp:TextBox>

            
       </p>
            <p>
                &nbsp;</p>
            <p>

            
            <asp:Button ID="btnGetRate" runat="server" Height="30px" OnClick="btnGetRate_Click" Text="Get Rate" Width="112px" />
            <br />
            <br />
                           
            <asp:Label ID="lbl1" runat="server"></asp:Label>
            <asp:Label ID="lblFrom2" runat="server"></asp:Label>
            <asp:Label ID="lbl2" runat="server"></asp:Label>
            <asp:Label ID="lblTo2" runat="server"></asp:Label>
            <asp:Label ID="lbl3" runat="server"></asp:Label>
            <asp:Label ID="lblRate" runat="server"></asp:Label>
            <br />
            <br />
                <asp:Label ID="lblEx" runat="server"></asp:Label>
                <asp:Label ID="lblEx1" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lblEx2" runat="server"></asp:Label>
                <span>&nbsp;<asp:Label ID="lblEx3" runat="server"></asp:Label>
                <asp:Label ID="lblCurrency" runat="server"></asp:Label>
                </span>

            
       </p>
    
    
    </div>
    </form>
</body>
</html>
