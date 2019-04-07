using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchoolRegistration : System.Web.UI.Page
{

    Geography Geo = new Geography();
    static Schools.EducationStructure EducationStructures = new Schools.EducationStructure();

    protected void Page_Load(object sender, EventArgs e)
    {
        // ScriptManager.GetCurrent(this).RegisterPostBackControl(RegisterBtn);





        if (!IsPostBack)
        {
            LoadData();
            //if (Session["FileUpload"] == null && LogoUpload.HasFile)
            //{
            //    Session["FileUpload"] = LogoUpload;
            //}

            //else if (Session["FileUpload"] != null && (!LogoUpload.HasFile))
            //{
            //    LogoUpload = (FileUpload)Session["FileUpload"];
            //}

            //else if (LogoUpload.HasFile)
            //{
            //    Session["FileUpload"] = LogoUpload;
            //}
        }
    }

    public void LoadData()
    {

        CountryDrop.Items.Clear();
        SchoolCategoriesCombo.Items.Clear();
        GenderDrop.Items.Clear();
        ReligionDrop.Items.Clear();
        Geography.Countries Countries = new Geography.Countries();


        CosmoService Csm = new CosmoService();

        foreach(Schools.EducationStructure Structure in Csm.getStructures())
        {
            ListItem Li = new ListItem(Structure.SchoolCategory + " [" + Structure.SchoolDenomination + ']', Structure.CategoryId.ToString());
            SchoolCategoriesCombo.Items.Add(Li);

        }

        foreach (Schools.Affilliations Afils in Csm.GetAffiliations("Religion"))
        {
            ListItem Li = new ListItem(Afils.Category, Afils.ID.ToString());
            ReligionDrop.Items.Add(Li);
        }

        foreach (Schools.Affilliations Afils in Csm.GetAffiliations("School Genders"))
        {
            ListItem Li = new ListItem(Afils.Category, Afils.ID.ToString());
            GenderDrop.Items.Add(Li);
        }

        foreach (Geography.Countries Country in Countries.GetCountries())
        {

            ListItem Li = new ListItem(Country.Name, Country.ID.ToString());

            CountryDrop.Items.Add(Li);

        }

    }




    protected void SchoolCategoriesCombo_SelectedIndexChanged(object sender, EventArgs e)
    {
        //  System.Diagnostics.Debug.WriteLine(SchoolCategoriesCombo.Value);
    }

    [WebMethod]
    public static List<Schools.EducationStructure> GetStructures()
    {

        return EducationStructures.GetStructures();

    }


    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        Schools Schools = new Schools();
        Schools.Info = new Schools.SchoolInformation();

        Schools.Affiliations SkulAfils = new Schools.Affiliations();

        Schools.Affilliations AfilCategories = new Schools.Affilliations();
        AfilCategories.ID = Convert.ToInt32(GenderDrop.SelectedItem.Value);

        SkulAfils.Gender = AfilCategories;

        

        AfilCategories.ID = Convert.ToInt32(ReligionDrop.SelectedItem.Value);
        SkulAfils.Religion = AfilCategories;

        Schools.Info.Affiliations = SkulAfils;

        Schools.Info.SchoolCategory = Convert.ToInt32(SchoolCategoriesCombo.SelectedValue);
        Schools.Info.SchoolName = SchoolName.Value;
        Schools.Info.RegistrationNumber = RegistrationNumberBox.Text;
        Schools.Info.Moto = SchoolMotto.Value;

        Geography SkulGeog = new Geography();

        SkulGeog.Country = new Geography.Countries();
        SkulGeog.Country.ID =Convert.ToInt32(CountryDrop.SelectedItem.Value);

        SkulGeog.City = new Geography.Cities();
        SkulGeog.City.ID = Convert.ToInt32(CityDrop.SelectedItem.Value);
        SkulGeog.Town = TownBox.Text;
        Schools.Info.SchoolGeography = SkulGeog;

        Schools.Addresses SkulAddresses = new Schools.Addresses();
        SkulAddresses.PhoneNumbers = new List<string>();
       
        SkulAddresses.PhoneNumbers.Add(PhoneNumberBox1.Text);
        SkulAddresses.PhoneNumbers.Add(PhoneNumberBox2.Text);

        SkulAddresses.Emails = new List<string>();
        SkulAddresses.Emails.Add(MailBox1.Text);
        SkulAddresses.Emails.Add(MailBox2.Text);


        Schools.Info.SchoolAddresses = SkulAddresses;

        Schools.Info.SchoolAddresses.FaxNumber = FaxBox.Text;
       
        Schools.Info.SchoolAddresses.Website = WebBox.Value;

        if (LogoUpload.HasFile)
        {
            Bitmap ImageBitmap = new Bitmap(LogoUpload.PostedFile.InputStream);

            Schools.Info.Logo = ImageBitmap;

        }
        else
        {
            Schools.Info.Logo = null;
        }


        Schools.RegisterSchool(Schools.Info);

      
        System.Diagnostics.Debug.WriteLine("Value is: " + CountryDrop.SelectedItem);


        //Response.Redirect("Home.aspx");
    }

    protected void CountryDrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Val is:" + CountryDrop.SelectedItem.Value);

        CityDrop.Items.Clear();

        Geography.Cities Cities = new Geography.Cities();

        foreach (Geography.Cities City in Cities.GetCities(Convert.ToInt32(CountryDrop.SelectedItem.Value)))
        {
            ListItem Li = new ListItem(City.Name, City.ID.ToString());
            CityDrop.Items.Add(Li);
        }

    }
}