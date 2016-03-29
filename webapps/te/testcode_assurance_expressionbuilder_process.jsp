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
     
     String expname =request.getParameter("expname").trim();

	 String inputlist = request.getParameter("inputlist").trim();
	 String functionname =request.getParameter("functionname").trim();
	 String expeditor =request.getParameter("expeditor").trim();
	 String outputlist =request.getParameter("outputlist").trim();	 
	 String expdes ="";
     if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }
	 String errflag="n";
	 
	 String mainkeyword ="";
     if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim();  }
	
	// out.println(expname+"\n"); 
	// out.println(product+"\n");
	// out.println(inputlist+"\n");
	 //out.println(functionname+"\n");
	// out.println(expeditor+"\n");
	// out.println(outputlist+"\n");
     String errmsg="Check Expression completed sucessfully...No Error\n"; 
      
	 try{
		   TCAExpression tca=new TCAExpression();

            tca.setExpname(expname);
            tca.setExptype(product);
            
            // body code
            String str=functionname+"\n"+expeditor+"\n";                       
            tca.setEpxbody(str);
           
            //  input list
			String inputstr[]=inputlist.split(",");
			Vector v=new Vector();
			for(int i=0;i<inputstr.length;i++){
			   v.add(inputstr[i]);
			}            
            tca.setInputlist(v);
            
            //  output list
			String outputstr[]=outputlist.split(",");
            Vector v1=new Vector();
			for(int i=0;i<outputstr.length;i++){
			   v1.add(outputstr[i]);
			}                     
            tca.setOutputlist(v1);
            
            
            TCAExpressionManager te= new TCAExpressionManager(tca);
            //te.generateExpressionClass();
            te.createNewExpressionAndComplile();
			compileflag="y";
		}catch(ErrException e){
    	  errflag ="y";
		  errmsg=e.toString()+".";
		}
	%>
	
      <input type="hidden" name="expname" value="<%=expname%>">
      
      <input type="hidden" name="inputlist" value="<%=inputlist%>">
      <input type="hidden" name="functionname" value="<%=functionname%>">    
	  <textarea name="expeditor" style="visibility: hidden" cols="120"  rows="40"><%=expeditor%></textarea>                                
	  <input type="hidden" name="outputlist" value="<%=outputlist%>">
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
	  <input type="hidden" name="errflag" value="<%=errflag%>">
	   <input type="hidden" name="mainkeyword" value="<%=mainkeyword%>">
	  <textarea name="expdes" style="visibility: hidden" cols="120" rows="40"><%=expdes%></textarea>
	  
	  	
 	  <% 
    if (errflag!="y"){
%>		
      
     <script language="JavaScript">
	   var frm = document.form1; 
	   var jcompileflag = document.getElementById('compileflag'); 
	   jcompileflag.value="y";
       frm.action="testcode_assurance_expressionbuilder.jsp";	
	   frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){
%>
    
    <script language="JavaScript">
      var frm = document.form1; 
	  var jcompileflag = document.getElementById('compileflag'); 
	  jcompileflag.value="n";
	  frm.action="testcode_assurance_expressionbuilder.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
</form>		
 
		
	



	
