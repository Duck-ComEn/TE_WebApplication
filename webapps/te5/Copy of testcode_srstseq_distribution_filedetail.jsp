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
	
 <%String menumode="testcode_assurance_filedetail.jsp";%>	
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
        <td height="300" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
            <table width="100%" height="290" border="0">
              <tr> 
                <td colspan="3" align="left"><span class="style1"><span class="style1">SRST Sequence 
                  Distribution:</span> 
                  :: Raw data information</span></td>
              </tr>
              <tr> </tr>
              <tr> 
                <td height="21" colspan="3">&nbsp; </td>
              </tr>
              <tr> 
                <td></td>
                <td width="12%"></td>
                <td width="51%"></td>
              </tr>
              <tr> 
                <td height="181" colspan="3"><table width="100%" border="0">
                    <tr> 
                      <td width="2%" height="175">&nbsp;</td>
                      <td width="96%" valign="top"><fieldset>
                        <p align="left"> 
                          <legend>File Detail</legend>
                          <%
								    //String userselectlist="";
									
									String process =request.getParameter("process").toUpperCase(); 
									String product =request.getParameter("userproduct").toUpperCase(); 
									String txtsrstversion =request.getParameter("txtsrstversion").toUpperCase();
									String mastercandidatehddsn =request.getParameter("mastercandidatehddsn").toUpperCase();
									String errmsg =request.getParameter("errmsg");
									//String hddsn =request.getParameter("hddsn").toUpperCase(); 
									
									//String pagenumber=request.getParameter("pagenum");
									
									//session.setAttribute(session.getAttribute("s_username")+"_tca_rawdatacalculationobject", null);
									
									//String orginalKeyword=IniFilesReader.getReturnProperties("Local.Application.tca","RAWDATA ORIGINAL KEYWORD");
									%>
                          
                          <input type="hidden" name="process" value="<%=process%>"/>
                          <input type="hidden" name="userproduct" value="<%=product%>"/>
                          <input type="hidden" name="txtsrstversion" value="<%=txtsrstversion%>"/>
                          <input type="hidden" name="mastercandidatehddsn" value="<%=mastercandidatehddsn%>"/>                                                   
                          <input type="hidden" name="filename" id="filename"/>
                        </p>
                        <table width="100%" border="0">
                          <tr> 
                            <td width="2%"> <div align="center"> </div></td>
                            <td width="19%"> <div align="center"> 
                                <table width="79%" border="0">
                                  <tr> 
                                    <td width="48%" height="40" align="right"><strong>Process 
                                      :</strong></td>
                                    <td width="52%" align="left"> <em> 
                                      
                                      <font color="#0000FF"><%=process%></font>
                                      </em> 
                                      <div align="left"></div></td>
                                  </tr>
                                </table>
                              </div></td>
                            <td width="14%"> <div align="center"> 
                                <table width="83%" border="0">
                                  <tr> 
                                    <td width="50%" height="21" align="right"><strong>Product 
                                      :</strong></td>
                                    <td width="50%" align="left"> <em> 

                                      <font color="#0000FF"><%=product%></font>
                                      </em> 
                                      <div align="left"></div></td>
                                  </tr>
                                </table>
                              </div></td>
                            <td width="65%"> <div align="left"></div>
                              <table width="93%" border="0">
                                <tr> 
                                  <td width="32%" height="21" align="right"><strong>SRST 
                                    Code Version:</strong></td>
                                  <td width="68%" align="left"> <em> 

                                   <font color="#0000FF"> <%=txtsrstversion%></font>
                                    </em> 
                                    <div align="left"></div></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                        <table width="100%" border="0">
                          <tr> 
                            
                                <%	
								 
						    							
						   if(errmsg=="" || errmsg==null) {
								//RawdataManager rm=new RawdataManager(session.getAttribute("s_username").toString());																
								//rm.getRawDataAndFilter(datadate,process,product,trialid,hddsn);
								//session.setAttribute(session.getAttribute("s_username")+"_tca_rawdataobject", rm);	
								SRSTSeqDistributionManager rm = (SRSTSeqDistributionManager)session.getAttribute(session.getAttribute("s_username")+"_tca_rawdataobject");
								Vector v= rm.getRawdatahddlist();
															
								if (v != null) {
								   
						   int p=0;
						   
						  if (pagenumber!=null){		
						      p =Integer.parseInt(pagenumber);
						 }						
						 
							 int numpage=v.size()/1000;							
							 int remain=v.size()%1000;
							 //if (remain<1000) {numpage=numpage+1;}
							 int minp=p*1000;
							 int maxp=0;
							 if (v.size()<(p*1000)+1000){
								 maxp= (p*1000)+remain;
							 }else{
								maxp= (p*1000)+999;
							 }
							if  (v.size()>1000){	
							    %>
								   
                            <td width="14%" height="21" align="right"><strong>Page 
                              No<em> </em> :</strong> 
                              <label></label></td>
                            <td width="86%" align="left"> <em><strong> </strong></em>
                            <div align="left"><em><strong>
								<%
							 for(int x=0;x<numpage;x++){
								%>  
								    <input type="submit" name="Submit" value="<%=x+1%>" onclick="clickchangepage(<%=x%>)"/>								
								<%
							 }
						   }
						
						 
					  %>
                                </strong></em></div></td>
                          </tr>
                        </table>
                        <table width="100%" border="0">
                          <tr> 
                            <td width="14%" height="21" align="right"><label></label></td>
                            <td width="86%" align="left"> <em><strong> Current 
                              Page :: <%=p+1%> &nbsp; Total Row :: 
                              <%=v.size()%>
                              &nbsp; Start Row:: 
                              <%=minp+1%>
                              &nbsp; End Row :: 
                              <%=maxp%>
                              <input type="hidden" name="pagenum" value=""/>
                              </strong></em> 
                              <div align="left"></div></td>
                          </tr>
                        </table>
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
                          <tr bgcolor="#333333"> 
                            <td width="9%"><div align="center"><font color="#FFFFFF"><strong>no</strong></font></div></td>
                            <td width="23%"><div align="center"><font color="#FFFFFF"><strong>filename</strong></font></div></td>                            
                            <td width="15%"><div align="center"><font color="#FFFFFF"><strong>filter status</strong></font></div></td>                            
                          </tr>
                          <%        
						            for(int i=minp;i<maxp/*v.size()*/;i++){ 									
										Rawdata r=(Rawdata)v.get(i);
										
										%>
                          <tr align="center" valign="middle"> 
                            <td> 
                              <%=i+1%>
                              <div align="center"></div></td>
                            <td> 
                              <%=r.getFilename()%>
                              <div align="center"></div></td>
                            <%											
											if(r.getFtpstatus()!=true){
											   %>
												
												  <td><div align="center"><img src="DATA-INF/Image/false-icon.gif" width="20" height="21" /></div></td>
												<%
											}else{
											   %>
												
												<td width="8%"><div align="center"><img src="DATA-INF/Image/ok.png" width="16" height="15" /></div></td>
												
												<%
											}							 
				     		%>
                            												
                          </tr>
                          <%										
									}
								}
								
								
							}else{
								 %>
                          <tr> 
                            <td><div align="center"><font color="#FF0000" size="3"><strong><em>Error 
                                :: 
                                <%=errmsg%>
                                </em></strong></font> </div></td>
                          </tr>
                          <%		  
							}
						
						
						%>
                          
                        </table>
                        </fieldset></td>
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

function clickchangepage(pagenum){

	
var frm = document.form1;
frm.pagenum.value=pagenum;

frm.action = "testcode_assurance_filedetail.jsp";	
frm.submit();	

}

function clickselectexpression(){
	
var frm = document.form1;
//alert(frm.criterialist.value);
//frm.huserselectlist.value="";
var jhuserlist = document.getElementById('huserselectlist');
jhuserlist.value="";
frm.action = "testcode_assurance_selectexpression.jsp";	
frm.submit();	
}

function clickviewfile(filename){
	
var frm = document.form1;
//alert(frm.criterialist.value);
//frm.huserselectlist.value="";
var jfilename = document.getElementById('filename');
jfilename.value=filename;
frm.action = "testcode_assurance_readfile.jsp";	
frm.submit();	
}

function clickeditexpression(){
var frm = document.form1;
var jcriterialist = document.getElementById('criterialist');
var jhuserlist = document.getElementById('huserselectlist');
	 
  if(jcriterialist.length>1){  
      frm.action = "testcode_assurance_selectexpression.jsp";	 
	 
	   var slist="";
		  for(i=1; i<jcriterialist.length; i++)  {	       
			   slist = slist+","+jcriterialist.options[i].text;		  
		  }
		  jhuserlist.value=slist.substring(1,slist.length);		
		  frm.submit();
		
   }else{
      alert("Your selection are empty.");
   }
}

function clickcalexpression(){
var frm = document.form1;
var jcriterialist = document.getElementById('criterialist');
var jhuserlist = document.getElementById('huserselectlist');
   
  if(jcriterialist.length>1){  
      frm.action = "testcode_assurance_rawdatacalculation_process.jsp";	 
	 
	   var slist="";
		  for(i=1; i<jcriterialist.length; i++)  {	       
			   slist = slist+","+jcriterialist.options[i].text;		  
		  }
		  jhuserlist.value=slist.substring(1,slist.length);		
		  frm.submit();
		
   }else{
      alert("Your selection are empty.");
   }
}

</script>