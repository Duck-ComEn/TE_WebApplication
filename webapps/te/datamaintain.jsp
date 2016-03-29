<%@ include file="session.jsp"%>
<%@ page buffer="30kb"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="javazoom.upload.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.app.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.common.*"%>
<%@ page import ="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import ="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.datamaintain.*"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	      String datamaintain =request.getParameter("datamaintain");    	      
    	  DataMaintain dmtt = new DataMaintainanceManager().getDataMaintain(datamaintain);  
		  
		  DataMaintainanceManager dm = new DataMaintainanceManager();  
		  Vector[] acvcv=dm.getDataFromTable(datamaintain) ;			
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
.style3 {font-size: 12px}
.style2 {font-size: 12px; font-family: Tahoma; color: #000000;}
.style4 {font-size: 12px; font-family: Tahoma; color: #a97965;
}
a:link {
	text-decoration: none;
	color: #000000;
}
a:visited {
	text-decoration: none;
	color: a97965;
}
a:hover {
	text-decoration: none;
	color: a97965;
}
a:active {
	text-decoration: none;
	color: #000000;
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
		  <h1><a name="Top" id="Top"></a>
	        <% out.println(webname); %> 
        </h1>
<%@ include file="menu_managedata_process.jsp" %>
			<br class="clear" />
	  </div>
	</div>
	<table width="100%" border="0">
      <tr>
        <td height="243" align="center" valign="top">
          <table class="form-noindent" cellspacing="3" cellpadding="5" width="100%" 
      border="0">
            <tbody>
              <tr>
                <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form  method="post" name="form1" target="_parent" id="form1">
                <table width="100%" border="0">
                  <tr>
                    <td width="10px">&nbsp;</td>
                    <td width="96%"><table width="100%" border="0" align="left">
                        <tr> 
                          <td width="17%"><div align="right"><span class="style1">Data 
                              Maintain :</span></div></td>
                          <td width="83%"><div align="left"><span class="style1"> 
                              <%out.println(dmtt.getDataMaintainName());%>
                              </span></div></td>
                        </tr>
                        <tr> 
                          <td><div align="right"><span class="style4">Description 
                              :</span></div></td>
                          <td><div align="left"><span class="style4"> 
                              <%out.println(dmtt.getMaintainDescription());%>
                              </span></div></td>
                        </tr>
                        <tr> 
                          <td><div align="right"><span class="style4">Record Count 
                              :</span></div></td>
                          <td><div align="left"><span class="style4"> 
                              <%out.println(acvcv[0].size());%>
                              </span></div></td>
                        </tr>
                      </table>
                      <p>&nbsp;</p>
                      <p>&nbsp;</p>
                      <p>
                        <input name="Add22" type="button" id="Add22" value="Add Data" onclick="clickAdd()"/>
                        <input name="Edit2" type="button" id="Edit2" value="Edit Data" onclick="clickEdit()" />
                        <input name="Delete2" type="button" id="Delete" value="Delete Data" onclick="clickDelete()" />
                      </p></td>
                    <td width="10px">&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td> <table width="100%" border="0">
					    <tr>
						<td>&nbsp;</td> 
						</tr>
                        <tr>
						<%
                           Vector fieldList = dmtt.getFieldList(); 
  	                        DataMainTainFieldInfo fieldInfo1 =	  null;
							int colwidth1=100/fieldList.size();                            
  	                       for (int i = 0; i < fieldList.size(); i++) 
  	                       { 
  		                     fieldInfo1 = (DataMainTainFieldInfo) fieldList.get(i); 							
							  %><td width="<%out.println(colwidth1);%>%" height="10" align="center" class="style1 style3"><%out.println(fieldInfo1.getFieldName());%></td><%
                           }
		               %> 
                         
                        </tr>
                         <% 
						  for(int jj=0;jj<acvcv[0].size();jj++){						  
                          
							    %><tr><%
								for(int ii=0;ii<acvcv.length;ii++){ 									
									 %>
									 <td width="<%out.println(colwidth1);%>%" height="10"><span class="style4"><%out.println(acvcv[ii].get(jj)); %></span></td>				 
									<%
								}
								%></tr><%
							}            
                        %>
						<tr>
						<td>&nbsp;</td> 
						</tr>
                        <tr>
						  <td>&nbsp;</td> 
                          <td>&nbsp;</td>                          
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
						 <tr> 
                          <td colspan="10"> 						    
                            <input name="maintainselect" type="hidden" id="maintainselect"  value="<%out.println(datamaintain);%>"  />
                          </td>
                        </tr>
                      </table>

                      
                    </td>
                    <td>&nbsp;</td>
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

function clickDelete(){
	var frm = document.form1;	
	frm.action = "datamaintain_delete.jsp";		
	frm.submit();	
}

function clickAdd(){
	var frm = document.form1;
	var alertmsg="";
	
	if(alertmsg == ""){
		frm.action = "datamaintain_add.jsp";		
		frm.submit();		
	}else{
		alert(alertmsg);
		
	}
}

function clickEdit(){
	var frm = document.form1;		
		frm.action = "datamaintain_edit.jsp";
		frm.submit();	
}

</script>