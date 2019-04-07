using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Services;
using System.Web.Script.Services;

using System.Collections;
using System.Data;



struct FigureTypes
{
    private char[] alpha;
    private string[] romans;

    public char[] Alphabet
    {
        get
        {
            alpha = new char[6];

            int count = 0;
            for (char i = 'A'; i <= 'E'; i++)
            {
                alpha[count] = i;

                count++;
            }

            return alpha;
        }
    }

    public string[] Romans
    {
        get
        {
            romans = new string[] { "I", "II", "III", "IV", "V" };
            return romans;
        }
    }

}



public partial class Teachers_QuestionBank_QuestionBanker : System.Web.UI.UserControl

{
    
    DataBase.Questions Questions;
    DataBase.ObjectivesObj Objectives;
    QuestionGenerator QG = new QuestionGenerator();
    DataBase.QuestionStructure Qs;
    DataBase.Questions.ObjectivesContent ObjContent;

    string Answer = null;
    int CurrentNumber;
    BarcodeLib.Barcode.QRCode QrCode = new BarcodeLib.Barcode.QRCode();
    BarcodeLib.Barcode.Linear Bcode = new BarcodeLib.Barcode.Linear();
    public int SectionNumber { get; set; }
  

    private bool IsEdited = false;

    string[] QuestionTypes = new string[] { "Objectives", "Structured", "Mixed Mode" };

    public string TestCodeData { get; set; }
    

    public string TestCode
    {
        get
        {
            return Bcode.Data;
        }
        set
        {
            TestCodeData = value;
        }
    }


    public Teachers_QuestionBank_QuestionBanker(string Tcode)
    {
        this.TestCodeData = Tcode;
    }

    public Teachers_QuestionBank_QuestionBanker() {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
        GenerateOptionFigureTypes(false);
        Bcode.Type = BarcodeLib.Barcode.BarcodeType.CODE39;
        Bcode.ShowStartStopChar = false;
        Bcode.BarWidth = 1;
        Bcode.BarHeight = 50;
        Bcode.LeftMargin = 5;
        Bcode.RightMargin = 5;
        Bcode.TopMargin = 5;
        Bcode.BottomMargin = 5;
        Bcode.Data = TestCodeData;

        using (Bitmap bitMap = Bcode.drawBarcode())
        {
            using (MemoryStream ms = new MemoryStream())
            {
                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                //barcode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }

        }


        Questions = new DataBase.Questions(TestCodeData);

       // Objectives = new DataBase.ObjectivesObj(TestCode);

        if (ViewState["Questionaire"] == null)
        {
            ViewState["Questionaire"] = "none";
        }
        

        if (ViewState["QuestObjectives"] == null)
        {
            ViewState["QuestObjectives"] = new object[] { };
        }


        if (ViewState["Section"] == null)
        {
            ViewState.Add("Section",0);

        }


        CurrentNumber = Convert.ToInt32(ViewState["QNumber"]);
        
        
        if (IsPostBack)
        {
                
          
            if (ViewState["ObjectivesCount"] == null)
            {
                ViewState.Add("ObjectivesCount", 1);

            }

            CurrentNumber = Convert.ToInt32(ViewState["QNumber"]);

            if (Convert.ToInt32(ViewState["Section"]) == 0)
            {
                SectionNumber = 1;
            }
            else
            {
            
                SectionNumber = 2;
            }

            System.Diagnostics.Debug.WriteLine(ViewState["Section"]);
            
        }

        else
        {

            if (ViewState["QNumber"] == null)
            {
                ViewState["QNumber"] = 1;

                CurrentNumber = Convert.ToInt32(ViewState["QNumber"]);
            }

            if (Convert.ToInt32(ViewState["Section"]) == 0)
            {
                SectionNumber = 1;
            }
            else
            {
                SectionNumber = 2;
            }


            LoadData(CurrentNumber, SectionNumber);
        }

      

    }

    private void LoadQuestionTypes()
    {
        QuestionTypeDropDown.Items.Clear();

        foreach (string Type in QuestionTypes)
        {
            QuestionTypeDropDown.Items.Add(Type);
        }
    }
    
    private void PopulateObjectives(int Count)
    {
        int start=1;
        int Threshold=5;

        for (start = 1; start <= Count; start++)
        {
            obtable.Rows[start].Visible = true;
        }
        for (start = Threshold ; start > Count; start--)
        {
            obtable.Rows[start].Visible = false;
        }
    
    }

    private void DisableControls(bool Disable)
    {
        
        if (Disable)
        {
            QuestionTextArea.Disabled = true;

            foreach (ListItem li in sell.Items)
            {
                li.Attributes.Add("disabled","disabled");
            }

            QuestionTypeDropDown.Items.Clear();
            

            int index = 1;
            foreach (HtmlTableRow Hrow in obtable.Rows)
            {

                if (Hrow.ID != "header_row")
                {
                    HtmlInputText Htext = (HtmlInputText)Hrow.Cells[2].Controls[0].FindControl("TextBox" + index.ToString());
                    HtmlInputCheckBox Hcheck = (HtmlInputCheckBox)Hrow.Cells[0].Controls[0].FindControl("chk" + index.ToString());
                    RadioButton Hradio = (RadioButton)Hrow.Cells[3].Controls[0].FindControl("AnswerRadio" + index.ToString());
                    
                    Htext.Disabled = true;
                    Hcheck.Disabled = true;
                    Hradio.Enabled = false;


                    index++;
                
                }
                
            }

       
          //  sell.Items.Clear();

        }
        else
        {
            QuestionTextArea.Disabled = false;
            sell.Enabled = true;
           // sell.Items.IsReadOnly=false;

            int index = 1;
            foreach (HtmlTableRow Hrow in obtable.Rows)
            {

                if (Hrow.ID != "header_row")
                {
                    HtmlInputText Htext = (HtmlInputText)Hrow.Cells[2].Controls[0].FindControl("TextBox" + index.ToString());
                    HtmlInputCheckBox Hcheck = (HtmlInputCheckBox)Hrow.Cells[0].Controls[0].FindControl("chk" + index.ToString());
                    RadioButton Hradio = (RadioButton)Hrow.Cells[3].Controls[0].FindControl("AnswerRadio" + index.ToString());

                    Htext.Disabled = false;
                    Hcheck.Disabled = false;
                    Hradio.Enabled = true;


                    index++;

                }

            }

        }
    }

    private List<DataBase.Questions.ObjectivesContent> GetObjectiveData()
    {
 
        List<DataBase.Questions.ObjectivesContent> Oblist = new List<DataBase.Questions.ObjectivesContent>();
        
        int index = 1;

        foreach (HtmlTableRow Hrow in obtable.Rows)
        {
            DataBase.Questions.ObjectivesContent Obc = new DataBase.Questions.ObjectivesContent();

            if (Hrow.ID != "header_row")
            {
                int validation = 0;

                HtmlInputText Htext = (HtmlInputText)Hrow.Cells[2].Controls[0].FindControl("TextBox" + index.ToString());
                RadioButton Hradio = (RadioButton)Hrow.Cells[3].Controls[0].FindControl("AnswerRadio"+index.ToString());
                HiddenField Hfield = (HiddenField)Hrow.Cells[4].Controls[0].FindControl("HiddenField" + index.ToString());

                if (Htext.Value.Length != 0)
                {

                    if (Hradio.Checked)
                    {
                        validation = 1;
                    }
                    else
                    {
                        validation = 0;
                    }

                    Obc.Detail = Htext.Value;
                    Obc.validity = validation;

                    if (Hfield.Value == string.Empty)
                    {

                        Obc.ObjID = 0;
                    }
                    else
                    {
                        Obc.ObjID = Convert.ToInt32(Hfield.Value);
                    }

                    Oblist.Add(Obc);

                    ObjContent = Oblist[0];

                    System.Diagnostics.Debug.WriteLine("First:" + Htext.Value);
            
                }
  
                else
                {
                    System.Diagnostics.Debug.WriteLine("First:" + "There's Nothing");
            
                }
                index++;
        
            }

         
        }

        return Oblist;
    }

    public void LoadData(int QuestionNumber,int SectionNumber)
    {
        ClearTemplate();

        char[] Sections = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();


        for (int i = 0; i <= SectionNumber; i++)
        {
            ListItem Li = new ListItem();
            Li.Value = "Section" + " " + Sections[i];

            SectionSelection.Items.Add(Li);




            if (QuestionNumber == 1)
            {
                ButtonPrev.Disabled = true;
            }

            else
            {
                ButtonPrev.Disabled = false;

            }

            qt.InnerText = "Qtn: " + QuestionNumber;

            if (Questions.CheckForQuestionExistance(TestCodeData, QuestionNumber, SectionNumber))
            {
                int count = 1;
                DisableControls(true);
                ButtonNext.InnerText = "NEXT";

                Questions.RetrieveData(QuestionNumber, SectionNumber);

                QuestionTextArea.InnerText = Questions.QuestionSructure.Question;

                List<string> data = new List<string>();

                HtmlTableRow Htr = new HtmlTableRow();

                switch (Questions.QuestionSructure.QuestionType)
                {
                    case 1:
                        QuestionTypeDropDown.Items.Add(QuestionTypes[0].ToString());
                        break;

                    case 2:
                        QuestionTypeDropDown.Items.Add(QuestionTypes[1].ToString());
                        break;

                    case 3:
                        QuestionTypeDropDown.Items.Add(QuestionTypes[2].ToString());
                        break;
                }

                if (Questions.QuestionSructure.Objectives != null)
                {

                    foreach (DataBase.Questions.ObjectivesContent obc in Questions.QuestionSructure.Objectives)
                    {

                        HtmlInputText HtText = (HtmlInputText)obtable.Rows[count].Cells[2].Controls[0].FindControl("TextBox" + count.ToString());

                        HtText.Value = obc.Detail;

                        RadioButton Hradio = (RadioButton)obtable.Rows[count].Cells[3].Controls[0].FindControl("AnswerRadio" + count.ToString());

                        HiddenField Hfield = (HiddenField)obtable.Rows[count].Cells[4].Controls[0].FindControl("HiddenField" + count.ToString());

                        Hfield.Value = obc.ObjID.ToString();


                        if (obc.validity == 1)
                        {
                            Hradio.Checked = true;
                        }
                        else
                        {
                            Hradio.Checked = false;
                        }

                        PopulateObjectives(count);

                        count++;
                    }


                    ViewState["ObjectivesReturnedCount"] = count;

                }
                else
                {

                    PopulateObjectives(0);

                }

                ButtonNext.Visible = true;
                ButtonAdd.Visible = false;

            }
            else
            {

                ButtonAdd.Visible = true;
                ButtonNext.Visible = false;
                DisableControls(false);
                LoadOptions();

                LoadQuestionTypes();

            }

        }

       
    }


    private void ClearTemplate(int[] index)
    {
     
        

        foreach (int selectedIndex in index)
        {
            HtmlInputText Htext = (HtmlInputText)obtable.Rows[selectedIndex].Cells[2].Controls[0].FindControl("TextBox" + selectedIndex.ToString());


            if (Htext != null)
            {
                Htext.Value = "";

            }
        }
    }
    private void ClearTemplate()
    {

        int index = 1;

       
        SectionSelection.Items.Clear();

        sell.Items.Clear();

        QuestionTypeDropDown.Items.Clear();

        QuestionTextArea.Value = "";

        foreach (HtmlTableRow Hrow in obtable.Rows)
        {
            if (Hrow.ID != "header_row")
            {

                HtmlInputText Htext =(HtmlInputText)Hrow.Cells[2].Controls[0].FindControl("TextBox"+index.ToString());
        
                Htext.Value = string.Empty;
                HiddenField HField = (HiddenField)Hrow.Cells[4].Controls[0].FindControl("HiddenField" + index.ToString());
                HField.Value = "";
                index++;
            }

            PopulateObjectives(0);

        }
    }

    private void GenerateOptionFigureTypes(bool IsRoman)
    {
        FigureTypes f = new FigureTypes();

        int count = 0;

        if (IsRoman)
        {
            foreach (HtmlTableRow hrow in obtable.Rows)
            {
                if (hrow.ID != "header_row")
                {

                    hrow.Cells[1].InnerHtml = f.Romans[count];
                    count++;
                }

            }

        }
        else
        {
            foreach (HtmlTableRow hrow in obtable.Rows)
            {
                if (hrow.ID != "header_row")
                {
                    hrow.Cells[1].InnerHtml = f.Alphabet[count].ToString();

                    count++;
                }


            }

        }

    }


    private void AssignObjectIds(HtmlTable Htable)
    {
        int count = 0;

        foreach (HtmlTableRow hrow in Htable.Rows)
        {
            if (hrow.ID != "header_row")
            {
                hrow.Cells[2].Controls[0].ID = "InputText" + count.ToString();

                //  HtmlInputText htext=((HtmlInputText)hrow.Cells[2].FindControl("InputText0"));

                Debug.Print(hrow.Cells[2].Controls[0].ID);

                //if (u is HtmlInputText)
                //{
                //    u.ID = "InputText" + count.ToString();
                //}

                //else if (u is HtmlInputRadioButton)
                //{
                //    u.ID = "InputRadio" + count.ToString();
                //}

                //else if (u is HtmlInputCheckBox)
                //{
                //    u.ID = "InputCheckBox" + count.ToString();
                //}
                count++;

            }
            else
            {

            }

        }

    }

    private void EncodeQuestion(int QuestionNumber, string Question, string[] objectives, string answer, string outputpath)
    {
        //QuestionNumber = Convert.ToInt32(ViewState["QuestionNumber"]);
        //Question = QuestionTextArea.Value;

        FigureTypes f = new FigureTypes();

        List<string> validatedobjectives = new List<string>();
        int valcount = 0;

        foreach (string obj in objectives)
        {
            if (obj != "")
            {
                validatedobjectives.Add(obj);
                valcount++;
            }
            else
            {

            }

        }

        if (!File.Exists(outputpath))
        {
            using (System.IO.StreamWriter swriter = new System.IO.StreamWriter(outputpath))
            {

                swriter.Write(QuestionNumber + ". ");
                swriter.WriteLine(Question + System.Environment.NewLine);

                for (int count = 0; count < valcount - 1; count++)
                {
                    swriter.Write(f.Alphabet[count] + " " + validatedobjectives.ElementAt(count) + "   ");

                }

                swriter.WriteLine();

                swriter.WriteLine("Answer: " + answer);

                swriter.WriteLine();
                swriter.WriteLine();

                swriter.Flush();
                swriter.Close();

            }

        }

        else
        {
            using (StreamWriter sw = File.AppendText(outputpath))

            {
                sw.Write(QuestionNumber + ". ");
                sw.WriteLine(Question + System.Environment.NewLine);

                for (int count = 0; count < valcount - 1; count++)
                {
                    sw.Write(f.Alphabet[count] + " " + validatedobjectives.ElementAt(count) + "   ");

                }

                sw.WriteLine();

                sw.WriteLine("Answer: " + answer);

                sw.WriteLine();
                sw.WriteLine();

                sw.Flush();
                sw.Close();

            }
        }

    }



    protected void DataDelete(object sender, EventArgs e)
    {

        IsEdited =Convert.ToBoolean(ViewState["Edited"]);

        if (IsEdited)
        {

            List<int> indexer = new List<int>();

            int count = 1;
            HtmlInputCheckBox Hcheck = new HtmlInputCheckBox();
            HiddenField HField = new HiddenField();

            foreach (HtmlTableRow Hrow in obtable.Rows)
            {
                if (Hrow.ID != "header_row")
                {
                    Hcheck = (HtmlInputCheckBox)Hrow.Cells[0].Controls[0].FindControl("chk" + count.ToString());

                    if (Hcheck.Checked)
                    {
                        indexer.Add(obtable.Controls.IndexOf(Hrow));
                        HField = (HiddenField)Hrow.Cells[4].Controls[0].FindControl("HiddenField" + count.ToString());

                        System.Diagnostics.Debug.WriteLine("The Index is: " + obtable.Controls.IndexOf(Hrow).ToString() + HField.Value);

                        Questions.DeleteObjective(Convert.ToInt32(HField.Value));

                        Hcheck.Checked = false;

                    }
                    else
                    {

                    }

                    count++;

                }

                ClearTemplate(indexer.ToArray());

                // Controls.Clear();
            }

            ViewState["Edited"] = IsEdited;
        }
    }   
    private void GenerateAnswer(RadioButton rb)
    {
        if (rb.Checked)
        {
            if (rb.Parent is HtmlTableCell)
            {
                HtmlTableRow htr = (HtmlTableRow)rb.Parent.Parent;

                char selectedindex = rb.ID[11];

                TextBox tb = htr.Cells[2].Controls[0].FindControl("TextBox" + selectedindex.ToString()) as TextBox;

                Answer = tb.Text;

            }
        }
    }


    private void NewTemplate()
    {
        ClearTemplate();
    }

    protected void sel_SelectedIndexChanged(object sender, EventArgs e)
    {

        ViewState["ObjectivesCount"]= sell.SelectedValue.ToString();

        int CurrentCount=Convert.ToInt32(ViewState["ObjectivesCount"]);

           
        ////@"return confirm('Add Record?')";
        //if (CurrentCount < Convert.ToInt32(ViewState["ObjectivesReturnedCount"]))
        //{
        //   // Response.Write("<script>alert('Are You Sure You want to Remove this data?')</script>");
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Are you Sure you want to remove this data?')", true);
     
        //    PopulateObjectives(Convert.ToInt32(ViewState["ObjectivesCount"].ToString()));
        //}

        //else
        //{
            

        //}

        PopulateObjectives(Convert.ToInt32(ViewState["ObjectivesCount"].ToString()));
        

    }

    private void EncodeQuestion(int QuestionNumber, string Question, string objective, string answer, string outputpath)
    {
        //QuestionNumber = Convert.ToInt32(ViewState["QuestionNumber"]);
        //Question = QuestionTextArea.Value;

        FigureTypes f = new FigureTypes();
        int count = 0;

        using (System.IO.StreamWriter swriter = new System.IO.StreamWriter(outputpath))
        {
            swriter.Write(QuestionNumber + ". ");
            swriter.WriteLine(Question + System.Environment.NewLine);
            

            swriter.Write(f.Alphabet[count] + " " + objective + "  ");


            swriter.WriteLine();

            swriter.WriteLine("Answer: " + answer);

            swriter.WriteLine();
            swriter.WriteLine();

        }


    }

    private int MoveNext(int CurrentNumber)
    {
        int NextNumber = CurrentNumber + 1;

        return NextNumber;
    }

    protected void ButtonNext_ServerClick(object sender, EventArgs e)
    {
       
       
        IsEdited = Convert.ToBoolean(ViewState["Edited"]);

        ObjContent = new DataBase.Questions.ObjectivesContent();

        List<DataBase.Questions.ObjectivesContent> omls = new List<DataBase.Questions.ObjectivesContent>();

        omls = GetObjectiveData();

        Qs.Objectives = omls.ToArray();

        ViewState["QuestObjectives"] = Qs.Objectives;

        DataBase.QuestionStructure Qs2 = new DataBase.QuestionStructure();


        if (IsEdited)
        {

            Qs2.QuestionNumber = CurrentNumber;
            Qs2.Question = QuestionTextArea.Value;
            int QuestionType = 3;

            switch (QuestionTypeDropDown.SelectedValue)
            {
                case "Objectives":
                    QuestionType = 1;
                    break;

                case "Structured":
                    QuestionType = 2;
                    break;

                case "Mixed Mode":
                    QuestionType = 3;
                    break;
            }

            Qs2.QuestionType = QuestionType;


            Qs2.Objectives = (object[])ViewState["QuestObjectives"];

            System.Diagnostics.Debug.WriteLine("When this is: " + ViewState["Edited"].ToString() + CurrentNumber.ToString() + ViewState["Questionaire"].ToString());

            foreach (DataBase.Questions.ObjectivesContent obf in Qs2.Objectives)
            {

                System.Diagnostics.Debug.WriteLine("When this that is: " + obf.ObjID.ToString());

            }

            Questions.CaptureQuestionData(Qs2);

            ViewState["Edited"] = false;


        }

        ViewState["QNumber"] = MoveNext(CurrentNumber);

        LoadData(Convert.ToInt32(ViewState["QNumber"]),SectionNumber);

        
    }
    
    
    protected void ButtonPrev_ServerClick(object sender, EventArgs e)
    {
     
            int CurrentNu = Convert.ToInt32(ViewState["QNumber"]);   

            ViewState["QNumber"] = CurrentNu - 1;

            LoadData(Convert.ToInt32(ViewState["QNumber"]),SectionNumber);
        
        
    }

    private void LoadOptions()
    {
        sell.Items.Clear();


        for (int i = 0; i <= 5; i++)
        {
            sell.Items.Add(i.ToString());

        }
    }
    protected void EditBtn_ServerClick(object sender, EventArgs e)
    {
        DisableControls(false);
        LoadOptions();
        LoadQuestionTypes();
        IsEdited = true;
        ViewState["Edited"] = true;
    }
    protected void ButtonAdd_ServerClick(object sender, EventArgs e)
    {

        ViewState["Questionaire"] = QuestionTextArea.Value;


        System.Diagnostics.Debug.WriteLine("there is some: " + ViewState["Questionaire"].ToString());



        ObjContent = new DataBase.Questions.ObjectivesContent();

        List<DataBase.Questions.ObjectivesContent> omls = new List<DataBase.Questions.ObjectivesContent>();
        
        if (QuestionTextArea.Value != "")
        {

            omls = GetObjectiveData();

            Qs.Objectives = omls.ToArray();

            ViewState["QuestObjectives"] = Qs.Objectives;

            DataBase.QuestionStructure Qs2 = new DataBase.QuestionStructure();
            int QuestionType = 3;

            Qs2.QuestionNumber = CurrentNumber;
            Qs2.Question = ViewState["Questionaire"].ToString();

            switch (QuestionTypeDropDown.SelectedValue)
            {
                case "Objectives":
                    QuestionType = 1;
                    break;

                case "Structured":
                    QuestionType = 2;
                    break;

                case "Mixed Mode":
                    QuestionType = 3;
                    break;
            }

            Qs2.QuestionType = QuestionType;

            Qs2.Objectives = (object[])ViewState["QuestObjectives"];

            Questions.CaptureQuestionData(Qs2);

        }

        ViewState["QNumber"] = MoveNext(CurrentNumber);

        LoadData(Convert.ToInt32(ViewState["QNumber"]),SectionNumber);

    }


    protected void QuestionDelete_ServerClick(object sender, EventArgs e)
    {
        Questions.DeleteQuestion(this.TestCode, Convert.ToInt32(ViewState["QNumber"]));
        
        ViewState["QNumber"] = MoveNext(CurrentNumber);

        LoadData(Convert.ToInt32(ViewState["QNumber"]),SectionNumber);
    }
    protected void QuestionTypeDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void SectionSelection_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        ViewState.Add("Section", SectionSelection.SelectedIndex);

        System.Diagnostics.Debug.WriteLine(ViewState["Section"]);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tests.aspx");
    }
}