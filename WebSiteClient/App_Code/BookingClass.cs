using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookingClass
/// </summary>
public class Booking
{
    //properties
    public int TicketID;
    public string CurrencyCode;
    public decimal TotalCost;
    public int TicketQuantity;
    public string DepartureLocation;
    public string GameName;
    public string DepartureTime;
    public string ArrivalTime;
    public DateTime Date;
    public string Destination;
    public string ThrowIn;

    //constructor
    public Booking(int ticketID, string currencyCode, decimal totalCost, int ticketQuantity, string departureLocation, 
                    string gameName, string departureTime, DateTime date, string destination, string throwIn, string arrivalTime)
    {
        TicketID = ticketID;
        CurrencyCode = currencyCode;
        TotalCost = totalCost;
        TicketQuantity = ticketQuantity;
        DepartureLocation = departureLocation;
        GameName = gameName;
        DepartureTime = departureTime;
        ArrivalTime = arrivalTime;
        Date = date;
        Destination = destination;
        ThrowIn = throwIn;
       

    }
	
}