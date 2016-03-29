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
      
     
     String errflag="n";	 
	 String expname="";
	 String inputlist="";
	 String outputlist="";
	 String errmsg=""; 
	 String expeditor=""; 
	 String expdes="";	 
	 //out.println(preexpname+"\n"); 
	 //out.println("Product :: "+product+"\n");
	 //out.println("User Product :: "+userproduct+"\n");
	//s out.println(inputlist+"\n");	
	//out.println(outputlist+"\n");
   
      
	 try{
	        TCAExpressionManager te= new TCAExpressionManager();           
            
            TCAExpression tca = te.getTCAExpression(preexpname);
            
			String temp[]=tca.getExpname().split("_");
			expname=temp[1];
			product=temp[0];			
			product=tca.getExptype();
			inputlist=tca.getInputliststr();
			outputlist=tca.getOutputliststr();
			expeditor=tca.getEpxbody();
			expdes=tca.getExpdes();
           // out.println("ExpName : "+expname);
          //  out.println("ExpProduct : "+product);
          //  out.println("ExpInput : "+inputlist);
          //  out.println("ExpOutput : "+outputlist);
          //  out.println("ExpBody : "+expeditor);
          //  out.println("ExpDes : "+expdes);     
          
      
         
	    		  
		}catch(ErrException e){
    	  errflag ="y";
		  errmsg=e.toString();
		}
	%>
	

      <input type="hidden" name="expname" value="<%=expname%>">	  
	  <textarea  name="expeditor" style="visibility: hidden" cols="120" rows="40"><%=expeditor%></textarea> 
	  <textarea  name="expdes" style="visibility: hidden" cols="120" rows="40"><%=expdes%></textarea>     
      <input type="hidden" name="inputlist" value="<%=inputlist%>">      
	  <input type="hidden" name="outputlist" value="<%=outputlist%>">  
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
	  <input type="hidden" name="flag" value="<%=errflag%>">
  	  <input type="hidden" name="tempproduct" value="<%=product%>">

	  
	  
 	<% 
    if (errflag!="y"){
%>		
      
     <script language="JavaScript">
	   var frm = document.form1; 
	   var jproduct = document.getElementById('product');
	   var jtempproduct = document.getElementById('tempproduct');
	   jproduct.value=jtempproduct.value;
     frm.action="testcode_assurance_inputexpression.jsp";	
	   frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){
%>
    
    <script language="JavaScript">
      var frm = document.form1; 
	    frm.action="testcode_assurance_selectexpression.jsp";	
	    frm.submit();		
     </script> 
	
<%
}
%>  	
    
	</form>
	



	
