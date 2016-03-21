<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javazoom.upload.*"%>



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
 <%String menumode="testcode_srstseq_distribution_uploadrawdata.jsp";%> 		
  <div id="left"> 
    <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
    <div id="headerL"></div> 
		   
		   
   <!------------ Top left menu ------------------->
		    <div class="boxright" >  
		      <div class="boxcenter" >
				<div class="boxleft" >
				</div>     
			  </div>
		    </div> 			
			
    <!-- ---------------------------------------------- -->		
	        	      
      <ul id="side_menu"><%@ include file="testcode_leftmenu.jsp" %></ul> 		   	
   </div>	 	 
		 
		
<!-- ============================================Top Layout============================================================================== -->	
        <div id="right">
		   <%@ include file="PageLayout/testcode_righttoplayout.jsp" %>			  
	    </div> 
		
  <!-- ------------------------------------------------------------------------------------------------------------------------ -->
        <table width="717" border="0" align="center" cellpadding="5" cellspacing="3" class="form-noindent">
    <tbody>
      <tr> 
        <td width="699" height="297" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center">
		<%
		 String  rawdatamode="ftp"; //Set Default for rawdata mode
		 rawdatamode="upload";  // Set Actual mode
		%>
		<form action="" method="post" enctype="multipart/form-data" name="form1" target="_parent" id="form1">	
		<input name="filename" type="hidden" value="" />	
		<input name="Filepathupload" type="hidden" value="" />
		<input name="rawdatamode" type="hidden" value="<%=rawdatamode%>" />
		<%
		    String filename="";  
			String sprocess="";
		    String sproduct="";
		    String errmsg="";
            String errflag="n";
			String fileupload="";
			if (request.getParameter("Filepathupload")!=null){fileupload =request.getParameter("Filepathupload").trim();  }
		    if (request.getParameter("filename")!=null){filename =request.getParameter("filename").trim();  }						  
			if (request.getParameter("process")!=null){sprocess =request.getParameter("process").trim();  }						  
		    if (request.getParameter("userproduct")!=null){sproduct =request.getParameter("userproduct").trim();  }	
			if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  }						  
		    if (request.getParameter("errflag")!=null){errflag =request.getParameter("errflag").trim();  }	
			//out.print(fileupload);
		%>
            <table width="95%" border="0">
              <tr> 
                <td colspan="3" align="left"><span class="style1">SRST Sequence 
                  Time Distribution: Upload Rawdata</span></td>
              </tr>
              <tr> 
                <td height="21" colspan="3"> 
                  <%
				  if (errflag.equals("y")){
				      %><font color="#FF0000"><strong><%=errmsg%></strong></font><%
				  }
				%>
                  </td>
              </tr>
              <tr> 
                <td height="27" colspan="3"><div align="left"> 
                    <table width="100%" border="0">
                      <tr> 
                        <td width="3%">&nbsp;</td>
                        <td width="93%"><em>Upload Rawdata to server and filter 
                          by ST25fil especially for SRST Sequence Distribution. 
                          Please be input parameters which should be same stdid.</em></td>
                        <td width="4%">&nbsp;</td>
                      </tr>
                    </table>
                  </div></td>
              </tr>
              <tr> 
                <td width="6%" height="208"></td>
                <td width="92%" align="left" valign="top"><fieldset>
                  <legend>Controller</legend>
                  <div align="center"></div>
                  <table width="97%" border="0">
                    <tr> 
                      <td >&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="23%"><div align="right"> File Name : 
                          <label></label>
                        </div></td>
                      <td width="56%"><div align="left"> 
                          <input name="Fileupload" type="FILE" title="Select rawdata file"  value="<%=fileupload%>" size="40" maxlength="40" />
                          <strong></strong></div></td>
                    </tr>
                    <tr> 
                      <td width="23%"><div align="right">Product : 
                          <label></label>
                        </div></td>
                      <td width="56%"><div align="left"> 
                          <select name="product" id="product" title="Input Product">
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
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><div align="right">SRST Code Version :</div></td>
                      <td><fieldset>
                        <legend>Selection</legend>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="17%"> <div align="center"> 
                                <input type="radio" name="rbuttSearch" value="radiobutton" onclick="clicksearchrawdata()"  />
                              </div></td>
                            <td width="35%">Search from rawdata</td>
                            <td width="48%">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><div align="center"> 
                                <input type="radio" name="rbuttSpec" value="radiobutton" checked onclick="clickspecify()" />
                              </div></td>
                            <td>Specify code version</td>
                            <td><input name="txtsrstversion" type="text" size="4" maxlength="4"  /> 
                              <strong><font color="#FF0000">*</font></strong> 
                            </td>
                          </tr>
                        </table>
                        </fieldset>
                        &nbsp;</td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                      <td><input type="button" name="uploadfile" id="uploadfile3" value="Upload" onclick="clickSubmit()" /> 
                        <input type="reset" name="clear2" id="clear23" value="Clear" /> 
                      </td>
                    </tr>
                    <tr> 
                      <td><div align="right"></div></td>
                      <td><div align="left"></div></td>
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
  <!-- ------------------------------------------------------------------------------------------------------------------------ -->
  		
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
var jfilename=frm.Fileupload.value;
var jproduct=frm.product.value;
var jtxtsrstversion=frm.txtsrstversion.value;
var jrspec=frm.rbuttSpec.checked

if(jfilename==""){
	alertmsg=alertmsg+"Please select rawdata file.\n";
}

if(jproduct=="notselect"){
	alertmsg=alertmsg+"Please select product.\n";
}

if(jtxtsrstversion=="" && jrspec==true){
	alertmsg=alertmsg+"Please input SRST code version.\n";
}
    if(alertmsg != ""){
		alert(alertmsg);
	}else{	    
		
        var sp=jfilename.split("\\");       		
		frm.filename.value=sp[sp.length-1];
		frm.Filepathupload.value=jfilename;

		if (jrspec==true){
		   frm.action = "testcode_srstseq_distribution_uploadrawdata_process.jsp";
		}else{
		   frm.action = "testcode_srstseq_distribution_search_srstversion.jsp";
		}
		frm.submit();

	}
}

function clicksearchrawdata(){
var frm = document.form1;
var alertmsg="";
frm.rbuttSpec.checked = false;
frm.txtsrstversion.disabled = true; 
}

function clickspecify(){
var frm = document.form1;
var alertmsg="";
frm.rbuttSearch.checked = false;
frm.txtsrstversion.disabled = false; 
}

</script>
