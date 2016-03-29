
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
	String line = "";
    String shift="";
	String dataDate="";
	String prsno="";
    String employeeno="";
    String requsetername="";
	int beginRow=0;
	int endRow=0;	
    int prsrunning=0;
	
	line=request.getParameter("Line");
	shift=request.getParameter("Shift");
	dataDate=request.getParameter("dataDate");
	prsno=request.getParameter("prsno");
	beginRow=Integer.parseInt(request.getParameter("brownum"));
    endRow=Integer.parseInt(request.getParameter("erownum"));
	prsrunning=Integer.parseInt(request.getParameter("prsrunning"));
	employeeno=request.getParameter("employeeno");
    requsetername=request.getParameter("requsetername");
	
    if(shift.equals("")==false && line.equals("")==false && dataDate.equals("")==false
       && prsno.equals("")==false && beginRow!=0 && endRow!=0 && prsrunning!=0 && employeeno.equals("")==false && requsetername.equals("")==false){
		    
           
			PRSReport ra=new PRSReport();
			ra.setShift_id(shift);
			ra.setLine_id(line);
			ra.setInputdate(dataDate);

	        errormessage=InventoryReductionManager.generatePRSReport(ra,prsno,prsrunning,beginRow,endRow,requsetername,employeeno);

	}else{
	  errormessage="Generate PRS Report not complete , Please try again.";
	}
	
	%>
	<form name="form1" method="post" action="">
  <input type="hidden" name="Line" value="<%=line%>">
  <input type="hidden" name="Shift" value="<%=shift%>">
  <input type="hidden" name="dataDate" value="<%=dataDate%>">
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
			  frm.action="report_prs.jsp";	
	          frm.submit();		
          </script> 
		   </form>
		<%
	
		}	
 
       	%>
	



	
