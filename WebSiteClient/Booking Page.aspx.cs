using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Globalization;
using ExchangeService;


public partial class Booking_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //redirect if user is coming directly here
        if (Session["ssBook"] == null)
        {
            Response.Redirect("Client.aspx");
        }
        
        //if coming here from football or hurling page
        else
        {
        
        //declare booking object from session state
        Booking book = (Booking)Session["ssBook"];

        //output object properties to labels        
        lblName.Text = book.GameName;
        lblDate.Text = book.Date.ToString("dd MMMM yyyy");
        lblDeparture.Text = book.DepartureLocation;
        lblDtime.Text = book.DepartureTime;
        lblDest.Text = book.Destination;
        lblAtime.Text = book.ArrivalTime;
        lblThrow.Text = book.ThrowIn;
        lblQuantity.Text = book.TicketQuantity.ToString();
        lblCurrency.Text = book.CurrencyCode;
        lblCost.Text = book.TotalCost.ToString();
        lblbook.Text = "Click Confirm Booking To Finalise Booking";        
        
        }

    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //error check to prevent nulls in input text boxes
        if (tbxFname.Text == "" || tbxLname.Text == "" || tbxEaddress.Text == "" || tbxCCnumber.Text == "")
        {
            lblbook.Text = "*********Please Fill All Required Fields*********";
        }

        else
        {
            //declare booking object from session state
            Booking book = (Booking)Session["ssBook"];

            //declare variables from another session state, the booking object and the input text boxes
            int tAvailable = (int)Session["sstAvailable"];
            int nQuantity = tAvailable - book.TicketQuantity;
            int qTickets = book.TicketQuantity;
            int ticketID = book.TicketID;
            decimal tCost = book.TotalCost;
            string currCode = book.CurrencyCode;
            string eMail = tbxEaddress.Text;
            string cFirstName = tbxFname.Text;
            string cLastName = tbxLname.Text;
            string ccNumber = tbxCCnumber.Text;

            //connection string
            string cString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

            //sqlConnection object
            SqlConnection connObj = new SqlConnection();
            connObj.ConnectionString = cString;

            //open connection
            connObj.Open();

            //command object to send sql query
            SqlCommand commandObj = new SqlCommand("InsertNewBooking", connObj);
            commandObj.Connection = connObj;

            //commandtype defined
            commandObj.CommandType = CommandType.StoredProcedure;

            //add all the parameters
            commandObj.Parameters.Add("@cFirstName", SqlDbType.VarChar, 30);
            commandObj.Parameters.Add("@cLastName", SqlDbType.VarChar, 30);
            commandObj.Parameters.Add("@qTickets", SqlDbType.TinyInt);
            commandObj.Parameters.Add("@tCost", SqlDbType.SmallMoney);
            commandObj.Parameters.Add("@currCode", SqlDbType.NVarChar, 5);
            commandObj.Parameters.Add("@ccNumber", SqlDbType.BigInt);
            commandObj.Parameters.Add("@ticketID", SqlDbType.TinyInt);
            commandObj.Parameters.Add("@email", SqlDbType.NVarChar, 50);

            //set input parameter values
            commandObj.Parameters["@cFirstName"].Value = cFirstName;
            commandObj.Parameters["@cLastName"].Value = cLastName;
            commandObj.Parameters["@qTickets"].Value = qTickets;
            commandObj.Parameters["@tCost"].Value = tCost;
            commandObj.Parameters["@currCode"].Value = currCode;
            commandObj.Parameters["@ccNumber"].Value = ccNumber;
            commandObj.Parameters["@ticketID"].Value = ticketID;
            commandObj.Parameters["@email"].Value = eMail;
            
            //open connection and execute stored procedure
            commandObj.ExecuteNonQuery();
            
            //close connection 
            connObj.Close();       

            //open connection
            connObj.Open();

            //new command object to send sql query
            SqlCommand commandObj1 = new SqlCommand("UpdateQuantities", connObj);
            commandObj1.Connection = connObj;

            //commandtype defined
            commandObj1.CommandType = CommandType.StoredProcedure;

            // add all the parameters
            commandObj1.Parameters.Add("@Quantity", SqlDbType.Int);
            commandObj1.Parameters.Add("@TicketID", SqlDbType.Int);            

            // set input parameter values
            commandObj1.Parameters["@Quantity"].Value = nQuantity;
            commandObj1.Parameters["@TicketID"].Value = ticketID;

            // open connection and execute stored procedure
            commandObj1.ExecuteNonQuery();

            //close connection
            connObj.Close();            

            //confirmation email to display booking details and total cost for user to/from addresses
            string to = eMail;
            string from = "officialgaapackages@gmail.com";
            MailMessage message = new MailMessage(from, to);

            //email content
            message.Subject = "100% Official GAA Booking";
            message.Body = "Dear " + cFirstName + " " + cLastName + ". These are the details of your 100% Official GAA Booking.<br /><br />Championship Game : " + lblName.Text +
            "<br /><br />Date : " + lblDate.Text + "<br /><br />Departure Location : " + lblDeparture.Text + "<br /><br />Departure Time : " + lblDtime.Text + "<br /><br />Game Location : " + lblDest.Text + "<br /><br />Arrival Time : " + lblAtime.Text +
            "<br /><br />Throw In Time : " + lblThrow.Text + "<br /><br />Number of Tickets : " + qTickets + "<br /><br />Total Price Paid : " + currCode + " " + tCost +
            "<br /><br />Your return journey departs at 7.30 p.m from the station you arrived at earlier." +
            "<br /><br />Should you have any issues with your booking, you can contact us by reply email or on 071-234876";

            //email smtp, encoding and security settings
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("officialgaapackages@gmail.com", "sligoballina");
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential;
            
            //error checking
            try
            {
                //successful sending email
                client.Send(message);
                lblbook.Text = ("You Have Been Sent A Confirmation Email");
            }
            catch (Exception ex)
            {
                //unsuccessful sending email
                lblbook.Text = (ex.Message);
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Client.aspx");
    }
}