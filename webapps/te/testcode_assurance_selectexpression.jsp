<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>
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
 <%String menumode="testcode_assurance_selectexpression.jsp";%>	
		
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
  <table align="center" class="form-noindent" cellspacing="3" cellpadding="5" width="78%" 
      border="0">
    <tbody>
      <tr> 
        <td height="396" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form action="" method="post" name="form1" target="_parent" id="form1">
            <table width="100%" height="386" border="0">
			  <%@ include file="testcode_assurance_expression_commoninclude.jsp" %>	
              <tr> 
                <td colspan="3" align="left"><span class="style1">Test Code Assurance 
                  :: Select Expression</span></td>
              </tr>
              <tr> </tr>
              <tr> 
                <td height="275" colspan="3"><table width="100%" border="0">
                    <tr> 
                      <td width="3%">&nbsp;</td>
                      <td width="95%"><div align="left"><em> Please be select 
                          expression list as you would like to calculation.</em></div></td>
                      <td width="2%">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="100%" height="304" border="0">
                    <tr> 
                      <td width="2%" height="300" >&nbsp;</td>
                      <td width="96%"><fieldset>
                        <p> 
                          <legend>Controller</legend>
                        </p>
                        <%
						  
						  String flag ="";
						  if (request.getParameter("flag")!=null){flag =request.getParameter("flag").trim();  }						
						
						  String errmsg ="";
                          if (request.getParameter("errmsg")!=null){errmsg =request.getParameter("errmsg").trim();  }			
						 
						 if (flag.equals("y")){
                           %><font color="#FF0000"><strong><%=errmsg%></strong></font><% 
                         }
						%>
						
                        <table width="100%" border="0">
                          <tr> 
                            <td width="39%"> <div align="center">
                                <table width="100%" border="0">
                                  <tr> 
                                    <td width="15%" height="21" align="right"> 
                                      <%
									  
								    String criterialist="List1,List2,List3,List4,List5,List6,List7,List8";
									String userselectlist="";
																		
									String pagenumber ="";
                                    if (request.getParameter("pagenum")!=null){pagenumber =request.getParameter("pagenum").trim();  }
									
									
									String expname ="";
						            if (request.getParameter("txtname")!=null){expname =request.getParameter("txtname").trim();  }																							
																							
									if (flag.toLowerCase().equals("cancel") && addexpflag.toLowerCase().equals("y")){ 
										   TCAExpression tca=new TCAExpression();            
											tca.setExpname(expname);
											tca.setExptype(product);						
										  TCAExpressionManager te= new TCAExpressionManager(tca);
										  te.deleteExpressionClass();
									}
									
									
								    if (request.getParameter("huserselectlist")!=null){
									    userselectlist=request.getParameter("huserselectlist");
									}					   
								   String userlist[]=userselectlist.split(",");
								   String allcriterialist[]=criterialist.split(",");					
								   		   
								   	
								%>
                                    </td>
                                    <td width="21%" align="left" valign="bottom"> 
                                      <div align="left"> 
                                        <table width="100%" border="0" cellpadding="2">
                                          <tr>
                                            <td width="50%"><em><strong>Your Selection</strong></em> 
                                              <font color="#FF0000"><strong>*</strong></font> 
                                            </td>
                                            <td width="50%"><div align="right"><em><strong>Criteria List </strong></em> </div></td>
                                          </tr>
                                        </table>
                                      </div></td>
                                    <td width="40%" align="left" valign="bottom">&nbsp;</td>
                                  </tr>
                                  <tr> 
                                    <td height="212" align="right"  width="33%"><div align="left"><strong>Criteria Expression :: </strong></div></td>
										
                                    <td align="left" valign="top" width="33%"> <div align="left"> 
                                        <table width="100%" border="0">
                                          <tr> 
										  
                                            <td width="39%" >
											  <select name="userselectlist" size="10" multiple="multiple" id="select5"  >
                                                <option disabled title="Can not select." >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*****************************</option>
												
                                                <%
								                   
												   if (userselectlist!=""){										   
													   for (int ii=0;ii<userlist.length;ii++){
														   %>
																<option > 
																<%=userlist[ii]%>
																</option>
																<%
														}
												    }		
								 
								              %>
                                              </select>
											</td>
                                            <td width="22%"><input type="hidden" name="huserselectlist" id="huserselectlist5" />
                                              <input type="hidden" name="userproduct" id="userproduct" value="<%=userproduct%>"/>
                                              <table width="100%" border="0">
                                                <tr> 
                                                  <td><div align="center"> 
                                                      <input name="alltoleft" type="button" id="alltoleft5" value="&lt;&lt;" onclick="clickallgoleft();" />
                                                    </div></td>
                                                </tr>
                                                <tr> 
                                                  <td><div align="center"> 
                                                      <input name="toleft" type="button" id="toleft5" value="&lt;" onclick="clickgoleft();" />
                                                    </div></td>
                                                </tr>
                                                <tr> 
                                                  <td><div align="center"> 
                                                      <input name="toright" type="button" id="toright5" value="&gt;" onclick="clickgoright();" />
                                                    </div></td>
                                                </tr>
                                                <tr> 
                                                  <td><div align="center"> 
                                                      <input name="alltoright" type="button" id="alltoright5" value="&gt;&gt;" onclick="clickallgoright();" />
                                                    </div></td>
                                                </tr>
                                              </table></td>
                                            <td width="39%">
											<!-- ------------------------------------------------------------------------------------------- -->
											<%String temperror="";%>
											<select name="criterialist" size="10"  ondblclick="dblclickcriteria();" multiple="multiple" id="select6" >
                                                <option disabled title="Can not select.">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*****************************</option>
                                                <%
												try{
												
								                 TCAExpressionManager te= new TCAExpressionManager();												 
                                                 Vector v=te.getExpressionList(userproduct);
												 
													  if (v!=null){	
																								
																for (int ii=0;ii<v.size();ii++){
																	 boolean chk=false;
																	 Vector subdata=(Vector)v.get(ii);
																	 String strexpname=subdata.get(0).toString();
																	 String srtexpinput=subdata.get(1).toString();
																	for (int jj=0;jj<userlist.length;jj++){											    
																		if(strexpname.equals(userlist[jj])){
																			chk=true;
																		}
																	}
																	if(chk==false){
																	   %>
																		<option  title="<%=srtexpinput%>" > 
																		<%=strexpname%>
																		</option>
																		<%
																	}
																}		
														 }		
														 
													}catch (ErrException e){														     
														temperror="Error : "+e.toString();
												    }
												  %>
                                             </select>
											 <%out.print(temperror);%>
											<!-- ------------------------------------------------------------------------------------------- -->
											</td>
                                          </tr>
                                        </table>
                                        <div align="center">
                                          <p><input type="button" name="commitexpression" value="Commit Expression" onclick="clickcommitexpression();" />
                                        </p></div>
                                      </div></td>
                                    <td align="left" valign="top" > <div align="left">
                                        <table width="65%" border="0" >
                                          <tr> 
                                            <td> <div align="left"> 
                                                <input type="button" name="addexpression" value="Add Expression "  onclick="clickaddexpression();" />
                                              </div></td>
                                          </tr>
                                          <tr> 
                                            <td> <div align="left"> 
                                                <input type="button" name="editexp" value="Edit Expression" onclick="clickEditExpression();" />
                                              </div></td>
                                          </tr>
                                          <tr> 
                                            <td> <div align="left"></div></td>
                                          </tr>
                                        </table>
                                      </div></td>
                                  </tr>
                                </table>
                              </div></td>
                          </tr>
                          <tr>
                            <td><div align="center"> </div></td>
                          </tr>
                        </table>
                        </fieldset></td>
                      <td width="2%">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td></td>
                <td width="12%"></td>
                <td width="51%"></td>
              </tr>
              <tr> 
                <td height="21" colspan="3">&nbsp;</td>
              </tr>
            </table>
          </form></td>
      </tr>
    </tbody>
  </table>
  <!-- ------------------------------------------------------------------------------------------------------------------------ -->
  <!-- ================================================================================================================================== -->
</div>  
			
	</div>
	<%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">


function clickgoleft(){
	
var frm = document.form1;
var jcriteria = document.getElementById('criterialist');
var juserselect = document.getElementById('userselectlist');

	if (jcriteria.selectedIndex!=-1 && jcriteria.selectedIndex!=0){
		var userselect=jcriteria.options[jcriteria.selectedIndex].text;
		var oOption = document.createElement("OPTION");
		var chk=false;
		for(i=1; i<juserselect.length; i++)  {
		   if(juserselect.options[i].text==userselect){
			   chk=true;
		   }   
		}
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");
		  
		}else{
		   juserselect.options.add(oOption);
		   oOption.text = userselect;
		   oOption.value = userselect;
		   
		   jcriteria.remove(jcriteria.selectedIndex);	  
		   
		}
	}else{
	   alert("Please be select expression.");
	}
}

function clickgoright(){
	
var frm = document.form1;
var jcriteria = document.getElementById('criterialist');
var juserselect = document.getElementById('userselectlist');

	if (juserselect.selectedIndex!=-1 && juserselect.selectedIndex!=0){
		var criterialist=juserselect.options[juserselect.selectedIndex].text;
		var oOption = document.createElement("OPTION");
		var chk=false;
		for(i=1; i<jcriteria.length; i++)  {
		   if(jcriteria.options[i].text==criterialist){
			   chk=true;
		   }   
		}
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");
		  
		}else{
		   jcriteria.options.add(oOption);
		   oOption.text = criterialist;
		   oOption.value = criterialist;
		   
		   juserselect.remove(juserselect.selectedIndex);
		   
		}
	}else{
	   alert("Please be select expression.");
	}
}

function clickallgoright(){
	
var frm = document.form1;
var jcriteria = document.getElementById('criterialist');
var juserselect = document.getElementById('userselectlist');
var oOption = document.createElement("OPTION");
	
   if(juserselect.length>1){
        var chk=false;
         for (j=1;j<juserselect.length;j++){ 
		    var userselect=juserselect.options[j].text; 		
			for(i=1; i<jcriteria.length; i++)  {
			   if(jcriteria.options[i].text==userselect){
				   chk=true;
			   }   
			}
	     }		
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");
		  
		}else{
		  varnum=juserselect.length;
		  for(i=1; i<varnum; i++)  {
			   oOption = document.createElement("OPTION");
			   jcriteria.options.add(oOption);
			   oOption.text = juserselect.options[i].text;
			   oOption.value = juserselect.options[i].text;		   
			  
		  }
		  for(i=1; i<varnum; i++)  {	       
		   juserselect.remove(1);
	      }    
		} 	  
   }else{
      alert("Your selection are empty.");
   }	
}

function clickallgoleft(){
	
var frm = document.form1;
var jcriteria = document.getElementById('criterialist');
var juserselect = document.getElementById('userselectlist');
var oOption = document.createElement("OPTION");
	 
   if(jcriteria.length>1){
       var chk=false;
         for (j=1;j<jcriteria.length;j++){ 
		    var criteria=jcriteria.options[j].text; 		
			for(i=1; i<juserselect.length; i++)  {
			   if(juserselect.options[i].text==criteria){
				   chk=true;
			   }   
			}
	     }		
		if (chk==true){
		   alert("You have to select duplicate item , Please try again.");		  
		}else{
			  varnum=jcriteria.length;
			  for(i=1; i<varnum; i++)  {
				   oOption = document.createElement("OPTION");
				   juserselect.options.add(oOption);
				   oOption.text = jcriteria.options[i].text;
				   oOption.value = jcriteria.options[i].text;
				  
				   //jcriteria.remove(i);
			  }
			  for(i=1; i<varnum; i++)  {	       
				   jcriteria.remove(1);
			 }
		  }	 
   }else{
      alert("Your selection are empty.");
   }
}

function clickcommitexpression(){
var frm = document.form1;
var jhuserlist = document.getElementById('huserselectlist');
var juserselect = document.getElementById('userselectlist');

	 
  if(juserselect.length>1){  
      frm.action = "testcode_assurance_filedetail.jsp";	 
	  if(confirm("Confirmation?")){ 
		  var slist="";
		  for(i=1; i<juserselect.length; i++)  {	       
			   slist = slist+","+juserselect.options[i].text;		  
		  }
		  jhuserlist.value=slist.substring(1,slist.length);		
		  frm.submit();
		}
   }else{
      alert("Your selection are empty.");
   }
}

function clickaddexpression(){
var frm = document.form1;	
var jaddexpflag = document.getElementById('addexpflag'); 
var jcompileflag = document.getElementById('compileflag');
jcompileflag.value="n";
jaddexpflag.value="y";  
frm.action = "testcode_assurance_inputexpression.jsp";	 
frm.submit();
		
}

function clickEditExpression(){
	
var frm = document.form1;
var jcriteria = document.getElementById('criterialist');
var jpreexpname = document.getElementById('preexpname');
var jaddexpflag = document.getElementById('addexpflag');
var jcompileflag = document.getElementById('compileflag');
jcompileflag.value="n";

jaddexpflag.value="n"; 
	if (jcriteria.selectedIndex!=-1 && jcriteria.selectedIndex!=0){	
	    jpreexpname.value=jcriteria.options[jcriteria.selectedIndex].text;	
	    frm.action = "testcode_assurance_selecteditexpression_process.jsp";	 
        frm.submit();
	}else{
	   alert("Please select your expression as you want to Edit.");
	}
}

function dblclickcriteria(){
var frm = document.form1;
var jcriterialist = document.getElementById('criterialist'); 
var jpreexpname = document.getElementById('preexpname'); 
var jaddexpflag = document.getElementById('addexpflag');
var jcompileflag = document.getElementById('compileflag');
jcompileflag.value="n";
jaddexpflag.value="n"; 

	if(jcriterialist.selectedIndex!=(-1)){	          
	   jpreexpname.value=jcriterialist.options[jcriterialist.selectedIndex].text;		  
	   frm.action = "testcode_assurance_selecteditexpression_process.jsp";	 
       frm.submit();
	}
}

</script>