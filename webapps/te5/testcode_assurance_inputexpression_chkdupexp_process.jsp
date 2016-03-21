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
     if (request.getParameter("txtexpeditor")!=null){expeditor =request.getParameter("txtexpeditor").trim();  }	
	 
	 String outputlist ="";
     if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }	
	 
	 String expdes ="";
     if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }	
	 String errflag="n";	
	  	 
	// out.println(expname+"\n"); 
	// out.println(product+"\n");
	// out.println(inputlist+"\n");	
	// out.println(expeditor+"\n");
	 //out.println(outputlist+"\n");
	 //out.println(expdes+"\n");
     String errmsg=""; 
	 
   
	 try{
	      if (addexpflag.equals("y")){  
		    TCAExpression tca=new TCAExpression();
         
            tca.setExpname(expname);
            tca.setExptype(product);         
                        
            TCAExpressionManager te= new TCAExpressionManager(tca);
            te.chkDuplicationExpression();       
		  }
		}catch(ErrException e){
    	  errflag ="y";
		  errmsg=e.toString();		  
		}
		out.print(errmsg);
	%>
	  
 	
      <input type="hidden" name="expname" value="<%=expname%>">         
      <input type="hidden" name="inputlist" value="<%=inputlist%>">      
	  <input type="hidden" name="outputlist" value="<%=outputlist%>">	 
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
	  <input type="hidden" name="errflag" value="<%=errflag%>">
  <textarea  name="expeditor" style="visibility: hidden" cols="120" rows="40"><%=expeditor%></textarea>
  <textarea  name="expdes" style="visibility: hidden" cols="120" rows="40"><%=expdes%></textarea>   
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
	  frm.action="testcode_assurance_inputexpression.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
	
</form>
