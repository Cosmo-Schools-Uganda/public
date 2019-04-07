using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Script.Services;
using System.Web.Services;
using System.Threading;
using System.Threading.Tasks;
using System.IO;
using System.Drawing.Imaging;

/// <summary>
/// Summary description for Schools
/// </summary>
public class Schools
{

    static GlobalConnection GC = new GlobalConnection();
    static string Query = null;
    static SqlDataReader Reader, Reader2;

    public SchoolInformation Info { get; set; }

    public Schools()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public class EducationStructure
    {
        public enum Category
        {
            Private, Public
        }

        public enum Demons
        {
            Primary, Secondary, Nursery, University, Institution
        }

        public int CategoryId { get; set; }
        public string SchoolCategory { get; set; }
        public string SchoolDenomination { get; set; }


        public EducationStructure()
        {

        }


        public List<EducationStructure> GetStructures()
        {
            List<EducationStructure> StructureList = new List<EducationStructure>();

            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                Con.Open();

                Query = "Select * from School_Categories_View";

                using (var Com = new SqlCommand(Query, Con))
                {

                    Reader = Com.ExecuteReader();

                    while (Reader.Read())
                    {
                        EducationStructure EducStruct = new EducationStructure();

                        EducStruct.CategoryId = Convert.ToInt32(Reader["Category_Id"].ToString());

                        switch (Reader["Category"].ToString())
                        {
                            case "Public":

                                EducStruct.SchoolCategory = Category.Public.ToString();

                                break;

                            case "Private":
                                EducStruct.SchoolCategory = Category.Private.ToString();
                                break;
                        }

                        switch (Reader["Name"].ToString())
                        {
                            case "Primary":
                                EducStruct.SchoolDenomination = Demons.Primary.ToString();
                                break;

                            case "Secondary":
                                EducStruct.SchoolDenomination = Demons.Secondary.ToString();
                                break;

                            case "Nursery":
                                EducStruct.SchoolDenomination = Demons.Nursery.ToString();
                                break;

                            case "Institution":
                                EducStruct.SchoolDenomination = Demons.Institution.ToString();
                                break;

                            case "University":
                                EducStruct.SchoolDenomination = Demons.University.ToString();
                                break;
                        }

                        StructureList.Add(EducStruct);

                    }

                    Com.Dispose();
                }

                Con.Close();
            }

            return StructureList;
        }

    }


    public List<Affilliations> GetAffilliations(string AffilCat)
    {
        List<Affilliations> AffilsList = new List<Affilliations>();


        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "Select * from List_Types where Parent_id=(select id from List_Types where Category='" + AffilCat + "')";

            using (var com = new SqlCommand(Query, con))
            {
                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    Affilliations Affils = new Affilliations();

                    Affils.ID = Convert.ToInt32(Reader["id"].ToString());
                    Affils.Category = (Reader["Category"].ToString());

                    AffilsList.Add(Affils);
                }



                com.Dispose();
            }

            con.Close();
        }

        return AffilsList;
    }

    public class Affilliations
    {
        public int ID { get; set; }
        public string Category { get; set; }
    }

    public struct Affiliations
    {
        public Affilliations Gender { get; set; }

        public Affilliations Religion { get; set; }
    }


    public class SchoolInformation
    {
        public int SchoolCategory { get; set; }
        public int SchoolId { get; set; }
        public string SchoolName { get; set; }
        public string RegistrationNumber { get; set; }
        public string Moto { get; set; }
        public string Email { get; set; }
        public string WebSite { get; set; }
        public Bitmap Logo { get; set; }
        public string LogoString { get; set; }
        public EducationStructure EducStructure { get; set; }
        public List<Classes> ClassInformation { get; set; }
        public Affiliations Affiliations { get; set; }
        public Geography SchoolGeography { get; set; }

        public Addresses SchoolAddresses { get; set; }

    }

    public class Addresses
    {
        public List<string> PhoneNumbers { get; set; }
        public List<string> Emails { get; set; }

        public string FaxNumber { get; set; }
        public string Website { get; set; }
        public string FaceBookUrl { get; set; }
        public string TwitterUrl { get; set; }
    }

    public Schools GetSchool(int SchoolId)
    {
        Schools School = new Schools();

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from SchoolsView where id ='" + SchoolId + "'";

            using (var Com = new SqlCommand(Query, Con))
            {

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    SchoolInformation Sku = new SchoolInformation();
                    
                    Sku.SchoolId = Convert.ToInt32(Reader["id"].ToString());
                    Sku.SchoolName = Reader["sch_name"].ToString();
                    Sku.Moto = Reader["Moto"].ToString();
                    Sku.RegistrationNumber = Reader["sch_reg_no"].ToString();

                    School.Info = Sku;
                }

                Com.Dispose();
            }

            Con.Close();
        }

        return School;
    }

   
   

    public List<SchoolInformation> GetSchoolData(int Category)
    {

        List<SchoolInformation> MySkuls = new List<SchoolInformation>();


        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from SchoolsView where CatType='" + Category + "'";

            using (var Com = new SqlCommand(Query, Con))
            {

                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    SchoolInformation Sku = new SchoolInformation();

                    Sku.SchoolId = Convert.ToInt32(Reader["id"].ToString());
                    Sku.SchoolName = Reader["sch_name"].ToString();
                    Sku.Moto = Reader["Moto"].ToString();
                    Sku.RegistrationNumber = Reader["sch_reg_no"].ToString();


                    MySkuls.Add(Sku);

                }
                Com.Dispose();
            }

            Con.Close();
        }

        return MySkuls;
    }


    public void RegisterSchool(SchoolInformation Si)
    {
        using (var con = new SqlConnection(GC.ConnectionString))
        {
            con.Open();

            Query = "[dbo].[School_Registration]";

            using (var com = new SqlCommand(Query, con))
            {
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.Add(new SqlParameter("@Category",Si.SchoolCategory));
                com.Parameters.Add(new SqlParameter("@Registration_Number", Si.RegistrationNumber));
                com.Parameters.Add(new SqlParameter("@Name", Si.SchoolName));
                com.Parameters.Add(new SqlParameter("@motto", Si.Moto));
                com.Parameters.Add(new SqlParameter("@Gender",Si.Affiliations.Gender.ID));
                com.Parameters.Add(new SqlParameter("@Religion", Si.Affiliations.Religion.ID));
                com.Parameters.Add(new SqlParameter("@Country", Si.SchoolGeography.Country.ID));
                com.Parameters.Add(new SqlParameter("@City", Si.SchoolGeography.City.ID));
                com.Parameters.Add(new SqlParameter("@town", Si.SchoolGeography.Town));
                com.Parameters.Add(new SqlParameter("@PhoneNumber1", Si.SchoolAddresses.PhoneNumbers[0]));
                com.Parameters.Add(new SqlParameter("@PhoneNumber2", Si.SchoolAddresses.PhoneNumbers[1]));
                com.Parameters.Add(new SqlParameter("@Fax", Si.SchoolAddresses.FaxNumber));
                com.Parameters.Add(new SqlParameter("@Email1", Si.SchoolAddresses.Emails[0]));
                com.Parameters.Add(new SqlParameter("Email2", Si.SchoolAddresses.Emails[1]));
                com.Parameters.Add(new SqlParameter("Website", Si.SchoolAddresses.Website));


                byte[] LogoByte = null;

                if (Si.Logo != null)
                {

                    MemoryStream Ms = new MemoryStream();

                    Si.Logo.Save(Ms, ImageFormat.Jpeg);

                    LogoByte = Ms.ToArray();

                    System.Diagnostics.Debug.WriteLine(LogoByte[0]);

                }

                else
                {
                    LogoByte = null;
                }

                com.Parameters.Add(new SqlParameter("@Logo", LogoByte));

                Reader = com.ExecuteReader();

                while (Reader.Read())
                {
                    System.Diagnostics.Debug.WriteLine("FeedBack is:" + Reader["FeedBack"].ToString());
                }


                com.Dispose();
            }

            con.Close();
        }
    }

    public SchoolInformation GetSchoolData(int SchoolID, int SchoolCategory)
    {
        SchoolInformation SkuInfo = null;

        using (var Con = new SqlConnection(GC.ConnectionString))
        {
            Con.Open();

            Query = "Select * from SchoolsView where id='" + SchoolID + "'";

            using (var Com = new SqlCommand(Query, Con))
            {
                Reader = Com.ExecuteReader();

                while (Reader.Read())
                {
                    SkuInfo = new SchoolInformation();

                    SkuInfo.SchoolId = Convert.ToInt32(Reader["id"].ToString());
                    SkuInfo.SchoolName = Reader["sch_name"].ToString();
                    SkuInfo.Moto = Reader["Moto"].ToString();
                    SkuInfo.RegistrationNumber = Reader["sch_reg_no"].ToString();
                    SkuInfo.SchoolGeography = new Geography();
                    SkuInfo.SchoolGeography.Country = new Geography.Countries();
                    SkuInfo.SchoolGeography.City = new Geography.Cities();
                    SkuInfo.WebSite = Reader["Website"].ToString();

                    SkuInfo.SchoolGeography.Country.Name = Reader["Country"].ToString();
                    SkuInfo.SchoolGeography.City.Name = Reader["City"].ToString();
                    SkuInfo.SchoolGeography.Town = Reader["Town"].ToString();

                    if (Reader["Logo"] != DBNull.Value)
                    {

                        byte[] LogoByte = (byte[])(Reader["Logo"]);

                        SkuInfo.LogoString = Convert.ToBase64String(LogoByte);

                        MemoryStream ms = new MemoryStream(LogoByte);

                        SkuInfo.Logo = new Bitmap(ms);
                    }

                    else
                    {
                        SkuInfo.Logo = null;
                    }

                    List<Classes> MyClass = null;


                    MyClass = new List<Classes>();

                    string ClassesQuery = "select * from ClassesView where School_id='" + SchoolID + "'";

                    SkuInfo.ClassInformation = new List<Classes>();

                    using (var Con2 = new SqlConnection(GC.ConnectionString))
                    {

                        Con2.Open();

                        using (var Command = new SqlCommand(ClassesQuery, Con2))
                        {
                            Reader2 = Command.ExecuteReader();

                            while (Reader2.Read())
                            {
                                Classes cs = new Classes();
                                cs.ClassId = Convert.ToInt32(Reader2["id"].ToString());
                                cs.ClassName = Reader2["class_name"].ToString();

                                MyClass.Add(cs);

                            }

                            Command.Dispose();
                        }

                        Con2.Close();
                    }


                    SkuInfo.ClassInformation = MyClass;

                  


                }

                Com.Dispose();
            }

            Con.Close();

        }

       

        return SkuInfo;
    }


    public class Subjects
    {
        List<string> SubjectsOffered = new List<string>();

        public Subjects()
        {

        }

        [ScriptMethod()]
        [WebMethod]
        public List<string> GetSubjectsOffered(string prefixText, int count, int contextKey)
        {
            using (var con = new SqlConnection(GC.ConnectionString))
            {
                con.Open();

                //Query = "select * from SubjectsView where  SchoolId='" + SchoolID + "'";

                //if (contextKey != "0")
                //{
                //    cmdText += " and School_id = @SchoolID";
                //    cmd.Parameters.AddWithValue("@SchoolID", contextKey);
                //}


                using (var com = new SqlCommand(Query, con))
                {
                    Reader = com.ExecuteReader();

                    while (Reader.Read())
                    {
                        SubjectsOffered.Add(Reader["sbjct_title"].ToString());
                    }
                    com.Dispose();
                }

                con.Close();
            }


            return SubjectsOffered;
        }
    }

    public class Classes
    {
        public int ClassId { get; set; }
        public string ClassName { get; set; }
    }

}