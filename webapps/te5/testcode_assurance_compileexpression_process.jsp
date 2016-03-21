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
	 
	 String inputlist = "";
	 if (request.getParameter("inputlist")!=null){inputlist =request.getParameter("inputlist").trim();  }
	 
	 String functionname ="";
	 if (request.getParameter("functionname")!=null){functionname =request.getParameter("functionname").trim();  }
	 
	 
	 String expeditor ="";
	 if (request.getParameter("expeditor")!=null){expeditor =request.getParameter("expeditor").trim();  }
	
	 String outputlist ="";	  
	 if (request.getParameter("outputlist")!=null){outputlist =request.getParameter("outputlist").trim();  }
	 
	 String expdes ="";
     if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }
	 String errflag="n";
	
	 //out.println(functionname+"\n"); 
	// out.println(product+"\n");
	// out.println(inputlist+"\n");
	 //out.println(functionname+"\n");
	// out.println(expeditor+"\n");
	// out.println(outputlist+"\n");
     String errmsg="Check Expression completed sucessfully...No Error\n"; 
     compileflag="n";
	  
	 try{
		   TCAExpression tca=new TCAExpression();

            tca.setExpname(expname);
            tca.setExptype(product);
                        
           
            //  input list
			String inputstr[]=inputlist.split(",");
			Vector v=new Vector();
			String ftemp="";
			for(int i=0;i<inputstr.length;i++){
			   String temp[]=inputstr[i].split(":");
			   ftemp=ftemp+temp[1]+" " +temp[0]+",";
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
            
			// body code
			functionname=product.toUpperCase()+"_"+expname.toUpperCase()+"("+ftemp.substring(0,ftemp.length()-1)+"){";
			
            String str=functionname+"\n"+expeditor+"\n";                       
            tca.setEpxbody(str);
            
            TCAExpressionManager te= new TCAExpressionManager(tca);
            //te.generateExpressionClass();
            te.createNewExpressionAndComplile();
		}catch(ErrException e){
    	  errflag ="y";
		  errmsg=e.toString()+".";		  
		}
	%>
	
      <input type="hidden" name="expname" value="<%=expname%>">     
      <input type="hidden" name="inputlist" value="<%=inputlist%>">    
      <input type="hidden" maxlength="500" name="expeditor" value="<%=expeditor%>">   	  
	  <input type="hidden" name="outputlist" value="<%=outputlist%>">
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
	  <input type="hidden" name="errflag" value="<%=errflag%>">
	  <input maxlength="500" type="hidden" name="expdes" value="<%=expdes%>">
	  	
 	   <% 
    if (errflag!="y"){
%>		
      
     <script language="JavaScript">
	   var frm = document.form1; 
	   var jcompileflag = document.getElementById('compileflag'); 
	   jcompileflag.value="y";
       frm.action="testcode_assurance_inputexpression.jsp";	
	   frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){
%>
    
    <script language="JavaScript">
      var frm = document.form1; 
	  var jcompileflag = document.getElementById('compileflag'); 
	  jcompileflag.value="n";
	  frm.action="testcode_assurance_inputexpression.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>    
   
		
		
	



	
