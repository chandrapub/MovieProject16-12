﻿using System;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Net;
using System.Web.UI.HtmlControls;
using System.Xml;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace MovieProject
{
    public partial class Animation : System.Web.UI.Page
    {
        WebClient client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = new WebClient();
            ShowMyMovies();
        }

        public void ShowMyMovies()
        {
            SqlDataReader rdr = null;
            SqlCommand cmd = null;
            string sqlsel = "";
            SqlConnection conn = UtilityClass.CreateConnection();
            try
            {
                conn.Open();
                sqlsel = "select * from Movies WHERE FilmCategoryId = 2 order by MovieName asc";
                cmd = new SqlCommand(sqlsel, conn);

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

            string reply = "";
            reply = UtilityClass.RequestAPI(href);

            //Tjek i LatestResultAction.xml
            //File.WriteAllText(Server.MapPath("~/MyFiles/LatestResultAction.xml"), reply);
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
                LabelLanguage.Text = "Language: " + nodelist[0].SelectSingleNode("@language").InnerText;
                LabelImdbRating.Text = "Imdb Rating: " + nodelist[0].SelectSingleNode("@imdbRating").InnerText + "/10";
                LabelImdbRating.Text += " Votes: " + nodelist[0].SelectSingleNode("@imdbVotes").InnerText;
                LabelRuntime.Text = "Runtime: " + nodelist[0].SelectSingleNode("@runtime").InnerText;
                LabelRating.Text = "Child Rating: " + nodelist[0].SelectSingleNode("@rated").InnerText;
                LabelDescription.Text = "Plot: " + nodelist[0].SelectSingleNode("@plot").InnerText;
                if (nodelist[0].SelectSingleNode("@poster").InnerText == "N/A") { ImagePoster.ImageUrl = "~/img/ErrorImg.jpg"; }
                else
                {
                    ImagePoster.ImageUrl = nodelist[0].SelectSingleNode("@poster").InnerText;
                }

                // string rating = nodelist[0].SelectSingleNode("@imdbRating").InnerText;
                // decimal m = Convert.ToDecimal(rating);

                //// if (m > 7.0m) { LabelImdbRating.ForeColor = Color.Green; }
                //// else if (m < 3.0m) { LabelImdbRating.ForeColor = Color.Red; }



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
                File.WriteAllText(Server.MapPath("~/MyFiles/LatestTrailer.json"), result);
                var items = movieSearchResult["items"];
                var videoId = items[0]["id"]["videoId"];
                string checkVideo = videoId == null ? "" : videoId.ToString();
                //if (videoId.ToString() != " ")
                if (checkVideo != "")
                {
                    youTubeTrailer.Src = $"https://www.youtube.com/embed/{checkVideo}";

                }



                //string result = "";
                //result = UtilityClass.TrailerAPI(name.ToString(), Convert.ToInt32(year));
                //var movieSearchResult = JsonConvert.DeserializeObject<JObject>(result);

                //var items = movieSearchResult["items"];
                //var videoId = items[0]["id"]["videoId"];
                //if (videoId.ToString() != " ")
                //{
                //    youTubeTrailer.Src = $"https://www.youtube.com/embed/{videoId.ToString()}";
                //    LabelTralier.Text = "This movie trailer found";
                //}
                else
                {
                    LabelTralier.Text = "This movie trailer not found";
                }



            }

            else
            {
                LabelResult.Text = "Movie not found";
                ImagePoster.ImageUrl = "~/img/ErrorImg.jpg";
            }



        }
    }
}