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
        
		
		String prsnohis="";
		        
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
      
	 if(request.getParameter("prsno")==null){
     	   prsnohis="all";
		}else{
			prsnohis=request.getParameter("prsno");
	   }
	
            
	if(showListFlag.equals("show")){  	
		
		reportDataList=InventoryReductionManager.getPRSNOStatusList(prsnohis,((numRowPerPage)*reportDatabeginRow)-numRowPerPage+1,(numRowPerPage)*reportDatabeginRow);
	
        recordcount =InventoryReductionManager.getPRSStatusCountTotalRow(prsnohis);   
           	
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
                <td height="339" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center">			
			<form  method="post" name="form1" target="_parent" id="form1">
                <table width="102%" border="0">
                  <tr> 
                    <td width="97%" height="30" align="left"><table width="100%" border="0">
                        <tr> 
                          <td width="3%">&nbsp;</td>
                          <td width="94%"><span class="style1">PRS Report History</span>&nbsp;</td>
                          <td width="3%">&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="72" align="left" valign="top"><table width="100%" border="0">
                        <tr> 
                          <td width="70%" height="33"><table width="100%" border="0">
                              <tr> 
                                <td width="20%" height="26"><div align="right"><span class="style2 style1">PRS 
                                    No:</span></div></td>
                                <td width="80%"> <select name="prsno" id="select9" onkeypress="onEnterPrsno()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initPRSNOHIS=InventoryReductionManager.getPRSNOHistory();
										 
										for(int i=0 ; i<initPRSNOHIS.size();i++){	
											radioSelectStr="";
											if(initPRSNOHIS.get(i).equals(prsnohis)){radioSelectStr="selected";}
										%>
                                    <option value="<%=initPRSNOHIS.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initPRSNOHIS.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td height="26">&nbsp;</td>
                                <td><input name="showData" type="button" id="showData4" value="Show List" onclick="ShowListClick()" />
                                  <input type="reset" name="Submit2" value="Clear" onclick="clearClick()" /></td>
                              </tr>
                            </table></td>
                          <td width="30%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td height="33"><table width="100%" border="0">
                              <tr> 
                                <td width="20%"><div align="right"></div></td>
                                <td width="80%"> <input name="PRSDetail" type="button" id="PRSDetail" value="Show PRS Detail" onclick="clickShowPRSDetail()" />
                              
				<%				
	                         if (session.getAttribute("s_role").toString().trim().equals("viewer")==false) {                                        
    	                        %>
    	                         <input name="CancelPRS" type="button" id="CancelPRS" value="Cancel PRS Report" onclick="ClickCancelPRS()" />
                         	<%   
				}
                                %> 
                                 
                                </td>
                              </tr>
                            </table></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="21">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td height="21"><table width="100%" border="0">
                        <tr> 
                          <td width="22%" height="25"><div align="right"><span class="style1">Total 
                              Record Count :</span></div></td>
                          <td width="52%"><div align="left"><span class="style1"> 
                              <%=recordcount%>
                              </span></div></td>
                          <td width="26%"><input type="hidden" name="brownum"  value=""/> 
                            <input type="hidden" name="submitflag"  value=""/> 
                            <input type="hidden" name="beginRecord" /> <input type="hidden" name="endRecord" />
                            </td>
                        </tr>
                      </table></td>
                    <td width="3%" height="21">&nbsp; </td>
                  </tr>
                  <tr> 
                    <td height="69"><table width="100%" border="0">
                        <tr> 
                          <td width="3%" ><div align="center"></div></td>
                          <td width="3%" align="center"><span class="style2 style1">No</span></td>
                          <td width="8%" align="center"><div align="center"><span class="style2 style1">PRS 
                              No </span></div></td>
                          <td width="8%" align="center"><div align="center"><span class="style2 style1">Status</span></div></td>
                          <td width="15%" ><div align="center"><span class="style2 style1">Generator 
                              Name</span></div></td>
                          <td width="9%" ><div align="center"><span class="style2 style1">Timestamp</span></div></td>
                          <td width="14%" > <div align="center"><span class="style2 style1">Request 
                              Cancel Name </span></div></td>
                          <td width="16%" ><div align="center"><span class="style2 style1">Cancel 
                              Timestamp</span></div></td>
                          <td width="24%" ><div align="center"><span class="style2 style1">Cancel 
                              Remark</span></div></td>
                        </tr>
                        <%              
						
                        int roundofRow=recordcount/numRowPerPage;
						int roundofRemnant=recordcount%numRowPerPage;
						String radioValue="";
						  
						if (showListFlag.equals("show")){                      

                       for(int i=0 ; i<reportDataList.size();i++){				
						

								PRSStatus tmpRA=(PRSStatus)reportDataList.get(i);				
                                radioValue=tmpRA.getPrsno()+"~~"+tmpRA.getRequester_name()+"~~"+tmpRA.getRequester_id()+"~~"+tmpRA.getPrs_status();
						 %>
                        

                          <tr> 
                          <td > <div align="center"> 
                              <input type="radio" name="selectprn" value="<%=radioValue%>" />
                            </div></td>
                          <td align="center"><div align="center"><span class="style2"><%=(i+1)%> 
                              </span></div></td>
                          <td align="center"><div align="center"><span class="style2"><%=tmpRA.getPrsno()%> 
                              </span></div></td>
						<td align="center"><div align="center"><span class="style2"><%=tmpRA.getPrs_status()%></span></div></td>
                          <td ><div align="center"><span class="style2"><%=tmpRA.getRequester_name()%></span></div></td>
                          <td ><div align="center"><span class="style2"><%=tmpRA.getRequest_timestamp()%></span> 
                            </div></td>
                          <td ><div align="center"><span class="style2"><%=tmpRA.getCancel_name()%>
                              </span> </div></td>
                          <td ><div align="center"><span class="style2"><%=tmpRA.getCancel_timestamp()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"><%=tmpRA.getCancel_remark()%>
                              </span></div></td>
                        </tr>



                        <%
						  } 
						
							
					
						  }
						 %>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="21"><table width="100%" border="0">
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
                      </table></td>
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
  var jprsno=frm.prsno.value;

  frm.submitflag.value="show";  
  
  alertmsg=alertmsg+IsEmpty(jprsno,"PRS NO");

  if(alertmsg == ""){
		 frm.action="report_prs_history.jsp";		
		 frm.submit();						
  }else{
	    frm.submitflag.value="show"; 
		alert(alertmsg);		
  }  
}

function ClickCancelPRS(){
  var frm = document.form1;
	var alertmsg="Please select PRS No.";	
	var count=frm.selectprn.length;
     if(typeof count == 'undefined' ){
	  count=1;
     }
	if(count>=2){
		  for(i=0;i<count;i++){
		   if (frm.selectprn[i].checked==true)
		   {
			   alertmsg="";
		   }	   
		}
	}else{		
	   if (frm.selectprn.checked==true)
	  {
		   alertmsg="";
	   }
	}
	    
	

   if(alertmsg == ""){
		frm.action = "report_cancel_prs.jsp";	
		frm.submit();
	}else{
		alert(alertmsg);		
	}
}

function clearClick(){
  var frm = document.form1; 
  frm.submitflag.value="clear"; 
  frm.action="report_prs_history.jsp";	
  frm.submit();
}


function StartFocus(){
  var frm = document.form1; 
  frm.prsno.focus();	
	
}

function onEnterPrsno(){
if(event.keyCode==13)

var frm = document.form1;
	frm.showData.focus();

}

function clickShowPRSDetail(){
	var frm = document.form1;
	var alertmsg="Please select PRS No.";	
	var count=frm.selectprn.length;
     if(typeof count == 'undefined' ){
	  count=1;
     }
	if(count>=2){
		  for(i=0;i<count;i++){
		   if (frm.selectprn[i].checked==true)
		   {
			   alertmsg="";
		   }	   
		}
	}else{		
	   if (frm.selectprn.checked==true)
	  {
		   alertmsg="";
	   }
	}
	    
	

   if(alertmsg == ""){
		frm.action = "report_PRS_detail.jsp";	
		frm.submit();
	}else{
		alert(alertmsg);		
	}
}

function querydata(bRow){
 var frm = document.form1; 
 var bintRow=parseInt(bRow);
 frm.brownum.value=bintRow; 
 frm.submitflag.value="show";  
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