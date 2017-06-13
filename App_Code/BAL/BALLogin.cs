using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
public class BALLogin
{
	public BALLogin()
	{
		
	}

    public string MailID { get; set; }
    public string Password { get; set; }
    public string Flag { get; set; }
    public string ClientIpAddress { get; set; }
    public DateTime SystemBlockDate { get; set; }
    public DateTime GlobalBlockDate { get; set; }
    public int SystemBlockStatus { get; set; }

}