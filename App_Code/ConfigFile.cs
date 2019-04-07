using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

/// <summary>
/// Summary description for PathDir
/// </summary>
public class ConfigFile
{
    Configurations Config = new Configurations();
    
    public ConfigFile(string Filepath)
    {
        //string MyPath = Filepath + ".config";

        string SectionRation = String.Format("{0}", 0);

        if (!File.Exists(Filepath))
        {
           // CreateFile(Filepath);

            Sections Section = new Sections().DefaultSection();

            Config.WriteValue("Section", "Count", Section.SectionCount.ToString(), Filepath);
            
            //foreach(int Ratio in Section.SectionWeight)
            //{

            //    SectionRation += string.Format(":", Ratio.ToString());        
                
            //}

            Config.WriteValue("Section", "Ratio", SectionRation, Filepath);

        }
        else
        {

        }
     
    }

    public ConfigFile(string Filepath,int SectionCount)
    {
        string MyPath = Filepath + ".config";

        string SectionRation = String.Format("{0}", 0);

        if (!File.Exists(Filepath))
        {
            // CreateFile(Filepath);

            Sections Section = new Sections().DefaultSection();

            Config.WriteValue("Section", "Count", SectionCount.ToString(),Filepath);

            //foreach(int Ratio in Section.SectionWeight)
            //{

            //    SectionRation += string.Format(":", Ratio.ToString());        

            //}

            Config.WriteValue("Section", "Ratio", SectionRation,Filepath);

        }
        else
        {

        }

    }


    public ConfigFile()
    {

    }
    
    //private void CreateFile(string FileName)
    //{
    //    string Dir = @"~/Teachers/QuestionPaper/Exams/Config/";
        
    //    File.Create(FilePath);
        
    //}

    public class Sections
    {
        public string SectionName { get; set; }
        public int[] SectionWeight { get; set; }
        public int SectionCount { get; set; }

        public Sections()
        {

        }

        public Sections DefaultSection()
        {

            Sections Sec = new Sections();

            Sec.SectionName = "Default Section";
            Sec.SectionCount = 0;
            Sec.SectionWeight = null;


            return Sec;
        }

        public Sections(string SectionConfigurationFilePath)
        {
            char[] Delimiters = { ',', ':', ';', '/', '.', '\t' };

            Configurations Config = new Configurations();

            SectionCount = Convert.ToInt32(Config.ReadValue("Section", "Count", SectionConfigurationFilePath));

            string[] SectionRatioString = Config.ReadValue("Section", "Ratio", SectionConfigurationFilePath).Split(Delimiters);

            int [] SectionRation = new int [5];

            if (SectionCount > 1)
            {
                try
                {
                    for (int i = 0; i < SectionCount; i++)
                    {
                        System.Diagnostics.Debug.WriteLine("Ratio: " + SectionRatioString[i]);

                        SectionRation[i] = Convert.ToInt32(SectionRatioString[i]);
                    }
                }
                catch
                {

                }
            }

            SectionWeight = SectionRation;

        }



        //public void Add(int Count, HtmlGenericControl lt)
        //{

        //    if (Count > 1)
        //    {

        //        for (int i = 0; i < Count; i++)
        //        {

        //            SectionType = new char[] { 'A', 'B', 'C', 'D', 'E' };

        //            SectionName = "Section" + " " + SectionType[i];

        //            Panel p = new Panel();

        //            p.ID = SectionName;

        //            LiteralControl Section = new LiteralControl("<h3 class=''><b>" + SectionName + "</b></h3><br/><br/>");

        //            p.Controls.Add(Section);
        //            lt.Controls.Add(p);


        //        }

        //    }
        //    else
        //    {

        //    }

        //}
    }


}