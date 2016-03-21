<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>

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
	    String path = request.getContextPath();			   
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";			
		String apppath=application.getRealPath("");
	    String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		
		new TeWebConfig(apppath,webpath);    
		    
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
.style1 {	font-size: 16px;
	font-weight: bold;
}
-->
    </style>
</head>

<body>

    <%@ include file="PageLayout/logintoplayout.jsp" %>
	
	<table width="100%" border="0">
      <tr>
        <td height="243" align="center" valign="top">
          <table class="form-noindent" cellspacing="3" cellpadding="5" width="40%" 
      border="0">
            <tbody>
              <tr>
                <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form action="logon_process.jsp" method="post" name="form1" target="_parent" id="form1">
                    <table width="100%" border="0">
                      <tr>
                        <td colspan="3" align="left"><span class="style1">Logon</span></td>
                      </tr>
                      <tr>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="25%" align="left">Username:
                            <label></label></td>
                        <td colspan="2" align="left"><label>
                          <input name="username" type="text" id="username" size="32" />
                        </label></td>
                      </tr>
                      <tr>
                        <td align="left">Password:</td>
                        <td colspan="2" align="left"><label>
                          <input name="password" type="password" id="password" size="32" />
                        </label></td>
                      </tr>
                      <tr>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="center">&nbsp;</td>
                        <td width="17%" align="left" valign="middle"><input type="submit" name="button" id="button" value="Submit" /></td>
                        <td width="58%" align="left" valign="middle"><label>
                          <input type="reset" name="button2" id="button2" value="Cancel" />
                        </label></td>
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
    <%@ include file="PageLayout/footerlayout.jsp" %>

</body>
</html>
