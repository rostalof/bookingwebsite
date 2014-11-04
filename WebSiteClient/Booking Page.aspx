<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Booking Page.aspx.cs" Inherits="Booking_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GAA Packages Bookings</title>
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
      <div class="auto-style1">
                
                    <h2>Please Enter Your Details in The Required Fields Below And Click Confirm</h2>
                    <div>
            
            
            <section>
            
                <asp:Label ID="lblgName" runat="server" style="font-weight: 700">Championship Game : </asp:Label>
                <asp:Label ID="lblName" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                
                <asp:Label ID="lblDay" runat="server" style="font-weight: 700">Date : </asp:Label>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<br />

                <asp:Label ID="lblTown" runat="server" style="font-weight: 700">Departure Location : </asp:Label>
                <asp:Label ID="lblDeparture" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />

                <asp:Label ID="lbldepTime" runat="server" style="font-weight: 700">Departure Time :  </asp:Label>
                <asp:Label ID="lblDtime" runat="server"></asp:Label>     
                &nbsp; <br />

                <asp:Label ID="lblcity" runat="server" style="font-weight: 700">Game Location : </asp:Label>
                <asp:Label ID="lblDest" runat="server"></asp:Label>
           
                      
                <br />
                  
                <asp:Label ID="lblarrival" runat="server" style="font-weight: 700">Arrival Time : </asp:Label>
                  
                <asp:Label ID="lblAtime" runat="server"></asp:Label>
                 
                <br />
                 
                <asp:Label ID="lblkickoff" runat="server" style="font-weight: 700">Throw In Time : </asp:Label>
                 
                <asp:Label ID="lblThrow" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lbltQuantity" runat="server" style="font-weight: 700">Number of Tickets : </asp:Label>
                <asp:Label ID="lblQuantity" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lbltotCost" runat="server" style="font-weight: 700">Total Package Cost : </asp:Label>
                <asp:Label ID="lblCurrency" runat="server"></asp:Label>
                <asp:Label ID="lblCost" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;<br />
                <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="Your First Name : "></asp:Label>
                <asp:TextBox ID="tbxFname" runat="server" Width="192px"></asp:TextBox>
                *<br />
                <asp:Label ID="Label2" runat="server" style="font-weight: 700" Text="Your Last Name :"></asp:Label>
                <asp:TextBox ID="tbxLname" runat="server" Width="193px"></asp:TextBox>
                *<br />
                <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text="E-Mail Address     : "></asp:Label>
                <asp:TextBox ID="tbxEaddress" runat="server" Width="200px"></asp:TextBox>
                *<br />
                <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="Credit Card No : "></asp:Label>
                <asp:TextBox ID="tbxCCnumber" runat="server" Width="201px"></asp:TextBox>
                *<br />
                * Required Field<br />
                <asp:Label ID="lblbook" runat="server" style="font-weight: 700"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Confirm Booking" Width ="168px" Height ="30px" OnClick="Button1_Click1"/>
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Start Over" Width ="168px" Height ="30px" OnClick="Button2_Click" />
                </section>
            <br />
           </div>
           </div>     
            <br />
            
            <br />
            <br />
        </div>
    </form>
</body>
</html>
