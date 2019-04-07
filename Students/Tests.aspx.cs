using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;


public partial class Students_Tests : System.Web.UI.Page 
{

    int UserID;
    Tests Ts = new Tests();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        UserID=Convert.ToInt32(Context.User.Identity.Name.ToString());

         Students Student = new Students(UserID);

         try
         {
             Session["IncomingPaper"] = new Tests().GetIncomingTests(new Classes(Student.ID).ClassID)[0].ExamId;
         }
         catch
         {
             Session["IncomingPaper"] = 0;
         }
        if (!IsPostBack)
        { 
            UpdateSchedule(Ts.GetIncomingTests(12));

        }
        else
        {
          
        }
       
    }

    protected void PaperClick(object sender,EventArgs e)
    {
        
        HtmlAnchor paper = (HtmlAnchor)sender;

        System.Diagnostics.Debug.WriteLine("Paper has been clicked: " +paper.InnerHtml );
    }


    protected void resultsclick(object sender, EventArgs e)
    {
        //Response.Redirect("#results");
    }

    //ASPxSchedulerStorage Storage { get { return ASPxScheduler1.Storage; } }

  
    private void UpdateSchedule(List<Tests> Ls)
    {
 
    }

}