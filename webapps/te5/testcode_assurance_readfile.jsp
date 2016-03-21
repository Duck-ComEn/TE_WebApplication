<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String apppath=application.getRealPath("");
	String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
	new TeWebConfig(apppath,webpath);     
	SPDBAccess sp=new SPDBAccess();  
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
     .form-noindent {	BORDER-RIGHT: #c3d9ff 1px solid; BORDER-TOP: #c3d9ff 1px solid; BORDER-LEFT: #c3d9ff 1px solid; BORDER-BOTTOM: #c3d9ff 1px solid; BACKGROUND-COLOR: #ffffff
}
.style1 {	font-size: 16px;
	font-weight: bold;
}
-->
    </style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>    
</head>

<body>
<%String menumode="testcode_assurance_readfile.jsp";%>
<%@ include file="PageLayout/testcode_hometoplayout.jsp" %>
<table align="center" class="form-noindent" cellspacing="3" cellpadding="5" width="95%" 
      border="0">
  <tbody>
    <tr> 
      <td height="247" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
          <table width="100%" height="237" border="0">
            <tr> 
			  <%@ include file="testcode_assurance_expression_commoninclude.jsp" %>
              <%
				 try{
				  String filename =request.getParameter("filename");
				  RawdataManager rm = (RawdataManager)session.getAttribute(session.getAttribute("s_username")+"_tca_rawdataobject");
                  //session.setAttribute(session.getAttribute("s_username")+"_tca_rawdataobject",null);				
				  
				  String huserselectlist ="";
                  if (request.getParameter("huserselectlist")!=null){huserselectlist =request.getParameter("huserselectlist").trim();  }  			  
				%>
				<input type="hidden" name="huserselectlist" value="<%=huserselectlist%>"/>
           
              <td colspan="3" align="left"><span class="style1">Test Code Assurance 
                :: Read File 
                <%=filename%>
                </span></td>
            </tr>
            <tr> </tr>
            <tr> 
              <td height="21" colspan="3">&nbsp;</td>
            </tr>
            <tr> 
              <td></td>
              <td width="12%"></td>
              <td width="51%"></td>
            </tr>
            <tr> 
              <td height="181" colspan="3"><table width="100%" border="0">
                  <tr> 
                    <td width="2%" height="59">&nbsp;</td>
                    <td width="96%" valign="top"><fieldset>
                      <p align="left"> 
                        <legend>Read detail</legend>
                      </p>
                      <p>Page :: <em><strong> 
                        <%	
						   int p=0;
						  if (request.getParameter("p")!=null){		
						      p =Integer.parseInt(request.getParameter("p"));
						 }
						 File f=new File(rm.getRawdataDir()+"\\"+filename);
                         Vector v= rm.readAllRawdata(f);
					     int pagenum=v.size()/1000;
						 int remain=v.size()%1000;
						 if (remain<1000) {pagenum=pagenum+1;}
						 int minp=p*1000;
						 int maxp=0;
						 if (v.size()<(p*1000)+1000){
						     maxp= (p*1000)+remain;
						 }else{
						    maxp= (p*1000)+999;
						 }
						    
						 for(int x=0;x<pagenum;x++){
						    %>
                        <a href="testcode_assurance_readfile.jsp?filename=<%=filename%>&p=<%=x%>">&lt; 
                        <%=x+1%>
                        &gt;</a> 
                        <!-- <font color="#FF0000">&lt;2&gt;</font> -->
                        <%
						 }
					  %>
                        </strong></em></p>
                      <p> <em><strong>Total Row :: 
                        <%=v.size()%>
                        &nbsp; Start Row:: 
                        <%=minp+1%>
                        &nbsp; End Row :: 
                        <%=maxp%>
                        </strong></em></p>
                      <p><em><strong>
                        <input name="buttSelectExp" type="button" id="buttSelectExp" value="Select Expression"  onclick="clickselectexpression();"/>
                        </strong></em> </p>
                      </fieldset></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table>
                <table width="100%" border="0">
                  <tr> 
                    <td align="left">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td height="132"> 
                      <%
							    
						for(int i=minp;i<maxp/*v.size()*/;i++){                                       
						%>
                      <input type="hidden" name="minrow" /> <div align="left"> 
                        <%=v.get(i).toString()%>
                      </div>
                      <%                    
                        }
					    v.removeAllElements();
															 
					   }catch(Exception e){
								  %>
                      <div align="center"><font color="#FF0000" size="3"><strong><em>Error 
                        :: 
                        <%=e%>
                        </em></strong></font> </div>
                      <%
							   }
							  %>
                      <p>&nbsp;</p></td>
                  </tr>
                </table>
                <p>&nbsp;</p></td>
            </tr>
          </table>
        </form></td>
    </tr>
  </tbody>
</table>
<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function clickselectexpression(){
var frm = document.form1;
frm.action = "testcode_assurance_filedetail.jsp";	 
frm.submit();

}






</script>
