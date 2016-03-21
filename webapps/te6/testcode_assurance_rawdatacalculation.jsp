<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>

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
<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function clickselectexpression(){

var frm = document.form1;
frm.action = "testcode_assurance_selectexpression.jsp";	 
frm.submit();
}

function clickgetrawdata(){

var frm = document.form1;
frm.action = "testcode_assurance.jsp";	 
frm.submit();
}

function clickshowcal(sn){
var jselectsn = document.getElementById('selectsn');
jselectsn.value=sn;
var frm = document.form1;
frm.action = "testcode_assurance_showfilecalculation.jsp";	 
frm.submit();

}


</script> 
</head>

<body>
<%String menumode="testcode_assurance_rawdatacalculation.jsp";%> 
<%@ include file="PageLayout/testcode_hometoplayout.jsp" %>
<table width="98%" 
      border="0" align="center" cellpadding="5" cellspacing="3" class="form-noindent">
  <tbody>
    <tr> 
      <td height="302" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
	                              <%
								    
									String datadate =request.getParameter("datadate").toUpperCase(); 
									String process =request.getParameter("process").toUpperCase(); 
									String product =request.getParameter("userproduct").toUpperCase(); 
									String trialid =request.getParameter("trialid").toUpperCase();
									String hddsn =request.getParameter("hddsn").toUpperCase(); 
									String errmsg =request.getParameter("errmsg");
									String pagenumber=request.getParameter("pagenum");
									
									String huserselectlist ="";
                                    if (request.getParameter("huserselectlist")!=null){huserselectlist =request.getParameter("huserselectlist").trim();  }	

									%>
                                  <input type="hidden" name="datadate" value="<%=datadate%>" />
                                  <input type="hidden" name="process" value="<%=process%>"/>
                                  <input type="hidden" name="userproduct" value="<%=product%>"/>
                                  <input type="hidden" name="trialid" value="<%=trialid%>"/>
                                  <input type="hidden" name="hddsn" value="<%=hddsn%>"/>
								  <input type="hidden" name="huserselectlist" value="<%=huserselectlist%>"/>
								  <input type="hidden" name="selectsn"/>
                                 
          <table width="100%" height="281" border="0">
            <tr> 
              <td width="100%" height="21" align="left"><p><span class="style1">Test 
                  Code Assurance :: Rawdata Calculation</span></p></td>
            </tr>
            <tr align="left" valign="top"> 
              <td height="71"><table width="100%" height="137" border="0">
                  <tr> 
                    <td width="2%" height="133">&nbsp;</td>
                    <td width="96%" align="left" valign="top"><fieldset>
                      <legend>Information</legend>
                      <table width="100%" border="0">
                        <tr> 
                          <td width="35%" height="108" align="left" valign="top"><fieldset>
                            <legend>Rawdata</legend>
                            <table width="100%" border="0" cellpadding="2">
                              <tr> 
                                <td height="54"><table width="100%" border="0">
                                    <tr> 
                                      <td width="54%" height="46"> <div align="center"> 
                                          <table width="100%" border="0">
                                            <tr> 
                                              <td width="46%" align="right"><font size="-1"><strong>End 
                                                Date :</strong> 
                                                <label></label>
                                                </font></td>
                                              <td width="54%" align="left"> <font size="-1"><em> 
                                                <%  
									     if(datadate.equals("NOTSELECT")){ datadate="";}
										 
									  %>
                                                <font color="#0000FF"> 
                                                <%=datadate%>
                                                </font> </em> </font> <div align="left"></div></td>
                                            </tr>
                                            <tr> 
                                              <td align="right"><font size="-1"><strong>Process 
                                                :</strong></font></td>
                                              <td align="left"><em> <font size="-1" color="#0000FF"> 
                                                <%=process%>
                                                </font></em></td>
                                            </tr>
                                          </table>
                                        </div></td>
                                      <td width="46%"> <div align="center"> 
                                          <table width="100%" border="0">
                                            <tr> 
                                              <td width="42%" height="21" align="right"><font size="-1"><strong>Product 
                                                :</strong></font></td>
                                              <td width="58%" align="left"> <font size="-1"><em> 
                                                <font color="#0000FF"> 
                                                <%=product%>
                                                </font> </em> </font> <div align="left"></div></td>
                                            </tr>
                                            <tr> 
                                              <td height="21" align="right"><font size="-1"><strong>Trial 
                                                ID : </strong></font></td>
                                              <td align="left"><em> <font size="-1" color="#0000FF"> 
                                                <%=trialid%>
                                                </font></em></td>
                                            </tr>
                                          </table>
                                        </div></td>
                                    </tr>
                                  </table>
                                  <table width="100%" border="0">
                                    <tr> 
                                      <td width="25%" height="21" align="right"><font size="-1"><strong>HDD 
                                        SN :</strong> 
                                        <label></label>
                                        </font></td>
                                      <td width="75%" align="left"> <font size="-1"><em> 
                                        <font color="#0000FF"> 
                                        <%=hddsn%>
                                        </font></em> </font> <div align="left"></div></td>
                                    </tr>
                                  </table></td>
                              </tr>
                            </table>
                            </fieldset></td>
                          <td width="65%" valign="top"> <div align="left">
                              <fieldset>
                              <legend>Expression List</legend>
                              <table width="100%" border="0" cellpadding="2">
                                <tr> 
                                  <td width="18%"><div align="right"><font size="-1"><strong>Expression 
                                      : </strong></font></div></td>
                                  <td width="82%"><font size="-1" color="#0000FF"> 
                                    <%=huserselectlist%>
                                    </font></td>
                                </tr>
                              </table>                                                     
                              </fieldset>
							  
							  <fieldset>
							      <legend>Controller</legend>
                              <table width="100%" border="0" cellpadding="2">
                                <tr> 
                                  <td width="13%">&nbsp;</td>
                                  <td width="87%"> <p>
                                      <input name="buttGetRawdata" type="button" id="buttGetRawdata" value="Get Rawdata" onclick="clickgetrawdata();" />
                                      <input name="buttselectexp" type="button" id="buttselectexp" value="Select Expression" onclick="clickselectexpression();" />
                                    </p>
                                    </td>
                                </tr>
                              </table>
                              </fieldset>
                            </div></td>
                        </tr>
                      </table>
                      </fieldset></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
            <tr valign="top"> 
              <td height="181">
			  
			  <fieldset>
                <legend>Calculation Result</legend>
                <%
				   HashMap endresult = (HashMap)session.getAttribute(session.getAttribute("s_username")+"_tca_rawdatacalculationobject");
				    
                   String criterialist[]=huserselectlist.split(",");
				   int criterianum=	criterialist.length;
				   
    		        Object objhm[]= endresult.values().toArray();
					//HashMap hmrd=rd.getCirterialist(); // Get Criteria List
					//int criterianum=hmrd.size();
				%>
                <div align="center"> 
                  <table width="100%" border="0" cellpadding="0" cellspacing="2" bordercolor="#333333">
                    <tr>
					  <td  width="2%" bgcolor="#333333"><div align="center"><font color="#FFFFFF" size="-1"><strong>No.</strong></font></div></td> 
                      <td  width="6%" bgcolor="#333333"><div align="center"><font color="#FFFFFF" size="-1"><strong>HDDSN</strong></font></div></td>
                      <td width="6%"  bgcolor="#333333"><div align="center"><font color="#FFFFFF" size="-1"><strong>STDID</strong></font></div></td>                      
                      
                      <td  width="6%" bgcolor="#333333"><div align="center"><strong><font color="#FFFFFF" size="-1">PFCODE</font></strong></div></td>
                      <%					     
						for(int ci=0;ci<criterialist.length;ci++){
					  %>
                      <td width="16%"  bgcolor="#333333"><div align="center"><strong><font color="#FFFFFF" size="-1"> 
                          <%=criterialist[ci]%>
                          </font></strong></div></td>
                      <%
					    }
					  %>
                      <td width="16%"  bgcolor="#333333"><div align="center"><font color="#FFFFFF" size="-1"><strong>ERROR MSG</strong></font></div></td>
					  
                    </tr>
                    <%			           
            
						for(int i=0;i<objhm.length;i++){
						   Rawdata rd=(Rawdata)objhm[i];
						   String rderrmsg=rd.getErrmsg();
						   String linecolor="CCCCCC";
						   int headnum=rd.getHeadnum();
						   if(rderrmsg.equals("")==false){linecolor="DF6666";}
						    %>
							
                    <tr bgcolor="#<%=linecolor%>"> 
					  <td width="2%"><font size="-1" color="#0000FF"><strong><%=(i+1)%></strong></font></td> 
                      <td  onclick="clickshowcal('<%=rd.getUnitsn()%>');" title="Click show all detail">
					  <table  border="0" cellspacing="0" cellpadding="0">
                          <tr>
						    
                            <td ><div align="center"><img src="DATA-INF/Image/bulleticon/hdd_bullet.jpg" width="26" height="24" border="1" onclick="clickshowcal('<%=rd.getUnitsn()%>');" /></div></td>
                            <td ><div align="center"><font  color="#0000FF"><strong> <%=rd.getUnitsn()%></strong></font></div></td>
                          </tr>
                        </table>                      
					  </td>
					  					   
                      <td width="6%"><font size="-1" color="#0000FF"><strong><%=rd.getUnitstdid()%></strong></font></td>                     
                      <%
					    String rwjudcolor="00FF00";
					    if (rd.getPfstatus().toUpperCase().equals("PASS")==false){
						     rwjudcolor="FF0000";
						}
					  %>
                      <td width="6%" bgcolor="<%=rwjudcolor%>">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td><div align="center"><font size="-1" color="#0000FF"><strong><%=rd.getPfstatus()%></strong></font></div></td>
                          </tr>
                          <tr>
                            <td><div align="center"><font size="-1" color="#0000FF"><strong><%=rd.getPfcode()%></strong></font></div></td>
                          </tr>
                        </table></td>
                      <%
							  HashMap hmrd=rd.getCirterialist();
							  if(hmrd!=null){
								//Object obj[]= hmrd.values().toArray();
								
											     
						        for(int ci=0;ci<criterialist.length;ci++){								  
								  %><td><%
								   for (int ci2=0;ci2<headnum;ci2++){
								   CriteriaResult cresult=(CriteriaResult)hmrd.get(criterialist[ci]+ci2);			  
								    //out.print(criterialist[ci]+ci2+" :::: "+cresult);
									%>
									<!-- --------------------------------------------------------------------------------------------- -->
									<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#999999">
									  <tr> 
										<td width="26%"  bgcolor="#999999"> <div align="center"> <strong> 
											<font color="#FFFFFF" size="-2">H <%=cresult.getCriteriaHeadNum()%></font> </strong> </div>
										</td>
										
										<td width="74%" align="center" valign="top"> <div align="center">
                                <table  width="100%"  border="1" cellpadding="0" cellspacing="0">
                                  <tr> 
                                    <%
									 HashMap output=(HashMap)cresult.getCriteriaResult();
									 //out.print(" :::: "+output);
									  if(output!=null){
										  for (int ci3=0;ci3<output.size();ci3++){
												//out.print(" :::: "+output);
												String outputresult=output.get(String.valueOf(ci3)).toString();
												String resultcolor="FFFFFF";
															
												if (outputresult.toLowerCase().indexOf("fail")>(-1)){
												   resultcolor="FF0000";
												}else if (outputresult.toLowerCase().indexOf("pass")>(-1)){
												   resultcolor="00FF00";
												}
										%>
												<td  width="48%" bgcolor="#<%=resultcolor%>"><div align="center" ><font size="-2" color="#0000FF"><strong>
												<%=output.get(String.valueOf(ci3))%>
												</strong></font></div></td>
													<%
										   } //for
										}else{												
										  String strnull="--null--"; 
										  String err=cresult.getMsgerr().trim();
										  String errcolor="aaaaaa";
										  if(err.equals("")==false){
										       strnull=err;
											   errcolor="FF0000";
										  }
									 %>
                                    <td width="52%"><div align="center"><font size="-2"><em><font color="#<%=errcolor%>"><strong><%=strnull%></strong></font></em></font></div></td>
                                    <%}%>
                                  </tr>
                                </table>
                              </div></td>
									  </tr>
									</table>
                                  <!-- --------------------------------------------------------------------------------------------- -->
									<%
								   }
								   %></td><%
						        }								
								%>
							  
							  <%
							   }else{
							      for(int ci=0;ci<criterialist.length;ci++){			
							   %>							   
                                   <td>&nbsp; </td>
                               <% }
							    }
							 %>
                      <td width="4%"><font size="-1"> 
                        <%=rd.getErrmsg()%>
                        </font></td>
						
						
                      
                    </tr>
                    <%
							MonitorLog.setLog("5 --> End Show Result to web","");		
							//out.println("SN: "+rd.getUnitsn()+"\n");
							//out.println("STDID: "+rd.getUnitstdid()+"\n");
							//out.println("PFCODE: "+rd.getPfcode()+"\n");
							//out.println("PFStatus: "+rd.getPfstatus()+"\n");
							//out.println("Head Num: "+rd.getHeadnum()+"\n");
							//out.println("File Name: "+rd.getTxtfilename()+"\n");
							//out.println("Err MSG: "+rd.getErrmsg()+"\n");
							/*HashMap hmrd=rd.getCirterialist();
							
							if(hmrd!=null){
								Object obj[]= hmrd.values().toArray();
								
								for(int j=0;j<obj.length;j++){
									CriteriaResult cresult=(CriteriaResult) obj[j];
									out.println("   Criteria Name : "+cresult.getCriteriaName()+"\n");
									out.println("   Criteria Keyword : "+cresult.getCriteriaKeyword()+"\n");
									out.println("   Criteria Result : "+cresult.getCriteriaResult()+"\n");
									out.println("   Criteria Msg Err : "+cresult.getMsgerr()+"\n");
									out.println("   Criteria Head Num : "+cresult.getCriteriaHeadNum()+"\n");
									HashMap para=cresult.getParaValueList();
									
									
									if(para!=null){
										Object objpara[]= para.values().toArray();
										for(int k=0;k<objpara.length;k++){
											ParametricResult presult=(ParametricResult)objpara[k];
											out.println("      Para Name : "+presult.getParaname()+"\n");
											out.println("      Para Type : "+presult.getParatype()+"\n");
											out.println("      Para Value : "+presult.getValue()+"\n");
										}
									}
								}
							}*/
						}
			       %>
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


