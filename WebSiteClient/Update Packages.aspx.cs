using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Update_Packages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //connection string
        string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

        //sqlConnection object
        SqlConnection connectionObj = new SqlConnection();
        connectionObj.ConnectionString = connString;


        if (tbxDate.Text == "" || tbxGameID.Text == "" || tbxGameName.Text == "" || tbxGameType.Text == "" 
            || tbxLocation.Text == "" || tbxTtime.Text == ""   )
        {
            lblError.Text = "Please Fill All Fields";
        }

        else
        {
            int GameID = Convert.ToInt32(tbxGameID.Text);
            string NameOfGame = tbxGameName.Text;
            string GameType = tbxGameType.Text;
            string LocationOfGame = tbxLocation.Text;
            string GameDate = tbxDate.Text;
            string ThrowIn = tbxTtime.Text;


            //decimal newRate = Convert.ToDecimal(txtNewRate.Text);

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
                sendQuery.CommandText = "USE [C:\\GAADB\\GAA_GAMES.MDF] UPDATE Games SET NameOfGame = '" + NameOfGame + "', GameType = '" + GameType + "', LocationOfGame = '"
                    + LocationOfGame + "', GameDate = '" + GameDate + "', Throwin = '" + ThrowIn + "' FROM Games WHERE GameID = '" + GameID +"'";

                //send query to the database
                sendQuery.ExecuteNonQuery();

                lblError.Text = "Record Updated Successfully";

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
        string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";
        
        int GameID = Convert.ToInt32(tbxGameID1.Text);
        //sqlConnection object
        SqlConnection connectionObj = new SqlConnection();
        connectionObj.ConnectionString = connString;

        // try/catch for query being sent to the database 
        if (tbxGameID1.Text == "")
        {
            lblError.Text = "Please Enter A GameID";
        }

        else
        {

            try
            {
                //open the connection
                connectionObj.Open();

                //query the db: create a sql command object
                SqlCommand sendQuery = new SqlCommand();

                //point the command object towards an actual db connection
                sendQuery.Connection = connectionObj;

                //query to update the database
                sendQuery.CommandText = "DELETE FROM Games WHERE GameID = '" + GameID + "'";


                //send query to the database
                sendQuery.ExecuteNonQuery();
                lblError2.Text = "Record Deleted Successfully";

            }
            catch (Exception ex)
            {
                //if error is thrown output message
                lblError2.Text = ex.Message;
            }
            finally
            {
                //close connection 
                connectionObj.Close();
            }
        }

        
    }
}