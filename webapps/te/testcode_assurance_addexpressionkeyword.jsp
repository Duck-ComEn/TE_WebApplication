<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="java.util.Vector"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String apppath=application.getRealPath("");
	String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
	
	  
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

function generatefunctionname(){
	
var frm = document.form1;
var jleft = document.getElementById('left');
var jlbfunctionname = document.getElementById('functionname');
var jhproduct = document.getElementById('product');
var jhexpname = document.getElementById('expname');
var jparainput = document.getElementById('parainput');


var temp=jhproduct.value.toUpperCase()+"_";
temp=temp+jhexpname.value.toUpperCase();
temp=temp + " (";
var num=jparainput.length;

for( p=0;p<num;p++){  
   jparainput.remove(0);   
}
var oOption = document.createElement("OPTION");
jparainput.options.add(oOption);
oOption.text = "-----";
oOption.value = "-----";  

if (jleft.length>1){
	for(i=1; i<jleft.length; i++)  {
		
		var para=jleft.options[i].text.split(":");
		oOption = document.createElement("OPTION");
		temp=temp+para[1]+" "+para[0]+",";
		jparainput.options.add(oOption);
	    oOption.text = jleft.options[i].text;
	    oOption.value = jleft.options[i].text;  
	}
	temp=temp.substr(0,temp.length-1);
	
	
}	

temp=temp+ " ) {";
jlbfunctionname.value=temp;
}

function errormsg(msg) {  //reloads the window if Nav4 resized
  alert(msg);
}
MM_reloadPage(true);

//-->
</script>    
</head>

<body>
<%String menumode="testcode_assurance_testexpression.jsp";%> 
<%@ include file="PageLayout/testcode_hometoplayout.jsp" %>
<table align="center" class="form-noindent" cellspacing="3" cellpadding="5" width="97%" 
      border="0">
  <tbody>
    <tr> 
      <td height="274" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
          <table width="82%" height="264" border="0">
            <tr> 
              <td width="100%" height="21" align="left"><span class="style1">Test 
                Code Assurance :: Add New Keyword &amp; Parametric</span></td>
            </tr>
			<%@ include file="testcode_assurance_expression_commoninclude.jsp" %>
							    <%
								
                                 String expname ="";
								 if (request.getParameter("expname")!=null){expname =request.getParameter("expname").trim();  }
								 								 
								 String inputlist ="";
								 if (request.getParameter("inputlist")!=null){inputlist =request.getParameter("inputlist").trim();  }								 
								 
								 String functionname="";
								 if (request.getParameter("functionname")!=null){functionname =request.getParameter("functionname").trim();  }
								 
								 String expeditor ="";
								 if (request.getParameter("expeditor")!=null){expeditor =request.getParameter("expeditor").trim(); }
								 //out.print("expeditor :: "+expeditor);
								 		 								
								 String outputlist ="";
								 if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }
								 
								 String errflag ="";
								 if (request.getParameter("errflag")!=null){errflag =request.getParameter("errflag").trim();  }  
								 
								 String expdes ="";
						         if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }
								 
								 String mainkeyword ="";
						         if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim();  }
												
								String numofparametric ="1";
								if (request.getParameter("numofparametric")!=null){numofparametric =request.getParameter("numofparametric").trim();  }
								
								String cproduct="COMMON";
                                if (request.getParameter("cproduct")!=null){cproduct =request.getParameter("cproduct").trim().toUpperCase();  }
								
								String addkeywordflag="";
								if (request.getParameter("addkeywordflag")!=null){addkeywordflag =request.getParameter("addkeywordflag").trim();  }
																							 
                                String errmsg="";
								if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  } 	
								
								//out.print("errmsg :: "+errmsg);							
																 
								 String delmainkeyword="";
								 if (request.getParameter("delmainkeyword")!=null){delmainkeyword =request.getParameter("delmainkeyword").trim();  }
								 
								 String headkeyword="";
								 if (request.getParameter("headkeyword")!=null){headkeyword =request.getParameter("headkeyword").trim();  }
								 
								 String delheadkeyword="";
								 if (request.getParameter("delheadkeyword")!=null){delheadkeyword =request.getParameter("delheadkeyword").trim();  }
								 
								 String delreuslt="";
								 if (request.getParameter("delreuslt")!=null){delreuslt =request.getParameter("delreuslt").trim();  }								 
								 								 
								 String keyworddes="";
								 if (request.getParameter("keyworddes")!=null){keyworddes =request.getParameter("keyworddes").trim();  }
								 
								 //out.print("Product :: "+product);
								 
								 String disableobj="";
								 if(addkeywordflag.equals("edit")){
								     disableobj="disabled";
								 }
			  %>
            <tr> 
              <td height="214"><table width="100%" border="0">
                  <tr> 
                    <td width="3%">&nbsp;</td>
                    <td width="95%"><div align="left"><em> Please be input parameter 
                        to input box and click submit. </em></div></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table>
                <table width="100%" height="170" border="0">
                  <tr> 
                    <td width="0%" height="166" >&nbsp;</td>
                    <td width="98%" align="left" valign="top"><!-- <fieldset>
                      <legend>Controller</legend> -->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="0%">&nbsp;</td>
                          <td width="99%"></td>
                          <td width="1%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><fieldset><legend>Example Format</legend>
                            <font size="4"><strong><font color="#0000FF" size="2"> 
                            &nbsp; </font></strong></font>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td><div align="center"><img src="DATA-INF/Image/exkeywordformat.png" width="850" height="170" /> 
                                  </div></td>
                              </tr>
                            </table>
                            <p><font size="4"><strong><font color="#0000FF" size="2"> 
                              </font></strong></font>
</fieldset>
                            </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><fieldset>
                            <legend>Input Form</legend>
                            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><table width="97%"  border="0" cellpadding="1" cellspacing="1">
                                    <tr>
									  <%
									    if(errflag.equals("y")){
										    %><td><div align="center"><strong><em><font color="#FF0000">
                                          <%=errmsg%>
                                          </font></em></strong></div></td><%
										}else{
										    %><td width="2%"><strong><em><font color="#FF0000">&nbsp;</font></em></strong></td><%
										}
									  %>                                      
                                    </tr>
                                    <tr> 
                                      <td width="98%"><table width="98%" border="0" cellspacing="1" cellpadding="1">
                                          <tr> 
                                            <td><div align="right"><strong><font size="4">:: 
                                                Main Keyword ::</font></strong></div></td>
                                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr> 
                                                  <td width="22%"><input name="buttsave" type="button" id="buttsave" value="Save Keyword"  onclick="clicksavekeyword();"/> 
                                                  </td>
                                                  <td width="78%"><input name="Buttcancel" type="button" id="Buttcancel" value="Cancel"  onclick="clickcancel();"/> 
                                                  </td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                          <tr> 
                                            <td><input type="hidden" name="addkeywordflag" value="<%=addkeywordflag%>" /> 
                                              <input type="hidden" name="expname" value="<%=expname%>">	
                                              <input type="hidden" name="inputlist" value="<%=inputlist%>"> 
                                              <input type="hidden" name="outputlist" value="<%=outputlist%>">	
                                              <input type="hidden" name="errmsg" value="<%=errmsg%>"> 
                                              <input type="hidden" name="errflag" value="<%=errflag%>">                                               
                                              <input type="hidden" name="addkeywordflag" value="<%=addkeywordflag%>"> 
                                              <input type="hidden" name="cproduct" value="<%=product%>"> 
											 
                                            </td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr> 
                                            <td width="45%"><div align="right"><strong><font size="2"><strong>Main 
                                                Keyword<font color="#FF0000"> 
                                                (1)</font> ::</strong></font> 
                                                </strong></div></td>
                                            <td width="55%"> <strong><font color="#FF0000"> 
                                              <input <%=disableobj%> name="mainkeyword" type="text" size="50" value="<%=mainkeyword%>" />
                                              * </font></strong></td>
                                          </tr>                                          
                                          <tr> 
                                            <td><div align="right"><font size="2"><strong>Delimit 
                                                Main keyword <font color="#FF0000">(2)</font> 
                                                ::</strong></font></div></td>
                                            <td><input name="delmainkeyword" type="text" size="50" maxlength="10" value="<%=delmainkeyword%>" /> 
                                              <strong><font color="#FF0000">* 
                                              </font></strong></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="right"><strong><font size="2">Head 
                                                Keyword <font color="#FF0000">(3)</font> 
                                                ::</font></strong></div></td>
                                            <td><input name="headkeyword" type="text" size="50"  value="<%=headkeyword%>"/> 
                                              <strong><font color="#FF0000">* 
                                              </font></strong></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="right"><strong><font size="2">Delimit 
                                                Head Keyword<font color="#FF0000">(4)</font> 
                                                ::</font></strong></div></td>
                                            <td><input name="delheadkeyword" type="text" size="50" maxlength="10"  value="<%=delheadkeyword%>"/>
                                              <strong></strong></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="right"><strong><font size="2">Delimit 
                                                between result </font><font size="2"><font color="#FF0000"> 
                                                (5)</font> ::</font></strong></div></td>
                                            <td><input name="delreuslt" type="text" size="50" maxlength="10"  value="<%=delreuslt%>"/>
                                              <strong></strong></td>
                                          </tr>
                                          <tr> 
                                            <td><div align="right"><strong><font size="2">Keyword 
                                                description ::</font></strong></div></td>
                                            <td><textarea name="keyworddes" cols="50" rows="5"><%=keyworddes%></textarea></td>
                                          </tr>
                                          <tr> 
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr> 
                                            <td><div align="right"><strong><font size="4">:: 
                                                Parametric Keyword ::</font></strong></div></td>
                                            <td> 
                                              <%
								  String maxparanum=IniFilesReader.getReturnProperties("Local.Application.tca","MAX PARAMETRIC NUM");	
								  int maxpara=Integer.parseInt(maxparanum);
								  int paranum=Integer.parseInt(numofparametric);
								%>
                                              <select name="numofparametric" id="select3" title="Select Number of Parametric" onchange="selectnumofparametric();">
                                                <%
								   for(int i=1;i<=maxpara;i++){
								      if(i==paranum){
								         %>
                                                <option selected="selected" value="<%=i%>"> 
                                                <%=i%>
                                                </option>
                                                <%
									  }else{
									     %>
                                                <option value="<%=i%>"> 
                                                <%=i%>
                                                </option>
                                                <%
									  } 
								   }
								 %>
                                              </select> </td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </table></td>
                              </tr>
                              <tr>
                                <td>
								
								<!-- -----------------------------------Parametric Input-------------------------------------------------------- -->
								<%for(int p=1;p<=paranum;p++){ %>
								  <table width="98%" border="0" cellspacing="1" cellpadding="1">
                                    <tr>
                                      <td width="11%">&nbsp;</td>
                                      <td width="11%" bgcolor="#666666"><div align="center"><font size="4"><strong><font color="#FFFFFF">Parametric 
                                          <%=p%>
                                          </font></strong></font></div></td>
                                      <td width="70%"><div align="center"></div>
                                        <table width="96%" border="0" cellpadding="1" cellspacing="1">
                                          <tr> 
                                            <td width="35%" bgcolor="#999999"><div align="right"><font color="#FFFFFF" size="2"><strong>Parametric 
                                                Name ::</strong></font></div></td>
											<%
											  String paraname="";
                                              if (request.getParameter("paraname"+p)!=null){paraname =request.getParameter("paraname"+p).trim();  }
											%>	
                                            <td width="65%"><input name="paraname<%=p%>" type="text" size="50" value="<%=paraname%>" />
                                              <strong><font color="#FF0000">* 
                                              </font></strong></td>
                                          </tr>
                                          <tr> 
                                            <td bgcolor="#999999"><div align="right"><font color="#FFFFFF" size="2"><strong>Parametric 
                                                Keyword <font color="#FF0000">(6)</font> 
                                                ::</strong></font></div></td>
										    <%
											  String parakeyword="";
                                              if (request.getParameter("parakeyword"+p)!=null){parakeyword =request.getParameter("parakeyword"+p).trim();  }
											%>			
                                            <td><input name="parakeyword<%=p%>" type="text" size="50" value="<%=parakeyword%>" />
                                              <strong><font color="#FF0000">* 
                                              </font></strong></td>
                                          </tr>
                                          <tr> 
                                            <td bgcolor="#999999"><div align="right"><font color="#FFFFFF" size="2"><strong>Delimit 
                                                Value<font color="#FF0000"> (7) 
                                                </font>::</strong></font></div></td>
											<%
											  String delvalue="";
                                              if (request.getParameter("delvalue"+p)!=null){delvalue =request.getParameter("delvalue"+p).trim();  }
											%>				
                                            <td><input name="delvalue<%=p%>" type="text" size="50" maxlength="10" value="<%=delvalue%>" />
                                              <strong></strong></td>
                                          </tr>
                                          <tr> 
                                            <td bgcolor="#999999"><div align="right"><font color="#FFFFFF" size="2"><strong>Parametric 
                                                Type ::</strong></font></div></td>
                                            <td> 
                                              <%
												  String arrparatype[]=IniFilesReader.getReturnProperties("Local.Application.tca","ADD VARIABLE TYPE").split(",");								  															   
											      String paratype="double";												  
                                                  if (request.getParameter("paratype"+p)!=null){paratype =request.getParameter("paratype"+p).trim();  }												  
											%>	
                                              <select name="paratype<%=p%>" id="paratype" title="Select Parametric Type">
                                                <option selected="selected" value="notselect">--------</option>
                                                <%														  
														  for(int x=0;x<arrparatype.length;x++)
														  {      
														     //String arr[]= arrparatype[x].split(":");
														     if (arrparatype[x].indexOf(paratype)>(-1) && paratype!="" ){        							
																%>
																<option selected value="<%=arrparatype[x]%>"><%=arrparatype[x]%></option>
																<%
															 }else{
															    %>
																<option value="<%=arrparatype[x]%>"><%=arrparatype[x]%></option>
																<%
															}
														  }
													   %>
                                              </select>
                                              <strong><font color="#FF0000">* 
                                              </font></strong> </td>
                                          </tr>
                                          <tr> 
                                            <td bgcolor="#999999"><div align="right"><font color="#FFFFFF" size="2"><strong>Parametric 
                                                Description ::</strong></font></div></td>
										    <%
											  String parades="";
                                              if (request.getParameter("parades"+p)!=null){parades =request.getParameter("parades"+p).trim();  }
											%>				
                                            <td><textarea name="parades<%=p%>" cols="50" rows="5"><%=parades%></textarea></td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </table>
								  <%}%>
								<!-- -----------------------------------End Parametric Input-------------------------------------------------------- -->								  
								  
								  </td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                              </tr>
                            </table>
                            </fieldset>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                      <p align="center">&nbsp; </p>
                      <!-- </fieldset> --></td> 
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
            <tr> 
              <td height="21"></td>
            </tr>
          </table>
		  <textarea  name="expeditor" style="visibility: hidden" cols="100" rows="40" ><%=expeditor%></textarea>
		  <textarea  name="expdes" style="visibility: hidden" cols="120" rows="40"><%=expdes%></textarea>   
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


function selectnumofparametric(){
var frm = document.form1;
setenableobj();
frm.action="testcode_assurance_addexpressionkeyword.jsp";	
frm.submit();	

}

function clickcancel(){
var frm = document.form1;
setenableobj();
frm.action="testcode_assurance_expressionbuilder.jsp";	
frm.submit();	

}

function clicksavekeyword(){
var frm = document.form1;
var err=checkinput();

if (err == ""){
  setenableobj(); 
  frm.action="testcode_assurance_saveexpressionkeyword_process.jsp";	
  frm.submit();	  
}else{
   alert("Please verify your input.\n\n"+err);
}

}

function checkinput(){
var jnumofparametric = document.getElementById('numofparametric');
var jmainkeyword = document.getElementById('mainkeyword');
var jdelmainkeyword= document.getElementById('delmainkeyword');
var jheadkeyword = document.getElementById('headkeyword');
var jdelheadkeyword = document.getElementById('delheadkeyword');
var jdelreuslt = document.getElementById('delreuslt');
var err="";
err=err+chknull(jmainkeyword.value,"Main Keyword");
err=err+chknull(jdelmainkeyword.value,"Delimit Main Keyword");
err=err+chknull(jheadkeyword.value,"Head Keyword");
//err=err+chknull(jdelheadkeyword.value,"Delimit Head Keyword");
//err=err+chknull(jdelreuslt.value,"Delimit between result");

for(i=1;i<=jnumofparametric.value;i++){
   var objparaname=document.getElementById('paraname'+i);   
   var objparakeyword=document.getElementById('parakeyword'+i);
   var objdelvalue=document.getElementById('delvalue'+i);
   var objparatype=document.getElementById('paratype'+i);
   
   err=err+chknull(objparaname.value,"Parametric"+i+": Name ");
   err=err+chknull(objparakeyword.value,"Parametric"+i+": Keyword ");
   //err=err+chknull(objdelvalue.value,"Parametric"+i+": Delimit Value ");
   if(objparatype.value=="notselect"){      
       err=err+"Parametric"+i+": Type is empty. \n"
   }
     
      
}
return err;
}

function chknull(str,inputtype){
var err="";
	if(str==""){
	   err= inputtype + " is empty.\n";
	}  
	return err;
}

function setenableobj(){
  document.getElementById('mainkeyword').disabled=false;
  //document.getElementById('cproduct').disabled=false;
}



</script>