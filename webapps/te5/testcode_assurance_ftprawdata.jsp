<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="java.util.*"%>


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
 <%String menumode="testcode_assurance.jsp";%> 		
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
  <!-- ------------------------------------------------------------------------------------------------------------------------ -->
  <!-- ================================================================================================================================== -->
  <table align="center" class="form-noindent" cellspacing="3" cellpadding="5" 
      border="0">
    <tbody>
      <tr> 
        <td height="419" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
            <table border="0">
              <tr> 
                <td colspan="3" align="left"><span class="style1">Test Code Assurance 
                  :: Retrieve Rawdata</span></td>
              </tr>
              <tr> 
                <td height="21" colspan="3">&nbsp;</td>
              </tr>
              <tr> 
                <td height="21" colspan="3"><div align="left"> 
                    <table width="100%" border="0">
                      <tr> 
                        <td width="3%">&nbsp;</td>
                        <td width="95%"><em>Retrieve Test Rawdata from server 
                          and filter by ST25fil. Please be input parameters</em>.</td>
                        <td width="2%">&nbsp;</td>
                      </tr>
                    </table>
                  </div></td>
              </tr>
              <tr> 
                <td width="2%" height="313"></td>
                <td width="96%"><fieldset>
                  <legend>Controller</legend>
                  <table width="95%" border="0">
                    <tr> 
                      <td >&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="27%"><div align="right"> Trial ID : 
                          <label></label>
                        </div></td>
                      <td width="73%"><div align="left">
                          <input name="trialid" type="text" title="Input TrialID" size="4" maxlength="4" />
                          <strong></strong></div></td>
                    </tr>
                    <tr> 
                      <td><div align="right">Process :</div></td>
                      <td><div align="left"> 
                          <select name="process" id="process" title="Input Test Process">
                            <%						
			               Vector process=sp.getTestProcessNumber();
						   String s="";
						   for(int x=0;x<process.size();x++)
						  { 
						    s="";
						    if(x==0){ 
							    s="selected";
							}               							
  						    %>
                            <option <%=s%> value="<%=process.get(x)%>"> 
                            <%=process.get(x)%>
                            </option>
                            <%
						  }
					   %>
                          </select>
                          <strong><font color="#FF0000">*</font></strong></div></td>
                    </tr>
                    <tr> 
                      <td width="27%"><div align="right">Product : 
                          <label></label>
                        </div></td>
                      <td width="73%"><div align="left"> 
                          <select name="userproduct" id="product" title="Input Product">
                            <option selected="selected" value="notselect">--------</option>
                            <%
			                      Vector product=sp.getProductList();
								  for(int x=0;x<product.size();x++)
								  {               							
  							        %>
                            <option value="<%=product.get(x)%>"> 
                            <%=product.get(x)%>
                            </option>
                            <%
							      }
							   %>
                          </select>
                          <strong><font color="#FF0000">*</font></strong></div></td>
                    </tr>
                    <tr> 
                      <td><div align="right">End Date:</div></td>
                      <td><div align="left"> 
                          <select name="datadate" id="datadate" title="Input Test End Date">
                            <option selected="selected" value="notselect">--------</option>
                            <%
			                      Vector startdate=sp.getTestDateList();
								  for(int x=0;x<startdate.size();x++)
								  {               							
  							        %>
                            <option value="<%=startdate.get(x)%>"> 
                            <%=startdate.get(x)%>
                            </option>
                            <%
							      }
							   %>
                          </select>
                        </div></td>
                    </tr>
                    <tr> 
                      <td><div align="right">HDD SN ::</div></td>
                      <td><div align="left"> 
                          <textarea name="hddsn" cols="30" rows="5" title="input hddsn delimit by ',' "></textarea>
                        </div></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><div align="right"></div></td>
                      <td><div align="left"> 
                          <input type="submit" name="submit2" id="submit29" value="Submit" onclick="clickSubmit()" />
                          <input type="reset" name="clear2" id="clear29" value="Clear" />
                        </div></td>
                    </tr>

                    <tr> 
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>                                    

                  </table>
                  </fieldset></td>
                <td width="2%"></td>
              </tr>            
            </table>
          </form></td>
      </tr>
    </tbody>
  </table>
</div>  
			
	</div>
	<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function clickSubmit(){

	
var frm = document.form1;
var alertmsg="";
var jdatadate=frm.datadate.value;
var jproduct=frm.userproduct.value;
var jtrialid=frm.trialid.value;
var jhddsn=frm.hddsn.value;

/*if((jdatadate=="notselect" && jhddsn=="" && jtrialid=="") || (jdatadate=="notselect" && jhddsn!="" && jtrialid=="")){
	alertmsg=alertmsg+"Please select end date.\n";
}*/
if(jdatadate=="notselect"){
	alertmsg=alertmsg+"Please select end date.\n";
}
if(jproduct=="notselect"){
	alertmsg=alertmsg+"Please select product.\n";
}
if(jtrialid=="" && jhddsn==""){
	alertmsg=alertmsg+"Please specify TrialID or HDDSN.\n";
}

    if(alertmsg != ""){
		alert(alertmsg);
	}else{
		frm.action = "testcode_assurance_process.jsp";	
		//if(confirm("Confirmation?")){
		frm.submit();
		//}
	}
}
</script>