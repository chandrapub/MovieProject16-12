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
                    LabelResult.Text = nodelist[0].SelectSingleNode("@title").InnerText;
                    LabelResult.Text += " (" + nodelist[0].SelectSingleNode("@year").InnerText + ")";
                    LabelDirected.Text = "Directed by: " + nodelist[0].SelectSingleNode("@director").InnerText;
                    LabelActors.Text = "Starring: " + nodelist[0].SelectSingleNode("@actors").InnerText;
                    LabelRating.Text = "Child Rating: " + nodelist[0].SelectSingleNode("@rated").InnerText;
                    ImagePoster.ImageUrl = nodelist[0].SelectSingleNode("@poster").InnerText;

                SqlCommand cmd = null;
                string sqlupdate = "";
                SqlConnection con = UtilityClass.CreateConnection();

                try
                {
                    con.Open();                   
                    sqlupdate = "Update Action Set Counter = Counter + 1 Where Name = @title";
                    cmd = new SqlCommand(sqlupdate, con);
                    cmd.Parameters.AddWithValue("@title", name);
                    cmd.ExecuteNonQuery();
                }

                catch (Exception ex)
                {
                    LabelMessages.Text = "Dette er en Exception: " + ex.Message;
                }
                finally
                {
                    con.Close();
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
          



        }

        
    }
