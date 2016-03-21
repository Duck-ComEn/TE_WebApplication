<%@ include file="session.jsp"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="java.util.*"%>
<%@ page import="javazoom.upload.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.common.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import ="com.hitachigst.prb.itd.webservices.common.*"%>
<jsp:directive.page import="javax.xml.bind.JAXBElement;"/>


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
	%>
	
	
	<%
											String pUserID = "";
											String pPassword = "";
											String pUserName = "";
											String pFirstName = "";
											String pLastName = "";
											String pSerial = "";
											String pEmail = "";
											String pPhone = "";
											String pPlant = "";
											String pRole = "";
											String pSubmitFlag = "";
											String errormessage = "";
														
											if (MultipartFormDataRequest.isMultipartFormData(request)) {
												MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
															
												pSubmitFlag = mrequest.getParameter("SubmitFlag");
												pFirstName = mrequest.getParameter("FirstName");
												pLastName = mrequest.getParameter("LastName");
												pSerial = mrequest.getParameter("Serial");
												pEmail = mrequest.getParameter("Email");
												pPhone = mrequest.getParameter("Phone");
												pPlant = mrequest.getParameter("Plant");
												pRole = mrequest.getParameter("Role");
															
												StringTokenizer stc = new StringTokenizer(pEmail, "@");
												while (stc.hasMoreTokens()) {
													pUserID = stc.nextToken();
													stc.nextToken();
												}
												
												pPassword = pUserID + pUserID.length();
														pUserName=pFirstName + "_" + pLastName;
												User user=new User();
												
												UserManagerClient client = new UserManagerClient();
												UserManagerPortType service = client.getUserManagerHttpPort();	
												
												
												/*user.setUserID(pUserID);
												user.setPassword(pPassword);
												user.setUserName(pUserName);
												user.setFirstName(pFirstName);
												user.setLastName(pLastName);
												user.setSerial(pSerial);
												user.setEmail(pEmail);
												user.setPhone(pPhone);
												user.setPlant(pPlant);
												user.setRoleName(pRole);*/
														
												if (!pSubmitFlag.equals("")) {
															
													errormessage=service.insertUser(pUserID,pPassword,pUserName,pSerial,pEmail,pPhone,pPlant,pRole);
													MonitorLog.setLog("User "+session.getAttribute("s_username").toString()+" Register User "+pUserID,"");
													if(errormessage.equals("")){
																		
														%>
															<jsp:forward page="register_confirmation.jsp">
															<jsp:param name="userid" value="<%=pUserID %>" />
															</jsp:forward>
														<%
																		
													}else{
													
														%>
															<jsp:forward page="error.jsp">
															<jsp:param name="errormessage" value="<%=errormessage%>" />
															</jsp:forward>
														<%
													}
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
<%@ include file="menu_admin_process.jsp" %>
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
                      <td colspan="3" align="left"><span class="style1">Add New User </span></td>
                    </tr>
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="35%" align="left"><label><span class="style2">First Name: </span> </label></td>
                      <td colspan="2" align="left"><label>
                        <input name="FirstName" type="text" id="FirstName" size="30" />
</label></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Last Name:</span></td>
                      <td colspan="2" align="left"><input name="LastName" type="text" id="LastName" size="30" /></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Serial:</span> </td>
                      <td colspan="2" align="left"><input name="Serial" type="text" id="Serial" size="30" /></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Hitachi Email:</span></td>
                      <td colspan="2" align="left"><input name="Email" type="text" id="Email" size="30" /></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Phone Ext: </span> </td>
                      <td colspan="2" align="left"><input name="Phone" type="text" id="Phone" size="30" /></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Plant:</span></td>
                      <td colspan="2" align="left"><select name="Plant" id="Plant">
                        <option value="Plant"> ------------Plant------------- </option>
                        <option value="TH01"> TH01 </option>
                        <option value="SU01"> SU01 </option>
                      </select></td>
                    </tr>
                    <tr>
                      <td align="left"><span class="style2">Role: </span></td>
                      <td colspan="2" align="left"><select name="Role" id="Role">
                        <option value="Role"> ------------Role-------------- </option>
                        <option value="admin"> Admin </option>
                        <option value="viewer"> Viewer </option>
			<%
	                  if (session.getAttribute("s_role").toString().trim().equals("system")) {
    	                %>
    	                  <option value="system"> System </option>
    	                <%
			}			
			%>

                        
                      </select></td>
                    </tr>
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="center">&nbsp;</td>
                      <td width="21%" align="left" valign="middle"><input name="Submit" type="button" id="Submit2"
													value="Submit" onclick="clickSubmit()" /></td>
                      <td width="44%" align="left" valign="middle"><label>
                        <input name="Cancel" type="button" id="Cancel2"
													value="Cancel" onclick="clickCancel()" />
</label></td>
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

function clickSubmit(){

	
var frm = document.form1;
var alertmsg="";
var jFirstName=frm.FirstName.value;
var jLastName=frm.LastName.value;
var jSerial=frm.Serial.value;
var jEmail=frm.Email.value;
var jPhone=frm.Phone.value;
var jPlant=frm.Plant.value;
var jRole=frm.Role.value;

if(jFirstName == "" || jFirstName.length >50){
	alertmsg=alertmsg+"Invalid Input First Name \n"
}
if(jLastName == "" || jLastName.length >50){
	alertmsg=alertmsg+"Invalid Input Last Name \n"
}
if(jSerial.length==7){
		if(jSerial == null || jSerial.length != 7){
			alertmsg=alertmsg+"Invalid Input Serial \n"
		}else if(isNaN(jSerial)){
			alertmsg=alertmsg+"Invalid Input Serial \n"
		}
}else{
	alertmsg=alertmsg+"Invalid Input Serial \n"
}
if(jEmail.indexOf("@") != -1 && jEmail.indexOf(".") != -1) {

}else {
    alertmsg=alertmsg+"Invalid Input Email \n"
}
if(jPhone == "" || jPhone.length > 7){
	alertmsg=alertmsg+"Invalid Input Phone \n"
}
if(jPlant == "Plant" || jPlant == null){
	alertmsg=alertmsg+"Invalid Input Plant \n"
}
if(jRole == "Role" || jRole == null){
	alertmsg=alertmsg+"Invalid Input Role \n"
}
if(alertmsg != ""){
		alert(alertmsg);
	}else{
		frm.SubmitFlag.value = "submit";	
		frm.action = "adduser.jsp";
		if(confirm("Confirmation?")){
			frm.submit();
		}
}
}

function clickCancel(){	
	var frm = document.form1;	
	frm.FirstName.value = "";
	frm.LastName.value="";	
	frm.Serial.value="";
	frm.Email.value="";
	frm.Phone.value="";
	frm.Plant.value="Plant";
	frm.Role.value="Role";
	frm.SubmitFlag.value="";
	//frm.action="register.jsp";
	//frm.submit();
	}
</script>