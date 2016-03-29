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
<%String menumode="testcode_assurance_showfilecalculation.jsp";%> 
<%@ include file="PageLayout/testcode_hometoplayout.jsp" %>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="3" class="form-noindent">
  <tbody>
    <tr> 
      <td height="218" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center">	  
	    <form action="" method="post" name="form1" target="_parent" id="form1">
	    <%
	    String datadate ="";
        if (request.getParameter("datadate")!=null){datadate =request.getParameter("datadate").trim();  }	
									
	    String process ="";
        if (request.getParameter("process")!=null){process =request.getParameter("process").trim();  }	
									
    	String product ="";
        if (request.getParameter("userproduct")!=null){product =request.getParameter("userproduct").trim();  }	

		String trialid ="";
        if (request.getParameter("trialid")!=null){trialid =request.getParameter("trialid").trim();  }	
									
		String hddsn ="";
        if (request.getParameter("hddsn")!=null){hddsn =request.getParameter("hddsn").trim();  }																	
									
        String huserselectlist ="";
        if (request.getParameter("huserselectlist")!=null){huserselectlist =request.getParameter("huserselectlist").trim();  }	
									
	    String selectsn ="";
        if (request.getParameter("selectsn")!=null){selectsn =request.getParameter("selectsn").trim();  }	
	    
		%>
        <input type="hidden" name="datadate" value="<%=datadate%>" />
        <input type="hidden" name="process" value="<%=process%>"/>
        <input type="hidden" name="userproduct" value="<%=product%>"/>
        <input type="hidden" name="trialid" value="<%=trialid%>"/>
        <input type="hidden" name="hddsn" value="<%=hddsn%>"/>
        <input type="hidden" name="huserselectlist" value="<%=huserselectlist%>"/>
                                 
        <table width="100%" height="189" border="0">
            <tr> 
              <td width="100%" height="21" align="left"><p><span class="style1">Test Code Assurance :: Detail Calculation for <%=selectsn%></span></p></td>
            </tr>
            <tr align="left" valign="top"> 
              <td height="71"><table width="100%" height="409" border="0">
                  <tr> 
                    <td width="2%" height="405">&nbsp;</td>
                    <td width="96%" align="left" valign="top">
					<fieldset>
                      <legend>Detail</legend>
                      <%
					     HashMap endresult = (HashMap)session.getAttribute(session.getAttribute("s_username")+"_tca_rawdatacalculationobject");				
							
						 Rawdata rd=(Rawdata)endresult.get(selectsn);							
						 HashMap hmrd=rd.getCirterialist();								 
					  %>
                      <table width="100%" border="0" cellpadding="2">
                        <tr> 
                          <td width="2%" align="left" valign="top"></td>
                          <td width="21%" align="left" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td><div align="center"><img  src="DATA-INF/Image/bulleticon/HDD2.jpg" width="235" height="205" border="3" /></div></td>
                              </tr>
                              <tr> 
                                <td><div align="center">&nbsp;</div></td>
                              </tr>
                              <tr> 
                                <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
                                    <tr> 
                                      <td width="55%" bgcolor="#333333"><div align="right"><font color="#FFFFFF"><strong>STDID 
                                          :</strong></font></div></td>
                                      <td width="45%"> <div align="center"> <strong> 
                                          <%=rd.getUnitstdid()%>
                                          </strong></div></td>
                                    </tr>
                                    <tr> 
                                      <td bgcolor="#333333"><div align="right"><font color="#FFFFFF"><strong>PFCode 
                                          :</strong></font></div></td>
                                      <td> <div align="center"> <strong> 
                                          <%=rd.getPfcode()%>
                                          </strong></div></td>
                                    </tr>
                                    <tr> 
                                      <td bgcolor="#333333"><div align="right"><font color="#FFFFFF"><strong>Judgement 
                                          :</strong></font></div></td>
                                      <td> <div align="center"> <strong> 
                                          <%=rd.getPfstatus()%>
                                          </strong></div></td>
                                    </tr>
                                    <tr> 
                                      <td bgcolor="#333333"><div align="right"><font color="#FFFFFF"><strong>Head 
                                          Number :</strong></font></div></td>
                                      <td> <div align="center"> <strong> 
                                          <%
									 int numhead=rd.getHeadnum();
									%>
                                          <%=numhead%>
                                          </strong></div>
                                        <div align="center"></div></td>
                                    </tr>
                                    <tr> 
                                      <td bgcolor="#333333"><div align="right"><font color="#FFFFFF"><strong>File 
                                          Name :</strong></font></div></td>
                                      <td> <div align="center"> <strong> 
                                          <%=rd.getTxtfilename()%>
                                          </strong></div>
                                        <div align="center"></div></td>
                                    </tr>
                                    <%
							     String calrawerr=rd.getErrmsg();
							     if (calrawerr.equals("")==false){
							  %>
                                    <tr> 
                                      <td bgcolor="#333333"><div align="right"><font color="#FFFFFF"><strong>Error 
                                          Msg :</strong></font></div></td>
                                      <td><div align="center"> <strong> 
                                          <%=calrawerr%>
                                          </strong></div></td>
                                    </tr>
                                    <%
                                 }else{
                              %>
                                    <%}%>
                                  </table></td>
                              </tr>
                            </table></td>
                          <td width="77%"> 
                            <!-- -----------------------------------how Parametric with criteria-------------------------------------------------- -->
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td> 
								<!-- ---------------------------------Data Table---------------------------------------------------- -->
								      <table width="100%" border="0" cellpadding="0" cellspacing="0">
									  <%
									      
										 if(hmrd!=null){						
											// out.print("Test...");		 
											// out.print("hmrd :: "+hmrd)	;	
											// out.print("huserselectlist :: "+huserselectlist)	;			
											String criterialist[]=huserselectlist.split(",");
											for(int j=0;j<criterialist.length;j++){
											 // out.print("criterialist :: "+criterialist[j])	;	
										     %>
											 
												<tr> 
												  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
													  <tr> 
														<td width="31%"> <table width="93%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
															<tr> 
															  <td bgcolor="#0000FF"><div align="center"><strong><font color="#FFFFFF" size="+1"> <%=criterialist[j]%></font></strong></div></td>
															</tr>
														  </table></td>
														<td width="69%">&nbsp;</td>
													  </tr>
													</table>
												  </td>
												</tr>
												
												
												
												<tr> 
												  <td><table width="100%" border="2" cellpadding="0" cellspacing="0" bordercolor="#999999">
													  <%									
												  for(int k=0;k<numhead;k++){
												  //CriteriaResult cresult=(CriteriaResult)obj[j];
												  CriteriaResult cresult=(CriteriaResult)hmrd.get(criterialist[j]+k);
												   ///out.print("cresult :: "+cresult)	;	
												  %>
													  <tr> 
													  
														<td width="14%"  bgcolor="#333333"><div align="center"><font size="+1" color="#FFFFFF"><strong>Head <%=cresult.getCriteriaHeadNum()%></strong></font></div></td>														
														<td width="35%" bgcolor="#333333"> 
														  <div align="center"> 
															<!-- ---------------Show Result----------------------------- -->
															  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
																  <%
																	 HashMap hr=cresult.getCriteriaResult();	
																	 String resultcolor="FFFFFF";				
																	 if(hr!=null){												 
																		 
																											  
																		 for(int r=0;r<hr.size();r++){ 
																			 String outputresult=hr.get(String.valueOf(r)).toString();																			
																			 if (outputresult.toLowerCase().indexOf("fail")>(-1)){
																				   resultcolor="FF0000";
																			 }else if (outputresult.toLowerCase().indexOf("pass")>(-1)){
																				   resultcolor="00FF00";
																			 }
																   %>
																			  <tr> 
																				<td width="40%" bgcolor="#666666"><font size="3"><strong><font color="#FFFFFF">Output <%=(r+1)%> :</font></strong></font></td>													
																				<td width="60%" bgcolor="#<%=resultcolor%>"><font size="3" color="#000000"><%=outputresult%></font></td>
																			  </tr>
																  <%
																		 } //for hr
																     }else{ // if hr	
																	   String msg="--null--";
																	   if (cresult.getMsgerr().equals("")==false){msg=cresult.getMsgerr();}
																  %>
																         <tr>																	   
                                                                           <td width="40%" bgcolor="#666666"><font size="3"><strong><font color="#FFFFFF">Output :</font></strong></font></td>													
																		   <td width="60%" bgcolor="#<%=resultcolor%>"><font size="2" color="#FF0000"><em><%=msg%></em></font></td>
																		 </tr>
																  <%		      																       
																     } // if hr																 
																  %>
																</table>
															
															<!-- ---------------End Show Result----------------------------- -->
														  </div>
														 </td>
														
														   <!-- ------------------------------Show Para Reuslt-------------------------------- -->
														
														       <td width="51%" bgcolor="#333333" align="center">                                             
																	<table width="100%" height="100%" border="1" bordercolor="#333333"   cellpadding="0" cellspacing="0">
																	  <%
																	HashMap para=cresult.getParaValueList();    
																	//out.print("para :: "+para)	;	                   
																	if(para!=null){
																		Object objpara[]= para.values().toArray();
																		for(int l=0;l<objpara.length;l++){
																			ParametricResult presult=(ParametricResult)objpara[l];														
																   %>
																	  <tr> 
																		<td width="44%" bgcolor="#666666"><div align="right"><font color="#FFFFFF" size="2"> 
																			<strong> 
																			<%=presult.getParaname()%>
																			:</strong></font></div></td>
																		<td width="28%" bgcolor="#FFFFFF"><div align="center"> 
																			<font size="2"> 
																			<%=presult.getValue()%>
																			</font></div></td>
																		<td width="28%" bgcolor="#666666"><div align="center"><font color="#FFFFFF" size="2"> 
																			<%=presult.getParatype()%>
																			</font></div></td>
																	  </tr>
																	  <%
																	  } // for para
																	} // if para
																	%>
																	</table>
															  </td>
														
														
														
														
														
														
														  <!-- -------------------------------Show Para Result------------------------------- -->
														
													  </tr>
													  <%										
												}	// head number				 
											   %>
													</table></td>
												</tr>
												<tr> 
												  <td>&nbsp;</td>
												</tr>
											  
											  <%
													   }
											   }
											 %>
											 </table>
											</td>
										  </tr>
										</table>
									   <!-- --------------------------------------Data Table----------------------------------------------- -->							
                                </td>
                              </tr>
                            </table>
						  <!-- ----------------------------------------Show Parametric with criteria--------------------------------------------- -->	
                      </fieldset></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>            
          </table>
        </form>
	  </td>
    </tr>
  </tbody>
</table>
<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function clickselectexpression(){
var frm = document.form1;
frm.action = "testcode_assurance_filedetail.jsp";	 
frm.submit();

}

function clickgetrawdata(){
var frm = document.form1;
frm.action = "testcode_assurance.jsp";	 
frm.submit();

}




</script>
