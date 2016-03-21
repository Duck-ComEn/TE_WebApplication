<%@ include file="session.jsp"%>
<%@ page buffer="30kb"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="javazoom.upload.*"%>
<%@ page import ="java.text.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.app.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.common.*"%>
<%@ page import ="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import ="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.inventoryreduction.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="James Koster || www.sixshootermedia.com" />
    <meta name="copyright" content="" />
    <meta name="company" content="" />

    <meta name="revisit-after" content="7 days" />
	
	<%	
		String version="";
		String webname="";
		webname=IniFilesReader.getReturnProperties("Local.Application","Application Name");	
		version=InventoryReductionVersionControl.getVersion();
        
		
		String shift="";
		String line="";		
		String dataDate="";
        
        Vector reportDataList=null;
		String showListFlag="clear";
        String radioSelectStr="";

		int reportDatabeginRow=1;
		int numRowPerPage=30;
		int qty=0;
		int recordcount=0;

		if(request.getParameter("submitflag")==null){
     	   showListFlag="clear";
		}else{
			showListFlag=request.getParameter("submitflag");
	   }

	  if(request.getParameter("brownum")==null || request.getParameter("brownum").equals("")){
     	   reportDatabeginRow=1;
		}else{
			reportDatabeginRow=Integer.parseInt(request.getParameter("brownum"));
	  }
      // out.println("brownum : "+request.getParameter("brownum"));
	   


		//out.println("submitFlag1 : "+request.getParameter("submitflag"));

            
	if(showListFlag.equals("show")){  	
		shift=request.getParameter("Shift");
		line=request.getParameter("Line");		   		    
		dataDate=request.getParameter("dataDate");

		if(shift.equals("select")==false && line.equals("select")==false && dataDate.equals("select")==false ){
		    
           
			PRSReport ra=new PRSReport();		
			ra.setShift_id(shift);
			ra.setLine_id(line);
			ra.setInputdate(dataDate);		
		reportDataList=InventoryReductionManager.getReportPRSDataList(ra,((numRowPerPage)*reportDatabeginRow)-numRowPerPage+1,(numRowPerPage)*reportDatabeginRow); 
				  
         recordcount =InventoryReductionManager.getReportPRSCountTotalRow(ra);
   
		}else{
			showListFlag="clear";
		}
		}
		
       	%>
	

	
	<title><% out.println(webname); %></title>
	
    <link href="DATA-INF/CSS/1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
<!--
.form-noindent {	BORDER-RIGHT: #c3d9ff 1px solid; BORDER-TOP: #c3d9ff 1px solid; BORDER-LEFT: #c3d9ff 1px solid; BORDER-BOTTOM: #c3d9ff 1px solid; BACKGROUND-COLOR: #ffffff
}
.style1 {font-size: 16px;
	font-weight: bold;
}
.style2 {font-size: 12px; font-family: Tahoma; color: #000000;}
.style3 {font-size: 36px}
-->
    </style>
</head>

<body onload="StartFocus()">
     
	<div id="header">
	  <div id="header-container">
			 <p>Version : <% out.println(version); %> | <a href="#Top">Logon: <% out.println(session.getAttribute("s_username").toString().trim()); %></a><br />
			</p> 
	  <img src="DATA-INF/Image/logo.jpg" alt="Your Logo" title="Your Logo" />
		  <h1><a name="Top" id="Top"></a><a href="#Top"><% out.println(webname); %> </a></h1>
		  <%@ include file="menu_report_process.jsp" %>
			<br class="clear" />
	  </div>
	</div>
	<table width="100%" height="100%" border="0">
      <tr>
        <td height="530" align="center" valign="top">
          <table class="form-noindent" cellspacing="3" cellpadding="5" width="98%" 
      border="0">
            <tbody>
               <tr>
                <td height="248" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center">			
			<form  method="post" name="form1" target="_parent" id="form1">
                <table width="102%" border="0">
                  <tr> 
                    <td width="97%" height="30" align="left"><table width="100%" border="0">
                        <tr> 
                          <td width="3%">&nbsp;</td>
                          <td width="94%"><span class="style1">Generate PRS Report</span>&nbsp;</td>
                          <td width="3%">&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="72" align="left" valign="top"><table width="100%" border="0">
                        <tr> 
                          <td width="22%" height="33"><table width="100%" border="0">
                              <tr> 
                                <td width="42%" height="26"><div align="right"><span class="style2 style1">Date 
                                    :</span></div></td>
                                <td width="58%"> <select name="dataDate" id="select9" onkeypress="onEnterInputDate()">
                                    <option value="select">--- SELECT ---</option>
                                    <%
									     Vector initDate=InventoryReductionManager.getReportInitPRSDate();
										 
										for(int i=0 ; i<initDate.size();i++){	
											radioSelectStr="";
											if(initDate.get(i).equals(dataDate)){radioSelectStr="selected";}
										%>
                                    <option value="<%=initDate.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initDate.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select></td>
                              </tr>
                            </table></td>
                          <td width="27%"><table width="100%" border="0">
                              <tr> 
                                <td width="49%"><div align="right"><span class="style2 style1">Line 
                                    :</span></div></td>
                                <td width="51%"><select name="Line" id="select24" onkeypress="onEnterLine()">
                                    <option value="select" >--- SELECT ---</option>
                                    <%
									     Vector initLine=InventoryReductionManager.getReportInitPRSLine();
										
										for(int i=0 ; i<initLine.size();i++){	
											radioSelectStr="";
											if(initLine.get(i).equals(line)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initLine.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initLine.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                          <td width="24%"><table width="100%" border="0">
                              <tr> 
                                <td width="43%"><div align="right"><span class="style2 style1">Shift 
                                    :</span></div></td>
                                <td width="57%"><select name="Shift" id="shift" onkeypress="onEnterShift()">
                                    <option value="select">--- SELECT ---</option>
                                    <%
									     Vector initShift=InventoryReductionManager.getReportInitPRSShift();
										
										for(int i=0 ; i<initShift.size();i++){	
											radioSelectStr="";
											if(initShift.get(i).equals(shift)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initShift.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initShift.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr>
                          <td height="33">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr> 
                          <td>&nbsp;</td>
                          <td><div align="center"> 
                              <input name="showData" type="button" id="showData" value="Show List" onclick="ShowListClick()" />
                              <input type="reset" name="Submit2" value="Clear" onclick="clearClick()" />
                            </div></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="21">&nbsp; </td>
					<td width="3%" height="21">&nbsp; </td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr>
                          <td width="22%" height="24"><div align="right"><span class="style1">Total Record 
                              Count :</span></div></td>
                          <td width="52%"><div align="left"><span class="style1"> 
                              <%=recordcount%></span></div></td>
                          <td width="26%"><input type="hidden" name="brownum"  value=""/>
                            <input type="hidden" name="submitflag"  value=""/>
                            <input type="hidden" name="beginRecord" />
                            <input type="hidden" name="endRecord" /></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="52"><table width="100%" border="0">
                        <tr> 
                          <td width="6%" ><div align="center"><span class="style2 style1">No</span></div></td>
                          <td width="15%" align="center"><span class="style2 style1">Part 
                            Number</span></td>
                          <td width="24%" align="center"><div align="center"><span class="style2 style1">Invoice 
                              no</span></div></td>
                          <td width="10%" align="center"><div align="center"><span class="style2 style1">VMI_QTY</span></div></td>
                          <td width="10%" ><div align="center"><span class="style2 style1">COI_QTY</span></div></td>
                          <td width="9%" ><div align="center"><span class="style2 style1">QTY 
                              Issue</span></div></td>
                          <td width="26%" ><div align="center"><span class="style2 style1">Description</span></div></td>
                        </tr>
                        <%                      
                        int roundofRow=recordcount/numRowPerPage;
						int roundofRemnant=recordcount%numRowPerPage;
						
						  
						if (showListFlag.equals("show")){                      

                        for(int i=0 ; i<reportDataList.size();i++){				
						

								PRSReport tmpRA=(PRSReport)reportDataList.get(i);				
                
						 %>
                        <tr> 
                          <td > <div align="center"> 
                              <%=(i+1)%>
                            </div></td>
                          <td align="center"><div align="center"><span class="style2"> 
                              <%=tmpRA.getPn()%>
                              </span></div></td>
                          <td align="center"><div align="center"><span class="style2">
                              <%=tmpRA.getInvoice_no()%>
                              </span></div></td>
                          <td align="center"><div align="center"><span class="style2">
                              <%=tmpRA.getVmi_qty()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2">
                              <%=tmpRA.getCoi_qty()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getQty_issue()%>
                              </span> </div></td>
                          <td ><div align="center"><span class="style2">
                              <%if(tmpRA.getPp_code()==null){out.println("");}else{out.println(tmpRA.getPp_code());}%>
                              </span> </div></td>
                        </tr>
                        <%
						  } 
						
							
					
						  }
						 %>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr> 
                          <%
							  if (roundofRemnant>0){roundofRow=roundofRow+1;}
							  if(roundofRow>1){
								%>
                          <td width="22%"><div align="right"><span class="style2 style1">Record 
                              Count : </span></div></td>
                          <td width="72%"> <div align="left"> 
                              <%
								    for(int i=1;i<=roundofRow;i++){
									 %>
                              <a href="javascript:querydata(<%=i%>)"> 
                              <%=i%>
                              </a> &gt; 
                              <%  
								    }
								  %>
                            </div></td>
                          <td width="6%">&nbsp; </td>
                          <%
							  }
							  
							  %>
                        </tr>
                        <tr>
						<%
						if(recordcount>0){
						%>
                          <td align="center" valign="top"><div align="right"><span class="style2 style1">PRS 
                              Report &nbsp;: </span></div></td>
                          <td> <div align="left">
                              <table width="100%" border="0">
                                <tr> 
                                  <td width="24%"><div align="right"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Requester ID 
                                       :</strong></font></div></td>
                                  <td width="76%"><input type="text" name="employeeno" /></td>
                                </tr>
                                <tr>
                                  <td><div align="right"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Requester 
                                      Name :</strong></font></div></td>
                                  <td><input type="text" name="requsetername"  size="40"/></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td><input name="printPRS" type="button" id="printPRS" value="Create PRS Report for Current data" onclick="printPRSClick(<%=((numRowPerPage)*reportDatabeginRow)-numRowPerPage+1%>,<%=(numRowPerPage)*reportDatabeginRow%>)" /></td>
                                </tr>
                              </table>
                            </div></td>
                          <td><span class="style2"> </span></td>
						  <%
						  }
						  %>
                        </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td height="30"></td>
                  </tr>
                </table>
                </form>

               
              
            </td>
              </tr>
            </tbody>
          </table>
    </td>
      </tr>
    </table>
<div id="footer">
		<div id="footercontent">
			&copy; Hitachi Global Storage Techonologies (Thailand) Ltd.All rigths reserved</div>
</div>

</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function ShowListClick(){
  var frm = document.form1; 
  var alertmsg="";
  var jinputdate=frm.dataDate.value;
  var jShift=frm.Shift.value;
  var jLine=frm.Line.value;

  frm.submitflag.value="show";  
  
  alertmsg=alertmsg+IsEmpty(jinputdate,"Date");
  alertmsg=alertmsg+IsEmpty(jShift,"Shift");
  alertmsg=alertmsg+IsEmpty(jLine,"Line");
   

  if(alertmsg == ""){
		 frm.action="report_prs.jsp";		
		 frm.submit();		
				
  }else{
	    frm.submitflag.value="show"; 
		alert(alertmsg);
		
  }  
}

function clearClick(){
  var frm = document.form1; 
  frm.submitflag.value="clear"; 
  frm.action="report_prs.jsp";	
  frm.submit();
}


function StartFocus(){
  var frm = document.form1; 
  frm.dataDate.focus();	
	
}

function onEnterInputDate(){
if(event.keyCode==13)

var frm = document.form1;
	frm.Line.focus();

}

function onEnterLine(){
if(event.keyCode==13)

var frm = document.form1;
	frm.Shift.focus();

}

function onEnterShift(){
if(event.keyCode==13)

var frm = document.form1;
frm.showData.focus();
	
}

function printPRSClick(beginR,endR){
 var frm = document.form1; 
 var jemployeeno=frm.employeeno.value;
 var jrequsetername=frm.requsetername.value;
 var alertmsg="";
 frm.beginRecord.value=beginR;
 frm.endRecord.value=endR;	

 alertmsg=alertmsg+IsEmpty(jemployeeno,"Employee No");
 alertmsg=alertmsg+IsNumeric(jemployeeno,"Employee No");
 alertmsg=alertmsg+IsEmpty(jrequsetername,"Requester Name");

  if(alertmsg == ""){
		frm.action="report_PRS_print.jsp";			
		frm.submit();		
  }else{
	    frm.employeeno.focus();
		alert(alertmsg);		
  }  



 //window.open('report_PRS_print.jsp','mywindow','width=1024,height=678,toolbar=no, location=no,directories=no,status=no,menubar=yes,scrollbars=yes,copyhistory=no, resizable=yes');

}

function querydata(bRow){
 var frm = document.form1; 
 var bintRow=parseInt(bRow);
 frm.brownum.value=bintRow; 
 frm.submitflag.value="show";  
 frm.action="report_prs.jsp";	
 frm.submit();
}

function IsEmpty(sText,filedName){	
	var alertmsg=""; 
	  if (sText=="")
	  {         
          alertmsg="The " + filedName + " should not empty.\n" ;		  
	  }else{
         if (sText=="select"){
		     alertmsg="The " + filedName + " didn't select.\n" ;
		 }
	  }
	  return alertmsg;  
	}

function IsNumeric(sText,filedName)
{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var alertmsg="";
   var Char;
 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   
   if (IsNumber==false)
	{
	   alertmsg="The " + filedName + " should be numeric.\n" ;	  
	}
	return alertmsg;    
}

</script>