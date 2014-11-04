using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CurrencyService
{
    
    public class Service1 : CurrencyService1
    {
        //get rate method 
        public decimal GetRate(string currencyFrom, string currencyTo)
        {
            //connection string
            string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\CurrencyDB\\Currency_Rates.mdf;Integrated Security=True";

            //sqlConnection object
            SqlConnection connectionObj = new SqlConnection();
            connectionObj.ConnectionString = connString;

            try
            {
                //open connection
                connectionObj.Open();

                //command object to send sql queries
                SqlCommand commandObj = new SqlCommand();
                commandObj.Connection = connectionObj;
                
                //query line
                commandObj.CommandText = "SELECT Rate FROM Rates AS R1 JOIN Currency_To AS T1 ON R1.IDTo = T1.IDTo JOIN Currency_From as F1 ON R1.IDFrom = F1.IDFrom WHERE F1.CurrencyInCode = '" + currencyFrom + "'  AND T1.CurrencyOutCode = '" + currencyTo + "'";

                //reader 
                SqlDataReader dataReturned;
                dataReturned = commandObj.ExecuteReader();

                decimal returnfromDB;

                if (dataReturned.Read())
                {
                    returnfromDB = (decimal)dataReturned["Rate"];
                }

                else
                {
                    returnfromDB = 0;
                }

                return returnfromDB;
            }//try ends

            catch (Exception)
            {
                return 999;
            }

            finally
            {
                connectionObj.Close();
            }
        }

        public CurrencyRate GetRateDetails(string currencyFrom, string currencyTo)
        {
            CurrencyRate c = new CurrencyRate();

            //connect to db, connection string 
            string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\CurrencyDB\\Currency_Rates.mdf;Integrated Security=True";
            

            //sqlConnection object
            SqlConnection connectionObj = new SqlConnection();
            //property equal to actual connection string
            connectionObj.ConnectionString = connString;

            try
            {
                //open the connection
                connectionObj.Open();


                //command object transmit commands to the particular connection object
                SqlCommand commandObj = new SqlCommand();
                commandObj.Connection = connectionObj;
                commandObj.CommandText = "SELECT Rate, F1.CurrencyInCode, T1.CurrencyOutCode FROM Rates AS R1 JOIN Currency_To AS T1 ON R1.IDTo = T1.IDTo JOIN Currency_From as F1 ON R1.IDFrom = F1.IDFrom WHERE F1.CurrencyInCode = '" + currencyFrom + "'  AND T1.CurrencyOutCode = '" + currencyTo + "'";

                //create a reader object to store the info as returned from the db
                SqlDataReader datareturned;
                datareturned = commandObj.ExecuteReader();
                
                if (datareturned.Read())
                {
                    c.accessCurrency_From = datareturned["CurrencyInCode"].ToString();
                    c.accessCurrency_To = datareturned["CurrencyOutCode"].ToString();
                    c.accessrate = (decimal)datareturned["Rate"];
                }
                else
                {
                    c.accessCurrency_From = "No Currency Such Code";
                    c.accessCurrency_To = "No Currency Such Code";
                    c.accessrate = 0;
                    
                }

                return c;

            } //end of try
            catch (Exception e)
            {
                c.accessCurrency_From = e.Message;
                return c;
                //return null;
            }
            finally
            {
                connectionObj.Close();
            }

                       
        }

        
    }
}
