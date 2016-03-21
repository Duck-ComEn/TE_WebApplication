<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import ="com.hitachigst.prb.te.tca.*"%>
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
<%String menumode="testcode_assurance_expressionbuilder.jsp";%>
<%@ include file="PageLayout/testcode_hometoplayout.jsp" %>

<table width="85%" 
      border="0" align="center" cellpadding="5" cellspacing="3" class="form-noindent">
  <tbody>
    <tr> 
      <td height="1335" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="get" name="form1" target="_parent" id="form1">
          <table width="100%" height="449" border="0">
            <tr> 
              <td width="100%" height="21" align="left"><span class="style1">Test Code Assurance 
                :: Expression Builder</span></td>
            </tr>
            <tr> 
              <td height="21"><table width="99%" height="252" border="0">
                  <tr> 
                    <td width="33%" height="248" align="left" valign="top"><fieldset>
                      
                        <legend><legend>Information</legend>
</legend>
                      <table width="100%" border="0">
                        <tr> 
                          <td width="94%" height="21" align="right"> <table width="106%" border="0">
                              <tr> 
							    <%@ include file="testcode_assurance_expression_commoninclude.jsp" %>
							    <%
								
                                 String expname ="";
								 if (request.getParameter("expname")!=null){expname =request.getParameter("expname").trim();  }
								//out.print("expname : "+expname);
								 								 
								 String inputlist ="";
								 if (request.getParameter("inputlist")!=null){inputlist =request.getParameter("inputlist").trim();  }								 
								 //ou.print("inputlist : "+inputlist);
								 
								 String functionname="";
								 if (request.getParameter("functionname")!=null){functionname =request.getParameter("functionname").trim();  }
								// out.print("functionname : "+functionname);
								 
								 String expeditor ="";
								 try{
								   expeditor=session.getAttribute("expeditor").toString();								
								   //session.removeAttribute("expeditor");						 
								 }catch(Exception e){
								   //out.print("Destroy");
								 }
								 
								 if (request.getParameter("expeditor")!=null){expeditor =request.getParameter("expeditor").trim(); }
								 //out.print("expeditor :: "+ expeditor);
								 //out.print("expeditor : "+expeditor);
								 		 								
								 String outputlist ="";
								 if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }
								 //out.print("outputlist : "+outputlist);
								 
								 String errflag ="";
								 if (request.getParameter("errflag")!=null){errflag =request.getParameter("errflag").trim();  }  
								// out.print("errflag : "+errflag);
								 
								 String expdes ="";
						         if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }
								// out.print("expdes : "+expdes);
								 
								 //out.print("addexpflag : "+addexpflag);
								 
								 String mainkeyword ="";
								 mainkeyword=new CriteriaKeywordManager().getCriteriaKeyword(product+"_"+expname.toUpperCase().trim());							 
						         if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim();  }
								 //out.print("mainkeyword : "+mainkeyword);
								//out.print("Product : "+product);
								
								%>
								
								
								
                                <td width="41%"><div align="right">Expression Name ::</div></td>
                                <td width="59%"><div align="left"><strong><font color="#0000FF"> 
								
                                    <%=expname%>
                                    <input type="hidden" name="expname" value="<%=expname%>" />
                                    <input maxlength="500" type="hidden" name="expdes" value="<%=expdes%>" />
                                    <input type="hidden" name="flag" value="commit" />
									<input type="hidden" name="product"   value="<%=product%>"/>
									<input type="hidden" name="cproduct"   value="<%=product%>"/>
									<input type="hidden" name="addkeywordflag" value="add"/>
                                    </font>                                    
                                    </strong></div></td>
                              </tr>
                              <tr> 
                                <td><div align="right">Product :: </div></td>
                                <td><div align="left"><strong><%=product%> </strong></div></td>
                              </tr>
                              <tr> 
                                <td height="64">&nbsp;</td>
                                <td align="left" valign="top"><div align="left"> 
                                    <table width="98%" border="0" cellpadding="2">
									  <%			
									    
									     String commitbutt="";
										 String testexp="";						
									    if (errflag.equals("y") || errflag.equals("")){
										   commitbutt="disabled";
										   testexp="disabled";	
										}   									
									  %>
                                      <tr>
                                        <td><input name="commitexp" <%=commitbutt%> type="button" id="commitexp" value="Commit Expression"  onclick="clickcommitexpression();" /></td>
                                      </tr>
                                      <tr>
                                        <td><input name="Cancel" type="button" id="Cancel2" value="Cancel" onclick="clickcancel();" /></td>
                                      </tr>
                                    </table>                                    
                                  </div></td>
                              </tr>
                            </table>
                            <label></label></td>
                        </tr>
                        <tr> 
                          <td height="21" align="right"> <div align="center"> 
                            </div></td>
                        </tr>
                      </table>
                      </fieldset></td>
                    <td width="1%" align="left" valign="top"></td>
                    <td width="66%" align="left" valign="top"><div align="right"><fieldset>
                      <legend>Parametic Input</legend>
                      <div align="right"></div>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="21">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><div align="left"> 
                                <table width="100%" height="19" border="0" cellpadding="1" cellspacing="1">
                                  <tr> 
                                    <td width="23%" align="right" valign="middle"><div align="right"><strong><font size="2">Criteria 
                                        Keyword :: </font></strong></div></td>
                                    <td width="57%" align="left" valign="middle"> 
                                      <table width="76%" border="0" cellspacing="1" cellpadding="1">
                                        <tr> 
                                          <td width="66%" > <div align="left"> 
                                              <select name="criterkeywordselect" title="Please select expression keyword which matcthing with rawdata." onchange="mainkeywordselection();">
                                                <option disabled value="not select">----------------------------------------------------</option>
                                                
												 <%
												  CriteriaKeywordManager ck=new CriteriaKeywordManager();
												   Vector vmkeyword=ck.getCriteriaKeywordAll(product);
												   if (vmkeyword.size()>0){
														for (int mk=0;mk<vmkeyword.size();mk++){
															
															if ((product+"::"+mainkeyword).equals(vmkeyword.get(mk))){       									    							
															%>
																<option selected value="<%=vmkeyword.get(mk)%>"   >
																<%=vmkeyword.get(mk)%>
																</option>
																<%
															 }else{
															%>
															
															<option value="<%=vmkeyword.get(mk)%>">
															<%=vmkeyword.get(mk)%>
															</option>
															<%}
														}
													}
												   
												   
												%>
												
                                              </select>
                                              <strong><font color="#FF0000">*</font></strong></div></td>
                                        </tr>
                                      </table></td>
                                    <td width="20%"> <div align="left"> </div></td>
                                  </tr>
                                  <tr>
                                    <td align="right" valign="middle">&nbsp;</td>
                                    <td align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr> 
                                          <td width="13%"> <div align="left">
                                              <input type="button" name="addkeyword" value="Add Keyword" title="Add new keyword." onclick="addnewkeyword();"/>
                                            </div></td>
                                          <td width="87%"><input type="button" name="editkeyword" value="Edit Keyword" title="Edit selected keyword." onclick="editnewkeyword();"/></td>
                                        </tr>
                                      </table></td>
                                    <td>&nbsp;</td>
                                  </tr>
                                </table>
                              </div></td>
                          </tr>
                          <tr> 
                            <td>&nbsp; </td>
                          </tr>
                          <tr>
                            <td><table width="100%" border="0">
                                <tr> 
                                  <td width="5%">&nbsp;</td>
                                  <td width="94%"><table width="100%" border="0">
                                      <tr> 
                                        <td width="39%" ><div align="right"><strong><em>Your 
                                            selection </em><font color="#FF0000">*</font></strong></div></td>
                                        <td width="10%">&nbsp; </td>
                                        <td width="51%"><div align="left"><strong><em>Parametic 
                                            List </em></strong></div></td>
                                      </tr>
                                      <tr> 
                                        <td height="171" ><div align="right"> 
                                            <select name="left" size="10" multiple="multiple" id="select2" ondblclick="dblclickparametric();"  ><option disabled title="Can not select." >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;********************************************</option> 
                                              <%								          
										   String arruserparaselect[]=inputlist.split(",");
										   if (inputlist!=""){										   
											   for (int ii=0;ii<arruserparaselect.length;ii++){
												   %>
                                              <option  > 
                                              <%=arruserparaselect[ii]%>
                                              </option>
                                              <%
												}
										 }		
										 
										  %>
                                            </select>
                                          </div></td>
                                        <td><div align="center"></div>
                                          <div align="center"></div>
                                          <div align="center"></div>
                                          <div align="center"></div>
                                          <div align="center"> 
                                            <table width="64%" border="0">
                                              <tr> 
                                                <td><div align="center"> 
                                                    <input name="alltoleft" type="button" id="alltoleft2" value="&lt;&lt;" onclick="clickallgoleft();" />
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td><div align="center"> 
                                                    <input name="toleft" type="button" id="toleft" value="&lt;" onclick="clickgoleft();" />
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td><div align="center"> 
                                                    <input name="toright" type="button" id="toright" value="&gt;" onclick="clickgoright();" />
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td><div align="center"> 
                                                    <input name="alltoright" type="button" id="alltoright" value="&gt;&gt;" onclick="clickallgoright();" />
                                                  </div></td>
                                              </tr>
                                            </table>
                                          </div></td>
                                        <%										  
								  
								  
								  String paralist="";					 
								  						   
								  %>
                                        <td><div align="left"> 
                                            <select name="right" size="10" multiple="multiple" id="select3" >
											    <option disabled  title="Can not select.">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;********************************************</option> 
                                                <%
											   if (mainkeyword.equals("")==false && mainkeyword.indexOf("----")==(-1) ){
												  ParametricManager pm=new ParametricManager();				  								 												  					  											 
												  Vector vp=pm.getParmetricList(product.toUpperCase(),mainkeyword);		
												  if (vp!=null){	
																					
													for (int ii=0;ii<vp.size();ii++){
														 boolean chk=false;
														 paralist=vp.get(ii).toString();
														for (int jj=0;jj<arruserparaselect.length;jj++){											    
															if(paralist.equals(arruserparaselect[jj])){
																chk=true;
															}
														}
														if(chk==false){
																   %>
														  <option > 
														  <%=paralist%>
														  </option>
														  <%
														}
													}		
											     }						
										      }
								             %>
											    
                                            </select>
                                          </div></td>
                                      </tr>
                                    </table></td>
                                  <td width="1%">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                        </fieldset></div></td>
                  </tr>
                </table></td>
            </tr>
            <tr> 
              <td><fieldset>
                <p>
                  <legend>Criteria Expression </legend>
                </p>
                <table width="100%" border="0">
                  <tr> 
                    <td width="30%"><div align="center"> </div></td>
                    <td width="70%"><div align="left">
                        <input type="hidden" name="inputlist" value="<%=inputlist%>" />
                        <input type="hidden" name="outputlist" value="<%=outputlist%>"/>
						
                      </div></td>
                  </tr>
                  <tr> 
                    <td height="804" align="left" valign="top"><div align="center">
                        <fieldset>
                        <div align="left">
                          <legend>Controller</legend>
                          <table width="100%" border="0">
                            <tr> 
                              <td><div align="center"> 
                                  <table width="100%" border="0">
                                    <tr> 
                                      <td width="50%"><div align="right"> 
                                          <input name="checkexp2" type="button" id="checkexp23" value="Create Expression" onclick="checkExpression();" />
                                        </div></td>
                                      <td width="50%"><div align="left"> 
                                          <input name="testexp" <%=testexp%> type="button" id="checkexp2" value="Test Expression" onclick="clicktestexpression();" />
                                        </div></td>
                                    </tr>
                                  </table>
                                </div></td>
                            </tr>
                            <tr> 
                              <%        
							           String errmsg="";
									   if (request.getParameter("errmsg")!=null){
								             errmsg =request.getParameter("errmsg").trim();
											
									   }		 
								%>
                              <input type="hidden" name="errmsg" value="<%=errmsg%>" />
                              <td align="left" valign="top"> <div align="center"> 
                                  <fieldset>
                                  <div align="left"> 
                                    <legend>Suggestion</legend>
                                    <%
									   if (errflag.equals("y")){									   
									%>
                                    <strong><font color="#FF0000">
                                    <%out.println(errmsg);%>
                                    </font></strong> 
                                    <%
									  }else if (errflag.equals("n")){									%>
                                    <strong><font color="#009900">
                                    <%out.println(errmsg);%>
                                    </font></strong> 
                                    <%}%>
                                    <textarea name="txtsuggest" cols="50" rows="10" ><%=errmsg%></textarea>
                                  </div>
                                  </fieldset>
                                </div></td>
                            </tr>
                            <tr> 
                              <td align="left" valign="top"><fieldset onmouseover="addoutputfocus();" onmouseout="focusmoveout();">
                                <legend>Add Output</legend>
                                <table width="100%" border="0">
                                  <tr> 
                                    <td width="27%" height="34"><div align="right"><strong>Output 
                                        List::</strong> </div></td>
                                    <td width="49%"> <div align="center"></div>
                                      <%
									  String arroutputlist[]=outputlist.split(",");									  
									%>
                                      <select name="txtoutputlist" size="6" multiple="multiple" id="select"  >
                                        <option disabled title="Can not select." >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*********************</option>
                                        <%
										  
										   for (int o=0;o<arroutputlist.length;o++){
										      %>
                                        <%if (arroutputlist[o]!=""){%>
                                        <option> 
                                        <%=arroutputlist[o]%>
                                        </option>
                                        <%}%>
                                        <%
										   }
										%>
                                      </select></td>
                                    <td width="24%"> <input name="addvariable23" type="button" id="addvariable233" value="&gt;&gt;" onclick="clickaddoutputtoexp();" /></td>
                                  </tr>
                                  <tr> 
                                    <td><div align="right"></div></td>
                                    <td><div align="left"> 
                                        <table width="70%" border="0" cellpadding="2">
                                          <tr> 
                                            <td><div align="center"> 
                                                <input name="addoutput" type="button" id="addoutput2" value="add" onclick="clickaddoutput();" />
                                              </div></td>
                                            <td><div align="center"> 
                                                <input name="removeoutput" type="button" id="removeoutput3" value="remove" onclick="clickremoveoutput();" />
                                              </div></td>
                                          </tr>
                                        </table>
                                      </div></td>
                                    <td><div align="left"> </div></td>
                                  </tr>
                                </table>
                                </fieldset></td>
                            </tr>
                            <tr> 
                              <td align="left" valign="top"><fieldset onmouseover="addvariablefocus();" onmouseout="focusmoveout();" >
                                <legend>Add Variable</legend>
                                <table width="100%" border="0">
                                  <tr> 
                                    <td width="27%"><div align="right"><strong>Type 
                                        ::</strong></div></td>
                                    <td width="49%"><div align="left"> 
                                        <select name="selectvariable" >
                                          <option value="-----" >-----</option>
                                          <%
										    String getvariable=IniFilesReader.getReturnProperties("Local.Application.tca","ADD VARIABLE TYPE");
											String addvariable[]=getvariable.split(",");
											for(int av=0;av<addvariable.length;av++){
										  %>
                                          <option value="<%=addvariable[av]%>"> 
                                          <%=addvariable[av]%>
                                          </option>
                                          <%
										   }
										  %>
                                        </select>
                                      </div></td>
                                    <td width="24%">&nbsp;</td>
                                  </tr>
                                  <tr> 
                                    <td><div align="right"><strong>Name ::</strong></div></td>
                                    <td><div align="left"> 
                                        <input type="text" name="txtvariablename"/>
                                      </div></td>
                                    <td><div align="left"> 
                                        <input name="addvariable" type="button" id="addvariable2" value="&gt;&gt;" onclick="clickaddvariable();" />
                                      </div></td>
                                  </tr>
                                </table>
                                </fieldset></td>
                            </tr>
                            <tr> 
                              <td><fieldset  onmouseover="addparameticfocus();" onmouseout="focusmoveout();">
                                <legend>Add Parametic Input</legend>
                                <table width="100%" border="0">
                                  <tr> 
                                    <td width="27%"><div align="right"><strong>Parametic 
                                        ::</strong></div></td>
                                    <td width="49%"><div align="left"> 
                                        <select name="parainput">
                                        </select>
                                      </div></td>
                                    <td width="24%"><div align="left"> 
                                        <input name="addpara" type="button" id="addpara2" value="&gt;&gt;" onclick="clickaddparametic();" />
                                      </div></td>
                                  </tr>
                                </table>
                                </fieldset></td>
                            </tr>
                            <tr> 
                              <td> <fieldset  onmouseover="Selectionfocus();" onmouseout="focusmoveout();">
                                <legend>Add Selection</legend>
                                <table width="100%" border="0">
                                  <tr> 
                                    <td width="27%"><div align="right"><strong>Type 
                                        ::</strong></div></td>
                                    <td width="49%"><div align="left"> 
                                        <select name="selectcondition">
                                          <option value="-----">-----</option>
                                          <%
										    String getselection=IniFilesReader.getReturnProperties("Local.Application.tca","ADD SELECTION CONDITION");
											String addselection[]=getselection.split(",");
											for(int as=0;as<addselection.length;as++){
										  %>
                                          <option value="<%=addselection[as]%>"> 
                                          <%=addselection[as]%>
                                          </option>
                                          <%
										   }
										  %>
                                        </select>
                                      </div></td>
                                    <td width="24%"><div align="left"> 
                                        <input name="addselect" type="button" id="addselect" value="&gt;&gt;" onclick="clickaddselection();" />
                                      </div></td>
                                  </tr>
                                </table>
                                </fieldset></td>
                            </tr>
                            <tr> 
                              <td> <fieldset  onmouseover="iterationfocus();" onmouseout="focusmoveout();">
                                <legend>Add Iteration</legend>
                                <table width="100%" border="0">
                                  <tr> 
                                    <td width="27%"><div align="right"><strong>Type 
                                        ::</strong></div></td>
                                    <td width="49%"><div align="left"> 
                                        <select name="selectiterationloop">
                                          <option value="-----">-----</option>
                                          <%
										    String getiteration=IniFilesReader.getReturnProperties("Local.Application.tca","ADD ITERATION LOOP");
											String additeration[]=getiteration.split(",");
											for(int ai=0;ai<additeration.length;ai++){
										  %>
                                          <option value="<%=additeration[ai]%>"> 
                                          <%=additeration[ai]%>
                                          </option>
                                          <%
										   }
										  %>
                                        </select>
                                      </div></td>
                                    <td width="24%"><div align="left"> 
                                        <input name="additeration" type="button" id="additeration" value="&gt;&gt;" onclick="clickadditeration();" />
                                      </div></td>
                                  </tr>
                                </table>
                                </fieldset></td>
                            </tr>
                            <tr> 
                              <td>&nbsp;</td>
                            </tr>
                          </table>
                        </div>
                        </fieldset>
                      </div></td>
                    <td align="right" valign="top"><div align="left"> 
                        <table width="100%" border="0">
                          <tr>
                            <td><label><strong><em>
                              <input name="functionname" type="text" size="100" readonly=""  value="<%=functionname%>"/>
                              </em></strong></label></td>
                          </tr>
                          <tr>
                            <td><table width="100%" border="0">
                                <tr>
                                  <td width="8%" align="center" valign="top"> 
                                    <table width="100%" border="0">
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="plus" type="button" id="plus2" value="+" title="Plus sign"  onclick="setdatatocurrentcursor(' + ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="sub" type="button" id="sub2" value="-" title="Minus Sign"  onclick="setdatatocurrentcursor(' - ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="mul" type="button" id="mul2" value="*"  title="Multiply Sign" onclick="setdatatocurrentcursor(' * ');" />
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="div" type="button" id="div2" value="/" title="Divide Sign"  onclick="setdatatocurrentcursor(' / ');" />
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"></div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="circles" type="button" id="circles2" value="(" onclick="setdatatocurrentcursor(' ( ');" />
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="circlee" type="button" id="circlee2" value=")" onclick="setdatatocurrentcursor(' ) ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"></div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="and" type="button" id="and2" value="&&" title="And Sign" onclick="setdatatocurrentcursor(' && ');" />
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="Or" type="button" id="Or2" value="||" title="Or Sign"  onclick="setdatatocurrentcursor(' || ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"></div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="equal" type="button" id="equal2" value="=" title="Assign Value to Variable" onclick="setdatatocurrentcursor(' = ');" />
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="equalcondition" type="button" id="equalcondition" value="=="  title="Compare equal Value between 2 variable" onclick="setdatatocurrentcursor(' == ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="notequal" type="button" id="notequal" value="!="  title="Compare not equal value" onclick="setdatatocurrentcursor(' != ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="endline" type="button" id="endline" value=";"  title="End Line sign" onclick="setdatatocurrentcursor(' ; ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"></div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="scopes" type="button" id="scopes2" value="{"  title="Start Scope" onclick="setdatatocurrentcursor(' { ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"> 
                                            <input name="scopee" type="button" id="scopee2" value="}"  title="End Scope" onclick="setdatatocurrentcursor(' } ');"/>
                                          </div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center"></div></td>
                                      </tr>
                                      <tr> 
                                        <td><div align="center">
                                            <input name="comment" type="button" id="comment" value="//"  title="Comment out this line" onclick="setdatatocurrentcursor(' // ');"/>
                                          </div></td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td width="92%"><textarea  name="expeditor" cols="100" rows="40"  onkeypress="editorpresskey(event);" onmouseover="expressioneditorfocus();" onmouseout="focusmoveout();"><%=expeditor%></textarea></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td><strong><em>
                              <input name="textfield22" type="text" value="} // End function" size="100" readonly="" />
							  <input type="hidden"  name="mainkeyword"   value="<%=mainkeyword%>"/>
							  <input type="hidden" name="expeditor"   value="<%=expeditor%>"/>
							  <input type="hidden" name="addexpflag"   value="<%=addexpflag%>"/>
							  
                              </em></strong></td>
                          </tr>
                        </table>
                        <p>&nbsp;</p>
                      </div></td>
                  </tr>
                </table>
                <p>&nbsp;</p>
                <p>
                  <legend></legend>
                </p>
                <div align="center"> </div>
                </fieldset></td>
				
            </tr>
          </table>
        </form></td>
    </tr>
  </tbody>
</table>
<script language="JavaScript">   
   generatefunctionname();
</script>
<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>
<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">
function clickgoleft(){
var frm = document.form1;
var jright = document.getElementById('right');
var jleft = document.getElementById('left');

	if (jright.selectedIndex!=-1 && jright.selectedIndex!=0){
		var userselect=jright.options[jright.selectedIndex].text;
		var oOption = document.createElement("OPTION");
		var chk=false;
		for(i=1; i<jleft.length; i++)  {
		   if(jleft.options[i].text==userselect){
			   chk=true;
		   }   
		}
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");
		  
		}else{
		   jleft.options.add(oOption);
		   oOption.text = userselect;
		   oOption.value = userselect;
		   
		   jright.remove(jright.selectedIndex);	  
		   generatefunctionname();
		}
	}else{
	   alert("Please be select expression.");
	}
}

function clickgoright(){
	
var frm = document.form1;
var jright = document.getElementById('right');
var jleft = document.getElementById('left');

	if (jleft.selectedIndex!=-1 && jleft.selectedIndex!=0){
		var criterialist=jleft.options[jleft.selectedIndex].text;
		var oOption = document.createElement("OPTION");
		var chk=false;
		for(i=1; i<jright.length; i++)  {
		   if(jright.options[i].text==criterialist){
			   chk=true;
		   }   
		}
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");
		  
		}else{
		   jright.options.add(oOption);
		   oOption.text = criterialist;
		   oOption.value = criterialist;
		   
		   jleft.remove(jleft.selectedIndex);
		   generatefunctionname();
		}
	}else{
	   alert("Please be select expression.");
	}
}

function clickallgoright(){
	
var frm = document.form1;
var jright = document.getElementById('right');
var jleft = document.getElementById('left');
var oOption = document.createElement("OPTION");
	
   if(jleft.length>1){
        var chk=false;
         for (j=1;j<jleft.length;j++){ 
		    var userselect=jleft.options[j].text; 		
			for(i=1; i<jright.length; i++)  {
			   if(jright.options[i].text==userselect){
				   chk=true;
			   }   
			}
	     }		
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");
		  
		}else{
		  varnum=jleft.length;
		  for(i=1; i<varnum; i++)  {
			   oOption = document.createElement("OPTION");
			   jright.options.add(oOption);
			   oOption.text = jleft.options[i].text;
			   oOption.value = jleft.options[i].text;		   
			  
		  }
		  for(i=1; i<varnum; i++)  {	       
		   jleft.remove(1);
	      } 
		  generatefunctionname();   
		} 	  
   }else{
      alert("Your selection are empty.");
   }	
}

function clickallgoleft(){
	
var frm = document.form1;
var jright = document.getElementById('right');
var jleft = document.getElementById('left');
var oOption = document.createElement("OPTION");
	 
   if(jright.length>1){
       var chk=false;
         for (j=1;j<jright.length;j++){ 
		    var criteria=jright.options[j].text; 		
			for(i=1; i<jleft.length; i++)  {
			   if(jleft.options[i].text==criteria){
				   chk=true;
			   }   
			}
	     }		
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");		  
		}else{
			  varnum=jright.length;
			  for(i=1; i<varnum; i++)  {
				   oOption = document.createElement("OPTION");
				   jleft.options.add(oOption);
				   oOption.text = jright.options[i].text;
				   oOption.value = jright.options[i].text;
				  
				   //jcriteria.remove(i);
			  }
			  for(i=1; i<varnum; i++)  {	       
				   jright.remove(1);
			  }
			  generatefunctionname();
		  }	 
   }else{
      alert("Your selection are empty.");
   }
}

function addoutputfocus(){

var jtxtsuggest = document.getElementById('txtsuggest');
var temp = "Add output variable for your expression.\n";
temp=temp+"and system will use 'sysoutput' + num of output.\n";
temp=temp+"Ex  sysoutput0 = 1 ;\n";
temp=temp+"    sysoutput1 = 2 ;\n";
temp=temp+"So , If you want to return result to system.\n";
temp=temp+"Please be using this variable to return result.\n";
jtxtsuggest.value=temp;

}

function focusmoveout(){
var jtxtsuggest = document.getElementById('txtsuggest');
jtxtsuggest.value="";
}

function addvariablefocus(){
	
var frm = document.form1;
var jtxtsuggest = document.getElementById('txtsuggest');
var temp = "int :: -2147483648 to 2147483647.\n";
temp=temp+"double :: -1.8 * (10^308) to 1.8 * (10^308).\n";
temp=temp+"long :: -9223372036854775808 to 9223372036854775807.\n";
temp=temp+"String :: abcdefghijklmnopqrstuvwxyz.\n";
temp=temp+"boolean :: true or false.\n";
jtxtsuggest.value=temp;

}


function addparameticfocus(){
	
var frm = document.form1;
var jtxtsuggest = document.getElementById('txtsuggest');
var temp = "Selection parametic as you have to input to your expression.\n";
jtxtsuggest.value=temp;
}


function clickaddvariable(){	
var jselectv = document.getElementById('selectvariable');
var jtxtv = document.getElementById('txtvariablename');
	if(jselectv.value!="-----" && jtxtv.value!=""){
	    var type=jselectv.value.split(":");
        if (type[0].toString().toUpperCase()=="STRING"){  
		   var temp=type[0] + " " + jtxtv.value + " = \"" + "" + "\" ;\n";
		}else{
		   var temp=type[0] + " " + jtxtv.value + " = " + type[1] + " ;\n";
		}
		jselectv.options[0].selected; 
		jtxtv.value="";
	    setdatatocurrentcursor(temp);
		
	}else{
	   alert("Your input are empty.");
	}
}

function expressioneditorfocus(){
var frm = document.form1;
var jtxtsuggest = document.getElementById('txtsuggest');
var temp = "Create your expression in this area.\nEach of statement should be have ';' in the end of line.\n\nEx  XX=XX+1;\n     XX=(1+3)*2;";
temp=temp+"\n\nEx  if(x==1){\n       a=a+1; \n     }";
jtxtsuggest.value=temp;
}


function setdatatocurrentcursor(msg){
var jexpeditor = document.getElementById('expeditor');
jexpeditor.focus();
sel = document.selection.createRange();
sel.text = msg;
}

function Selectionfocus(){
var frm = document.form1;
var jtxtsuggest = document.getElementById('txtsuggest');
var temp = "Create if-else condition\n\nEx\nif (x==1){\n       a=a+1;\n}elseif(a==2 && a!=0){\n       b=(1+2)*3;\n}else{\n       a=0;\n}";
jtxtsuggest.value=temp;
}

function iterationfocus(){
var frm = document.form1;
var jtxtsuggest = document.getElementById('txtsuggest');
var temp = "Create iteration loop\nEx\ndo{\n       a=a+1;\n}while(a<=10);\n\nEx\nwhile ( a<10 ){\n       a=a+1;\n}";
jtxtsuggest.value=temp;
}

function setdatatocurrentcursor(msg){
var jexpeditor = document.getElementById('expeditor');
jexpeditor.focus();
sel = document.selection.createRange();
sel.text = msg;
}

function clickaddparametic(){
var jparainput = document.getElementById('parainput');
var type=jparainput.value.split(":");

	if (jparainput.value!="-----"){
		setdatatocurrentcursor(type[0]);
	}else{
		alert("Your input are empty.");
	}
}

function clickaddselection(){
var jselectcon = document.getElementById('selectcondition');
var temp="";    
	if (jselectcon.value!="-----"){
	    if(jselectcon.value.toUpperCase()=="IF"){
		     temp=temp+"if (   ) {\n\n\n}\n";			
		}else if (jselectcon.value.toUpperCase()=="IF-ELSE"){		    
		     temp=temp+"if (   ) {\n\n\n";			
			 temp=temp+"}else{\n\n\n}\n";		
		}else if (jselectcon.value.toUpperCase()=="IF-ELSEIF-ELSE") {
		     temp=temp+"if (   ) {\n\n\n";			
			 temp=temp+"}else if (   ){\n\n\n";
 			 temp=temp+"}else{\n\n\n}\n";		
		} 
		setdatatocurrentcursor(temp);
	}else{
		alert("Your input are empty.");
	}
}

function clickadditeration(){
var jadditeration = document.getElementById('selectiterationloop');
var temp="";    
	if (jadditeration.value!="-----"){
	    if(jadditeration.value.toUpperCase()=="DO-WHILE"){
		     temp=temp+"do{\n\n\n}while(  );\n";			
		}else if (jadditeration.value.toUpperCase()=="WHILE-LOOP"){		    
		     temp=temp+"while (   ) {\n\n\n";			
			 temp=temp+"}\n";		
		}
		setdatatocurrentcursor(temp);
	}else{
		alert("Your input are empty.");
	}
}

function clickaddoutput(){	
var jtxtoutputlist = document.getElementById('txtoutputlist');
var numcount=0;
var temp="";
var chk=true;
numcount=0;

do{
    temp="sysoutput"+numcount;
	chk=false;
	for(i=1; i<jtxtoutputlist.length; i++)  {
		if(jtxtoutputlist.options[i].text==temp){
			chk=true;
		 }   
	}
	if (chk==true){numcount=numcount+1;}
}while (chk!=false);


oOption = document.createElement("OPTION");
jtxtoutputlist.options.add(oOption);
oOption.text = "sysoutput"+numcount;
oOption.value = "sysoutput"+numcount;	
}

function clickremoveoutput(){
	
var frm = document.form1;
var jtxtoutputlist = document.getElementById('txtoutputlist');

	if (jtxtoutputlist.selectedIndex!=-1 && jtxtoutputlist.selectedIndex!=0){
		jtxtoutputlist.remove(jtxtoutputlist.selectedIndex);		
	}else{
	   alert("Please be select output as you would like to remove.");
	}
}

function clickaddoutputtoexp(){
var jtxtoutputlist= document.getElementById('txtoutputlist');    
    if (jtxtoutputlist.selectedIndex!=-1 && jtxtoutputlist.selectedIndex!=0){
		setdatatocurrentcursor(jtxtoutputlist.options[jtxtoutputlist.selectedIndex].text);	
	}else{
	   alert("Please be select output as you would like to add to expression.");
	}	
}

function checkExpression(){
var frm = document.form1;
var jinputlist= document.getElementById('inputlist');
var joutputlist= document.getElementById('outputlist');
var jleft= document.getElementById('left');
var jexpeditor= document.getElementById('expeditor');
var jtxtoutputlist= document.getElementById('txtoutputlist');
if (jtxtoutputlist.length>1 ) {
		var temp="";
		for(i=1; i<jtxtoutputlist.length; i++)  {
			temp=temp+","+jtxtoutputlist.options[i].text; 
		}
		joutputlist.value=temp.substr(1,temp.lenght);
		
		temp="";
		for(i=1; i<jleft.length; i++)  {
			temp=temp+","+jleft.options[i].text	;	 
		}
		jinputlist.value=temp.substr(1,temp.lenght);
		
		frm.action="testcode_assurance_expressionbuilder_process.jsp";	
		frm.submit();		
}else{
    alert("Can not check expression , Please verify your expression and output as you would like to return.");
}		
}

function editorpresskey(oEvent){
   if(oEvent.keyCode==13){
      setdatatocurrentcursor("\n");	  
   }    
}

function clicktestexpression(){
 var frm = document.form1;
var jinputlist= document.getElementById('inputlist');
var joutputlist= document.getElementById('outputlist');
var jleft= document.getElementById('left');
var jtxtoutputlist= document.getElementById('txtoutputlist');
 var temp="";
		for(i=1; i<jtxtoutputlist.length; i++)  {
			temp=temp+","+jtxtoutputlist.options[i].text; 
		}
		joutputlist.value=temp.substr(1,temp.lenght);
		
		temp="";
		for(i=1; i<jleft.length; i++)  {
			temp=temp+","+jleft.options[i].text	;	 
		}
		jinputlist.value=temp.substr(1,temp.lenght);
		
 frm.action="testcode_assurance_testexpression.jsp";	
 frm.submit();	
}


function clickcommitexpression(){
 var frm = document.form1;
var jinputlist= document.getElementById('inputlist');
var joutputlist= document.getElementById('outputlist');
var jleft= document.getElementById('left');
var jtxtoutputlist= document.getElementById('txtoutputlist');
var jcriterkeywordselect= document.getElementById('criterkeywordselect');

var temp="";
    if(jcriterkeywordselect.value!="not select"){
	   if(confirm("Confirmation?")){ 		  
			for(i=1; i<jtxtoutputlist.length; i++)  {
				temp=temp+","+jtxtoutputlist.options[i].text; 
			}
			joutputlist.value=temp.substr(1,temp.lenght);
			
			temp="";
			for(i=1; i<jleft.length; i++)  {
				temp=temp+","+jleft.options[i].text	;	 
			}
			jinputlist.value=temp.substr(1,temp.lenght);
			
		   frm.action="testcode_assurance_inputexpression.jsp";	
		   frm.submit();	
	   }
   }else{
       alert("Please select criteria keyword.");
   }
}

function clickcancel(){
var jsubmitflag= document.getElementById('flag');
var jexpeditor= document.getElementById('expeditor');
var jcompileflag = document.getElementById('compileflag');
var jaddexpflag = document.getElementById('addexpflag');

jcompileflag.value="n";
if(jaddexpflag=="y"){jexpeditor.value="";}
var frm = document.form1;
jsubmitflag.value="cancel";
frm.action = "testcode_assurance_inputexpression.jsp";	 
frm.submit();
}

function mainkeywordselection(){
var jcriterkeywordselect = document.getElementById('criterkeywordselect');
var jmainkeyword = document.getElementById('mainkeyword');
var jcompileflag = document.getElementById('compileflag');
var jright = document.getElementById('right');   
var jexpeditor = document.getElementById('expeditor');  
var jtxtoutputlist = document.getElementById('txtoutputlist'); 
 

	if (jcriterkeywordselect.value!="not select"){
		jcompileflag.value="n";
		var frm = document.form1;
		var tmp=jcriterkeywordselect.value.split("::");
		jmainkeyword.value=tmp[1];
		jexpeditor.value="";
		jtxtoutputlist.value="";
		frm.action = "testcode_assurance_expressionbuilder.jsp";	 
		frm.submit();
	}else{
	     var varnum=jright.length;		  
		  for(i=1; i<varnum; i++)  {	       
		   jright.remove(1);
	      } 
	}
}

function dblclickparametric(){

var jleft = document.getElementById('left');  
	if(jleft.selectedIndex!=(-1)){
	   var txtselect=jleft.options[jleft.selectedIndex].text; 
	   var tmp=txtselect.split(":");
	   setdatatocurrentcursor(tmp[0]);
	}
}

function addnewkeyword(){
var jmainkeyword = document.getElementById('mainkeyword');
jmainkeyword.value="";
var frm = document.form1;
frm.action = "testcode_assurance_addexpressionkeyword.jsp";	 
frm.submit();
	
}

function editnewkeyword(){
var jaddkeywordflag = document.getElementById('addkeywordflag');
var jcriterkeywordselect = document.getElementById('criterkeywordselect');
var frm = document.form1;
if(jcriterkeywordselect.value!="not select"){
	jaddkeywordflag.value="edit";
	frm.action = "testcode_assurance_editexpressionkeyword_process.jsp";	 
	frm.submit();
}else{
    alert("Please select criteria keyword.");
}	
}
</script>