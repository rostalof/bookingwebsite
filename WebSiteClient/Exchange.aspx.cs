using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using ExchangeService;

public partial class Exchange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGetRate_Click(object sender, EventArgs e)
    {
        try
        {
            //proxy to connect client and service
            CurrencyService1Client proxyToService = new CurrencyService1Client();

            // Use the client variable to call operations from the service.
            CurrencyRate rateDetailReturned = new CurrencyRate();
            decimal input;
            decimal rate;

            //call service and input parameters
            rateDetailReturned = proxyToService.GetRateDetails(ddlCurrencyFrom2.SelectedItem.Text, ddlCurrencyTo2.SelectedItem.Text);
            
            //declare and parse variables
            input = Decimal.Parse(txtInput.Text.ToString());
            rate = Decimal.Parse(rateDetailReturned.accessrate.ToString());

            //output results to labels
            lblRate.Text = rateDetailReturned.accessrate.ToString();
            lblFrom2.Text = rateDetailReturned.accessCurrency_From;
            lblTo2.Text = rateDetailReturned.accessCurrency_To;
            lbl1.Text = "The Exchange Rate For ";
            lbl2.Text = "to ";
            lbl3.Text = "is ";

            lblEx.Text = rateDetailReturned.accessCurrency_From;
            lblEx1.Text = txtInput.Text.ToString();
            lblEx2.Text = "is";
            lblEx3.Text = rateDetailReturned.accessCurrency_To;
            
            //calculate converted amount
            lblCurrency.Text = (rate * input).ToString("F");
            
            //close the client.
            proxyToService.Close();
        }
        catch (Exception)
        {
            //proxy to connect client and service
            CurrencyService1Client proxyToService = new CurrencyService1Client();

            // Use the client variable to call operations from the service.
            CurrencyRate rateDetailReturned = new CurrencyRate();

            //call service and input parameters
            rateDetailReturned = proxyToService.GetRateDetails(ddlCurrencyFrom2.SelectedItem.Text, ddlCurrencyTo2.SelectedItem.Text); 
            
            //ouput to labels
            lblRate.Text = rateDetailReturned.accessrate.ToString();
            lblFrom2.Text = rateDetailReturned.accessCurrency_From;
            lblTo2.Text = rateDetailReturned.accessCurrency_To;
            lbl1.Text = "The Exchange Rate For ";
            lbl2.Text = "to ";
            lbl3.Text = "is "; 
            lblCurrency.Text = "No Amount Entered";

            //close the client
            proxyToService.Close();
            
        }
    }
}