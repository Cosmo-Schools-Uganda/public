using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentRegistration : System.Web.UI.Page
{

    int CurrentId;

    Users User = new Users();

    protected void Page_Load(object sender, EventArgs e)
    {
        CurrentId = Convert.ToInt32(Context.User.Identity.Name);
      
        System.Diagnostics.Debug.WriteLine("DF: " + ViewState["SchoolId"]);

        // SqlDataSource2.SelectCommand = "select * from [ClassesView] where School_id=1";

        if (!IsPostBack)
        {
            LoadData();

            LoadPrimary();
            LoadSecondary();
        }

    }

    [WebMethod]
    public static List<Schools.SchoolInformation> GetSchools(int Category)
    {
        
        Schools sc = new Schools();

        return sc.GetSchoolData(Category);

    }

    [WebMethod]
    public static Schools.SchoolInformation GetSchool(int SchoolId,int Category)
    {
         Schools sc = new Schools();
        
        return sc.GetSchoolData(SchoolId,Category);
     

    }

    public void EnableCombinations(bool Value)
    {
        foreach (Control c in CombinationRow.Controls)
        {
            if (c is TextBox)
            {
                TextBox C = (TextBox)c;
                C.Enabled = Value;
            }
            else if (c is DevExpress.Web.ASPxTextBox)
            {
                ASPxTextBox T = (ASPxTextBox)c;
                T.Enabled = Value;
            }
        }

    }

    private void LoadData()
    {
        SchoolsDrop1.Items.Clear();
        SchoolsDrop2.Items.Clear();
        EnableCombinations(false);
     

        foreach(Schools.SchoolInformation Skul in GetSchools(6)) 
        {
            ListItem Li = new ListItem(Skul.SchoolName, Skul.SchoolId.ToString());
            SchoolsDrop1.Items.Add(Li);
        }

        //foreach (Schools.SchoolInformation Skul2 in GetSchools(3))
        //{
        //    ListItem Li = new ListItem(Skul2.SchoolName, Skul2.SchoolId.ToString());
        //    SchoolsDrop1.Items.Add(Li);
        //}

        //foreach (Schools.SchoolInformation Skul in GetSchools(2))
        //{
        //    ListItem Li = new ListItem(Skul.SchoolName, Skul.SchoolId.ToString());
        //    SchoolsDrop2.Items.Add(Li);
        //}

        foreach (Schools.SchoolInformation Skul2 in GetSchools(5))
        {
            ListItem Li = new ListItem(Skul2.SchoolName, Skul2.SchoolId.ToString());
            SchoolsDrop2.Items.Add(Li);
        }


    }

   


    protected void RegisterButton_Click(object sender, EventArgs e)
    {
      //  Response.Redirect("Home.aspx");
        
    }

    protected void SchoolsDrop1_SelectedIndexChanged(object sender, EventArgs e)
    {

        LoadPrimary();
    }

    void LoadPrimary()
    {
        ClassesDrop1.Items.Clear();

        Schools.SchoolInformation SKuinfo = new Schools.SchoolInformation();
        SKuinfo = GetSchool(Convert.ToInt32(SchoolsDrop1.SelectedItem.Value), 6);
        BioName1.InnerText = SKuinfo.SchoolName;
        BioReg1.InnerText = SKuinfo.RegistrationNumber;
        BioMotto.InnerText = SKuinfo.Moto;
        BioWebsite1.InnerText = SKuinfo.WebSite;
        BioWebLink1.HRef = "http://" + SKuinfo.WebSite;
        BioWebLink1.Target = "_blank";

        Geography SkulGeog = new Geography();
        SkulGeog.Country = new Geography.Countries();
        SkulGeog.City = new Geography.Cities();

        SkulGeog.Country = SKuinfo.SchoolGeography.Country;
        SkulGeog.City = SKuinfo.SchoolGeography.City;
        SkulGeog.Town = SKuinfo.SchoolGeography.Town;

        System.Diagnostics.Debug.WriteLine(SkulGeog.Country.Name);

        if (SKuinfo.LogoString != null)
        {
            BioImage1.Src = "data:image/jpg;base64," + SKuinfo.LogoString;

        }
        else
        {
            BioImage1.Src = "Users/Images/NoImage.png";
        }

        BioAddr1.InnerHtml = String.Format("{0}, {1}, {2}", SkulGeog.Country.Name, SkulGeog.City.Name, SkulGeog.Town);


        foreach (Schools.Classes Class in SKuinfo.ClassInformation)
        {
            ListItem Li = new ListItem(Class.ClassName, Class.ClassId.ToString());

            ClassesDrop1.Items.Add(Li);

        }

    }

    void LoadSecondary()
    {
        ClassesDrop2.Items.Clear();

        Schools.SchoolInformation SKuinfo = new Schools.SchoolInformation();
        SKuinfo = GetSchool(Convert.ToInt32(SchoolsDrop2.SelectedItem.Value), 5);
        BioName2.InnerText = SKuinfo.SchoolName;
        BioReg2.InnerText = SKuinfo.RegistrationNumber;
        BioMotto2.InnerText = SKuinfo.Moto;
        BioWebsite2.InnerText = SKuinfo.WebSite;
        BioLink2.HRef = "http://" + SKuinfo.WebSite;
        BioLink2.Target = "_blank";

        Geography SkulGeog = new Geography();
        SkulGeog.Country = new Geography.Countries();
        SkulGeog.City = new Geography.Cities();

        SkulGeog.Country = SKuinfo.SchoolGeography.Country;
        SkulGeog.City = SKuinfo.SchoolGeography.City;
        SkulGeog.Town = SKuinfo.SchoolGeography.Town;

        System.Diagnostics.Debug.WriteLine(SkulGeog.Country.Name);

        if (SKuinfo.LogoString != null)
        {
            BioImage2.Src = "data:image/jpg;base64," + SKuinfo.LogoString;

        }
        else
        {
            BioImage2.Src = "Users/Images/NoImage.png";
        }

        BioAddr2.InnerHtml = String.Format("{0}, {1}, {2}", SkulGeog.Country.Name, SkulGeog.City.Name, SkulGeog.Town);


        foreach (Schools.Classes Class in SKuinfo.ClassInformation)
        {
            ListItem Li = new ListItem(Class.ClassName, Class.ClassId.ToString());

            ClassesDrop2.Items.Add(Li);


        }
    }

    protected void SchoolsDrop2_SelectedIndexChanged(object sender, EventArgs e)
    {

        LoadSecondary();

    }

    protected void ClassesDrop2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ClassesDrop2.SelectedItem.ToString() =="S.5" || ClassesDrop2.SelectedItem.ToString() == "S.6")
        {
            EnableCombinations(true);
        }

        else
        {

            EnableCombinations(false);

        }
    }

    protected void RegisterButton2_Click(object sender, EventArgs e)
    {
       

        if (User.RegisterInSchool(CurrentId,Convert.ToInt32(SchoolsDrop2.SelectedItem.Value),Convert.ToInt32(ClassesDrop2.SelectedItem.Value), RegNumberBox.Text, LicenseBox.Value.ToString()))

        {

            System.Diagnostics.Debug.WriteLine("Registration: " + true);
            ErrorAlert.Visible = false;

            Response.Redirect("UserPage.aspx");

        }

        else

        {

                ErrorAlert.Visible = true;
                ErrorMessage.InnerText = "Sorry, The Registration Number or License Used may be Wrong";
            
        }

        RegNumberBox.Text = "";
        LicenseBox.Value = "";

    }
}