using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.IO;
using System.Xml;
using System.Drawing;
using System.Xml.Xsl;
using System.Data.SqlClient;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Web.UI.HtmlControls;

namespace MovieProject
{
    public partial class index : System.Web.UI.Page
    {

        WebClient client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = new WebClient();

        }

        protected void ButtonFind_Click(object sender, EventArgs e)
        {
            MultiViewMovies.ActiveViewIndex = 1;
            string reply = "";

            if (TextBoxName.Text == " ") TextBoxName.Text = "No Name";
            reply = UtilityClass.RequestAPI(TextBoxName.Text);
            //File.WriteAllText(Server.MapPath("~/MyFiles/LatestResult.xml"), reply);
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(reply);

            if (doc.SelectSingleNode("/root/@response").InnerText == "True")
            {
                XmlNodeList nodelist = doc.SelectNodes("/root/movie");

                object name = nodelist[0].SelectSingleNode("@title").InnerText;
                object picture = nodelist[0].SelectSingleNode("@poster").InnerText;
                object year = nodelist[0].SelectSingleNode("@year").InnerText;
                LabelResult.Text = nodelist[0].SelectSingleNode("@title").InnerText;
                LabelResult.Text += " (" + nodelist[0].SelectSingleNode("@year").InnerText + ")";
                LabelDirected.Text = "Directed by: " + nodelist[0].SelectSingleNode("@director").InnerText;
                LabelActors.Text = "Starring: " + nodelist[0].SelectSingleNode("@actors").InnerText;
                LabelRating.Text = "Child Rating: " + nodelist[0].SelectSingleNode("@rated").InnerText;
                //LabelDescription.Text = "Plot: " + nodelist[0].SelectSingleNode("@plot").InnerText;

                //in case of Missing image
                if (nodelist[0].SelectSingleNode("@poster").InnerText == "N/A") { ImagePoster.ImageUrl = "~/img/ErrorImg.jpg"; }
                else
                {
                    ImagePoster.ImageUrl = nodelist[0].SelectSingleNode("@poster").InnerText;
                }


                SqlCommand cmd = null;
                SqlCommand command = null;
                string sqlupdate = "";
                string sqlinsert = "";
                SqlConnection con = UtilityClass.CreateConnection();

                try
                {
                    con.Open();
                    sqlupdate = "UPDATE Movies SET Counter = Counter + 1 WHERE MovieName = @title";
                    sqlinsert = "UPDATE Movies SET PosterUrl = @picture WHERE MovieName = @title";
                    cmd = new SqlCommand(sqlupdate, con);
                    command = new SqlCommand(sqlinsert, con);
                    cmd.Parameters.AddWithValue("@title", name);
                    command.Parameters.AddWithValue("@title", name);
                    command.Parameters.AddWithValue("@picture", picture.ToString());

                    cmd.ExecuteNonQuery();
                    command.ExecuteNonQuery();
                }

                catch (Exception ex)
                {
                    LabelMessages.Text = "Dette er en Exception: " + ex.Message;
                }
                finally
                {
                    con.Close();
                }

                string result = "";
                result = UtilityClass.TrailerAPI(name.ToString(), Convert.ToInt32(year));
                var movieSearchResult = JsonConvert.DeserializeObject<JObject>(result);
                File.WriteAllText(Server.MapPath("~/MyFiles/LatestTrailer.json"), result);
                var items = movieSearchResult["items"];
                var videoId = items[0]["id"]["videoId"];
                string checkVideo = videoId == null ? "" : videoId.ToString();
                //if (videoId.ToString() != " ")
                if (checkVideo != "")
                {
                    youTubeTrailer.Src = $"https://www.youtube.com/embed/{checkVideo}";
                    LabelTralier.Text = "This movie trailer found";
                }
                else
                {
                    youTubeTrailer.Src = "";
                    LabelTralier.Text = "This movie trailer not found";
                }

            }
            else
            {
                LabelResult.Text = "Movie not found...";
                ImagePoster.ImageUrl = "~/img/ErrorImg.jpg";
                LabelDirected.Text = "";
                LabelActors.Text = "";
                LabelRating.Text = "";
            }



        }

        public void anchor2_ServerClick(object sender, EventArgs e)
        {
            MultiViewMovies.ActiveViewIndex = 1;
            var anchor = sender as HtmlAnchor;
            if (anchor == null)
                return;

            var href = anchor.InnerText;
            

            string reply = "";
            reply = UtilityClass.RequestAPI(href);

            //Tjek i LatestResultAction.xml
            File.WriteAllText(Server.MapPath("~/MyFiles/LatestResultAction.xml"), reply);
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(reply);

            if (doc.SelectSingleNode("/root/@response").InnerText == "True")
            {
                XmlNodeList nodelist = doc.SelectNodes("/root/movie");
                object name = nodelist[0].SelectSingleNode("@title").InnerText;
                object year = nodelist[0].SelectSingleNode("@year").InnerText;
                object picture = nodelist[0].SelectSingleNode("@poster").InnerText;
                LabelResult.Text = nodelist[0].SelectSingleNode("@title").InnerText;
                LabelResult.Text += " (" + nodelist[0].SelectSingleNode("@year").InnerText + ")";
                LabelDirected.Text = "Directed by: " + nodelist[0].SelectSingleNode("@director").InnerText;
                LabelActors.Text = "Starring: " + nodelist[0].SelectSingleNode("@actors").InnerText;
                LabelRating.Text = "Child Rating: " + nodelist[0].SelectSingleNode("@rated").InnerText;
                LabelDescription.Text = "Plot: " + nodelist[0].SelectSingleNode("@plot").InnerText;
                ImagePoster.ImageUrl = nodelist[0].SelectSingleNode("@poster").InnerText;

                SqlCommand cmd = null;
                SqlCommand command = null;
                string sqlupdate = "";
                string sqlinsert = "";
                SqlConnection con = UtilityClass.CreateConnection();

                try
                {
                    con.Open();
                    sqlupdate = "UPDATE Movies SET Counter = Counter + 1 WHERE MovieName = @title";
                    sqlinsert = "UPDATE Movies SET PosterUrl = @picture WHERE MovieName = @title";
                    cmd = new SqlCommand(sqlupdate, con);
                    command = new SqlCommand(sqlinsert, con);
                    cmd.Parameters.AddWithValue("@title", name);
                    command.Parameters.AddWithValue("@title", name);
                    command.Parameters.AddWithValue("@picture", picture.ToString());

                    cmd.ExecuteNonQuery();
                    command.ExecuteNonQuery();
                }

                catch (Exception ex)
                {
                    LabelMessages.Text = "Dette er en Exception: " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
                //Trailer
                string result = "";
                result = UtilityClass.TrailerAPI(name.ToString(), Convert.ToInt32(year));
                var movieSearchResult = JsonConvert.DeserializeObject<JObject>(result);

                var items = movieSearchResult["items"];
                var videoId = items[0]["id"]["videoId"];
                if (videoId.ToString() != " ")
                {
                    youTubeTrailer.Src = $"https://www.youtube.com/embed/{videoId.ToString()}";
                    LabelTralier.Text = "This movie trailer found";
                }
                else
                {
                    LabelTralier.Text = "This movie trailer not found";
                }



            }





        }


    }
}
