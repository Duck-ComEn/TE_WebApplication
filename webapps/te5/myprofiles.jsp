<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="java.util.*"%>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import ="com.hitachigst.prb.itd.webservices.common.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<jsp:directive.page import="javax.xml.bind.JAXBElement;"/>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
                                                String pUserID = "";
                                                String pFirstName = "Error";
                                        		String pLastName = "Error";
                                        		String pSerial = "Error";
                                        		String pEmail = "Error";
                                        		String pPhone = "Error";
                                        		String pPlant = "Error";
                                        		String pRole = "Error";
                                        		
                                        		pUserID = (String)session.getAttribute("s_username"); 
                                        		
                                        		User user=new User();
                                        		//user.setUserID(pUserID);	
                                        		
                                        		//user=UserManager.getUserDetail(user);	
                                        		UserManagerClient client = new UserManagerClient();
												UserManagerPortType service = client.getUserManagerHttpPort();	
                                        		
                                        		user=service.getUserDetail(pUserID);	
                                        		
                                        		JAXBElement<String> x1 = (JAXBElement<String>)user.getFirstName();
                                        		pFirstName =x1.getValue();
                                        		
                                        		
                                        		
                                        		JAXBElement<String> x2 = (JAXBElement<String>)user.getLastName();
                                        		pLastName =x2.getValue();
                                        		
                                        		
                                        
                                        		
                                        		JAXBElement<String> x3 = (JAXBElement<String>)user.getSerial();
                                        		pSerial =x3.getValue();
                                        		
                                        		
                                        		
                                        		
                                        		JAXBElement<String> x4 = (JAXBElement<String>)user.getEmail();
                                        		pEmail =x4.getValue();
                                        		
                                        		
                                        		
                                        		JAXBElement<String> x5 = (JAXBElement<String>)user.getPhone();
                                        		pPhone =x5.getValue();
                                        		
                                        		
                                        		
                                        		JAXBElement<String> x6 = (JAXBElement<String>)user.getPlant();
                                        		pPlant =x6.getValue();

                                        		
                                        		JAXBElement<String> x7 = (JAXBElement<String>)user.getRoleName();
                                        		pRole =x7.getValue();
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
		version=TeWebVersionControl.getVersion();
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
   <li><a href="myprofiles.jsp">My Profiles</a></li>
    <li><a href="changepassword.jsp">Edit Password</a></li>
				<li><a href="logon_screen.jsp">Logout</a></li>
				<li><a href="#Top">Help</a></li>
				<li><a href="#Top">About</a></li>
		</ul>
			<br class="clear" />
	  </div>
	</div>
	<table width="100%" border="0">
      <tr>
        <td height="243" align="center" valign="top">
          <table class="form-noindent" cellspacing="3" cellpadding="5" width="50%" 
      border="0">
            <tbody>
              <tr>
                <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form action="logon_process.jsp" method="post" name="form1" target="_parent" id="form1">
                    <table width="100%" border="0">
                      <tr>
                        <td colspan="3" align="left"><span class="style1">My Profiles </span></td>
                      </tr>
                      <tr>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="23%" align="left"><span class="style2">First Name:</span>                          <label></label></td>
                        <td colspan="2" align="left"><%out.println(pFirstName); %></td>
                      </tr>
                      <tr>
                        <td align="left"><span class="style2">Last Name:</span></td>
                        <td colspan="2" align="left"><%out.println(pLastName); %></td>
                      </tr>
                      <tr>
                        <td align="left"><span class="style2">Serial:</span></td>
                        <td colspan="2" align="left"><%out.println(pSerial); %></td>
                      </tr>
                      <tr>
                        <td align="left"><span class="style2">Hitachi Email:</span></td>
                        <td colspan="2" align="left"><%out.println(pEmail); %></td>
                      </tr>
                      <tr>
                        <td align="left"><span class="style2">Phone Ext:</span></td>
                        <td colspan="2" align="left"><%out.println(pPhone); %></td>
                      </tr>
                      <tr>
                        <td align="left"><span class="style2">Plant:</span></td>
                        <td colspan="2" align="left"><%out.println(pPlant); %></td>
                      </tr>
                      <tr>
                        <td align="left"><span class="style2">Role:</span></td>
                        <td colspan="2" align="left"><%out.println(pRole); %></td>
                      </tr>
                      <tr>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="3">&nbsp;</td>
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
