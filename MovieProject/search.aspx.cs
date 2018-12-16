using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieProject
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page lastPage = (Page)Context.Handler;
            LabelSearch.Text = ((TextBox)lastPage.FindControl("TextBoxName")).Text;
            string searchWord = ((TextBox)lastPage.FindControl("TextBoxName")).Text;
           
            SqlDataSourceSearch.SelectCommand = "Select top 6 MovieName, PosterUrl from Movies WHERE MovieName LIKE '%@search%' ORDER by counter desc";
            SqlDataSourceSearch.SelectParameters.Add("@search", searchWord);
        }
        public void anchor2_ServerClick(object sender, EventArgs e)
        {

        }
    }
}