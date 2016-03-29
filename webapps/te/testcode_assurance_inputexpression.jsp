<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="java.util.*"%>

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
<%String menumode="testcode_assurance_inputexpression.jsp";%> 
<%@ include file="PageLayout/testcode_hometoplayout.jsp" %>
<table width="98%" 
      border="0" align="center" cellpadding="5" cellspacing="3" class="form-noindent">
  <tbody>
    <tr> 
      <td height="554" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
          <%@ include file="testcode_assurance_expression_commoninclude.jsp" %>
		  <table width="100%" height="441" border="0">
            <tr> 
			<%
			    String switchmode="Add";
				//out.print("addexpflag : "+addexpflag);	
			   if (addexpflag.toLowerCase().equals("n")){
			       switchmode="Edit";
			   }
			%>
              <td colspan="3" align="left"><span class="style1">Test Code Assurance 
                :: <%=switchmode%> Expression</span></td>
            </tr>
            <tr> </tr>
            <tr> 
              <td height="200" colspan="3"><table width="100%" height="195" border="0">
                  <tr> 
                    <td width="2%" height="191">&nbsp;</td>
                    <td width="96%"><fieldset>
                      <p> 
                        <legend>Information</legend>
                      </p>					 
						
						<%
						
					    
						
						product ="";
						if (request.getParameter("product")!=null){product =request.getParameter("product").trim();  }
					    if (product.equals("")){ product=userproduct;}
						
						String expname ="";
						if (request.getParameter("expname")!=null){expname =request.getParameter("expname").trim();  }											
											
						String criteriatype ="p";
						if (product.toUpperCase().equals("COMMON")){criteriatype ="c";}						
						if (request.getParameter("criteriatype")!=null){criteriatype =request.getParameter("criteriatype").trim();  }
						
						String inputlist ="";
						if (request.getParameter("inputlist")!=null){inputlist =request.getParameter("inputlist").trim();  }								 
								 
					    String functionname="";
					    if (request.getParameter("functionname")!=null){functionname =request.getParameter("functionname").trim();  }
								 
					    String expeditor ="";
					    if (request.getParameter("expeditor")!=null){expeditor =request.getParameter("expeditor").trim(); }
														 									 								
					    String outputlist ="";
					    if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }
						//out.print("outputlist : "+outputlist);
								 
						String errflag ="";
						if (request.getParameter("errflag")!=null){errflag =request.getParameter("errflag").trim();  }  
						
						String errmsg ="";
						if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  }
						
						String expdes ="";
						if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }  
						                        
						String flag ="";
                        if (request.getParameter("flag")!=null){flag =request.getParameter("flag").trim();  }					
						
						String mainkeyword ="";
					    if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim();  }	
																
                        //out.print("product : "+product);
																		
						if (flag.toLowerCase().equals("cancel") && addexpflag.toLowerCase().equals("y")){ 
						       TCAExpression tca=new TCAExpression();            
								tca.setExpname(expname);
								tca.setExptype(product);						
						      TCAExpressionManager te= new TCAExpressionManager(tca);
							  te.deleteExpressionClass();
						}
					  %>
                      			  
					  <input type="hidden" name="expname" />
					  <input type="hidden" name="inputlist"  value="<%=inputlist%>"/>					  
					  <input type="hidden" name="outputlist" value="<%=outputlist%>" />						   		
					   <input type="hidden" name="flag" value="<%=flag%>" />
					   <input type="hidden" name="mainkeyword"   value="<%=mainkeyword%>"/>					   
					   
                      <%
						   if (errflag.equals("y")){						    
							%><strong><font color="#FF0000"><%=errmsg%></font></strong><%
						%>
                      <%
						   }
						   //out.print("Test compileflag : "+compileflag);
						   //out.print("Test preexp : "+preexpname);
						%>
                       
                      <table width="100%" border="0">
                        <tr>
                          <td width="44%" valign="top"><table width="100%" border="0">
                              <tr> 
                                <td width="37%" height="21" align="right"> <label>Expression 
                                  Name ::</label></td>
                                <td width="63%" align="left" valign="bottom"> 
                                  <div align="left"> 
                                    <input name="txtname" type="text" size="30" maxlength="30" value="<%=expname%>" />
                                    <strong><font color="#FF0000">*</font></strong></div></td>
                              </tr>
                              <tr> 
                                <td height="21" align="right"><div align="right">Criteria 
                                    Type:: </div></td>
                                <td align="left" valign="top"> <div align="left"> 
                                    <table width="100%" border="0">
                                      <tr> 
                                        <td width="47%"><table width="100%" border="0">
										   <%
										       String comchk="";
											   String prochk="";
											   String prodis="";
										      if  (criteriatype.equals("c")){
											       comchk="checked";
												   prodis="disabled";
											  }else{
											       prochk="checked";

											  }
										   %>
                                            <tr> 
                                              <td width="13%"><input  <%=comchk%> type="radio" name="concriteria" value="radiobutton" onclick="clickcritertype('c');"  /></td>
                                              <td width="87%">Common Criteria 
                                                <strong><font color="#FF0000">*</font></strong></td>
                                            </tr>
                                          </table></td>
                                        <td width="28%">&nbsp;</td>
                                      </tr>
                                      <tr> 
                                        <td><table width="100%" border="0">
                                            <tr> 
                                              <td width="13%"><input <%=prochk%> type="radio" name="procriteria" value="radiobutton" onclick="clickcritertype('p');" /></td>
                                              <td width="87%">Product Criteria 
                                                <strong><font color="#FF0000">*</font></strong></td>
                                            </tr>
                                          </table></td>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="21" align="right">Product ::</td>
                                <td align="left" valign="top">
								<select name="productselect" id="product" title="Input Product" <%=prodis%> >
                            <option selected="selected" value="notselect">--------</option>
                            <%
			                      Vector v=sp.getProductList();
								  
								  for(int x=0;x<v.size();x++)
								  {     
								     if (product.equals(v.get(x))){       
									    							
  							        %>
                                      <option selected value="<%=v.get(x)%>"><%=v.get(x)%></option>
                                    <%
							         }else{
							   %>
							          <option value="<%=v.get(x)%>"><%=v.get(x)%></option>
							      <%}
								  }%>
                          </select> <strong><font color="#FF0000">*</font></strong></td>
                              </tr>
                              <tr> 
                                <td height="21" align="right">&nbsp;</td>
                                <td align="left" valign="top">&nbsp;</td>
                              </tr>
							  <%
							     String savebuttstatus="";
								 
							    if (compileflag.toLowerCase().equals("n") ){
								       savebuttstatus="disabled";  										
								}
							  %>
                              <tr>
                                <td height="21" align="right">&nbsp;</td>
                                <td align="left" valign="top"><input name="saveexp" <%=savebuttstatus%> type="button" id="saveexp" value="Save Expression"  onclick="clicksaveexpression();"/>
                                  <input name="clearexp"  type="button" id="cancel" value="Cancel" onclick="clickcancel();"  />
                                </td>
                              </tr>
                            </table>
                            
                          </td>
                          <td width="56%" valign="top"><table width="100%" border="0">
                              <tr> 
                                <td width="29%" height="154" align="right" valign="top"> 
                                  <label>Description ::</label></td>
                                <td width="71%" align="left" valign="top"> 
                                  <div align="left"> 
                                    <textarea name="expdes" cols="70" rows="10"><%=expdes%></textarea>
                                    <strong></strong></div></td>
                              </tr>
                            </table>
                            <div align="left"></div></td>
                        </tr>
                      </table>
                      </fieldset></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
            <tr> 
              <td width="37%" height="7"></td>
              <td width="12%"></td>
              <td width="51%"></td>
            </tr>
            <tr valign="top"> 
              <td height="181" colspan="3"><fieldset>
                <legend>Criteria Expression </legend>
                <div align="center">
                  <table width="100%" border="0">
                    <tr>
                      <td><div align="center"> 
                          <input name="expbuilder" type="button" id="expbuilder" value="Expression Builder" onclick="clickexpressionbuilder();" />
                        </div></td>
                    </tr>
                    <tr>
                      <td><div align="center"> 
                          <textarea name="txtexpeditor" cols="150" rows="30"   readonly><%=expeditor%></textarea>
                        </div></td>
                    </tr>
                  </table>
                  
                </div>
                </fieldset></td>
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

function clickexpressionbuilder(){
var jconcriteria= document.getElementById('concriteria'); 
var jprocriteria= document.getElementById('procriteria'); 
var jproductselect= document.getElementById('productselect');
var jproduct= document.getElementById('product');
var jtxtname= document.getElementById('txtname');
var jexpname= document.getElementById('expname');

var frm = document.form1;
if(jtxtname.value!="" && ((jprocriteria.checked==true && jproductselect.options[jproductselect.selectedIndex].text!="--------") || jconcriteria.checked==true)){
     var chkname = checkExpressionName(jtxtname.value,"Expression Name");
	 
     if (chkname==""){		

			 if(jconcriteria.checked==true){      
				  jproduct.value="Common";	   
			 }else if(jprocriteria.checked==true){  
				  
				 jproduct.value=jproductselect.options[jproductselect.selectedIndex].text;		
			 }
		
			jexpname.value=jtxtname.value;
			frm.action = "testcode_assurance_inputexpression_chkdupexp_process.jsp";	 
			frm.submit();
	}else{
	    alert(chkname);
	}		
}else{
   alert("Please be verify your input.");
}		

}

function clickcritertype(flag){
var jconcriteria= document.getElementById('concriteria'); 
var jprocriteria= document.getElementById('procriteria'); 
var jproduct= document.getElementById('productselect');    

 if  (flag==("c")){      
      jconcriteria.checked=true;
	  jprocriteria.checked=false;
	  jproduct.disabled=true;
 }else{    
      jconcriteria.checked=false;
	  jprocriteria.checked=true;
	  jproduct.disabled=false;
 }
}

function clicksaveexpression(){
var jtxtname= document.getElementById('txtname'); 
var jexpdes= document.getElementById('expdes'); 
var jconcriteria= document.getElementById('concriteria');
var jprocriteria= document.getElementById('procriteria');
var jproductselect= document.getElementById('productselect');
var jtxtexpeditor= document.getElementById('txtexpeditor');
var jproduct= document.getElementById('product');
var jexpname= document.getElementById('expname');

var frm = document.form1;

if(jtxtname.value!="" && jtxtexpeditor.value!=""  && ((jprocriteria.checked==true && jproductselect.options[jproductselect.selectedIndex].text!="--------") || jconcriteria.checked==true)){
	 var chkname = checkExpressionName(jtxtname.value,"Expression Name");
	 
     if (chkname==""){		
		 if(jconcriteria.checked==true){      
			  jproduct.value="Common";	   
		 }else if(jprocriteria.checked==true){  			  
			 jproduct.value=jproductselect.options[jproductselect.selectedIndex].text;		
		 }
	
		 jexpname.value=jtxtname.value;
		frm.action = "testcode_assurance_inputexpression_process.jsp";	 
		frm.submit();
	}else{
	   alert(chkname);
	}	
}else{
   alert("Please be verify your input again.");
}		

}

function clickcancel(){
var jsubmitflag= document.getElementById('flag');

var frm = document.form1;
jsubmitflag.value="cancel";
frm.action = "testcode_assurance_selectexpression.jsp";	 
frm.submit();
}


function clickcompileexpression(){
var jtxtname= document.getElementById('txtname'); 
var jexpdes= document.getElementById('expdes'); 
var jconcriteria= document.getElementById('concriteria');
var jprocriteria= document.getElementById('procriteria');
var jproductselect= document.getElementById('productselect');
var jtxtexpeditor= document.getElementById('txtexpeditor');
var jproduct= document.getElementById('product');
var jexpname= document.getElementById('expname');

var frm = document.form1;
if(jtxtname.value!="" && jtxtexpeditor.value!=""  && ((jprocriteria.checked==true && jproductselect.options[jproductselect.selectedIndex].text!="--------") || jconcriteria.checked==true)){
	 if(jconcriteria.checked==true){      
		  jproduct.value="Common";	   
	 }else if(jprocriteria.checked==true){  
	      
		 jproduct.value=jproductselect.options[jproductselect.selectedIndex].text;		
	 }

	 jexpname.value=jtxtname.value;
	 frm.action = "testcode_assurance_compileexpression_process.jsp";	 
	 frm.submit();
}else{
   alert("Please be verify your input again.");
}		

}

function checkExpressionName(str,obj){
  var pattern = new Array();
   pattern[0]="_"; 
   pattern[1]=",";
   pattern[1]=":";
 
   for(i=0;i<pattern.length;i++){      
	  if (trim(str).indexOf(pattern[i])>(-1) ){	   
		return "Can not use ( ' - ' ) sign in "+obj+".";
	  }else{
	     return "";
	  }
	}
}

function trim(str) {
  return str.replace(/^\s*|\s*$/g,"");
}
</script>
