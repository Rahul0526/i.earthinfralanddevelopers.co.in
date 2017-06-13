<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PieChartTest.aspx.cs" Inherits="admin_PieChartTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

       var Os = document.getElementById('<%= Os.ClientID %>').innerText;
            var clicks = document.getElementById('<%= clicks.ClientID %>').innerText;
            var DataOs = [];
            var DataClicks = [];
            //            alert(clicks);
            //            alert(countires);
            DataOs = Os.toString().split(',');
            DataClicks = clicks.toString().split(',');
            var dataTo = [[, ]];
            var datalength = DataOs.length;
            dataTo[0] = ['Popular Os', 'Clicks']
            for (var a = 0; a < datalength; a++) {
                dataTo.push([String(DataOs[a]), Number(DataClicks[a])]);
            }



       var data = google.visualization.arrayToDataTable(dataTo);

        var options = {
          title: 'Most popular OS',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
  <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Os Wise Clicks</b>
    <div id="piechart_3d"  style="width: 345px; height: 244px;"></div>

  <div style="display: none">
        <p id="clicks" runat="server">
        </p>
        <p id="Os" runat="server">
        </p>
    </div>

  </body>
</html>