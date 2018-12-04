using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

namespace MovieProject
{
    public partial class Action : System.Web.UI.Page
    {
        WebClient client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = new WebClient();               
            ShowMyMovies();                        
        }
       
        public void ShowMyMovies()
        {
            SqlConnection conn = new SqlConnection(@"data source = LAPTOP-9C071575; integrated security = true; database = Movies");
            SqlCommand cmd = null;
            SqlDataReader rdr = null;

            try
            {
                conn.Open();

                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select * FROM action order by year desc";

                rdr = cmd.ExecuteReader();
                GridViewMovies.DataSource = rdr;
                GridViewMovies.DataBind();

            }

            catch (Exception ex)
            {
                LabelMessages.Text = "Dette er en Exception: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void anchor1_ServerClick(object sender, EventArgs e)
        {
            var anchor = sender as HtmlAnchor;
            if (anchor == null)
                return;

            var href = anchor.InnerText;
            //--do something
            LabelResult.Text = anchor.InnerText.ToString();
            string reply = "";
            reply = client.DownloadString("http://www.omdbapi.com/?t=" + href + "&r=xml&apikey=3dc0ab16");

            File.WriteAllText(Server.MapPath("~/MyFiles/LatestResultAction.xml"), reply);
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(reply);

            if (doc.SelectSingleNode("/root/@response").InnerText == "True")
            {
                XmlNodeList nodelist = doc.SelectNodes("/root/movie");
                LabelResult.Text += "(" + nodelist[0].SelectSingleNode("@year").InnerText + ")";
                LabelDirected.Text = "Directed by: " + nodelist[0].SelectSingleNode("@director").InnerText;
                LabelActors.Text = "Starring: " + nodelist[0].SelectSingleNode("@actors").InnerText;
                LabelRating.Text = "Child Rating: " + nodelist[0].SelectSingleNode("@rated").InnerText;
                ImagePoster.ImageUrl = nodelist[0].SelectSingleNode("@poster").InnerText;
            }


        }
    }
}