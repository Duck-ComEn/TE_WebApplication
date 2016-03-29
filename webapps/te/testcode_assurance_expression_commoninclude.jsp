<%
String datadate ="";
if (request.getParameter("datadate")!=null){datadate =request.getParameter("datadate").trim().toUpperCase();  }

String product ="";
if (request.getParameter("product")!=null){product =request.getParameter("product").trim().toUpperCase();  }	
									
String process ="";
if (request.getParameter("process")!=null){process =request.getParameter("process").trim().toUpperCase();  }																	
									
String trialid ="";
if (request.getParameter("trialid")!=null){trialid =request.getParameter("trialid").trim().toUpperCase();  }
									
String hddsn ="";
if (request.getParameter("hddsn")!=null){hddsn =request.getParameter("hddsn").trim().toUpperCase();  }

String userproduct ="";
if (request.getParameter("userproduct")!=null){userproduct =request.getParameter("userproduct").trim().toUpperCase();  }

String addexpflag ="";
if (request.getParameter("addexpflag")!=null){addexpflag =request.getParameter("addexpflag").trim();  }

String preexpname ="";
if (request.getParameter("preexpname")!=null){preexpname =request.getParameter("preexpname").trim().toUpperCase();  }			

String compileflag ="n";
if (request.getParameter("compileflag")!=null){compileflag =request.getParameter("compileflag").trim(); }

%>

<input type="hidden" name="datadate" value="<%=datadate%>" />
<input type="hidden" name="process" value="<%=process%>"/> 
<input type="hidden" name="product" value="<%=product%>"/>                                    
<input type="hidden" name="trialid" value="<%=trialid%>"/>
<input type="hidden" name="hddsn" value="<%=hddsn%>"/>
<input type="hidden" name="userproduct" value="<%=userproduct%>"/>
<input type="hidden" name="addexpflag" value="<%=addexpflag%>"/>
<input type="hidden" name="preexpname" value="<%=preexpname%>"/>
<input type="hidden" name="compileflag" value="<%=compileflag%>">
		

                                   

