<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>
<%@ page import="java.util.*"%>

						
<form name="form1" method="post" action="">		
<%@ include file="testcode_assurance_expression_commoninclude.jsp" %>				
<%
     String expname ="";
     if (request.getParameter("expname")!=null){expname =request.getParameter("expname").trim();  }	 	 
	 
	 String inputlist ="";
     if (request.getParameter("inputlist")!=null){inputlist =request.getParameter("inputlist").trim();  }	
	 
	 String expeditor ="";
     if (request.getParameter("expeditor")!=null){expeditor =request.getParameter("expeditor").trim();  }	
	 
	 //out.print("txtexpeditor : "+expeditor);
	 
	 String outputlist ="";
     if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }	
	 
	 String expdes ="";    
	 if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }	
	 String errflag="n";
	 
	 String addkeywordflag="";
	 if (request.getParameter("addkeywordflag")!=null){addkeywordflag =request.getParameter("addkeywordflag").trim();  }	
	
     String errmsg="Save completed sucessfully...No Error\n"; 
	 
	 //----------------------------------------insert keyword-------------------------------------------------------------
	 String mainkeyword="";
	 if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim().toUpperCase();  }
	 
	 String delmainkeyword="";
	 if (request.getParameter("delmainkeyword")!=null){delmainkeyword =request.getParameter("delmainkeyword").trim().toUpperCase();  }
	 
	 String headkeyword="";
	 if (request.getParameter("headkeyword")!=null){headkeyword =request.getParameter("headkeyword").trim().toUpperCase();  }
	 
	 String delheadkeyword="";
	 if (request.getParameter("delheadkeyword")!=null){delheadkeyword =request.getParameter("delheadkeyword").trim().toUpperCase();  }
	 
	 String delreuslt="";
	 if (request.getParameter("delreuslt")!=null){delreuslt =request.getParameter("delreuslt").trim().toUpperCase();  }
	 
	 String cproduct="";
	 if (request.getParameter("cproduct")!=null){cproduct =request.getParameter("cproduct").trim().toUpperCase();  }
	 
	 String keyworddes="";
	 if (request.getParameter("keyworddes")!=null){keyworddes =request.getParameter("keyworddes").trim();  }	
	 //-------------------------------------------------------------------------------------------------------------------
	 String numofparametric="";
	 if (request.getParameter("numofparametric")!=null){numofparametric =request.getParameter("numofparametric").trim();  }	
	 
	 int paranum=Integer.parseInt(numofparametric);
	 //-------------------------------------------------------------------------------------------------------------------
	 
	/*out.print("mainkeyword : "+mainkeyword+">>>>");
	out.print("delmainkeyword : "+delmainkeyword+">>>>");
	out.print("headkeyword : "+headkeyword+">>>>");
	out.print("delheadkeyword : "+delheadkeyword+">>>>");
	out.print("delreuslt : "+delreuslt+">>>>");
	out.print("keyworddes : "+keyworddes+">>>>");
	out.print("cproduct : "+cproduct+">>>>");*/
	 //out.print("numofparametric : "+numofparametric+">>>>");
   
	 try{
		    CriteriaKeyword ck=new CriteriaKeyword();
            ck.setCriteriaKeyword(mainkeyword.trim());
            ck.setDelimitCriteria(delmainkeyword.trim());
            ck.setHdkeyword(headkeyword.trim());
            ck.setDelimithdvalue(delheadkeyword.trim());
            ck.setDelimitResult(delreuslt.trim());
			ck.setClassName("CRITERIA_COMMON");       
			ck.setDescription(keyworddes.trim());     
            CriteriaKeywordManager ckm= new CriteriaKeywordManager();	
			
			String paraname="";
			String parakeyword="";	
			String delvalue="";
			String paratype="";
			String parades="";
			Vector v=new Vector();
			
			for(int i=1;i<=paranum;i++){
				    
	                if (request.getParameter("paraname"+i)!=null){paraname =request.getParameter("paraname"+i).trim().toUpperCase();  }									
					//out.print("paraname"+i+paraname+">>>>");
					
					if (request.getParameter("parakeyword"+i)!=null){parakeyword =request.getParameter("parakeyword"+i).trim().toUpperCase();  }										
					//out.print("parakeyword"+i+parakeyword+">>>>");
					
					if (request.getParameter("delvalue"+i)!=null){delvalue =request.getParameter("delvalue"+i).trim().toUpperCase();  }										
					//out.print("delvalue"+i+delvalue+">>>>");					
					
					if (request.getParameter("paratype"+i)!=null){paratype =request.getParameter("paratype"+i).trim();  }										
					//out.print("paratype"+i+paratype+">>>>");
											
					if (request.getParameter("parades"+i)!=null){parades =request.getParameter("parades"+i).trim();  }					
					//out.print("parades"+i+parades+">>>>");
					
					ParametricKeyword pk=new ParametricKeyword();
						
						pk.setParaName(paraname);
						pk.setValueKeyword(parakeyword);
						pk.setDelimitValue(delvalue);
						String str[]=paratype.split(":");
						pk.setParaType(str[0].trim());	
						pk.setParaProduct(cproduct);	
						pk.setParades(parades);
					    v.add(pk);
					%>
					  <input type="hidden" name="paraname<%=i%>" value="<%=paraname%>">
					  <input type="hidden" name="parakeyword<%=i%>" value="<%=parakeyword%>">
					  <input type="hidden" name="delvalue<%=i%>" value="<%=delvalue%>">
					  <input type="hidden" name="paratype<%=i%>" value="<%=paratype%>">
					  <input type="hidden" name="parades<%=i%>" value="<%=parades%>">	
					<%
				} 
			
			
			 ParametricManager pm=new ParametricManager();
			
			if (addkeywordflag.equals("add")==false){  
			   ckm.updateCriteriaKeyword2db(ck,cproduct,session.getAttribute("s_username").toString());
			   pm.updateParametric2db(v,mainkeyword.trim(),session.getAttribute("s_username").toString());  
			}else{				   	   
			   ckm.insertCriteriaKeyword2db(ck,cproduct,session.getAttribute("s_username").toString());			   
			   pm.insertParametric2db(v,mainkeyword.trim(),session.getAttribute("s_username").toString());  					
			}		
                    
		}catch(ErrException e){
    	  errflag ="y";
		  errmsg=e.toString();		
		  //out.print("errmsg : "+errmsg); 
		}
	%>
	   <input type="hidden" name="expname" value="<%=expname%>">  		      
      <input type="hidden" name="inputlist" value="<%=inputlist%>">      
	  <input type="hidden" name="outputlist" value="<%=outputlist%>">	 
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
	  <input type="hidden" name="errflag" value="<%=errflag%>">
	  <textarea  name="expdes" style="visibility: hidden" cols="120" rows="40"><%=expdes%></textarea>   
	  <input  maxlength="500" type="hidden" name="addkeywordflag" value="<%=addkeywordflag%>">	  
	  
	  <input type="hidden" name="mainkeyword" value="<%=mainkeyword%>">
	  <input type="hidden" name="delmainkeyword" value="<%=delmainkeyword%>">
	  <input type="hidden" name="headkeyword" value="<%=headkeyword%>">
	  <input type="hidden" name="delheadkeyword" value="<%=delheadkeyword%>">
	  <input type="hidden" name="delreuslt" value="<%=delreuslt%>">
	  <input type="hidden" name="keyworddes" value="<%=keyworddes%>">
	  <input type="hidden" name="cproduct" value="<%=cproduct%>">
	  <input type="hidden" name="numofparametric" value="<%=numofparametric%>">	  
	  <textarea  name="expeditor" style="visibility: hidden" cols="100" rows="40" ><%=expeditor%></textarea> 
	  
	  
<% 
    if (errflag!="y"){
%>		  
     <script language="JavaScript">
       var frm = document.form1; 
	   frm.action="testcode_assurance_expressionbuilder.jsp";	
	  frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){
%>
  
     
	 
    <script language="JavaScript">
       var frm = document.form1; 
	   frm.action="testcode_assurance_addexpressionkeyword.jsp";	
	   frm.submit();		
     </script> 
	
<%
}
%>
</form>
