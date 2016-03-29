<%@ page language="java" %>
<%@ page pageEncoding="TIS-620"%>

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
<meta http-equiv="content-type" content="html/text;charset=utf-8" />
<meta name="author" content="Luka Cvrk (www.solucija.com)" />
<meta name="description" content="My Site" />
<meta name="keywords" content="key, words" />
<%	
		String version="";
		String webname="";
		webname=IniFilesReader.getReturnProperties("Local.Application","Application Name");	
		version=TeWebVersionControl.getVersion();
		SPDBAccess sp=new SPDBAccess();
		
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
	
 <%String menumode="testcode_srstseq_distribution_showgraph.jsp";%>	
  <div id="left"> 
    <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
    <div id="headerL"> 
      <!-- <div id="contentLR">	 -->
      <!-- <ul><li></li></ul> -->
      <!-- </div> -->
      <!-- <br class="clear" /> -->
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
  <table align="center" class="form-noindent" cellspacing="3" cellpadding="5" width="78%" 
      border="0">
    <tbody>
      <tr> 
        <td height="247" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
            <table width="100%" height="245" border="0">
              <tr> 
                <td colspan="3" align="left"><span class="style1"><span class="style1">SRST 
                  Sequence Distribution:</span> :: SEQ Distribution Chart</span></td>
              </tr>
              <tr> </tr>
              <tr> 
                <td height="22" colspan="3">
                  <%
								   
									
									String errmsg="";
									String process="";
									String product="";
									String txtsrstversion="";
									String mastercandidatehddsn="";
									String percentcomp="";
									String htmoutput="";
									String srstcodeversionlist="";
									if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  }	 											
									if (request.getParameter("process")!=null){process =request.getParameter("process").trim();  }	 	
									if (request.getParameter("product")!=null){product =request.getParameter("product").trim();  }	 	
									if (request.getParameter("txtsrstversion")!=null){txtsrstversion =request.getParameter("txtsrstversion").trim();  }	 	
									if (request.getParameter("mastercandidatehddsn")!=null){mastercandidatehddsn =request.getParameter("mastercandidatehddsn").trim();  }	
									if (request.getParameter("percentcomp")!=null){percentcomp =request.getParameter("percentcomp").trim();  }
									if (request.getParameter("srstcodeversionlist")!=null){srstcodeversionlist =request.getParameter("srstcodeversionlist").trim();  }
									
																		
									SRSTSeqDistributionManager srst=new SRSTSeqDistributionManager(session.getAttribute("s_username").toString());
									String exportresult=session.getAttribute("s_username").toString()+"/"+srst.getZipReportFileResult(product);
									//if (request.getParameter("htmoutput")!=null){htmoutput =request.getParameter("htmoutput").trim();  }
									// out.print("exportresult : "+ exportresult);
									 //htmoutput="tca/rawdata/"+session.getAttribute("s_username").toString()+"/GraphMacro.files/image001.gif";
									
									//SRSTSeqDistributionManager srst=new SRSTSeqDistributionManager(session.getAttribute("s_username").toString());
									
									//session.setAttribute(session.getAttribute("s_username")+"_tca_rawdatacalculationobject", null);
									
									//String orginalKeyword=IniFilesReader.getReturnProperties("Local.Application.tca","RAWDATA ORIGINAL KEYWORD");
									%>
                  <input type="hidden" name="process" value="<%=process%>"/> 
				  <input type="hidden" name="product" value="<%=product%>"/> 
                  <input type="hidden" name="txtsrstversion" value="<%=txtsrstversion%>"/> 
                  <input type="hidden" name="mastercandidatehddsn" value="<%=mastercandidatehddsn%>"/> 
                 <input type="hidden" name="percentcomp" value="<%=percentcomp%>"/> 
				 <input type="hidden" name="exportresult" value="<%=exportresult%>"/>
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
                      <td width="96%" valign="top"> <div align="center"></div>
                        <table width="95%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="53%"><fieldset>
                              <legend>Information</legend>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                                <tr> 
                                  <td><div align="center"> 
                                      <table align="center" width="86%" border="0">
                                        <tr> 
                                          <td width="32%" height="48"> <div align="center"> 
                                              <table width="81%" border="0">
                                                <tr> 
                                                  <td width="48%" height="40" align="right"><strong>Process 
                                                    :</strong></td>
                                                  <td width="52%" align="left"> 
                                                    <em> <font color="#0000FF"> 
                                                    <%=process%>
                                                    </font> </em> <div align="left"></div></td>
                                                </tr>
                                              </table>
                                            </div></td>
                                          <td width="25%"> <div align="center"> 
                                              <table width="83%" border="0">
                                                <tr> 
                                                  <td width="56%" height="21" align="right"><strong>Product 
                                                    :</strong></td>
                                                  <td width="44%" align="left"> 
                                                    <em> <font color="#0000FF"> 
                                                    <%=product%>
                                                    </font> </em> <div align="left"></div></td>
                                                </tr>
                                              </table>
                                            </div></td>
                                        </tr>
                                        <tr> 
                                          <td height="27"><table width="91%" border="0">
                                              <tr> 
                                                <td width="53%" height="21" align="right"><strong>Master 
                                                  File Name:</strong></td>
                                                <td width="47%" align="left"> 
                                                  <em> <font color="#0000FF"> 
                                                  <%=mastercandidatehddsn%>
                                                  </font> </em> <div align="left"></div></td>
                                              </tr>
                                            </table></td>
                                          <td><table width="93%" border="0">
                                              <tr> 
                                                <td width="60%" height="21" align="right"><strong>SRST 
                                                  Code Version:</strong></td>
                                                <td width="40%" align="left"> 
                                                  <em> <font color="#0000FF"> 
                                                  <%=txtsrstversion%>
                                                  </font> </em> <div align="left"></div></td>
                                              </tr>
                                            </table></td>
                                        </tr>
                                        <tr> 
                                          <td height="27"><table width="90%" border="0">
                                              <tr> 
                                                <td width="53%" height="40" align="right"><strong>Percent 
                                                  Complete :</strong></td>
                                                <td width="47%" align="left"> 
                                                  <em> <font color="#0000FF"> 
                                                  <%=percentcomp%>
                                                  % </font> </em> 
                                                  <div align="left"></div></td>
                                              </tr>
                                            </table></td>
                                          <td>&nbsp;</td>
                                        </tr>
                                      </table>
                                    </div></td>
                                </tr>
                              </table>
                              <div align="center"> 
                                <input name="changepercentcomp" type="button" id="changepercentcomp" value="Change Percent Complete" onclick="clickchangepercentcomp();" />
                                <input name="buttExportResult" type="button" id="buttExportResult" value="Export Result" onclick="exportresultfile();" />
                              </div>
                              </fieldset></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="95%"><div align="center"> </div></td>
                                </tr>
                                <%
						    
							Vector vm  = srst.readSeqDistributionfile();						    
						  %>
                                <tr> 
                                  <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
                                      <%
							   // if(vm!=null){	  
								  for(int i=0;i<vm.size();i++){ 									
									  SeqDistributionTime ms=(SeqDistributionTime)vm.get(i);
									  if(i==0){
										%>
                                      <tr bgcolor="#333333"> 
                                        <td ><div align="center"><font color="#FFFFFF"><strong>no</strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getSeqchr()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getLoopcount()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getTimebypercomp()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getTimemean()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getTimemin()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getTimemax()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getTimestddev()%>
                                            </strong></font></div></td>
                                        <td ><div align="center"><font color="#FFFFFF"><strong> 
                                            <%=ms.getCount()%>
                                            </strong></font></div></td>
                                      </tr>
                                      <%        
						               }else{										
										%>
                                      <tr align="center" valign="middle"> 
                                        <td ><div align="center"> 
                                            <%=i%>
                                          </div></td>
                                        <td><div align="center"> 
                                            <%=ms.getSeqchr()%>
                                          </div></td>
                                        <td ><div align="center"> 
                                            <%=ms.getLoopcount()%>
                                          </div></td>
                                        <td ><div align="center"> 
                                            <%=ms.getTimebypercomp()%>
                                          </div></td>
                                        <td ><div align="center"> 
                                            <%=ms.getTimemean()%>
                                          </div></td>
                                        <td ><div align="center"> 
                                            <%=ms.getTimemin()%>
                                          </div></td>
                                        <td ><div align="center"> 
                                            <%=ms.getTimemax()%>
                                          </div></td>
                                        <td ><div align="center"> 
                                            <%=ms.getTimestddev()%>
                                          </div></td>
                                        <td><div align="center"> 
                                            <%=ms.getCount()%>
                                          </div></td>
                                      </tr>
                                      <%										
									   }
								  }
							  // }	
						      %>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                        <p align="center">&nbsp; </p></td>
                      <td></td>
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

function clickcalculation(){	
var frm = document.form1;
frm.action = "testcode_srstseq_distribution_rawdatacalculation_process.jsp";	
frm.submit();	

}

function clickchangepercentcomp(){	
var frm = document.form1;
frm.action = "testcode_srstseq_distribution_filedetail.jsp";	
frm.submit();	

}

function exportresultfile(){  
var frm = document.form1; 
var jexportresult=frm.exportresult.value;

    var url="../te/tca/rawdata/"+jexportresult;
	window.open(url,'Download');  
}


</script>