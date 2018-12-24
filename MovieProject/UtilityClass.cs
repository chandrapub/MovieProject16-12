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
        
        public static SqlConnection CreateConnection()
        {
            SqlConnection conn = new SqlConnection(@"data source = DESKTOP-F8MV33J\SQLEXPRESS; integrated security = true; database = MovieDB");
            return conn;
        }
        public static string RequestAPI(string search)
        {
           WebClient client = new WebClient();
            string reply = "";
            reply = client.DownloadString("http://www.omdbapi.com/?t=" + search + "&r=xml&apikey=3dc0ab16");
            return reply;
        }
        public static string TrailerAPI(string search, int year)
        {
            WebClient client = new WebClient();
            var apiKey = "AIzaSyBv1JLAkCV4giMLrTUKBXfDI4HTIOIeqAo";
            string cleanSeach = search.Replace(" ", "+");
            string searchWord = cleanSeach + year + "Movie Trailer";
            string result = "";
           
            string youtubeAPI = $"https://www.googleapis.com/youtube/v3/search?&part=snippet&q={searchWord}&type=trailer&key={apiKey}";
            result = client.DownloadString(youtubeAPI);
            return result;
        }

        //<compilers>
        //compiler language = "c#;cs;csharp" extension=".cs"
        //type="Microsoft.CodeDom.Providers.DotNetCompilerPlatform.CSharpCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        //warningLevel="4" compilerOptions="/langversion:default /nowarn:1659;1699;1701"/>
        //<compiler language = "vb;vbs;visualbasic;vbscript" extension=".vb"
        //type="Microsoft.CodeDom.Providers.DotNetCompilerPlatform.VBCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        //warningLevel="4" compilerOptions="/langversion:default /nowarn:41008 /define:_MYTYPE=\&quot;Web\&quot; /optionInfer+"/>
        //</compilers>

        
        
    }
    
}