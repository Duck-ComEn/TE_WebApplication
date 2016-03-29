<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>
<%@ page import="java.util.*"%>

<%   String datadate ="";
     if (request.getParameter("datadate")!=null){datadate =request.getParameter("datadate").trim().toUpperCase();  }	      
	 if(datadate.equals("NOTSELECT")){ datadate="";}
	 
	 String process ="";
     if (request.getParameter("process")!=null){process =request.getParameter("process").trim().toUpperCase();  }
	 
	 String product ="";
     if (request.getParameter("userproduct")!=null){product =request.getParameter("userproduct").trim().toUpperCase();  }
	 
     String trialid ="";
     if (request.getParameter("trialid")!=null){trialid =request.getParameter("trialid").trim().toUpperCase(); }							 
	 							  
	 String hddsn ="";
     if (request.getParameter("hddsn")!=null){hddsn =request.getParameter("hddsn").trim().toUpperCase();} 	
	 
	 String rawdatamode ="";
     if (request.getParameter("rawdatamode")!=null){rawdatamode =request.getParameter("rawdatamode").trim().toUpperCase();}
	 
	 String filename ="";
     if (request.getParameter("filename")!=null){filename =request.getParameter("filename").trim().toUpperCase();}  
	 
     String errmsg=""; 
      
	  try{
		RawdataManager rm=new RawdataManager(session.getAttribute("s_username").toString());																
		if(rawdatamode.toUpperCase().equals("UPLOAD")){
		   rm.unzipAndFilter(filename);
		}else if (rawdatamode.toUpperCase().equals("FTP")){
		   rm.getRawDataAndFilter(datadate,process,product,trialid,hddsn);
		}   
    	session.setAttribute(session.getAttribute("s_username")+"_tca_rawdataobject", rm);		
		}catch(ErrException e){
		  errmsg=e.toString();
		}
	%>
	<form name="form1" method="post" action="">
      <input type="hidden" name="datadate" value="<%=datadate%>">
      <input type="hidden" name="process" value="<%=process%>">
      <input type="hidden" name="userproduct" value="<%=product%>">
      <input type="hidden" name="trialid" value="<%=trialid%>">
      <input type="hidden" name="hddsn" value="<%=hddsn%>">
	  <input type="hidden" name="errmsg" value="<%=errmsg%>">
 	
		
     <script language="JavaScript">
     	var frm = document.form1; 
	    frm.action="testcode_assurance_filedetail.jsp";	
	    frm.submit();		
      </script> 
	</form>
		
	<%
	
	%>



	
