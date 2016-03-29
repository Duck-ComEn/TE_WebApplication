<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.text.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.inventoryreduction.*"%>
<%

String employeeno="";
String requsetername="";
String requseterid="";
String prsno="";
String status="";
String shift="";
String[] datatime=null;
Vector reportDataList=null;
int beginRow=1;
int endRow=30;
int numRowPerPage=30;


String selectPara[]=request.getParameter("selectprn").split("~~");
requsetername=selectPara[1];
requseterid=selectPara[2];
status=selectPara[3];
prsno=selectPara[0];

reportDataList=InventoryReductionManager.getReportPRSDataList(prsno);
PRSReport segmentInfo=InventoryReductionManager.getReportPRSSegment(prsno);
PRSReport pnlevelInfo=InventoryReductionManager.getReportPRSPNLevel(prsno);
shift=InventoryReductionManager.getReportPRSShift(prsno);
datatime=InventoryReductionManager.getReportPRSDataAndTime(prsno);

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>PRS Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td height="343" valign="top"><form name="form1" method="post" action="">
        <strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
        </font></strong> <strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
        </font></strong> <strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
        </font></strong> 
        <table width="100%" border="0">
          <tr>
            <td><div align="center"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
                <input name="PrintPRS" type="button" id="PrintPRS7" value="Print PRS Report"  onClick="clickPrintPrs()">
                <input name="cancel" type="button" id="cancel8" value="Cancel" onClick="clickCancel()">
                </font></strong></div></td>
          </tr>
        </table>
        <strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
        </font></strong> 
        <table width="100%" border="0">
          <tr> 
            <td width="11%" height="37"><table width="100%" height="35" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" bgcolor="#333333">
                <tr> 
                  <td height="33"><div align="center"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
                      PART REQUISTION SLIP 
                   
					  
                      </font></strong></div></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="23" valign="top"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
                <tr>
                  <td height="59"><table width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
                      <tr> 
                        <td width="32%" height="51"  align="center" valign="top"> 
                          <table width="100%" height="75%" border="0">
                            <tr> 
                              <td width="44%" height="20"><div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Date 
                                  of Request :</font></strong></font></div></td>
                              <td width="3%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
                              <td width="53%"><strong><font size="1" face="Arial, Helvetica, sans-serif"> 
                                <%=datatime[0]%>
                                </font></strong></td>
                            </tr>
                            <tr> 
                              <td height="20"> <div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Time 
                                  :</font></strong></font></div></td>
                              <td><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
                              <td><strong><font size="1" face="Arial, Helvetica, sans-serif"> 
                                 <%=datatime[1]%>
                                </font></strong></td>
                            </tr>
                          </table></td>
                        <td width="35%" align="center" valign="top"><table width="100%" border="0">
                            <tr> 
                              <td height="51" valign="top"><table width="100%" height="47" border="0">
                                  <tr> 
                                    <td width="43%" height="20"><div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">To 
                                        :</font></strong></font></div></td>
                                    <td width="4%"><font size="1">&nbsp;</font></td>
                                    <td width="53%"><strong><font size="1" face="Arial, Helvetica, sans-serif"><%=pnlevelInfo.getPart_level()%></font></strong></td>
                                  </tr>
                                  <tr> 
                                    <td height="20"> <div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Shift 
                                        :</font></strong></font></div></td>
                                    <td><font size="1">&nbsp;</font></td>
                                    <td><strong><font size="1" face="Arial, Helvetica, sans-serif"><%=shift%></font></strong></td>
                                  </tr>
                                </table></td>
                              <td valign="top"><table width="100%" height="46" border="0">
                                  <tr> 
                                    <td width="43%" height="20"><div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Size 
                                        :</font></strong></font></div></td>
                                    <td width="4%"><font size="1">&nbsp;</font></td>
                                    <td width="53%"><strong><font size="1" face="Arial, Helvetica, sans-serif"><%=segmentInfo.getSegment_size()%></font></strong></td>
                                  </tr>
                                  <tr> 
                                    <td height="20"> <div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Type 
                                        :</font></strong></font></div></td>
                                    <td><font size="1">&nbsp;</font></td>
                                    <td><strong><font size="1" face="Arial, Helvetica, sans-serif"><%=segmentInfo.getSegment_type()%></font></strong></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                        <td width="33%" valign="top"><table width="100%" height="47" border="0">
                            <tr> 
                              <td width="30%"><div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">PRS 
                                  No :</font></strong></font></div></td>
                              <td width="3%"><font size="1">&nbsp;</font></td>
                              <td width="67%"><font size="1">&nbsp;</font><font size="2" face="Arial, Helvetica, sans-serif"><strong><%=prsno%></strong></font></td>
                            </tr>
							<%
							if(status.equals("CANCEL")){
                            %>
                            <tr> 
                              <td> <div align="right"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Status 
                                  :</font></strong></font></div></td>
                              <td><font size="1">&nbsp;</font></td>
                              <td><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;</font><font size="1"><strong><font face="Arial, Helvetica, sans-serif"><%=status%></font></strong></font></td>
                            </tr>
							<%}%>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="43"><table width="100%" height="51" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
                <tr bgcolor="#333333" > 
                  <td width="29" height="19" ><div align="center"><font color="#FFFFFF" size="1" face="Arial, Helvetica, sans-serif"><strong>No</strong></font></div></td>
                  <td width="46"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">Line 
                      Code </font></font></strong></font></div></td>
                  <td width="59"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">Part 
                      Number </font></font></strong></font></div></td>
                  <td width="74"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">Description</font></font></strong></font></div></td>
                  <td width="41"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">QTY 
                      ISSUE </font></font></strong></font></div></td>
                  <td width="27"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">VMI</font></font></strong></font></div></td>
                  <td width="27"><div align="center"> 
                      <p><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">COI</font></font></strong></font></p>
                    </div></td>
                  <td width="64"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">GR 
                      SAP Document</font></font></strong></font></div></td>
                  <td width="67"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">GI 
                      SAP Document</font></font></strong></font></div></td>
                  <td width="71"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="1">Invoice 
                      no </font></strong></font></div></td>
                  <td width="57"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="2"><font size="1">ID</font></font></font></strong></font></div></td>
                  <td width="63"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="1">S/N</font></font></strong></font></div></td>
                  <td width="104"><div align="center"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><font size="2"><font size="2"><font size="1">REMARK</font></font></font></strong></font></div></td>
                </tr>
                <%
				 for(int i=0 ; i<reportDataList.size();i++){						

					PRSReport tmpRA=(PRSReport)reportDataList.get(i);	

				%>
                <tr> 
                  <td> <div align="center"><font face="Arial, Helvetica, sans-serif" size="1"><%=(i+1)%></font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=tmpRA.getLine_id()%></font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=tmpRA.getPn()%></font></div></td>
                  <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                      <%if(tmpRA.getPp_code()==null){out.println("&nbsp;");}else{out.println(tmpRA.getPp_code());}%>
                      </font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=tmpRA.getQty_issue()%></font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=tmpRA.getVmi_qty()%></font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=tmpRA.getCoi_qty()%></font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></div></td>
                  <td><div align="center"><font size="1"><%=tmpRA.getInvoice_no()%></font></div></td>
                  <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></div></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <%
				  }
				%>
              </table></td>
          </tr>
          <tr> 
            <td height="21" valign="bottom"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
                <tr> 
                  <td height="18" bgcolor="#333333"><font color="#FFFFFF" size="1" face="Arial, Helvetica, sans-serif"><strong>REQUESTER 
                    / MANUFACTURING LINE</strong></font></td>
                </tr>
                <tr> 
                  <td height="32" align="center" valign="middle"><div align="left"> 
                      <table width="100%" border="0">
                        <tr> 
                          <td width="24%" height="20"><div align="right"><font size="1" face="Arial, Helvetica, sans-serif">NAME 
                              OF REQUESTER :</font></div></td>
                          <td width="32%"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif"><strong><%=requsetername%></strong></font></div></td>
                          <td width="12%"><div align="right"><font size="1" face="Arial, Helvetica, sans-serif">EMPLOYEE 
                              NO :<strong> </strong></font></div></td>
                          <td width="32%"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif"><strong><%=requseterid%> 
                              </strong> </font></div></td>
                        </tr>
                      </table>
                    </div></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
                <tr> 
                  <td height="19" bgcolor="#333333"><font color="#FFFFFF" size="1" face="Arial, Helvetica, sans-serif"><strong>REQUESTER 
                    / MANUFACTURING LINE</strong></font></td>
                </tr>
                <tr> 
                  <td height="38" align="center" valign="middle"><div align="left"> 
                      <table width="100%" border="0">
                        <tr> 
                          <td width="34%"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">NAME 
                              OFDISTRIBUTER:</font></div></td>
                          <td width="5%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"></font></div></td>
                          <td width="57%"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">EMPLOYEE 
                              NO. </font></div></td>
                          <td width="2%"><div align="center"><strong></strong></div></td>
                          <td width="2%"><div align="right"></div></td>
                        </tr>
                        <tr> 
                          <td height="21"><font size="1" face="Arial, Helvetica, sans-serif">TIME 
                            ISSUE :_______________________________________am./pm.</font></td>
                          <td>&nbsp;</td>
                          <td><font size="1" face="Arial, Helvetica, sans-serif">SFC 
                            .Document No._____________________________________ 
                            Approve by.________________________</font></td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td><font size="1" face="Arial, Helvetica, sans-serif">TIME 
                            RECEIVED:____________________________________am./pm.</font></td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function StartFocus(){
  var frm = document.form1; 
  frm.dataDate.focus();	
	
}

function clickPrintPrs(){
  var frm = document.form1; 
  frm.PrintPRS.style.visibility='hidden';
   frm.cancel.style.visibility='hidden';	
   window.print();
   frm.action="report_prs_history.jsp";	
   frm.submit(); 
}

function clickCancel(){
  var frm = document.form1; 	
  frm.action="report_prs_history.jsp";	
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
