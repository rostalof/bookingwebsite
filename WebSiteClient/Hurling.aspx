<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hurling.aspx.cs" Inherits="Hurling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GAA Packages Hurling</title>
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
           
<h2>Please Select Your Match Day Trip Below</h2>
            <div class="auto-style1">
                <p>
                <asp:Label ID="Label1" runat="server" Text="Depart From"></asp:Label>
                    <asp:DropDownList ID="ddlDeparture" runat="server" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlDeparture_SelectedIndexChanged">
                    <asp:ListItem Value="1">Ballina</asp:ListItem>
                    <asp:ListItem Value="2">Sligo</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text="Game"></asp:Label>
                    <asp:DropDownList ID="ddlGames" runat="server" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlGames_SelectedIndexChanged">
                        <asp:ListItem Value="1">SHC Quarter Final 1</asp:ListItem>
                    <asp:ListItem Value="2">SHC Quarter Final 2</asp:ListItem>
                    <asp:ListItem Value="3">SHC Quarter Final 3</asp:ListItem>
                    <asp:ListItem Value="4">SHC Quarter Final 4</asp:ListItem>
                    <asp:ListItem Value="5">SHC Semi Final 1</asp:ListItem>
                    <asp:ListItem Value="6">SHC Semi Final 2</asp:ListItem>
                    <asp:ListItem Value="7">SHC All Ireland Final</asp:ListItem>
                </asp:DropDownList>
                    &nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Currency"></asp:Label>
                    <asp:DropDownList ID="ddlCurrencyTo" runat="server" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlCurrencyTo_SelectedIndexChanged" OnLoad="Page_Load">
                    <asp:ListItem Value="1">$USD</asp:ListItem>
                <asp:ListItem Value="2">£GBP</asp:ListItem>
                <asp:ListItem Value="3">$AUD</asp:ListItem>
                <asp:ListItem Value="4">$CAD</asp:ListItem>
                <asp:ListItem Value="5" selected = "true" >€EUR </asp:ListItem>
                </asp:DropDownList>
               
             &nbsp;&nbsp; No. Of Tickets
                <asp:DropDownList ID="ddlquantity" runat="server" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="ddltQuantity_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
               
             </p>
            <div>
            
            
            <section>
            
                &nbsp;<strong><br />
                PACKAGE DETAILS&nbsp; </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                <asp:Label ID="lblgName" runat="server" style="font-weight: 700">Championship Game : </asp:Label>
                <asp:Label ID="lblName" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                
                <asp:Label ID="lblDay" runat="server" style="font-weight: 700">Match Date : </asp:Label>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<br />

                <asp:Label ID="lblTown" runat="server" style="font-weight: 700">Depart From : </asp:Label>
                <asp:Label ID="lblDeparture" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />

                <asp:Label ID="lbldepTime" runat="server" style="font-weight: 700" ToolTip="Departure Time : ">Departure Time : </asp:Label>
                <asp:Label ID="lblDtime" runat="server"></asp:Label>     
                &nbsp; <br />

                <asp:Label ID="lblcity" runat="server" style="font-weight: 700">Location : </asp:Label>
                <asp:Label ID="lblDest" runat="server"></asp:Label>
           
                      
                <br />
                  
                <asp:Label ID="lblarrival" runat="server" style="font-weight: 700">Arrival Time : </asp:Label>
                  
                <asp:Label ID="lblAtime" runat="server"></asp:Label>
                 
                <br />
                 
                <asp:Label ID="lblkickoff" runat="server" style="font-weight: 700">Throw In Time : </asp:Label>
                 
                <asp:Label ID="lblThrow" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblavailability" runat="server" style="font-weight: 700">Tickets Available : </asp:Label>
                <asp:Label ID="lblquantity" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblpersonCost" runat="server" style="font-weight: 700">Price Per Person : </asp:Label>
                <asp:Label ID="lblcurrency" runat="server"></asp:Label>
                <asp:Label ID="lblCost" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="lbltotalCost" runat="server" style="font-weight: 700">Group Total Cost : </asp:Label>
                <asp:Label ID="lblgroupCurrency" runat="server"></asp:Label>
                <asp:Label ID="lblgroupCost" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblbook" runat="server" style="font-weight: 700">Go To The Booking Page - Click Book Now</asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Height="30px" Text="Book Now" Width="338px" OnClick="Button1_Click" />
                <asp:HiddenField ID="hdField" runat="server" />
                </section>
            <br />
           </div>
           </div>
        </div>
    </form>
</body>
</html>