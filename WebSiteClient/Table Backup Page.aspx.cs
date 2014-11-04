using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Table_Backup_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        //connection string
        string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

        //sqlConnection object
        SqlConnection connectionObj = new SqlConnection();
        connectionObj.ConnectionString = connString;

        //open connection
        connectionObj.Open();

        //command object to send sql queries
        SqlCommand commandObj = new SqlCommand();
        commandObj.Connection = connectionObj;
        
        //query
        commandObj.CommandText = "IF OBJECT_ID ('TDBackup') IS NOT NULL DROP TABLE [TDBackup] SELECT * INTO TDBackup FROM Ticket_Details ";

        //reader 
        SqlDataReader dataReturned;
        dataReturned = commandObj.ExecuteReader();

        //close connection
        connectionObj.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //connection string
        string connString = "Data Source=HOME-PC\\SQLEXPRESS;AttachDbFilename=C:\\GAAdb\\Gaa_Games.mdf;Integrated Security=True";

        //sqlConnection object
        SqlConnection connectionObj = new SqlConnection();
        connectionObj.ConnectionString = connString;

        //open connection
        connectionObj.Open();

        //command object to send sql queries
        SqlCommand commandObj = new SqlCommand();
        commandObj.Connection = connectionObj;
        
        //query
        commandObj.CommandText = "IF OBJECT_ID ('TDBackup1') IS NOT NULL DROP TABLE [TDBackup1] SELECT * INTO TDBackup1 FROM Ticket_Details";

        //reader 
        SqlDataReader dataReturned;
        dataReturned = commandObj.ExecuteReader();

        //close connection
        connectionObj.Close();
    }
}
