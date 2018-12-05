using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;

namespace MovieProject
{
    public class UtilityClass
    {
        WebClient client;
        public static SqlConnection CreateConnection()
        {          
            SqlConnection conn = new SqlConnection(@"data source = LAPTOP-9C071575; integrated security = true; database = Movies");       
            return conn;
        }
        public static string RequestAPI(string search)
        {
           WebClient client = new WebClient();
            string reply = "";
            reply = client.DownloadString("http://www.omdbapi.com/?t=" + search + "&r=xml&apikey=3dc0ab16");
            return reply;
        }
    }
    
}