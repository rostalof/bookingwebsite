using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Globalization;
using ExchangeService;


public partial class Football : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //check for cookie to select currency
            if (Request.Cookies["currencySelected"] != null)
            {
                ddlCurrencyTo.SelectedValue = Request.Cookies["currencySelected"].Value;          
            }
            //set default currency
            else
                ddlCurrencyTo.SelectedValue = "5";
                
        }
        // declare location and name of game strings        
        string departureLocation = ddlDeparture.SelectedItem.Text;
        string gameName = ddlGames.SelectedItem.Text;

        //connection string
        string cString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

        //sqlConnection object
        SqlConnection connObj = new SqlConnection();
        connObj.ConnectionString = cString;

        //open connection
        connObj.Open();

        //command object to send sql query
        SqlCommand commandObj = new SqlCommand("GetTicketDetails", connObj);
        commandObj.Connection = connObj;

        //define command type as stored procedure
        commandObj.CommandType = CommandType.StoredProcedure;

        //add all the input parameters
        commandObj.Parameters.Add("@Departure_Location", SqlDbType.VarChar, 10);
        commandObj.Parameters.Add("@NameOfGame", SqlDbType.VarChar, 40);
        commandObj.Parameters.Add("@CostInEuro", SqlDbType.SmallMoney).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@GameDate", SqlDbType.Date).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@LocationOfGame", SqlDbType.VarChar, 30).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Departure_Time", SqlDbType.Time, 0).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Arrival_Time", SqlDbType.Time, 0).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@TicketID", SqlDbType.TinyInt).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@ThrowIn", SqlDbType.Time).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Quantity", SqlDbType.Int).Direction = ParameterDirection.Output;
        
        // set input parameter values
        commandObj.Parameters["@Departure_Location"].Value = departureLocation;
        commandObj.Parameters["@NameOfGame"].Value = gameName;

        // open connection and execute stored procedure
        commandObj.ExecuteNonQuery();

        // read output values from stored procedure
        decimal price = Convert.ToDecimal(commandObj.Parameters["@CostInEuro"].Value);
        string destination = (commandObj.Parameters["@LocationOfGame"].Value).ToString();
        DateTime date = Convert.ToDateTime(commandObj.Parameters["@GameDate"].Value);
        string departureTime = (commandObj.Parameters["@Departure_Time"].Value).ToString();
        string aTime = (commandObj.Parameters["@Arrival_Time"].Value).ToString();
        int ticketID = Convert.ToInt32(commandObj.Parameters["@TicketID"].Value);
        string tTime = (commandObj.Parameters["@ThrowIn"].Value).ToString();
        int availableQty = Convert.ToInt32(commandObj.Parameters["@Quantity"].Value);
        int ticketQuantity = Convert.ToInt32(ddlquantity.SelectedValue);
        
        //close connection
        connObj.Close();

        //proxy to connect client and service
        CurrencyService1Client proxyToService = new CurrencyService1Client(); 
        
        //use the 'client' variable to call operations on the service.
        CurrencyRate rateDetailReturned = new CurrencyRate();
        rateDetailReturned = proxyToService.GetRateDetails("€EUR", ddlCurrencyTo.SelectedItem.Text);

        //declare and calculate variables for currency conversion
        decimal convertedPrice = price * rateDetailReturned.accessrate;
        decimal totalCost = convertedPrice * ticketQuantity;

        //variable labels if tickets are available
        if (availableQty >= ticketQuantity)
        {
            lblDate.Text = date.ToString("dd MMMM yyyy");
            lblDeparture.Text = departureLocation.ToString();
            lblDtime.Text = departureTime.ToString();
            lblName.Text = gameName.ToString();
            lblCost.Text = convertedPrice.ToString("F");
            lblDest.Text = destination.ToString();
            lblAtime.Text = aTime.ToString();
            lblThrow.Text = tTime.ToString();
            lblquantity.Text = availableQty.ToString();
            lblgroupCost.Text = totalCost.ToString("F");
            lblcurrency.Text = ddlCurrencyTo.SelectedItem.Text;
            lblgroupCurrency.Text = ddlCurrencyTo.SelectedItem.Text;
            hdField.Value = ticketID.ToString();            
            
        }
        //if no tickets are available
        else
        {
            lblgName.Text = "No Tickets Are Available For This Game";
        }
        //cookie settings and value
        Response.Cookies["currencySelected"].Value = ddlCurrencyTo.SelectedValue.ToString();
        Response.Cookies["currencySelected"].Expires = DateTime.Now.AddDays(99); 

    }
    //game ticket detail when selection changed      
    protected void ddlGames_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //check for cookie to select currency
            if (Request.Cookies["currencySelected"] != null)
            {
                ddlCurrencyTo.SelectedValue = Request.Cookies["currencySelected"].Value;
            }
            //set default currency value
                ddlCurrencyTo.SelectedValue = "5";

        }
        // declare location and name of game strings        
        string departureLocation = ddlDeparture.SelectedItem.Text;
        string gameName = ddlGames.SelectedItem.Text;

        //connection string
        string cString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

        //sqlConnection object
        SqlConnection connObj = new SqlConnection();
        connObj.ConnectionString = cString;

        //open connection
        connObj.Open();

        //command object to send sql query
        SqlCommand commandObj = new SqlCommand("GetTicketDetails", connObj);
        commandObj.Connection = connObj;
        commandObj.CommandType = CommandType.StoredProcedure;


        //add all the parameters
        commandObj.Parameters.Add("@Departure_Location", SqlDbType.VarChar, 10);
        commandObj.Parameters.Add("@NameOfGame", SqlDbType.VarChar, 40);
        commandObj.Parameters.Add("@CostInEuro", SqlDbType.SmallMoney).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@GameDate", SqlDbType.Date).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@LocationOfGame", SqlDbType.VarChar, 30).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Departure_Time", SqlDbType.Time, 0).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Arrival_Time", SqlDbType.Time, 0).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@TicketID", SqlDbType.TinyInt).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@ThrowIn", SqlDbType.Time).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Quantity", SqlDbType.Int).Direction = ParameterDirection.Output;

        //set input parameter values
        commandObj.Parameters["@Departure_Location"].Value = departureLocation;
        commandObj.Parameters["@NameOfGame"].Value = gameName;

        //open connection and execute stored procedure
        commandObj.ExecuteNonQuery();

        //read output values from stored procedure
        decimal price = Convert.ToDecimal(commandObj.Parameters["@CostInEuro"].Value);
        string destination = (commandObj.Parameters["@LocationOfGame"].Value).ToString();
        DateTime date = Convert.ToDateTime(commandObj.Parameters["@GameDate"].Value);
        string departureTime = (commandObj.Parameters["@Departure_Time"].Value).ToString();
        string aTime = (commandObj.Parameters["@Arrival_Time"].Value).ToString();
        int ticketID = Convert.ToInt32(commandObj.Parameters["@TicketID"].Value);
        string tTime = (commandObj.Parameters["@ThrowIn"].Value).ToString();
        int availableQty = Convert.ToInt32(commandObj.Parameters["@Quantity"].Value);
        int ticketQuantity = Convert.ToInt32(ddlquantity.SelectedValue);

        //close connection
        connObj.Close();

            //if tickets are available
            if (availableQty >= ticketQuantity)
            {
            //proxy to connect client and service
            CurrencyService1Client proxyToService = new CurrencyService1Client();

            //use the 'client' variable to call operations on the service.
            CurrencyRate rateDetailReturned = new CurrencyRate();
            rateDetailReturned = proxyToService.GetRateDetails("€EUR", ddlCurrencyTo.SelectedItem.Text);

            //declare and calculate variables for currency conversion
            decimal convertedPrice = price * rateDetailReturned.accessrate;
            decimal totalCost = convertedPrice * ticketQuantity;

            //variable labels        
            lblDate.Text = date.ToString("dd MMMM yyyy");
            lblDeparture.Text = departureLocation.ToString();
            lblDtime.Text = departureTime.ToString();
            lblName.Text = gameName.ToString();
            lblCost.Text = convertedPrice.ToString("F");
            lblDest.Text = destination.ToString();
            lblAtime.Text = aTime.ToString();
            lblThrow.Text = tTime.ToString();
            lblquantity.Text = availableQty.ToString();
            lblgroupCost.Text = totalCost.ToString("F");
            lblcurrency.Text = ddlCurrencyTo.SelectedItem.Text;
            lblgroupCurrency.Text = ddlCurrencyTo.SelectedItem.Text;
            hdField.Value = ticketID.ToString();
        }
        
        //if tickets aren't available
        else
        {
            lblgName.Text = "That Number of Tickets Is Not Available";
        }
                    
    }

    protected void ddlCurrencyTo_SelectedIndexChanged(object sender, EventArgs e)

    //calculate total cost each selection changed
    {
        //proxy to connect client and service
        CurrencyService1Client proxyToService = new CurrencyService1Client(); 
        
        //use the client variable to call operations from the service.
        CurrencyRate rateDetailReturned = new CurrencyRate();
        rateDetailReturned = proxyToService.GetRateDetails(lblcurrency.Text, ddlCurrencyTo.SelectedItem.Text);

        //declare and calculate variables
        int ticketQuantity = Convert.ToInt32(ddlquantity.SelectedValue);
        decimal currentPrice = Convert.ToDecimal(lblCost.Text);
        decimal convertedPrice = currentPrice * rateDetailReturned.accessrate;
        decimal totalCost = convertedPrice * ticketQuantity;

        //ouput values to labels    
        lblCost.Text = convertedPrice.ToString("F");
        lblcurrency.Text = rateDetailReturned.accessCurrency_To;
        lblgroupCost.Text = totalCost.ToString("F");
        lblgroupCurrency.Text = lblcurrency.Text;        
 
    }

    protected void ddltQuantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        //variables for new group cost
        int ticketQuantity = Convert.ToInt32(ddlquantity.SelectedValue);
        decimal currentPrice = Convert.ToDecimal(lblCost.Text);
        decimal totalCost = currentPrice * ticketQuantity;

        //new group cost
        lblgroupCost.Text = totalCost.ToString();
            
    }
        
    protected void ddlDeparture_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if cookie exists set currency
            if (Request.Cookies["currencySelected"] != null)
            {
                ddlCurrencyTo.SelectedValue = Request.Cookies["currencySelected"].Value;

            }
            //if cookie doesn't exists set default currency
            else
                ddlCurrencyTo.SelectedValue = "5";

        }
        // declare location and name of game strings        
        string departureLocation = ddlDeparture.SelectedItem.Text;
        string gameName = ddlGames.SelectedItem.Text;

        //connection string
        string cString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

        //sqlConnection object
        SqlConnection connObj = new SqlConnection();
        connObj.ConnectionString = cString;

        //open connection
        connObj.Open();

        //command object to send sql queries
        SqlCommand commandObj = new SqlCommand("GetTicketDetails", connObj);
        commandObj.Connection = connObj;

        //define commandtype as stored procedure
        commandObj.CommandType = CommandType.StoredProcedure;

        // add all the parameters
        commandObj.Parameters.Add("@Departure_Location", SqlDbType.VarChar, 10);
        commandObj.Parameters.Add("@NameOfGame", SqlDbType.VarChar, 40);
        commandObj.Parameters.Add("@CostInEuro", SqlDbType.SmallMoney).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@GameDate", SqlDbType.Date).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@LocationOfGame", SqlDbType.VarChar, 30).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Departure_Time", SqlDbType.Time, 0).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Arrival_Time", SqlDbType.Time, 0).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@TicketID", SqlDbType.TinyInt).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@ThrowIn", SqlDbType.Time).Direction = ParameterDirection.Output;
        commandObj.Parameters.Add("@Quantity", SqlDbType.Int).Direction = ParameterDirection.Output;

        //set input parameter values
        commandObj.Parameters["@Departure_Location"].Value = departureLocation;
        commandObj.Parameters["@NameOfGame"].Value = gameName;

        //open connection and execute stored procedure
        commandObj.ExecuteNonQuery();

        //read output values from stored procedure
        decimal price = Convert.ToDecimal(commandObj.Parameters["@CostInEuro"].Value);
        string destination = (commandObj.Parameters["@LocationOfGame"].Value).ToString();
        DateTime date = Convert.ToDateTime(commandObj.Parameters["@GameDate"].Value);
        string departureTime = (commandObj.Parameters["@Departure_Time"].Value).ToString();
        string arrivalTime = (commandObj.Parameters["@Arrival_Time"].Value).ToString();
        int ticketID = Convert.ToInt32(commandObj.Parameters["@TicketID"].Value);
        string throwIn = (commandObj.Parameters["@ThrowIn"].Value).ToString();
        int availableQty = Convert.ToInt32(commandObj.Parameters["@Quantity"].Value);
        int ticketQuantity = Convert.ToInt32(ddlquantity.SelectedValue);

        //close connection
        connObj.Close();

        //proxy to connect client and service
        CurrencyService1Client proxyToService = new CurrencyService1Client();

        //use the client variable to call operations from the service.
        CurrencyRate rateDetailReturned = new CurrencyRate();
        rateDetailReturned = proxyToService.GetRateDetails("€EUR", ddlCurrencyTo.SelectedItem.Text);

        //declare and calculate variables for currency conversion
        decimal convertedPrice = price * rateDetailReturned.accessrate;
        decimal totalCost = convertedPrice * ticketQuantity;

        //variable labels

        //if tickets are available
        if (availableQty >= ticketQuantity)
        {
            lblDate.Text = date.ToString("dd MMMM yyyy");
            lblDeparture.Text = departureLocation.ToString();
            lblDtime.Text = departureTime.ToString();
            lblName.Text = gameName.ToString();
            lblCost.Text = convertedPrice.ToString("F");
            lblDest.Text = destination.ToString();
            lblAtime.Text = arrivalTime.ToString();
            lblThrow.Text = throwIn.ToString();
            lblquantity.Text = availableQty.ToString();
            lblgroupCost.Text = totalCost.ToString("F");
            lblcurrency.Text = ddlCurrencyTo.SelectedItem.Text;
            lblgroupCurrency.Text = ddlCurrencyTo.SelectedItem.Text;
            
        }
        //if tickets are not available
        else
        {
            lblgName.Text = "That Number of Tickets Is Not Available";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //declare variables from label and dropdown settings
        int ticketID = Convert.ToInt32(hdField.Value);
        string currencyCode = ddlCurrencyTo.SelectedItem.Text;
        decimal totalCost = Convert.ToDecimal(lblgroupCost.Text);
        int ticketQuantity = Convert.ToInt32(ddlquantity.SelectedValue);
        int ticketsAvailable = Convert.ToInt32(lblquantity.Text);
        string departureLocation = lblDeparture.Text;
        string gameName = lblName.Text;
        string departureTime = lblDtime.Text;
        DateTime date = Convert.ToDateTime(lblDate.Text);
        string destination = lblDest.Text;
        string throwIn = lblThrow.Text;
        string arrivalTime = lblAtime.Text;
        
        //create new booking object
        Booking book = new Booking(ticketID, currencyCode, totalCost, ticketQuantity, departureLocation, 
                                gameName, departureTime, date, destination, throwIn, arrivalTime);

        //place booking object and tickets available in session state
        Session["ssBook"] = book;
        Session["sstAvailable"] = ticketsAvailable;
               
        //create cookie
        Response.Cookies["currencySelected"].Value = ddlCurrencyTo.SelectedValue.ToString();
        Response.Cookies["currencySelected"].Expires = DateTime.Now.AddDays(99);

        //redirect to booking page
        Response.Redirect("Booking Page.aspx");
        
    }
}