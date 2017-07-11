using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public class DalValidateAdTags
{
    string strcon;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    public DalValidateAdTags()
    {

    }




    private int SetCampPriority(DataTable dtcamp)
    {
        try
        {


            int RowCount = dtcamp.Rows.Count;
            //string[] Arr={"A","B","C","D","E","F"};
            DataTable dPriority = new DataTable();
            dPriority.Columns.Add("campaign");
            dPriority.Columns.Add("range");
            dPriority.Columns.Add("frequency");
            int A = 0; int B = 0; int C = 0; int D = 0; int E = 0; int F = 0;
            foreach (DataRow dr in dtcamp.Rows)
            {

                if (dr["PriorAgeRange"] == "A")
                { A += 1; }
                else if (dr["PriorAgeRange"] == "B")
                { B += 1; }
                else if (dr["PriorAgeRange"] == "C")
                { C += 1; }
                else if (dr["PriorAgeRange"] == "D")
                { D += 1; } 
                else if (dr["PriorAgeRange"] == "E")
                { E += 1; }
                else if (dr["PriorAgeRange"] == "F")
                { F += 1; }

            }

             for (int LoopCounter = 0; LoopCounter < dtcamp.Rows.Count; LoopCounter++)
             {
                 DataRow dr = dPriority.NewRow();

                 if (dtcamp.Rows[LoopCounter]["PriorAgeRange"] == "A")
                 {
                     dr["campaign"] = dtcamp.Rows[LoopCounter]["campid"].ToString();
                     dr["range"] = dtcamp.Rows[LoopCounter]["PriorAgeRange"].ToString();
                     dr["frequency"] = A.ToString();
                     
                 }
                 else if (dtcamp.Rows[LoopCounter]["PriorAgeRange"] == "B")
                 {
                     dr["campaign"] = dtcamp.Rows[LoopCounter]["campid"].ToString();
                     dr["range"] = dtcamp.Rows[LoopCounter]["PriorAgeRange"].ToString();
                     dr["frequency"] = B.ToString();
                 }
                 else if (dtcamp.Rows[LoopCounter]["PriorAgeRange"] == "C")
                 {
                     dr["campaign"] = dtcamp.Rows[LoopCounter]["campid"].ToString();
                     dr["range"] = dtcamp.Rows[LoopCounter]["PriorAgeRange"].ToString();
                     dr["frequency"] = C.ToString();
                 }
                 else if (dtcamp.Rows[LoopCounter]["PriorAgeRange"] == "D")
                 {
                     dr["campaign"] = dtcamp.Rows[LoopCounter]["campid"].ToString();
                     dr["range"] = dtcamp.Rows[LoopCounter]["PriorAgeRange"].ToString();
                     dr["frequency"] = D.ToString();
                 }
                 else if (dtcamp.Rows[LoopCounter]["PriorAgeRange"] == "E")
                 {
                     dr["campaign"] = dtcamp.Rows[LoopCounter]["campid"].ToString();
                     dr["range"] = dtcamp.Rows[LoopCounter]["PriorAgeRange"].ToString();
                     dr["frequency"] = E.ToString();
                 }
                 else if (dtcamp.Rows[LoopCounter]["PriorAgeRange"] == "F")
                 {
                     dr["campaign"] = dtcamp.Rows[LoopCounter]["campid"].ToString();
                     dr["range"] = dtcamp.Rows[LoopCounter]["PriorAgeRange"].ToString();
                     dr["frequency"] = F.ToString();
                 }


                 dPriority.Rows.Add(dr);

             }

             int CampaignPosition = Max(dPriority);

            // int[] Arr = { A, B, C, D, E, F };

             return CampaignPosition;
            

  
       

        }
        catch(Exception sqe)
        {
           // InvalidCampaign
            return 0;
        }
    }
    public bool isValidCamp(string ComputerId, string campId, string AdTagName, string banner_id)
    {
        try
        {
            //con.Open();
            //SqlDataAdapter adpcampTypeOfAdTarget = new SqlDataAdapter("select TypeOfAdTarget from campaigns where campaign_id='" + campId + "'", con);
            //DataSet dsTypeOfAd = new DataSet();
            //adpcampTypeOfAdTarget.Fill(dsTypeOfAd);
            //con.Close();
            //string Query = "select cnt=case when  ((( case when  (select count(*) from dbo.tbltagImperassions where AdtagName='" + AdTagName + "' and Datetime=CAST(GETDATE() as DATE)) =0 then 3 else (select count(*) from dbo.tbltagImperassions where AdtagName='" + AdTagName + "' and Datetime=CAST(GETDATE() as DATE))  end) )/3 )<(select MaxCookieImpressions from dbo.campaigns where campaign_id='" + campId + "') then 'true' else 'false' end";
            string query = "  select (case when ( select count(*) from dbo.tbltagImperassions where AdtagName='" + AdTagName + "' and Datetime=CAST(GETDATE() as DATE )  )<3 then 'valid' else 'Invalid'  end) as 'cnt' ,Add_style_formate from dbo.campaigns where campaign_id='"+campId+"'";

            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows[0]["cnt"].ToString() == "valid" && ds.Tables[0].Rows[0]["Add_style_formate"].ToString() == banner_id)
                return true;
            else
                return false;
        }
        catch
        {
            return false;
        }
    }

    public string[] SetCookiePriority(string ComputerId, string banner_id)
    {
        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter("select AdTagValue , AdtagName,  DATEDIFF(day,getdate(),expireydate) as 'daysRemain'  from dbo.tblCookieTags where uniqueComputerId='" + ComputerId + "' and DATEDIFF(day,getdate(),expireydate)>0", con);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        con.Close();
        string[] CampaignArr = new string[100];
        DataTable dtcampDetails = new DataTable();
        dtcampDetails.Columns.Add("tagname");
        dtcampDetails.Columns.Add("campid");
        dtcampDetails.Columns.Add("domainname");
        dtcampDetails.Columns.Add("expiry");
        dtcampDetails.Columns.Add("categorySpacification");

        if (ds.Tables[0].Rows.Count != 0)
        {
            for (int count = 0; count < ds.Tables[0].Rows.Count; count++)
            {
                string[] RowArr;
                RowArr = (ds.Tables[0].Rows[count]["AdTagValue"].ToString()).Split(',');
                DataRow dr = dtcampDetails.NewRow();
                dr["domainname"] = RowArr[0];
                dr["campid"] = RowArr[1];
                dr["expiry"] = RowArr[2];
                dr["tagname"] =ds.Tables[0].Rows[count]["AdtagName"].ToString();
                dr["categorySpacification"] = RowArr[4];


                bool tagvalidity = isValidCamp(ComputerId, RowArr[1], ds.Tables[0].Rows[count]["AdtagName"].ToString(), banner_id);
                if(tagvalidity==true)
                    dtcampDetails.Rows.Add(dr);
            }

            DataTable ReturnedData= AudienceInterestAlgorithms(dtcampDetails);
            int campaignPosition = SetCampPriority(ReturnedData);
            string[] Arr={ReturnedData.Rows[campaignPosition]["campid"].ToString()};
            return Arr;
        }
        else
        {

            string[] Arr = { "InvalidCampaign" };
            //return Arr;
            return null;
         }





    }
    private DataTable AudienceInterestAlgorithms(DataTable dtTags)
    {
        try
        {

            DataTable dtPriorityCounter = new DataTable();
            dtPriorityCounter.Columns.Add("tagname");
            dtPriorityCounter.Columns.Add("campid");
            dtPriorityCounter.Columns.Add("domainname");
            dtPriorityCounter.Columns.Add("expiry");
            dtPriorityCounter.Columns.Add("PriorAgeRange");

            //  List<string[]> var = new List<string[]>();
            foreach (DataRow dr in dtTags.Rows)
            {
                string[] InterestArr = dr["categorySpacification"].ToString().Split('/');
                DataTable dtCombinations = new DataTable();
                dtCombinations.Columns.Add("Combination");
                // string sqlQuery

                for (int LoopCounter = 0; LoopCounter < InterestArr.Length; LoopCounter++)
                {
                    con.Open();
                    SqlDataAdapter adpRangeCombination = new SqlDataAdapter("select RangeCombination  from tblUserInterestCategories where  serial=" + Convert.ToInt32(InterestArr[LoopCounter].ToString()) + "", con);
                    DataTable dtRangeCombination = new DataTable();
                    adpRangeCombination.Fill(dtRangeCombination);
                    con.Close();

                    if (dtRangeCombination.Rows.Count > 0)
                    {
                        DataRow dr2 = dtCombinations.NewRow();
                        dr2["Combination"] = dtRangeCombination.Rows[0]["RangeCombination"].ToString();
                        dtCombinations.Rows.Add(dr2);

                    }

                }//close for loop.

              string PriorAgeRange = this.setPriority(dtCombinations);

              DataRow drNew = dtPriorityCounter.NewRow();
              drNew["tagname"] = dr["tagname"].ToString();
              drNew["campid"] = dr["campid"].ToString();

              drNew["domainname"] = dr["domainname"].ToString();
              drNew["expiry"] = dr["expiry"].ToString();
              drNew["PriorAgeRange"] = PriorAgeRange;


              dtPriorityCounter.Rows.Add(drNew);
            } //close foreach loop


            return dtPriorityCounter;

        }
        catch (Exception sqe)
        {
            return null;
        }
    }
    private string setPriority(DataTable dt)
    {
        try
        {
            string[] Arr = { "A", "B", "C", "D", "E", "F" };
            DataTable dtReturn=new DataTable();
            dtReturn.Columns.Add("category");
            dtReturn.Columns.Add("frequency");

            for(int count=0; count<Arr.Length; count++)
            {
                DataRow drNewRow=dtReturn.NewRow();
                drNewRow["category"]=Arr[count];
            foreach (DataRow dr in dt.Rows)
            {

                if (dr["Combination"].ToString().Contains(Arr[count]))
                {
                    if (drNewRow["frequency"].ToString() == string.Empty)
                    { drNewRow["frequency"] = "1"; }
                    else
                    { drNewRow["frequency"] = (Convert.ToInt32(drNewRow["frequency"].ToString()) + 1).ToString();  }
                }
                else
                {

                }
            }

            if(drNewRow["frequency"].ToString()==string.Empty)
            drNewRow["frequency"]="0";

            dtReturn.Rows.Add(drNewRow);

            }

             // now we will check the friquency pof each age range
            //  string PriorAgeRange=

          //  comparisions
            int PriorRowPosition = Max(dtReturn);


            return dtReturn.Rows[PriorRowPosition]["category"].ToString();

        }
        catch(SqlException e)
        {
            return null;
        }
    }

    private int Max(DataTable numbers)
    {
        int m = Convert.ToInt32(numbers.Rows[0]["frequency"]);
        int priorRowPostion = 0;
        for (int i = 0; i < numbers.Rows.Count; i++)
        {
            if (m < Convert.ToInt32(numbers.Rows[i]["frequency"]))
            {
                m = Convert.ToInt32(numbers.Rows[i]["frequency"]);
                priorRowPostion = i;
            }
        }


        //validate friquency Algorithm   (we will find the occurence and row position)
         string RowPositions = "";
        for (int i = 0; i < numbers.Rows.Count; i++)
        {
            if (m == Convert.ToInt32(numbers.Rows[i]["frequency"]))
            {
                if (RowPositions == string.Empty)
                    RowPositions = i.ToString();
                else
                    RowPositions = RowPositions + "," + i.ToString();

            
            }
        }

        string[] Arr = RowPositions.Split(',');




        return Convert.ToInt32(Arr[0].ToString());

    }

}