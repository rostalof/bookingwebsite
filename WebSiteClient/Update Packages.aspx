<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update Packages.aspx.cs" Inherits="Update_Packages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Packages</title>
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
           
<h1>For Administrator Use Only</h1>
            <div class="auto-style1">
               
            <div>
            
            
            
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>To Upate A Current Record In The&nbsp;Games Table, Enter The Details In The Fields Below </strong>&nbsp;&nbsp;
                &nbsp;&nbsp;<p><strong>Enter the GameID of the record you wish to UPDATE here </strong><asp:TextBox ID="tbxGameID" runat="server"></asp:TextBox>
&nbsp;&nbsp; 
                <br />
                </p>
                <p>&nbsp;</p>
                <p>Enter the new data for this record in the text boxes below<br />
                
                Name Of Game <asp:TextBox ID="tbxGameName" runat="server" ></asp:TextBox>
&nbsp;&nbsp;Game Type <asp:TextBox ID="tbxGameType" runat="server"></asp:TextBox>
&nbsp;&nbsp;<br />
                Game Location <asp:TextBox ID="tbxLocation" runat="server" ></asp:TextBox>
                &nbsp; Game Date <asp:TextBox ID="tbxDate" runat="server" ></asp:TextBox>
&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Throw-In Time <asp:TextBox ID="tbxTtime" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" Width="150px" OnClick="btnUpdate_Click" />
            
            
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
               <asp:Label ID="lblError" runat="server"></asp:Label></p>
                <p>&nbsp;</p>
                <p><strong>Enter the GameID of the record you wish to DELETE here </strong><asp:TextBox ID="tbxGameID1" runat="server"></asp:TextBox>
&nbsp;&nbsp; 
                </p>
                <p><strong>WARNING: THIS WILL COMPLETELY DELETE THIS RECORD FROM THE TABLE</strong>
                <br />
                &nbsp;
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="150px" Height="26px" OnClick="btnDelete_Click" /></p>
                <p>
                    <asp:Label ID="lblError2" runat="server"></asp:Label>
                </p>
           </div>
           </div>
        </div>
    </form>
</body>
    </html>