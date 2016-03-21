<%@ include file="session.jsp"%>
<%@ page language="java"%>
<%@ page pageEncoding="TIS-620"%>
<%@ page import="java.util.*"%>
<%@ page import="javazoom.upload.*"%>
<%@ page import="com.hitachigst.prb.itd.fastrework.common.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import="com.hitachigst.prb.itd.webservices.common.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.datamaintain.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.datamaintain.DataMainTainFieldInfo"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			String version = "";
			String webname = "";
			webname = IniFilesReader.getReturnProperties("Local.Application",
					"Application Name");
			version = FastReworkVersionControl.getVersion();
		%>


		<%

		  String mainatainselect=request.getParameter("datamaintain"); 
          String editDataStr=request.getParameter("editData"); 
		  String[] editData=editDataStr.split("~~");
		 
		  
    	  DataMaintain dmaintain = new DataMaintainanceManager().getDataMaintain(mainatainselect.trim());	  
		  
		 
		%>

		<title>
			<%
			out.println(webname);
			%>
		</title>

		<link href="DATA-INF/CSS/1.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.form-noindent {	BORDER-RIGHT: #c3d9ff 1px solid; BORDER-TOP: #c3d9ff 1px solid; BORDER-LEFT: #c3d9ff 1px solid; BORDER-BOTTOM: #c3d9ff 1px solid; BACKGROUND-COLOR: #ffffff
}
.style1 {font-size: 16px;
	font-weight: bold;
}
.style2 {font-size: 12px; font-family: Tahoma; color: #000000;}
.style3 {font-family: Tahoma;
	font-weight: bold;
	font-size: 12px;
	color: #a97965;
}
.style3 {font-family: Tahoma;
	font-weight: bold;
	font-size: 12px;
	color: #FFFFFF;
}
-->
    </style>
	</head>

	<body>

		<div id="header">
			<div id="header-container">
				<p>
					Version :
					<%
				out.println(version);
				%>
					|
					<a href="#Top">Logon: <%
				out.println(session.getAttribute("s_username").toString().trim());
				%>
					</a>
					<br />
				</p>
				<img src="DATA-INF/Image/logo.jpg" alt="Your Logo" title="Your Logo" />
				<h1>
					<a name="Top" id="Top"></a><a href="#Top">
						<%
						out.println(webname);
						%> </a>
				</h1>
				<%@ include file="menu_managedata_process.jsp"%>
				<br class="clear" />
			</div>
		</div>
		<table width="100%" border="0">
			<tr>
				<td height="243" align="center" valign="top">
					<table class="form-noindent" cellspacing="3" cellpadding="5"
						width="50%" border="0">
						<tbody>
							<tr>
								<!-- <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap"
									bgcolor="#e8eefa">
									<form  method="post"
										enctype="multipart/form-data" name="form1"> -->
                                      <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form  method="post" name="form1" target="_parent" id="form1">				  

										<table width="100%" border="0">
											<tr>
												<td colspan="3" align="left">
													<span class="style1">Edit Data for <%out.println(dmaintain.getDataMaintainName());%></span>
												</td>
											</tr>
											<tr>
												<td colspan="3">&nbsp;
													
												</td>
											</tr>
											
											
	<%

       Vector fieldList = dmaintain.getFieldList();   	     
	   DataMainTainFieldInfo fieldInfo = null;
	   String jScript="";
	   String jScriptClear="";
	   String  nullable="";
	   String  valueType="";
	   boolean   hasChk=false;
	   String disableStr="";
	   String tagPK="<font size=\"1\"><strong><font color=\"#FF0000\">* PK</font></strong></font>";
  	
  	 for (int i = 0; i < fieldList.size(); i++) 
  	  { 		 
  		  fieldInfo = (DataMainTainFieldInfo) fieldList.get(i);	
		  String inputType = fieldInfo.getInputType();
		  disableStr=disableStr+"frm."+fieldInfo.getFieldName()+".disabled=false;";
       %>

       <tr>
		  <td width="35%" align="right">
		 	<span class="style2"><%out.print(fieldInfo.getFieldName());%> : </span>
		  </td>
		  <td colspan="2" align="left">
            <%
		      //---------------------- Check input type and create form ------------------------
		      if(inputType.equals("system")){
                  
					%> <label><input name="<%=fieldInfo.getFieldName()%>" type="text" id="Input<%=i%>" size="30" maxlength="<%=fieldInfo.getFieldLenght() %>" value="<%=editData[i]%>" disabled /></label><%

	          }else if(inputType.equals("typing")){
                  if (fieldInfo.getPrimaryKey().trim().toLowerCase().equals("y")) {
						%> <label><input disabled name="<%=fieldInfo.getFieldName()%>" type="text" id="Input<%=i%>" size="30"  maxlength="<%=fieldInfo.getFieldLenght()%>" value="<%=editData[i]%>" />
                      <%=tagPK%></label>
                      <% 
				  }else{
					  %> <label><input name="<%=fieldInfo.getFieldName()%>" type="text" id="Input<%=i%>" size="30" maxlength="<%=fieldInfo.getFieldLenght()%>" value="<%=editData[i]%>" /></label><% 
				  }
                 
				  jScriptClear=jScriptClear+"frm."+fieldInfo.getFieldName()+".value = \"\";"; 	  

			  }else if(inputType.equals("dropdown")){
				        String s="";
                        if (fieldInfo.getPrimaryKey().trim().toLowerCase().equals("y")) {
						     %><label><select disabled  name="<%=fieldInfo.getFieldName()%>"><%
							 s=tagPK;
						}else{
						     %><label><select name="<%=fieldInfo.getFieldName()%>"><%
						}
					   
					  if (fieldInfo.getInputInitialType().equals("default")){
							 String[] init=fieldInfo.getInputInitial().split(",");
                             for(int x=0;x<init.length;x++){
								 if (editData[i].equals(init[x])){
								    %><option selected value="<%=init[x]%>"><%=init[x]%></option><%
								 }else{
									%><option value="<%=init[x]%>"><%=init[x]%></option><%
								}
							 }
					  }else{
						%><select name="<%=fieldInfo.getFieldName()%>">
				             <option value="0">Disabled</option>
					         <option value="1" selected>Enabled</option>
				          </select>											
				        <%
					  }  
						 %></select><%=s%></label><%	
              }

			   //---------------------- Check value and create java script ------------------------
			    nullable=fieldInfo.getNullable().toLowerCase();
				valueType=fieldInfo.getValueType().toLowerCase();				
                hasChk=false;

			      if (nullable.equals("n") ){
				      jScript=jScript+"alertmsg= alertmsg+IsEmpty(jInput"+i+",\""+fieldInfo.getFieldName()+"\");";
                      hasChk=true;					    
				  }                  

				  if ((valueType.equals("integer") || valueType.equals("double")) && inputType.equals("typing")){
				     jScript=jScript+"alertmsg= alertmsg+IsNumeric(jInput"+i+",\""+fieldInfo.getFieldName()+"\");";
					 
					 hasChk=true;
				  }

				  if (hasChk==true){jScript="var jInput"+i+"=frm."+fieldInfo.getFieldName()+".value;" +jScript;}                
			%>
    	  </td>
	   </tr>

	   <%
      
  	 /* out.println(" Data Maintain : " + fieldInfo.getFieldName());
  	  out.println(" Data Maintain : " + fieldInfo.getValueType());
  	  out .println(" Data Maintain : " + fieldInfo.getFieldLenght());
  	  out.println(" Data Maintain : " + fieldInfo.getNullable());
  	  out.println(" Data Maintain : " + fieldInfo.getInputType());
  	  out.println(" Data Maintain : " +
  	  fieldInfo.getInputInitialType());
  	  out.println(" Data Maintain : " +  fieldInfo.getInputInitial()); 
  	  out.println(); */
	 
  	  }	 
	  String jScriptMain="<script language=\"JavaScript\">";
      jScriptMain=jScriptMain+"function clickSubmit(){";
	  jScriptMain=jScriptMain+"var frm = document.form1;";
	  jScriptMain=jScriptMain+disableStr;
	  jScriptMain=jScriptMain+"var alertmsg=\"\";";	  
	  jScriptMain=jScriptMain+jScript;
	  jScriptMain=jScriptMain+"if (alertmsg!=\"\")";
	  jScriptMain=jScriptMain+" {alert(alertmsg);  }";
	  jScriptMain=jScriptMain+"else{frm.action = \"datamaintain_process.jsp\";";   
	  jScriptMain=jScriptMain+"if(confirm(\"Confirmation?\")){frm.submit();}";
	  jScriptMain=jScriptMain+"}}";		
	  
     
	 jScriptMain=jScriptMain+"function clickCancel(){";
	 jScriptMain=jScriptMain+"var frm = document.form1;";
	 jScriptMain=jScriptMain+jScriptClear;			
	 jScriptMain=jScriptMain+"frm.action=\"datamaintain.jsp\";";
     jScriptMain=jScriptMain+"frm.submit();";
	 jScriptMain=jScriptMain+"}";	
	 jScriptMain=jScriptMain+"</script>";
	%> 
  
  <%=jScriptMain%>

										<tr>
												<td colspan="3">&nbsp;
													
												</td>
											</tr>
											<tr>
												<td align="center">&nbsp;
													
												</td>
												<td width="21%" align="left" valign="middle">
													<input name="Submit" type="button" id="Submit2"
														value="Save" onclick="clickSubmit()" />

														 <input name="datamaintain" type="hidden" id="datamaintain" 
														 value="<%=mainatainselect.trim()%>"  />
														 
														 <input name="maintainevent" type="hidden" id="maintainevent"  value="editdata"  />

														  <input name="beforeEdit" type="hidden" id="beforeEdit"  value="<%=editDataStr%>"  />
												</td>
												<td width="44%" align="left" valign="middle">
													<label>
														<input name="Cancel" type="button" id="Cancel2"
															value="Cancel" onclick="clickCancel()" />
													</label>
												</td>
											</tr>
											<tr>
												<td colspan="3">
													
												</td>
											</tr>
										</table>
									</form>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
		<div id="footer">
			<div id="footercontent">
				&copy; Hitachi Global Storage Techonologies (Thailand) Ltd.All
				rigths reserved
			</div>
		</div>

	</body>
</html>



<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

/*function clickSubmit(){

	
var frm = document.form1;
var alertmsg="";
var jInput1=frm.Input1.value;


if(jInput1 == "" || jInput1.length >50){
	alertmsg=alertmsg+"Invalid Input Location Definition \n"
}
	if(alertmsg != ""){
		alert(alertmsg);
	}else{
		frm.SubmitFlag.value = "submit";	
		frm.action = "datamaintain_add.jsp";	
		if(confirm("Confirmation?")){
			frm.submit();
		}
	}
}

function clickCancel(){	
	var frm = document.form1;	
	frm.Input1.value = "";
	
	frm.SubmitFlag.value="";
	//frm.action="register.jsp";
	//frm.submit();
	}
	
	<script language="JavaScript">

function clickSubmit(){	
var frm = document.form1;
var alertmsg="";

var jInput0=frm.Supplier_ID.value;
var jInput1=frm.Supplier_Name.value;


 alertmsg= alertmsg+IsEmpty(jInput0,"Supplier_ID");
 alertmsg= alertmsg+IsNumeric(jInput0,"Supplier_ID");
 alertmsg= alertmsg+IsEmpty(jInput1,"Supplier_Name");

	 if (alertmsg!="")
     {alert(alertmsg);  }
  
   
}
	*/

function IsNumeric(sText,filedName)
{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var alertmsg="";
   var Char;
 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   
   if (IsNumber==false)
	{
	   alertmsg="The " + filedName + " should be numeric.\n" ;	  
	}
	return alertmsg;    
}

function IsEmpty(sText,filedName){	
	var alertmsg=""; 
	  if (sText=="")
	  {         
          alertmsg="The " + filedName + " should not empty.\n" ;		  
	  }
	  return alertmsg;  
	}

</script>
