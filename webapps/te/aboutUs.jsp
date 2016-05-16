<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import="java.util.*"%>
<%@ page import ="java.text.*"%>
<%@ page buffer="30kb"%>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.testtimetool.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>Test Engineer</title>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="author" content="Luka Cvrk (www.solucija.com)" />
<meta name="description" content="My Site" />
<meta name="keywords" content="key, words" />

<%  
String version="";
String webname="";
webname=IniFilesReader.getReturnProperties("Local.Application","Application Name"); 
version=TeWebVersionControl.getVersion();

        String errormessage="";
		String product = "";
		String reportByAllDrives = " ";
        String reportByPasserDrives = " ";
        String reportByTester = " ";
		String reportByDriveTestCode= " ";
		String reportByTestTimeTestCode = " ";
		String yaxisQty = " ";
        String yaxisYield = " ";
		String yaxisLatestYield = " ";
		String showDataTable = " ";
		int process = 0;
		int indexVector= 0;


//boolean optionSelect[3]; //= {true,false,false}; // All drives , Passer drives , by tester

    product						= request.getParameter("Product");
	reportByAllDrives 			= request.getParameter("hidden_ReportByAllDrives");
	reportByPasserDrives 		= request.getParameter("hidden_ReportByPasserDrives");
	reportByTester 				= request.getParameter("hidden_ReportByTester");
	reportByDriveTestCode		= request.getParameter("hidden_ReportByDriveTestCode");
	reportByTestTimeTestCode 	= request.getParameter("hidden_ReportByTestTimeTestCode");
	yaxisQty 					= request.getParameter("hidden_yaxisQty");
    yaxisYield 					= request.getParameter("hidden_yaxisYield");
	yaxisLatestYield 			= request.getParameter("hidden_yaxisLatestYield");
	showDataTable 				= request.getParameter("hidden_showDataTable");

	//set default product.
if(product == null){
   product = "MPS";     
}

// Set default value for ratio
if(reportByAllDrives == null && reportByPasserDrives == null && reportByTester == null  && reportByDriveTestCode == null && reportByTestTimeTestCode == null){
   reportByAllDrives = "checked"  ; 
   reportByPasserDrives = " "  ; 
   reportByTester = " "  ; 
   reportByDriveTestCode = " ";
   reportByTestTimeTestCode = " " ;
}

// Set default value for Y-AXIS ratio
if(yaxisQty == null && yaxisYield == null && yaxisLatestYield == null){
   yaxisYield = " "  ; 
   yaxisQty = "checked"  ; 
   yaxisLatestYield = " " ;
}

// Set default value for showTable CheckBox (Un-Show)
if (showDataTable == null){
showDataTable = " " ;
}


TestTimeTool ttMonitor = new TestTimeTool();

%>

<title>
<% out.println(webname); %>
</title>
<link rel="stylesheet" type="text/css" href="DATA-INF/CSS/style.css" media="screen" />

<script src="JSAX-INF/amcharts.js" type="text/javascript"></script>
<script type="text/javascript">
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}


<%@ include file="testcodeprocessor/testcode_testtimechart_script.jsp" %> 
MM_reloadPage(true);
</script>

<script>
document.write("<style type=\"text/css\">");
document.write("body {margin: 0px; width:100%; height:100%;}");
document.write("#load {position:absolute; left:0px; top:0px; width:100%; height:100%; background-color:white; z-index:300;}");
document.write("blink.txt {font-size:15px; font-weight:bold; font-face:Arial;}");
document.write("</style>");

var ie5 = (document.getElementById && document.all);
var ns6 = (document.getElementById && !document.all);

function BlinkTxt() {
    if(ie5) {
     obj = document.getElementsByTagName("blink");
     for (var j=0; j<obj.length; j++)
     if (obj[j].style.visibility=="hidden") {
     obj[j].style.visibility="visible";
    }
    else {
     obj[j].style.visibility="hidden";
    }
  }
}
setInterval("BlinkTxt()",750)

function SetUp(){
    if(ie5 || ns6) {
     document.getElementById("load").style.visibility = "hidden";
    }
}
window.onload=SetUp;
</script>

</head>
<body>
<div id="load">
          <table width="100%" height="100%" align="center" valign="middle" bgcolor="white">
          <tr>
               <td width="100%" height="100%" align="center" valign="middle">
                    <blink class="txt">Retrieving...</blink>
					
               </td>
          </tr>
          </table>
     </div>
	

<!-- ----------------------Te Logo--------------------------- -->
<div id="Layer1" style="position:absolute; left:3px; top:3px; width:84px; height:70px; z-index:1"><img src="DATA-INF/Image/telogo.jpg" 

width="275" height="58" /></div> 
<!-- -------------------------------------------------------- -->
<!--  <div id="Layer2" style="position:absolute; left:460px; top:255px; width:505px; height:46px; z-index:2"> </div>  -->
<%String menumode="testcode_testtimemonitor.jsp";%> 
<!-- ---------------------------------Left Layout -------------- -->
<div id="contentleft">
  <div id="left"> 
  <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
  <div id="headerL"></div>  
   </div> 

<!-- ============================================Top 

Layout============================================================================== -->

<div id="right"> <%@ include file="PageLayout/testcode_righttoplayout.jsp" %></div> 

<!--Add Vision-->

<div align="center" ><img src = "DATA-INF/Image/TeamVision.jpg" width ="60%" height="60%" /></div>


<%@ include file="PageLayout/footerlayout.jsp" %>

</body>

</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script type="text/javascript">



}
</script>