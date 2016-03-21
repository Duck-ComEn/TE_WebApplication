<%@ include file="session.jsp"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.*"%>
<%@ page import="javazoom.upload.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.common.*"%>

<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.common.*"%>


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
version=FastReworkVersionControl.getVersion();
String apppath=application.getRealPath("");
		String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		new FastReworkConfig(apppath,webpath);
	%>
	
	
	<%
                                                  		long pTotalMemory = 0L;
                                                  		long pTotalAllPDFSize = 0L;
                                                                                		long pTotalBackupNotProcess = 0L;
                                                  		long pTotalLog = 0L;
                                                                                		long pTotalError = 0L;
                                                                                		long pMaxMemory = 0L;
                                                                                		long pMaxAllPDFSize = 0L;
                                                                                		long pMaxBackupNotProcess = 0L;
                                                  		long pMaxLog = 0L;
                                                                                		long pMaxError = 0L;
                                                                                        String pAutoBackup = "Error";
                                                                                        String pProcessFTP = "Error";
                                                                                        String pProcessTXN = "Error";
                                                                                        String pRMIService = "Error";
                                                                                		String pLocalPath = "Error";
                                                                                		
                                                                                		
                                                                                		
                                                                                		
                                                                                		
            
                                                                                		pTotalLog=FilesManagement.totalDirectorySize(new File(CommonConfig.getAPPLICATION_PATH()+"/log"));
                                                                                		pTotalError=FilesManagement.totalDirectorySize(new File(CommonConfig.getAPPLICATION_PATH()+"/error"));
                                                                                		pTotalBackupNotProcess=FilesManagement.totalDirectorySize(new File(CommonConfig.getAPPLICATION_PATH()+"/backup"));
                                                                                		pTotalAllPDFSize=FilesManagement.totalDirectorySize(new File(FastReworkConfig.getAPPLICATION_PATH()+"/DATA-INF/Rawdata"));
                                                                                		pLocalPath=FastReworkConfig.getWEB_PATH();
                                                                                		pMaxMemory=SystemManagement.getMaxMemory();
                                                                                		pMaxLog=Long.parseLong(IniFilesReader.getReturnProperties("Remote.Application","Log"));
                                                                                		pMaxError=Long.parseLong(IniFilesReader.getReturnProperties("Remote.Application","Error"));
                                                                                		pMaxAllPDFSize=Long.parseLong(IniFilesReader.getReturnProperties("Remote.Application","PDF Files"));
                                                                                		pMaxBackupNotProcess=Long.parseLong(IniFilesReader.getReturnProperties("Remote.Application","Backup Process"));
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
.style3 {font-family: Tahoma;
	font-weight: bold;
	font-size: 12px;
	color: #a97965;
}
.style3 {font-family: Tahoma;
	font-weight: bold;
	font-size: 12px;
	color: #FFFFFF;
}
-->
    </style>
</head>

<body>

	<div id="header">
	  <div id="header-container">
			<p>Version : <% out.println(version); %> | <a href="#Top">Logon: <% out.println(session.getAttribute("s_username").toString().trim()); %></a><br />
			</p>
	  <img src="DATA-INF/Image/logo.jpg" alt="Your Logo" title="Your Logo" />
		  <h1><a name="Top" id="Top"></a><a href="#Top"><% out.println(webname); %> </a></h1>
		  <ul>
<li><a href="home.jsp">Home</a></li>
   <li><a href="adduser.jsp">Add User</a></li> 
				<li><a href="maintenance.jsp">Maintenance</a></li>
		</ul>
			<br class="clear" />
	  </div>
	</div>
	<table width="100%" border="0">
      <tr>
        <td height="243" align="center" valign="top">        <table class="form-noindent" cellspacing="3" cellpadding="5" width="50%" 
      border="0">
          <tbody>
            <tr>
              <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form action="changepassword.jsp" method="post" enctype="multipart/form-data" name="form1">
			  
		  
                  <table width="100%" border="0">
                    <tr>
                      <td colspan="3" align="left"><span class="style1">Maintenance</span></td>
                    </tr>
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="35%" align="left"><label><span class="style2">Delete Error: </span></label></td>
                      <td width="33%" align="left"><label class="style2">
                        <%out.println(pTotalError); %>
                        /
                        <%out.println(pMaxError); %>
</label></td>
                    <td width="32%" align="left"></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Delete Log:</span></td>
                      <td align="left" class="style2"><%out.println(pTotalLog); %>
                        /
                        <%out.println(pMaxLog); %></td>
                    <td align="left"></td>
                    </tr>
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="3"><input name="SubmitFlag" type="hidden" id="SubmitFlag" /></td>
                    </tr>
                  </table>
              </form></td>
            </tr>
          </tbody>
        </table></td>
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


function clickDeleteLogSubmit(){

var frm = document.form1;
var alertmsg="";


	if(alertmsg != ""){
			alert(alertmsg);
		}else{
			frm.action = "delete_log.jsp";
			if(confirm("Confirmation?")){
			frm.submit();
			}
	}
}

function clickDeleteErrorSubmit(){

var frm = document.form1;
var alertmsg="";


	if(alertmsg != ""){
			alert(alertmsg);
		}else{
			frm.action = "delete_error.jsp";
			if(confirm("Confirmation?")){
			frm.submit();
			}
	}
}

</script>