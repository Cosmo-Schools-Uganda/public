using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Students_Classes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int Class_Index = 1;

        HtmlAnchor listAnchor;
        HtmlGenericControl li;

        int Secondary_index = 1;


      

        for (Class_Index = 1; Class_Index <= 7; Class_Index++)
        {
            li = new HtmlGenericControl("li");

            listAnchor = new HtmlAnchor();

           
           

            listAnchor.HRef = "#p"+Class_Index.ToString();
            listAnchor.Attributes.Add("data-toggle", "tab");
            li.Attributes.Add("class", "list-group-item-text");
         
   
            listAnchor.InnerText = "P." + Class_Index.ToString();

           

            li.Controls.Add(listAnchor);

            Primary_Classes.Controls.Add(li);

        }


        for (Secondary_index = 1; Secondary_index <= 6; Secondary_index++)
        {
             li = new HtmlGenericControl("li");

            listAnchor = new HtmlAnchor();

            listAnchor.Attributes.Add("href", "#");
            li.Attributes.Add("class", "list-group-item-text");


            if (Secondary_index == 4)
            {
                HtmlGenericControl span = new HtmlGenericControl("span");
                span.Attributes.Add("class", "badge pull-right");
                span.InnerHtml = "Current";

                listAnchor.InnerText = "S." + Secondary_index.ToString();
                listAnchor.Controls.Add(span);


            }
            else
            {
                listAnchor.InnerText = "S." + Secondary_index.ToString();

            }
           
            li.Controls.Add(listAnchor);
            if (Secondary_index <= 4)
            {
                Secondary_Classes.Controls.Add(li);

            }

            else
            {


                Secondary_Classes2.Controls.Add(li);
                
            
            }


            
        }

    }
}