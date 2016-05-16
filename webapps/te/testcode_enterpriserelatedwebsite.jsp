<%@ page language="java" %>
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
<link rel="stylesheet" type="text/css" href="DATA-INF/CSS/style.css" media="screen" />

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
<%String menumode="testcode_enterpriserelatedwebsite.jsp";%> 
<!-- ----------------------Te Logo--------------------------- -->
<div id="Layer1" style="position:absolute; left:3px; top:3px; width:84px; height:70px; z-index:1"><img src="DATA-INF/Image/telogo.jpg" width="275" height="58" /></div>
<!-- -------------------------------------------------------- -->

<!-- ---------------------------------Left Layout -------------- -->
		
	  <div id="left"> 
		<%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
		<div id="headerL"> </div> 
	
	   <!------------ Top left menu ------------------->
		<!--****************************Closed Top left menu
		<div class="boxright" >  
		   <div class="boxcenter" > 
		       <div class="boxleft" > </div>      
			</div>
		</div> 			        
		End of Closed code****************************-->
		
		<!-- ---------------------------------------------- -->			
		
		<ul id="side_menu"><!--  %@ include file="testcode_leftmenu.jsp" %  --></ul> 
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
            <td><div align="center"></div></td>
          </tr>
          <tr> 
            <td><div align="center">
                <p align="left"><font size="+1"><strong><font color="#990000">Related 
                  Website for Enterprise product</font></strong></font> </p>
                <table border="1" cellspacing="0" bordercolor="#CCCCCC">
                  <tr bgcolor="#333333"> 
                    <td width="271"><div align="left"><font color="#FFFFFF" size="3"><strong>Link</strong></font></div></td>
                    <td width="802"><font color="#FFFFFF" size="3"><strong>Description</strong></font></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><strong><font size="3"><a href="http://tecode1.sanjose.hgst.com/">TE 
                        CODE1 </a></font></strong></div></td>
                    <td><div align="left"><font size="3">Test code release packge 
                        for all enterprise product</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><strong><font size="3"><a href="http://sidewinder.sanjose.hgst.com/twiki/bin/view/Srst/WebHome">TWiki</a></font></strong></div></td>
                    <td><div align="left"><font size="3">Description of juggernaut 
                        code specification (Application Factory,ErrorCode,PersistentDataObject,TestEvent,TraceEventDescription)</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td> <div align="left"><strong><font size="3"><a href="http://fiweb.sanjose.hgst.com/requests/">Test 
                        Code Change Request </a></font></strong></div></td>
                    <td><div align="left"><font size="3">Test code changes request 
                        for enterprise SoC5 test code</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><strong><font size="3"><a href="http://sjf41srv.sanjose.hgst.com/bugzilla/">Bugzilla</a></font></strong></div></td>
                    <td><div align="left"><font size="3">Description of technical 
                        information changes item for SoC5 test code</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><strong><font size="3"><a href="http://fogbugz.rochester.hgst.com/">FogBugz</a></font></strong></div></td>
                    <td><div align="left"><font size="3">Test code changes request 
                        for enterprise SoC6 test code (Common code base)</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td> <div align="left"><font size="3"><strong><a href="http://persephone.snjmfg.mfg.hgst.com/">WW 
                        Servo</a></strong></font></div></td>
                    <td><div align="left"><font size="3">Sanjose Servo website 
                        including HiLiter installation files , Servo Wiki and 
                        etc</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><a href="http://tecodetracker.rochester.hgst.com/cdtracker"><strong>Code 
                        Tracker</strong></a></font></div></td>
                    <td><div align="left"><font size="3">Test code release tracker 
                        for enterprise SoC6 test code</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><a href="http://fiweb.sanjose.hgst.com/training2013/"><strong>CBF 
                        Training Material</strong></a></font></div></td>
                    <td><div align="left"><font size="3">Training Material for 
                        CBF Product</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><strong><font size="3"><a href="http://fiweb.sanjose.hgst.com/training2012v3/">MPS 
                        Training Material</a></font></strong></div></td>
                    <td><div align="left"><font size="3">Training Material for 
                        MPS Product</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><strong><a href="http://tecode1.sanjose.hgst.com/testtimes/">Test 
                        Time Road Map</a></strong></font></div></td>
                    <td><div align="left"><font size="3">Test time roadmaps for 
                        enterprise product</font></div></td>
                  </tr>
                  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><strong><a href="http://fogbugz.rochester.hgst.com/default.asp?W1791">HDD Vocabulary</a></strong></font></div></td>
                    <td><div align="left"><font size="3">Related HDD Vocabulary</font></div></td>
                  </tr>
                   <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><strong><a href="DocumentSharing\HDD Terminology and Experiences.pdf">HDD Terminology and Experiences</a></strong></font></div></td>
                    <td><div align="left"><font size="3">HDD Terminology and Experiences</font></div></td>
                  </tr>
				  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><strong><a href="DocumentSharing\Fail F002 CEP product after resume R9.pptx">HDD Terminology and Experiences</a></strong></font></div></td>
                    <td><div align="left"><font size="3">HDD Terminology and Experiences</font></div></td>
                  </tr>
				  <tr bgcolor="#D5EAFF"> 
                    <td><div align="left"><font size="3"><strong><a href="https://hgst.jiveon.com/login.jspa?referer=%2Fdocs%2FDOC-49105">CBG FI Training 2015</a></strong></font></div></td>
                    <td><div align="left"><font size="3">CBG FI Training 2015</font></div></td>
                  </tr>
				  
                </table>
              </div></td>
          </tr>
          <tr> 
            <td><div align="center"><font size="+1"><strong></strong></font></div></td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 
		  
		  
		   
		
<!-- ================================================================================================================================== -->
		</div>  
			
	</div>
	<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>