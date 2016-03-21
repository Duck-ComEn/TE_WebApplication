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
	 session.setAttribute("expeditor", expeditor);
	 
	 
	 String outputlist ="";
     if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }	
	 
	 String expdes ="";    
	 if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }	
	 String errflag="n";
	 
	 String addkeywordflag="";
	 if (request.getParameter("addkeywordflag")!=null){addkeywordflag =request.getParameter("addkeywordflag").trim();  }	
	 
	 String criterkeywordselect="";
	 if (request.getParameter("criterkeywordselect")!=null){criterkeywordselect =request.getParameter("criterkeywordselect").trim().toUpperCase();  }
	 
	 String tmpstr[]=criterkeywordselect.split("::");
	  String mainkeyword=tmpstr[1];
	 String cproduct=tmpstr[0];	 
	 String delmainkeyword="";	 
	 String headkeyword="";	 
	 String delheadkeyword="";	 
	 String delreuslt="";	 
	 String keyworddes="";	 
     String errmsg=""; 
	 
	 //----------------------------------------insert keyword-------------------------------------------------------------
     String paraname="";
	 String parakeyword="";	
	 String delvalue="";
	 String paratype="";
	 String parades="";
	 int paranum=0;
	 //-------------------------------------------------------------------------------------------------------------------
   
	 try{
	
            CriteriaKeywordManager ckm= new CriteriaKeywordManager();	
			
			CriteriaKeyword ck= ckm.getCriteriaKeyword(mainkeyword, cproduct);
			
			 mainkeyword=mainkeyword.trim();	
			 delmainkeyword=ck.getDelimitCriteria().trim();	 
			 headkeyword=ck.getHdkeyword().trim();	 
			 delheadkeyword=ck.getDelimithdvalue().trim();	 
			 delreuslt=ck.getDelimitResult().trim();	 
			 cproduct=product.trim();	 
			 keyworddes=ck.getDescription().trim();
	 
			ParametricManager pm=new ParametricManager();
			Vector v=pm.getParmetricListByCriteria(cproduct,mainkeyword);
			paranum=v.size();
			
			 
			for(int i=0;i<v.size();i++){
				    ParametricKeyword pk = (ParametricKeyword)v.get(i);
	   				
					paraname=pk.getParaName();
					parakeyword=pk.getValueKeyword();
					delvalue=pk.getDelimitValue();
					String str[]=pk.getParaType().split(":");
					paratype=str[0];					
					parades=pk.getParades();
					
					//out.print("paraname :: "+paraname);
					//out.print("parakeyword :: "+parakeyword);
					//out.print("delvalue :: "+delvalue);
					//out.print("paratype :: "+paratype);
					//out.print("parades :: "+parades);
				    
					%>
					  <input type="hidden" name="paraname<%=(i+1)%>" value="<%=paraname%>">
					  <input type="hidden" name="parakeyword<%=(i+1)%>" value="<%=parakeyword%>">
					  <input type="hidden" name="delvalue<%=(i+1)%>" value="<%=delvalue%>">
					  <input type="hidden" name="paratype<%=(i+1)%>" value="<%=paratype%>">
					  <input type="hidden" name="parades<%=(i+1)%>" value="<%=parades%>">	
					<%
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
	  <input type="hidden" name="addkeywordflag" value="<%=addkeywordflag%>">	  
	  <input type="hidden" name="mainkeyword" value="<%=mainkeyword%>">
	  <input type="hidden" name="delmainkeyword" value="<%=delmainkeyword%>">
	  <input type="hidden" name="headkeyword" value="<%=headkeyword%>">
	  <input type="hidden" name="delheadkeyword" value="<%=delheadkeyword%>">
	  <input type="hidden" name="delreuslt" value="<%=delreuslt%>">
	  <input type="hidden" name="keyworddes" value="<%=keyworddes%>">
	  <input type="hidden" name="cproduct" value="<%=cproduct%>">
	  <input type="hidden" name="numofparametric" value="<%=paranum%>">	 
	  <textarea  name="expeditor" style="visibility: hidden" cols="100" rows="40" ><%=expeditor%></textarea> 
	  
	  
	  
	  
<% 
    if (errflag!="y"){
%>		  
     <script language="JavaScript">
      var frm = document.form1; 
	  frm.action="testcode_assurance_addexpressionkeyword.jsp";	
	  frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){
%>
  
     
	 
    <script language="JavaScript">
      var frm = document.form1; 
	   frm.action="testcode_assurance_expressionbuilder.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
</form>
