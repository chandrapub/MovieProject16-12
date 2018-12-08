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
                    sqlupdate = "Update Action Set Counter = Counter + 1 Where Name = @title";
                    sqlinsert = "UPDATE Action SET PosterUrl = @picture WHERE Name = @title";
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

                //try
                //{
                //    string trailer = "";
                //    trailer = UtilityClass.TrailerAPI(TextBoxName.Text);
                //    File.WriteAllText(Server.MapPath("~/MyFiles/LatestTrailerResult.xml"), trailer);
                //    XmlDocument trailerdoc = new XmlDocument();
                //    trailerdoc.LoadXml(trailer);


                //    if (trailerdoc.SelectSingleNode("/trailers/trailer/video_title").InnerText == "Trailer")
                //    {
                //        XmlNodeList trailerlist = trailerdoc.SelectNodes("/trailers/trailer");
                //        LabelResult.Text += trailerlist[0].SelectSingleNode("trailer_id").InnerText;


                //    }
                //    else
                //    {
                //        LabelMessages.Text = "No trailer...";
                //        return;
                //    }
                //}
                //catch (Exception ex)
                //{
                //    LabelMessages.Text = ex.ToString();
                //}

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
          



        }

        
    }
