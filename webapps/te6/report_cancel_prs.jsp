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
		
		String selectPara[]=request.getParameter("selectprn").split("~~");
		prsnohis=selectPara[0];
	   
	           
	
		
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
                          <td width="94%"><span class="style1">Cancel PRS Report</span>&nbsp;</td>
                          <td width="3%">&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="72" align="left" valign="top"><table width="100%" border="0">
                        <tr> 
                          <td width="70%" height="62"><table width="100%" border="0">
                              <tr> 
                                <td width="27%" height="26"><div align="right"><span class="style2 style1">PRS 
                                    No:</span></div></td>
                                <td width="73%"><strong><font size="2" face="Arial, Helvetica, sans-serif"><%=prsnohis%></font></strong> 
                                  
                                </td>
                              </tr>
                              <tr> 
                                <td height="26"><div align="right"><span class="style2 style1">Requester 
                                    ID:</span></div></td>
                                <td><input type="text" name="requesterid" onClick="onEnterRequesterid()"   /></td>
                              </tr>
                              <tr> 
                                <td height="26"><div align="right"><span class="style2 style1">Requester 
                                    Name:</span></div></td>
                                <td><input type="text" name="requestername" size="35" onClick="onEnterRequesterName()" /> 
                                </td>
                              </tr>
                              <tr> 
                                <td height="26"><div align="right"><span class="style2 style1">Cancel 
                                    Remark :</span></div></td>
                                <td><input type="text" name="cancelremark" size="50
								"  onClick="onEnterCancelRemark()"/></td>
                              </tr>
                              <tr> 
                                <td height="26">&nbsp;</td>
                                <td><input type="hidden" name="prsno"  value="<%=prsnohis%>"/></td>
                              </tr>
                            </table></td>
                          <td width="30%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td height="33"><table width="100%" border="0">
                              <tr> 
                                <td width="27%"><div align="right"></div></td>
                                <td width="73%"><input name="CancelPRS" type="button" id="CancelPRS3" value="Cancel PRS Report" onclick="ClickCancelPRS()"  />
                                  <input name="Cancel" type="button" id="CancelPRS" value="Cancel " onclick="ClickCancel()" /> 
                                </td>
                              </tr>
                            </table></td>
                          <td>&nbsp;</td>
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

function ClickCancelPRS(){
  var frm = document.form1; 
  var alertmsg="";
  var jprsno=frm.prsno.value;
  var jrequesterid=frm.requesterid.value;
  var jrequestername=frm.requestername.value;
  var jcancelremark=frm.cancelremark.value;

 alertmsg=alertmsg+IsEmpty(jprsno,"PRS NO");
 alertmsg=alertmsg+IsEmpty(jrequesterid,"Requester ID");
 alertmsg=alertmsg+IsEmpty(jrequestername,"Requester Name");
 alertmsg=alertmsg+IsEmpty(jcancelremark,"Cancel Remark");

  if(alertmsg == ""){
		 frm.action="report_cancel_prs_process.jsp";
		 if(confirm("Confirmation?")){
			frm.submit();			
		}		 					
  }else{	   
	alert(alertmsg);		
  }  
}

function ClickCancel(){  
var frm = document.form1;
frm.action="report_prs_history.jsp";		
frm.submit();						 					
 
}


function StartFocus(){
  var frm = document.form1; 
  frm.requesterid.focus();	
	
}

function onEnterRequesterid(){
if(event.keyCode==13)

var frm = document.form1;
	frm.requestername.focus();
}

function onEnterRequesterName(){
if(event.keyCode==13)

var frm = document.form1;
	frm.cancelremark.focus();

}

function onEnterCancelRemark(){
if(event.keyCode==13)

var frm = document.form1;
	frm.CancelPRS.focus();

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



</script>