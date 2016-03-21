<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hitachigst.prb.te.srstseqdistrbution.*"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String apppath=application.getRealPath("");
	String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
	new TeWebConfig(apppath,webpath);
    
	
	String rawdatapath=IniFilesReader.getReturnProperties("Local.Application.tca","RAWDATA PATH");
	rawdatapath=rawdatapath.trim().replace("\\","/");
	String httppath=webpath+rawdatapath+session.getAttribute("s_username").toString()+"/";
	
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
		//SPDBAccess sp=new SPDBAccess();
		
	%>
<title>
<% out.println(webname); %>
</title>
<!-- <link rel="stylesheet" type="text/css" href="DATA-INF/CSS/1.css" media="screen" /> -->
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
<!-- ----------------------Te Logo--------------------------- -->
<div id="Layer1" style="position:absolute; left:3px; top:3px; width:84px; height:70px; z-index:1"><img src="DATA-INF/Image/telogo.jpg" width="275" height="58" /></div>
<!-- -------------------------------------------------------- -->

<div id="contentleft">
	
 <%String menumode="testcode_srstseq_distribution_filedetail.jsp";%>	
  <div id="left"> 
    <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
    <div id="headerL"> 
      <!-- <div id="contentLR">	 -->
      <!-- <ul><li></li></ul> -->
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
                   		   
				    
					  <%@ include file="testcode_leftmenu.jsp" %>	             
                   
				     

			        		    	     				  
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
	       </ul> 
		   	
		</div>	 	 
		 
		
<!-- ============================================Top Layout============================================================================== -->	
        
  <div id="right"> 
    <%@ include file="PageLayout/testcode_righttoplayout.jsp" %>
  </div> 
			
  <!-- ------------------------------------------------------------------------------------------------------------------------ -->
  <table align="center" class="form-noindent" cellspacing="3" cellpadding="5" width="58%" 
      border="0">
    <tbody>
      <tr> 
        <td height="354" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
            <table width="100%" height="245" border="0">
              <tr> 
                <td colspan="3" align="left"><span class="style1"><span class="style1">SRST 
                  Sequence Time Distribution:</span> :: SRST Version Selection</span></td>
              </tr>
              <tr> </tr>
              <tr> 
                <td height="22" colspan="3">
                  <%
								    String userselectlist="";
									
									String process =request.getParameter("process").toUpperCase(); 
									String product =request.getParameter("product").toUpperCase();									
									String srstcodeversionlist = request.getParameter("srstcodeversionlist").toUpperCase(); //"X1H2_1,X1I3_1836,X1L0_8,X1K1_1155, ";//
																		
									String errmsg ="";
									if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  }
									String pagenumber=request.getParameter("pagenum");
									SRSTSeqDistributionManager srst=new SRSTSeqDistributionManager(session.getAttribute("s_username").toString());
									
									if(errmsg.equals("")==false){
									  %>
										<font color="#FF0000"><strong><em><%=errmsg%></em></strong></font>   
									   <%										   
									}	
									%>
                  <input type="hidden" name="process" value="<%=process%>"/> 
				  <input type="hidden" name="product" value="<%=product%>"/>                            
				  <input type="hidden" name="txtsrstversion" value=""/> 
				  <input type="hidden" name="srstcodeversionlist" value="<%=srstcodeversionlist%>"/>
                   </td>
              </tr>
              <tr> 
                <td></td>
                <td width="12%"></td>
                <td width="51%"></td>
              </tr>
              <tr> 
                <td height="183" colspan="3"><table width="100%" border="0">
                    <tr> 
                      <td width="2%" height="162">&nbsp;</td>
                      <td width="96%" valign="top"> <font size="2"><em><strong>Please select SRST code version as you would like to summary SRST Sequence Distribution.</strong></em></font> 
                        
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="46%"><div align="center"><fieldset>
                                <legend>Controller</legend>
                                <!-- <br class="clear" /> -->
                                <table width="74%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td><div align="center"></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td><div align="center">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr> 
                                            <td width="35%" height="25"><div align="right">SRST Code Version :: </div></td>
                                            <td width="44%"> <div align="left"> 
											    <%												 
												 String  arr[]=srstcodeversionlist.split(",."); 
											     String tmp[]=null; 
												%>
                                                <select name="srstcodeversion" id="select" title="Select SRST Code version">
												<option selected="selected" value="notselect">----</option>
                                                  <%
													  for(int x=0;x<arr.length;x++)
													  {
													     tmp = arr[x].split("<<");     													          							
													  %>                                                  
                                                        <option value="<%=tmp[0]%>"><%=tmp[0]%></option>     
												      <%
												       }
												       %>
                                                </select>
                                                <input name="ButtSubmit" type="button" id="ButtSubmit" value="Submit" onclick="clicksubmit()" />
                                              </div></td>
                                          </tr>
                                        </table>
                                      </div></td>
                                  </tr>
                                  <tr> 
                                    <td><div align="center"> </div></td>
                                  </tr>
                                </table>
                                
                                 
                                
                                <div align="center"></div>
                              </fieldset></div>
							  
							  <fieldset>
                              <legend>Information</legend>                             
                              <table align="center" width="86%" border="0">
                                <tr> 
                                  <td width="97%" height="48"> <div align="center"> 
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr> 
                                          <td width="52%"><table width="100%" border="0">
                                              <tr> 
                                                <td width="48%" height="40" align="right"><strong>Process 
                                                  :</strong></td>
                                                <td width="52%" align="left"> 
                                                  <em> <font color="#0000FF"> 
                                                  <%=process%>
                                                  </font> </em> <div align="left"></div></td>
                                              </tr>
                                            </table></td>
                                          <td width="48%"><table width="83%" border="0">
                                              <tr> 
                                                <td width="56%" height="21" align="right"><strong>Product 
                                                  :</strong></td>
                                                <td width="44%" align="left"> 
                                                  <em> <font color="#0000FF"> 
                                                  <%=product%>
                                                  </font> </em> <div align="left"></div></td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                      </table>
                                    </div></td>
                                </tr>
                                <tr> 
                                  <td height="48"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
                                      <tr bgcolor="#333333"> 
                                        <td ><div align="center"><font color="#FFFFFF"><strong>no</strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong>SRST 
                                            Version</strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong>Number 
                                            of Drive</strong></font></div></td>
                                      </tr>
                                      <%     								 
									  for(int i=0;i<arr.length;i++){ 									
										tmp = arr[i].split("<<");									  										
										%>
										  <tr align="center" valign="middle"> 
											<td ><div align="center">
												<%=i+1%>
											  </div></td>
											<td><div align="center">
												<%=tmp[0]%>
											  </div></td>
											<td ><div align="center">
												<%=tmp[1]%>
											  </div></td>
										  </tr>
										  <%												   
									   }
						           %>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td height="24">&nbsp;</td>
                                </tr>
                              </table>
                            
                              <div align="center"></div>
                              </fieldset> 
							  
							  </td>
                            
                          </tr>
                        </table>
                        
                      </td>
                      <td width="2%">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table>
          </form></td>
      </tr>
    </tbody>
  </table>
  <!-- ------------------------------------------------------------------------------------------------------------------------ -->
  <!-- ================================================================================================================================== -->
</div>  
			
	</div>
	<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>


<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function clicksubmit(){	
var frm = document.form1;
var alertmsg="";
if (frm.srstcodeversion.value=="notselect"){
   alertmsg=alertmsg+"Please select SRST Code version.\n";
}

if(alertmsg != ""){
   alert(alertmsg);
}else{	  
    frm.txtsrstversion.value = frm.srstcodeversion.value;
    frm.action = "testcode_srstseq_distribution_getmasterfilebyrawdataversion_process.jsp";	
    frm.submit();
}

}
</script>