using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

/// <summary>
/// Summary description for Countries
/// </summary>
public class Geography
{

    static GlobalConnection GC = new GlobalConnection();
    static string Querry;
    static SqlDataReader Reader;

    public Countries Country { get; set; }
    public Cities City { get; set; }

    public string Town { get; set; }



    public class Cities
    {

        public int ID { get; set; }
        public string Name { get; set; }
        public Bitmap Map { get; set; }
        public int ParentId { get; set; }


        public Cities()
        {

        }


        public List<Cities> GetCities(int ID)
        {
            List<Cities> CityList = new List<Cities>();

            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                Con.Open();

                Querry = "Select * from GeographyArea where Parent_id='"+ID+"'";

                using (var Com = new SqlCommand(Querry, Con))
                {
                    Reader = Com.ExecuteReader();

                    while (Reader.Read())
                    {
                        Cities City = new Cities();

                        City.ID = Convert.ToInt32(Reader["Geo_Area_Id"].ToString());

                        City.Name = Reader["Geo_Name"].ToString();

                        if (Reader["Parent_id"] == DBNull.Value)
                        {

                        }
                        else
                        {

                            City.ParentId = Convert.ToInt32(Reader["Parent_id"].ToString());
                        }


                        CityList.Add(City);

                    }

                    Com.Dispose();

                }

                Con.Close();
            }

            return CityList;
        }

    }

    public class Countries
    {

        public int ID { get; set; }
        public string Name { get; set; }
        public Bitmap Map { get; set; }
        public int ParentId { get; set; }


        public Countries()
        {

        }

        public Countries GetCountry(int CountryName)
        {
            Countries Country = new Countries();

            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                Con.Open();

                Querry = "select * from GeographyArea where Parent_id=NULL and Geo_Name='" + CountryName + "'";

                using (var Com = new SqlCommand(Querry, Con))
                {
                    Reader = Com.ExecuteReader();

                    while (Reader.Read())
                    {

                        Country.ID = Convert.ToInt32(Reader["Geo_Area_Id"].ToString());

                        Country.Name = Reader["Geo_Name"].ToString();

                        if (Reader["Parent_id"] == DBNull.Value)
                        {

                        }
                        else
                        {

                            Country.ParentId = Convert.ToInt32(Reader["Parent_id"].ToString());
                        }


                    }

                    Com.Dispose();

                }

                Con.Close();
            }

            return Country;
        }


        public List<Countries> GetCountries()
        {
            List<Countries> Countries = new List<Countries>();
            Countries Country = new Countries();


            using (var Con = new SqlConnection(GC.ConnectionString))
            {
                Con.Open();

                Querry = "select * from GeographyArea where Geo_Level = 1";

                using (var Com = new SqlCommand(Querry, Con))
                {
                    Reader = Com.ExecuteReader();

                    while (Reader.Read())
                    {
                        Country = new Geography.Countries();

                        Country.ID = Convert.ToInt32(Reader["Geo_Area_Id"].ToString());
                        Country.Name = Reader["Geo_Name"].ToString();

                        if (Reader["Parent_id"] == DBNull.Value)
                        {

                        }

                        else
                        {

                            Country.ParentId = Convert.ToInt32(Reader["Parent_id"].ToString());
                        }

                        Countries.Add(Country);

                    }

                    Com.Dispose();

                }

                Con.Close();
            }

            return Countries;
        }

    }

    public Geography()
    {

        int Id;
        string Name = null;

        Bitmap Map = null;

    }


    public Geography(string CountryName)
    {

    }


    //public List<Geography> GetGeography(string ParentGeography)
    //{

    //    List<Geography> Geo = new List<Geography>();

    //    using (var Con=new SqlConnection())

    //}

}