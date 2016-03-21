<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function clickchangepwd(){
var joldpwd = document.getElementById('OldPassword');
var jnewpwd = document.getElementById('NewPassword');
var jconfirmpwd = document.getElementById('ConfirmNewPassword');
var jsubmitFlag = document.getElementById('SubmitFlag');
     
	if(joldpwd.value!="" && jnewpwd.value!="" && jconfirmpwd.value!="" ){
	  if (jnewpwd.value==jconfirmpwd.value){
	      if (joldpwd.value!=jnewpwd.value){
				  jsubmitFlag.value="y";
				  
				  var frm = document.form1;
				  frm.action = "changepassword.jsp";	
				  frm.submit();
		  }else{
		     alert("Please input difference new password.");
		  }		  
	  }else{
	     alert("New Password vs Confirm New Password are not match.");
	  }	  
	}else{
	   alert("Your input are empty.");
	}	
	

}


</script>

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
.style1 {	font-size: 16px;
	font-weight: bold;
}
-->
    </style>
</head>

<body>
<%
  String prevpage ="";
  if (request.getParameter("prevpage")!=null){prevpage =request.getParameter("prevpage").trim();  }	 
  
%>
<!-- ============================================Top Layout============================================================================== -->	
 <div id="header">
      <table width="100%" border="0">
		<tr> 
		  <td width="33%"><img src="DATA-INF/Image/telogo.jpg" alt="Your Logo" title="Your Logo" /></td>
		  <td width="33%"><h1><a name="Top" id="Top"></a><a href="#"><%//out.println(webname); %> </a></h1></td>
		  <td width="34%"> <p>Version : <%out.println(version); %> | <a href="#Top">Logon: <%out.println(session.getAttribute("s_username").toString().trim());%></a><br /></p> </td>	  
		</tr>
		<tr> 
		  <td width="33%"></td>
		  <td width="33%"></td>
		  <td width="34%"></td>
		</tr>   	 
     </table>  
	 
	
		  <div id="header-container">		     	
			  <ul>
			    <%if(prevpage.equals("logon")==false){%> 
				   <li><a href="home.jsp">Home</a></li>
				   <li><a href="myprofiles.jsp">My Profiles</a></li>
				   <li><a href="changepassword.jsp">Edit Password</a></li>
				   <li><a href="logon_screen.jsp">Logout</a></li>
				   <li><a href="#Top">Help</a></li>			   
			    <%}%>  	
				<li><a href="logon_screen.jsp">Logout</a></li>   
			  </ul>
			  <br class="clear" />
  </div>
	 
	 
	</div>
<!-- ================================================================================================================================== -->
<%
  
  String OldPassword ="";
  if (request.getParameter("OldPassword")!=null){OldPassword =request.getParameter("OldPassword").trim();  }	 
  
  String NewPassword ="";
  if (request.getParameter("NewPassword")!=null){NewPassword =request.getParameter("NewPassword").trim();  }	
  
  String ConfirmNewPassword ="";
  if (request.getParameter("ConfirmNewPassword")!=null){ConfirmNewPassword =request.getParameter("ConfirmNewPassword").trim();  }	
  
  String SubmitFlag ="";
  if (request.getParameter("SubmitFlag")!=null){SubmitFlag =request.getParameter("SubmitFlag").trim();}
  
  String nextpage ="";
  if (request.getParameter("nextpage")!=null){nextpage =request.getParameter("nextpage").trim();}
  
  String errmsg="";

  try{
	  if (SubmitFlag.equals("y")){
		   UserAccountManager userm= new UserAccountManager();
		   String  dbpwd=userm.getCurrentPWD(session.getAttribute("s_username").toString().trim());
		   
		   
		   if(OldPassword.trim().equals(dbpwd)){
			  userm.updatepwd2db(session.getAttribute("s_username").toString().trim(),NewPassword);
			  response.sendRedirect("home.jsp");
			  
		   }else{
			  errmsg="Current password are incorrect.";
		   }
       }
   }catch (ErrException e){
      errmsg=e.toString();
   }	   
%>
<table width="100%" border="0">
  <tr> 
    <label><td height="243" align="center" valign="top"> <table class="form-noindent" cellspacing="3" cellpadding="5" width="50%" 
      border="0">
        <tbody>
          <tr> 
            <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form action="" method="post" name="form1" target="_parent" id="form1">
                <table width="100%" border="0" align="right">
                  <tr> 
                    <td colspan="3" align="left"><span class="style1"><font size="+1">Change 
                      Password</font> </span></td>
                  </tr>
                  <tr> 
                    <td colspan="3"></td>
                  </tr>
                  <tr> 
                    <td colspan="3"> 
                      <%if(prevpage.equals("logon")){%>
                      <div align="center"><font color="#333333" size="2"><em>Please 
                        change default password to other password.</em></font></div>
                      <%}%>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3"><div align="center"><strong><font color="#FF0000"> 
                        <%=errmsg%>
                        </font></strong></div></td>
                  </tr>
                  <tr> 
                    <td colspan="3"><div align="center"><strong><font color="#FF0000"> 
                        </font></strong></div></td>
                  </tr>
                  <tr> 
                    <td width="35%" align="left"><div align="right"><font size="2"><span class="style2">Current 
                        Password:</span> </font></div>
                      <font size="2"> 
                      <label></label>
                      </font></td>
                    <td colspan="2" align="left"><label> 
                      <input name="OldPassword" type="password" id="OldPassword2" size="30" />
                      </label></td>
                  </tr>
                  <tr> 
                    <td align="left"><div align="right"><font size="2"><span class="style2">New 
                        Password</span>:</font></div></td>
                    <td colspan="2" align="left"><input name="NewPassword" type="password" id="NewPassword" size="30" /></td>
                  </tr>
                  <tr> 
                    <td align="left"><div align="right"><font size="2"><span class="style2">Confirm 
                        New Password</span>:</font></div></td>
                    <td colspan="2" align="left"><input name="ConfirmNewPassword" type="password" id="NewPassword" size="30" /></td>
                  </tr>
                  <tr> 
                    <td colspan="3">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td align="center">&nbsp;</td>
                    <td width="21%" align="left" valign="middle"><input name="Submit" type="button" id="Submit" value="Change PWD"  onclick="clickchangepwd();" /></td>
                    <td width="44%" align="left" valign="middle"><label> 
                      <input name="Cancel" type="reset" id="Cancel" value="Reset" />
                      </label></td>
                  </tr>
                  <tr> 
                    <td colspan="3"><input name="SubmitFlag" type="hidden" id="SubmitFlag" /></td>
                  </tr>
                </table>
              </form></td>
          </tr>
        </tbody>
      </table></td></label>
  </tr>
</table>
<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>
