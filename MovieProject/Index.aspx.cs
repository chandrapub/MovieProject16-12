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
            
            try
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
                    foreach (XmlNode node in nodelist)
                    {
                        string id = node.SelectSingleNode("@poster").InnerText;
                        ImagePoster.ImageUrl = id;
                    }
                    LabelResult.Text = nodelist[0].SelectSingleNode("@title").InnerText;
                    LabelResult.Text += " (" + nodelist[0].SelectSingleNode("@year").InnerText + ")";
                    LabelDirected.Text = "Directed by: " + nodelist[0].SelectSingleNode("@director").InnerText;
                    LabelActors.Text = "Starring: " + nodelist[0].SelectSingleNode("@actors").InnerText;
                    LabelRating.Text = "Child Rating: " + nodelist[0].SelectSingleNode("@rated").InnerText;
                    ImagePoster.ImageUrl = nodelist[0].SelectSingleNode("@poster").InnerText;
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
            catch (XmlException ex)
            {
                LabelResult.Text = ex.ToString();
            }
            catch (Exception ex)
            {
                LabelResult.Text = ex.ToString();
            }
            finally
            {
                
            }



        }

        
    }
}