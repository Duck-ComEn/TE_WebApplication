
<%@ include file="session.jsp"%>
<%@ page buffer="30kb"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="javazoom.upload.*"%>
<%@ page import ="java.text.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.app.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.fastrework.common.*"%>
<%@ page import ="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import ="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import ="com.hitachigst.prb.itd.inventoryreduction.*"%>

<%
		

    String errormessage="";	
	String prsno="";
    String employeeno="";
    String requsetername="";
	String calcelremrk="";
	
	
	prsno=request.getParameter("prsno");	
	employeeno=request.getParameter("requesterid");
    requsetername=request.getParameter("requestername");
	calcelremrk=request.getParameter("cancelremark");
	
    if( prsno.equals("")==false  && employeeno.equals("")==false && requsetername.equals("")==false){		
        errormessage=InventoryReductionManager.cancelPRSReport(prsno,requsetername,employeeno,calcelremrk);    
	}else{
	  errormessage="Cancel PRS Report not complete , Please try again.";
	}
	
	%>
	<form name="form1" method="post" action="">
  <input type="hidden" name="submitflag" value="show">
 
	<%	
	if(errormessage.equals("")==false){
		   %>
		<jsp:forward page="error.jsp">
			<jsp:param name="errormessage" value="<%=errormessage%>" />
		</jsp:forward> 
		<%
		}else{			
       
			%>
		
            <script language="JavaScript">
   			 var frm = document.form1; 
			  frm.action="report_prs_history.jsp";	
	          frm.submit();		
          </script> 
		   </form>
		<%
	
		}	
 
       	%>
	



	
