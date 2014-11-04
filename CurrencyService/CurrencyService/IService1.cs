using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CurrencyService
{
    
    [ServiceContract]
    public interface CurrencyService1
    {
        //method that accepts from currency and to currency string
        [OperationContract]
        decimal GetRate(string currencyFrom, string currencyTo );

        [OperationContract]
        CurrencyRate GetRateDetails(string currencyFrom, string currencyTo);

    }

    [DataContract]
    public class CurrencyRate
    {
        string currencyFromCode; 
        string currencyToCode;        
        decimal rate; 

        [DataMember]
        public string accessCurrency_From
        {
            get { return currencyFromCode; }
            set { currencyFromCode = value; }
        }

        [DataMember]
        public string accessCurrency_To
        {
            get { return currencyToCode; }
            set { currencyToCode = value; }
        }

        [DataMember]
        public decimal accessrate
        {
            get { return rate; }
            set { rate = value; }
        }
    }
}
