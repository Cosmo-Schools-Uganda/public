using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using CosmoSearcher;

/// <summary>
/// Summary description for CosmoService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//[ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CosmoService : System.Web.Services.WebService
{

    static Schools.EducationStructure EducationStructures = new Schools.EducationStructure();
    static Schools schools = new Schools();
    static Geography Geog = new Geography();
    static Tests Test = new Tests();
    CosmoSearcher.Searcher Searcher=new Searcher();
    GlobalConnection GC = new GlobalConnection();


    public CosmoService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public List<Schools.EducationStructure> getStructures()
    {

        return EducationStructures.GetStructures();

    }

    [WebMethod]
    public List<Schools.Affilliations> GetAffiliations(string Category)
    {
        return schools.GetAffilliations(Category);
    }

    [WebMethod]
    public List<Geography.Countries> GetCountries()
    {
        Geography.Countries GeogCount = new Geography.Countries();

        return GeogCount.GetCountries();
    }


    [WebMethod]
    public List<Geography.Cities> GetCities(int CountryID)
    {
        Geography.Cities GeogCities = new Geography.Cities();

        return GeogCities.GetCities(CountryID);
    }


    [WebMethod]
    public List<Tests> GetTests()
    {
        int UserID = Convert.ToInt32(Context.User.Identity.Name.ToString());

        Students Student = new Students(UserID);
        
            Test = new Tests();
 
        return Test.GetIncomingTests(new Classes(Student.ID).ClassID);
    } 

    [WebMethod]
    public List<CosmoSearcher.Person> Search(string keyword)
    {
        
        Searcher.ConnectionString = GC.ConnectionString;

        return Searcher.Search(keyword);
    } 
}
