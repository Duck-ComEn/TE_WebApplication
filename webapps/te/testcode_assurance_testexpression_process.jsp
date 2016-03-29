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
	 
	 String mainkeyword ="";
     if (request.getParameter("mainkeyword")!=null){mainkeyword =request.getParameter("mainkeyword").trim();  }
	
	
     if (request.getParameter("expdes")!=null){expdes =request.getParameter("expdes").trim();  }
	 String arrinput[]=inputlist.split(",");
	 String errflag="n";
	 Vector getinput=new Vector();
	 String outputresult="";
	 String testinput="";
	 for(int i=0;i<arrinput.length;i++){
	     String temp[]=arrinput[i].split(":");
	         getinput.add(request.getParameter("txt"+temp[0]).trim());			 
			// out.println(request.getParameter("txt"+temp[0]).trim());
			testinput=testinput+request.getParameter("txt"+temp[0]).trim()+",";
	 }	
	 
	 
	  	 
	 //out.println(expname+"\n"); 
	// out.println(product+"\n");
	//s out.println(inputlist+"\n");	
	//out.println(outputlist+"\n");
     String errmsg="Test Expression completed sucessfully...No Error\n"; 
      
	 try{
		   TCAExecuteExpressionManager eem=new TCAExecuteExpressionManager(session.getAttribute("s_username").toString());
            Vector arrhddsn=new Vector();
            TCAExecutExpression ee=new TCAExecutExpression();
			ee.setHddsn("test");
			ee.setClassname(product.toUpperCase()+"_"+expname.toUpperCase());
			ee.setInput(getinput);                    
            arrhddsn.add(ee);            
            Vector v=new Vector();
            v.add(product.toUpperCase()+"_"+expname.toUpperCase());
			Vector result=eem.executeExpression(arrhddsn,v);
			
			for (int i=0;i<result.size();i++){
                ExpressionResult er=(ExpressionResult)result.get(i);
                //out.println("HDDSN : "+er.getHddsn());
                Vector explist=er.getExpoutput();
                for(int j=0;j<explist.size();j++){
                    ExpressionOutput eo=(ExpressionOutput)explist.get(j);
                    //out.println("    Exp Name : "+eo.getExpname());
                    Vector voutput=eo.getOutput();
					//out.println("    size : "+voutput.size());
                    for(int k=0;k<voutput.size();k++){
                        //out.println("        Exp output"+k+" : "+voutput.get(k));
						outputresult=outputresult+voutput.get(k)+",";
                    }
                }
               // out.println(outputresult.substring(0,outputresult.length()-1));
            }
		}catch(ErrException e){
    	  errflag ="y";
		  errmsg=e.toString()+".";
		}
	%>
	

      <input type="hidden" name="expname" value="<%=expname%>">

	  <input type="hidden" name="functionname" value="<%=functionname%>">
      <textarea name="expeditor" style="visibility: hidden" cols="120" rows="40"><%=expeditor%></textarea>
      <input type="hidden" name="inputlist" value="<%=inputlist%>">      
	  <input type="hidden" name="outputlist" value="<%=outputlist%>">
	  <input type="hidden" name="testinput" value="<%=(testinput.substring(0,testinput.length()-1))%>">                  
	  <input type="hidden" name="outputresult" value="<%=(outputresult.substring(0,outputresult.length()-1))%>">
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
	  <input type="hidden" name="errflag" value="<%=errflag%>">
	  <textarea name="expdes" style="visibility: hidden" cols="120" rows="40"><%=expdes%></textarea>	  
	  <input type="hidden" name="mainkeyword" value="<%=mainkeyword%>">
 	  
		
     <script language="JavaScript">
      var frm = document.form1; 
	frm.action="testcode_assurance_testexpression.jsp";	
	frm.submit();		
      </script> 
	</form>
	



	
