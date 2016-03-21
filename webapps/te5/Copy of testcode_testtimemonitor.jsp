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
String reportByTestTimeTestCode = " ";
String yaxisQty = " ";
        String yaxisYield = " ";
String yaxisLatestYield = " ";
String showDataTable = " ";


//boolean optionSelect[3]; //= {true,false,false}; // All drives , Passer drives , by tester

    product=request.getParameter("Product");

reportByAllDrives = request.getParameter("hidden_ReportByAllDrives");
reportByPasserDrives = request.getParameter("hidden_ReportByPasserDrives");
reportByTester = request.getParameter("hidden_ReportByTester");
reportByTestTimeTestCode = request.getParameter("hidden_ReportByTestTimeTestCode");
yaxisQty = request.getParameter("hidden_yaxisQty");
        yaxisYield =request.getParameter("hidden_yaxisYield");
yaxisLatestYield = request.getParameter ("hidden_yaxisLatestYield");
showDataTable = request.getParameter ("hidden_showDataTable");

if(product == null){
   product = "CEP";     
}

// Set default value for ratio
if(reportByAllDrives == null && reportByPasserDrives == null && reportByTester == null && reportByTestTimeTestCode == null){
   reportByAllDrives = "checked"  ; 
   reportByPasserDrives = " "  ; 
   reportByTester = " "  ; 
   reportByTestTimeTestCode = " " ;
}

// Set default value for Y-AXIS ratio
if(yaxisQty == null && yaxisYield == null && yaxisLatestYield == null){
   yaxisYield = "checked"  ; 
   yaxisQty = " "  ; 
   yaxisLatestYield = " " ;
}

// Set default value for showTable CheckBox
if (showDataTable == null){
showDataTable = "checked" ;
}


        Vector processID = new Vector(3, 1);
        processID.addElement(new Integer(6400));
        processID.addElement(new Integer(6800));
        processID.addElement(new Integer(9000));

TestTimeTool ttMonitor = new TestTimeTool();
Vector mtype = ttMonitor.getMtype(product);



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

</head>
<body>
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

<!-- =============================================Center 

Layout========================================================================== -->
<form name="form1" method="post" action="" target="_parent">
       <input type="hidden" name="Product" value="<%=product%>">
       <input type="hidden" name="hidden_ReportByAllDrives"  />
       <input type="hidden" name="hidden_ReportByPasserDrives" />
       <input type="hidden" name="hidden_ReportByTester" />
   <input type="hidden" name="hidden_ReportByTestTimeTestCode" />
   <input type="hidden" name="hidden_yaxisQty" />
       <input type="hidden" name="hidden_yaxisYield" />
   <input type="hidden" name="hidden_yaxisLatestYield" />
   <input type="hidden" name="hidden_showDataTable" />

   <!-- Create Prepare chart-->
<%@ include file="testcodeprocessor/testcode_testtimechart_processor.jsp" %>
<table width="100%" border="0">
  <tr><td align="center" width="100%" >
<div id="content-product-header">
<table width="100%" border="0">
  <tr> 
<td align="center" ><input type="submit" name="mps" value="MPS" onclick="productsubmit('MPS')" /></td>
<td align="center" ><input type="submit" name="mks" value="MKS" onclick="productsubmit('MKS')" /></td>
<td align="center" ><input type="submit" name="cbe" value="CBE" onclick="productsubmit('CBE')" /></td>
<td align="center" ><input type="submit" name="cep" value="CEP" onclick="productsubmit('CEP')" /></td>
<td align="center" ><input type="submit" name="cbd" value="CBD" onclick="productsubmit('CBD')" /></td>
  </tr>
</table>
</div>
   </td></tr>
<tr><td align="center" width="100%" ><div id="content-header"><%=product%> Test Time Monitoring (Last updated <%=ttMonitor.getLatestUpdate()%>)</div>
</td></tr>
<tr>
        <td align="center" width="100%" ><table width="50%" border="0">
            <tr> 
              <td height="21"><strong>Data Option :</strong></td>
              <td><strong>Y-Axis Option</strong></td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td width="60%" height="46"><table width="98%" border="0">
                  <div id="content-product-header"> 
                    <tr> 
                      <td > <div align="left"> 
                          <input type="radio" name="reportOption" id="byAllDrives" value="byAllDrives"  <%=reportByAllDrives%> 

onclick="applyReportOptionSubmit()" />
                          By All Drives </div></td>
                      <td  > <div align="left"> 
                          <input type="radio" name="reportOption" id="byPasserDrives" value="byPasserDrives" <%=reportByPasserDrives%> 

onclick="applyReportOptionSubmit()" />
                          By Passer Drives</div></td>
  <td > <div align ="left">
  <input type="radio" name="reportOption" id="byTestTimeTestCode" value="byTestTimeTestCode" <%=reportByTestTimeTestCode%> 

onclick="applyReportOptionSubmit()" />
  By TestTime TestCode</div></td>
</tr>
                    <tr> 
                      <td > <div align="left"> 
                          <input type="radio" name="reportOption"  id="byTester" value="byTester" <%=reportByTester%> 

onclick="applyReportOptionSubmit()" />
                          By Tester</div></td>
                      <td> <div align="left"> 
                          <input type="checkbox" name="tableOption" id="byShowDataTable" value="ShowDataTable" <%=showDataTable%> 

onclick="applyReportOptionSubmit()" />
                          Show Data Table</div></td>
                    </tr>
                  </div>
                </table></td>
              <td width="35%"><table width="98%" border="0">
                  <div id="content-product-header"> 
                    <tr> 
                      <td > <div align="left"> 
                          <input type="radio" name="yaxisOption" value="yaxisQty"  <%=yaxisQty%> onclick="applyReportOptionSubmit()" />
                          QTY</div></td>
  <td> <div align= "left">
<input type="radio" name="yaxisOption"  value="yaxisLatestYield" <%=yaxisLatestYield%> onclick="applyReportOptionSubmit()" />
Latest Yield</div></td>
                    </tr>
                    <tr> 
                      <td > <div align="left"> 
                          <input type="radio" name="yaxisOption"  value="yaxisYield" <%=yaxisYield%> onclick="applyReportOptionSubmit()" />
                          Yield First Pass</div></td>
                    </tr>




                  </div>
                </table></td>
              <td width="37%"><p>&nbsp; </p></td>
            </tr>
          </table>
  </td>
      </tr>

  <!-- **************** Plot test time chart ****************-->
<%@ include file="testcodeprocessor/testcode_testtimechart_shower.jsp" %>

</table>

</form> 
</div>

<!-- =============================================Bottom 

Layout========================================================================== -->
<%@ include file="PageLayout/footerlayout.jsp" %>

</body>

</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script type="text/javascript">


function productsubmit(productSelected){
  var frm = document.form1;
  frm.Product.value = productSelected;
  checkReportOption();
  frm.action="testcode_testtimemonitor.jsp";  
  frm.submit(); 
}


function applyReportOptionSubmit(){
var frm = document.form1;

  checkReportOption();
  frm.action="testcode_testtimemonitor.jsp";  
  frm.submit(); 
}


function checkReportOption(){
var frm = document.form1;
var radios = document.getElementsByTagName('input');
var checkBox = document.getElementById("byShowDataTable");

frm.hidden_ReportByAllDrives.value = ' ';
frm.hidden_ReportByPasserDrives.value = ' ';
frm.hidden_ReportByTester.value = ' ';
frm.hidden_ReportByTestTimeTestCode.value= ' ';
frm.hidden_yaxisQty.value = ' ';
frm.hidden_yaxisYield.value = ' ';
frm.hidden_yaxisLatestYield.value = ' ';
frm.hidden_showDataTable.value = ' ';


if (checkBox.checked == true){
frm.hidden_showDataTable.value = 'checked';
//  alert("I am an alert box **Checked**!");
}
else if (checkBox.checked == false){
    frm.hidden_showDataTable.value = 'unchecked';
//  alert("I am an alert box **unChecked**!");
}

for (var i = 0; i < radios.length; i++) {
    if (radios[i].type == 'radio'){
   
if (radios[i].value == 'byAllDrives'  && radios[i].checked) {
frm.hidden_ReportByAllDrives.value = 'checked';
}else if (radios[i].value == 'byPasserDrives' && radios[i].checked) {
frm.hidden_ReportByPasserDrives.value = 'checked';
}else if (radios[i].value == 'byTester' && radios[i].checked) {
frm.hidden_ReportByTester.value = 'checked';
}else if (radios[i].value =='byTestTimeTestCode' && radios[i].checked) {
frm.hidden_ReportByTestTimeTestCode.value = 'checked';
}else if (radios[i].value == 'yaxisQty' && radios[i].checked) {
frm.hidden_yaxisQty.value = 'checked';
}else if (radios[i].value == 'yaxisYield' && radios[i].checked) {
frm.hidden_yaxisYield.value = 'checked';
}else if (radios[i].value == 'yaxisLatestYield' && radios[i].checked) {
frm.hidden_yaxisLatestYield.value = 'checked';
}
}
  }
}
</script>