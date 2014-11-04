using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Currency_Rate_Update
{
    public partial class CurrencyChange : System.Web.UI.Page
    {
        //when adding an entry to the rate table RateID ++ and IDTo++ and IDFrom++
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //connection string
            string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\CurrencyDB\\Currency_Rates.mdf;Integrated Security=True";

            //sqlConnection object
            SqlConnection connectionObj = new SqlConnection();
            connectionObj.ConnectionString = connString;

            if (txtNewRate.Text == "")
            {
                lblError.Text = "Please Enter A New Rate In The TextBox";
            }

            else
            {
                decimal newRate = Convert.ToDecimal(txtNewRate.Text);

                // try/catch for query being sent to the database 

                try
                {
                    //open the connection
                    connectionObj.Open();

                    //query the db: create a sql command object
                    SqlCommand sendQuery = new SqlCommand();

                    //point the command object towards an actual db connection
                    sendQuery.Connection = connectionObj;

                    //query to update the database
                    sendQuery.CommandText = "USE [C:\\CURRENCYDB\\CURRENCY_RATES.MDF] UPDATE Rates SET Rate = '" + newRate + "' FROM Rates as R1 JOIN Currency_To AS T1 ON R1.IDTo = T1.IDTo JOIN Currency_From as F1 ON R1.IDFrom = F1.IDFrom WHERE F1.CurrencyInCode = '" + ddlFrom.SelectedItem.Text.ToString() + "'  AND T1.CurrencyOutCode = '" + ddlTo.SelectedItem.Text.ToString() + "'";

                    //read out query to screen for testing
                    //lblError.Text = sendQuery.CommandText;

                    //store data into the database
                    sendQuery.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    //if error is thrown output message
                    lblError.Text = ex.Message;
                }
                finally
                {
                    //close connection 
                    connectionObj.Close();
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            //connection string / path
            string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\CurrencyDB\\Currency_Rates.mdf;Integrated Security=True";

            //sqlConnection object
            SqlConnection connectionObj = new SqlConnection();
            connectionObj.ConnectionString = connString;

            // try/catch for query being sent to the database 

            try
            {
                //open the connection
                connectionObj.Open();

                //query the db: create a sql command object
                SqlCommand sendQuery = new SqlCommand();

                //point the command object towards an actual db connection
                sendQuery.Connection = connectionObj;

                //query to update the database
                sendQuery.CommandText = "DELETE Rates FROM Rates as R1 JOIN Currency_To AS T1 ON R1.IDTo = T1.IDTo JOIN Currency_From as F1 ON R1.IDFrom = F1.IDFrom WHERE F1.CurrencyInCode = '" + ddlFrom.SelectedItem.Text + "'  AND T1.CurrencyOutCode = '" + ddlTo.SelectedItem.Text + "'";
                                        

                //store data into the database
                sendQuery.ExecuteNonQuery();



            }
            catch (Exception ex)
            {
                //if error is thrown output message
                lblError.Text = ex.Message;
            }
            finally
            {
                //close connection 
                connectionObj.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        //ran out of time to complete this
        }

        
    }
}