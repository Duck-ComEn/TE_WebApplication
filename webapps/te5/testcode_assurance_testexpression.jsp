<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
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
<table align="center" class="form-noindent" cellspacing="3" cellpadding="5" width="96%" 
      border="0">
  <tbody>
    <tr> 
      <td height="274" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
          <table width="100%" height="264" border="0">
            <tr> 
              <td width="100%" height="21" align="left"><span class="style1">Test 
                Code Assurance :: Test Expression</span></td>
            </tr>
			<%@ include file="testcode_assurance_expression_commoninclude.jsp" %>
            <%
			     String expname =request.getParameter("expname").trim();

				 String classname=product.toUpperCase()+"_"+expname.toUpperCase();				 
				 String inputlist = request.getParameter("inputlist").trim();
				 String functionname =request.getParameter("functionname").trim();
				 String expeditor =request.getParameter("expeditor").trim();				 
				 String outputlist ="";
				 if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }
				 String outputresult ="";
				 if (request.getParameter("outputresult")!=null){outputresult =request.getParameter("outputresult").trim();  }
				 String testinput ="";
				 if (request.getParameter("testinput")!=null){testinput =request.getParameter("testinput").trim();  }
                
				  String errflag ="";
				 if (request.getParameter("errflag")!=null){errflag =request.getParameter("errflag").trim();  }
				 String errmsg ="";
				 if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  }
				 
				 String expdes ="";
			     if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  } 
				 
				 String mainkeyword ="";
                if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim();  }
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
                    <td width="2%" height="166" >&nbsp;</td>
                    <td width="96%" align="left" valign="top"><fieldset>
                      <legend>Controller</legend>
                      <input type="hidden" name="inputlist" value="<%=inputlist%>" />
                      <input type="hidden" name="outputlist" value="<%=outputlist%>"/>
                      <input type="hidden" name="expname" value="<%=expname%>" />
                      <input type="hidden" name="errflag" value="n"/>
                      <input type="hidden" name="functionname" value="<%=functionname%>"/>
                      <input type="hidden" name="expdes" value="<%=expdes%>"/>
					  <input type="hidden" name="mainkeyword" value="<%=mainkeyword%>">
	<!-- ---------------------------------------------------------------------------------------------------- -->				 
                      <table width="100%" border="0">
                        <tr> 
                          <td width="3%"> <div align="center"> </div></td>
                          <td width="94%">Expression Name :: <font color="#0000FF"><%=classname%></font><strong><em> </em></strong></td>
                          <td width="3%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td><table width="100%" border="0" cellpadding="2">
                              <tr> 
                                <td width="58%"><fieldset>
                                  <legend>Input</legend>
                                  <table width="100%" border="0" cellpadding="2">
                                    <%									     
									  String arrinputlist[]=inputlist.split(",");
									  String arruserinput[]=testinput.split(",");
									  String inputtype="";									  
										 for (int i=0;i<arrinputlist.length;i++){										   
										    String substr[] = arrinputlist[i].split(":");
											inputtype=inputtype+arrinputlist[i]+",";											
										%>
										<!-- --------------------------------input-------------------------------- -->
										<tr> 
										  <td width="37%"> <div align="right"><%=substr[0]%>
											  <%String tmp="txt"+substr[0];%>
											  ::</div>
										   </td>
										  <%
											  
											if(testinput.equals("")==false){
											  %>
											  <td width="23%"><input name="<%=tmp%>" value="<%=arruserinput[i]%>" type="text"   size="10" maxlength="9" /> 
												<em><font color="#CC0000">[ <%=substr[1]%> ]</font></em> </td>
											  <%
											  }else{
											  %>
											   <td width="40%"><input name="<%=tmp%>" value="" type="text"   size="10" maxlength="9" /> 
												<em><font color="#CC0000">[ <%=substr[1]%> ]</font></em></td>
											 <%}%>
										</tr>
										<!-- --------------------------------------------------------------------- -->
                                        <%}%>
                                    <input type="hidden" name="inputtype" value="<%=inputtype.substring(0,inputtype.length()-1)%>"/>
                                  </table>
                                  </fieldset></td>
                                <td width="42%" align="left" valign="top"><fieldset>
                                  <legend>Output</legend>
								  <!-- ----------------------------Output---------------------------------------- -->
                                  <table width="100%" border="0" cellpadding="2">
								     <%
									  String arroutputlist[]=outputlist.split(",");
									  String arroutputresult[]=outputresult.split(",");
									  for(int x=0;x<arroutputlist.length;x++){										  		
								    %>
									    <tr> 
										  <td width="24%"> <div align="right"><%=arroutputlist[x]%> ::</div></td>
										  <%if(outputresult.equals("")==true){%>
										     <td width="43%"> <div align="left">&nbsp;</div></td>	
										     
										  <%}else{%>
										     <td width="33%"> <div align="left"><strong><font color="#0000FF"><%=arroutputresult[x]%></font></strong> 
                                          
                                        </div></td>	
										  <%}%>								  
									    </tr>
									 <%
									  }
								    %>	
								  </table>				
								  <!-- -------------------------------------------------------------------------- -->								  
                                  </fieldset></td>
                              </tr>
                            </table></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td height="26">&nbsp;</td>
                          <td> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="58%"><div align="center">
                                    <input name="testexp" type="button" id="testexp" value="Test Expression" onclick="clicktestexp();" />
                                    <input name="cancel" type="button" id="cancel" value="Quit" onclick="backtoexpressionbuilder();" />
                                  </div></td>
                                <td width="42%">&nbsp;</td>
                              </tr>
                            </table> </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->					  
                      <table width="100%" border="0" cellpadding="2">
                        <tr> 
                          <td>&nbsp; </td>
                        </tr>
                        <tr> 
                          <td> 
						    <div align="center">
                            <%
							 if (errflag.equals("y")){									   
							%>
                              <strong><font color="#FF0000"> <%=errmsg%> </font></strong> 
                              <%
							  }else if (errflag.equals("n")){									
							%>
                              <strong><font color="#009900"> <%=errmsg%></font></strong> 
                            <%}%>
                            </div></td>
                        </tr>
                        <tr> 
                          <td><div align="center"> 
                              <textarea readonly name="expeditor" cols="100" rows="30"><%=expeditor%></textarea>
                            </div></td>
                        </tr>
                      </table>
                      <p align="center">&nbsp; </p>
                      </fieldset></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
            <tr> 
              <td height="21"></td>
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

function clicktestexp(){
var jinputtype = document.getElementById('inputtype');
var inputtype = new Array();
var input = new Array();
var inputtype=jinputtype.value.split(",");
var frm = document.form1;
var err="";
var obj=null;


	for(i=0;i<inputtype.length;i++){
	   input=inputtype[i].split(":");
	   var obj=document.getElementById('txt'+input[0]);
	      if (obj.value!=""){
			  if (input[1].toUpperCase()=="INT"){
				   
				   if (isInteger(obj.value)==false){
						err=err+" Input"+(i+1)+": Input value are incorrect. You should be input on 'Integer' type.\n";
				   }
			  }else if (input[1].toUpperCase()=="DOUBLE"){	    
				 if (isDouble(obj.value)==false){
						err=err+" Input"+(i+1)+": Input value are incorrect. You should be input on 'Double' type.\n";
				  }
			  }else if (input[1].toUpperCase()=="LONG"){	    
				 if (isInteger(obj.value)==false){
						err=err+" Input"+(i+1)+": Input value are incorrect. You should be input on 'Long' type.\n";
				  }
			  }	
			}else{
			    err=err+" Input"+(i+1)+" are emtpy.\n";
			}
	 
	}
    if (err==""){
	     frm.action="testcode_assurance_testexpression_process.jsp";	
		 frm.submit();	
	  } else{
	    alert(err);
	  } 

}

function backtoexpressionbuilder(){
var frm = document.form1;
frm.action="testcode_assurance_expressionbuilder.jsp";	
frm.submit();	

}

function isInteger(val){  
val=val.replace("-","");
for (var i = 0; i < val.length; i++)     
{        
   var ch = val.charAt(i);        
   if (i == 0 && ch == "-")        
   {            
      continue        
	}        
	if (ch < "0" || ch > "9"){ 
	      return false        
    }    
}    
return true
}

function isDouble(str){
str=str.replace("-","");
  var pattern = /^\d+.?\d*$/;
  
	if ( str.match(pattern)==null )
		return false
	else

    return true
}

</script>