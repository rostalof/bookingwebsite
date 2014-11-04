<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Table Backup Page.aspx.cs" Inherits="Table_Backup_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Table Backup</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .auto-style1 { width: 759px;
            height: 594px; }
        
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
            <h1>FOR ADMINISTRATOR USE ONLY</h1><br />
            <h2>&nbsp;Backup The Ticket Details Table Here</h2><br />
            <p>
            &nbsp;<asp:Button ID="Button1" runat="server" Height="30px" OnClick="Button1_Click" Text="Backup Table" Width="167px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Height="30px" OnClick="Button2_Click" Text="Delete Old Backup" Width="167px" />
             </p>
        </div>
    </form>
</body>
</html>