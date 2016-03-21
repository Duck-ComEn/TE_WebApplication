<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String apppath=application.getRealPath("");
	String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
	new TeWebConfig(apppath,webpath);
	
%>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="author" content="Luka Cvrk (www.solucija.com)" />
<meta name="description" content="My Site" />
<meta name="keywords" content="key, words" />
<%	
		String version="";
		String webname="";
		webname=IniFilesReader.getReturnProperties("Local.Application","Application Name");	
		version=TeWebVersionControl.getVersion();
	%>
<title>
<% out.println(webname); %>
</title>
<link rel="stylesheet" type="text/css" href="DATA-INF/CSS/1.css" media="screen" />
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
<%String menumode="testcode_assurance_testexpression.jsp";%> 
<!-- ----------------------Te Logo--------------------------- -->
<div id="Layer1" style="position:absolute; left:3px; top:3px; width:84px; height:70px; z-index:1"><img src="DATA-INF/Image/telogo.jpg" width="275" height="58" /></div>
<!-- -------------------------------------------------------- -->

<div id="contentleft">
	
		
  <div id="left"> 
    <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
    <div id="headerL">		        
				<!-- <div id="contentLR">	 -->  	
			      <!-- <ul><li></li></ul> -->
				  <!-- <br class="clear" /> -->
				<!-- </div> -->
		   </div> 
		   
		   
   <!------------ Top left menu ------------------->
		    <div class="boxright" >  
		      <div class="boxcenter" >
				<div class="boxleft" >
				</div>     
			  </div>
		    </div> 			
			
    <!-- ---------------------------------------------- -->		
	        	      
		    <ul id="side_menu">
      <!--  <li>		 -->
      <!-- <a href="http://www.conceptnova.com/">TE Process</a>	 -->
      <!-- </li> 	 -->
      <!-- <div class="side_menuboxleft"><li> <div class="side_menuboxright" ><a href="http://www.conceptnova.com/">TE Maintenance</a></div></li></div>
				<div class="side_menuboxleft"><li> <div class="side_menuboxright" ><a href="http://www.conceptnova.com/">TE Monitoring</a></div></li></div>		
				 <div class="side_menuboxleft"><li> <div class="side_menuboxright" ><a href="http://www.conceptnova.com/">TE Early Detection</a></div></li></div>
				<div class="side_menuboxleft"><li> <div class="side_menuboxright" ><a href="http://www.conceptnova.com/">TE Utilization</a></div></li></div>  -->
      <!------------ Bottom left menu ------------------->
      <!-- <div class="boxbmright" >  
				  <div class="boxbmcenter" >
					<div class="boxbmleft" >
					</div>     
				  </div>
				</div>  			 -->
      <!-- ---------------------------------------------- -->
      <div align="right"></div>
    </ul> 
		   	
		</div>	 	 
		 
		
  <!-- ============================================Top Layout============================================================================== -->
  
  <div id="right">
		   <%@ include file="PageLayout/testcode_righttoplayout.jsp" %>		
		   <div id="subheader">		
            </div> 
		</div>
  <table align="center" width="69%" height="69%" border="0" valign="top">
    <tr> 
      <td width="65%" height="211" align="right" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><div align="center"><img src="DATA-INF/Image/number1.jpg" width="241" height="165" /></div></td>
          </tr>
          <tr> 
            <td><div align="center"><font size="+1"><strong><font color="#990000">We 
                will support any idea for make our work to be easiness.</font></strong></font></div></td>
          </tr>
          <tr> 
            <td><div align="center"><font size="+1"><strong><font color="#990000">So 
                your idea , Its very important with our team.</font></strong></font></div></td>
          </tr>
        </table></td>
    </tr>
  </table> 
		  
		  
		   
		
<!-- ================================================================================================================================== -->
		</div>  
			
	</div>
	<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>