using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class BLGetMapData
{
	public BLGetMapData()
	{
	}


    public string instruction { get; set; }

    public DateTime startDate { get; set; }
    public DateTime EndDate { get; set; }
    public string  AffiliateID { get; set; }
    public string country { get; set; }
    public string website { get; set; }
}