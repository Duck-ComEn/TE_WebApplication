<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javazoom.upload.*"%>
<%@ page import="com.hitachigst.prb.te.srstseqdistrbution.*"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String apppath=application.getRealPath("");
	String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
	new TeWebConfig(apppath,webpath);	
%>
 
<form action="" method="post" name="form1" target="_parent" id="form1">
<%
  
 String filename=""; 
  String process="6600";
  String product="";
  String fileupload=""; 
  String txtsrstversion="";
  String rawdatamode="";
 String errmsg="";
 String errflag="n";	
 String mastercandidatehddsn="";				
 String srstcodeversionlist="";   
 try{				
		 if (request.getParameter("filename")!=null){filename =request.getParameter("filename").trim();  }		 
		 if (request.getParameter("product")!=null){product =request.getParameter("product").trim();  }		 
		 if (request.getParameter("Filepathupload")!=null){fileupload =request.getParameter("Filepathupload").trim();  }		 		 
		 if (request.getParameter("txtsrstversion")!=null){txtsrstversion =request.getParameter("txtsrstversion").trim();  }		 
		 if (request.getParameter("rawdatamode")!=null){rawdatamode =request.getParameter("rawdatamode").trim();  }
		 if (request.getParameter("srstcodeversionlist")!=null){srstcodeversionlist =request.getParameter("srstcodeversionlist").trim();  }
		 
		 out.println("<br><br>Please waiting for create rawdata object..."); 
		 SRSTSeqDistributionManager srst= new SRSTSeqDistributionManager(session.getAttribute("s_username").toString());		  
		 Vector v=srst.getAllRawdataObject();		 
		 		  
		  if (v.size()!=0) {
		       out.print("<br><br>Create rawdata object completed sucessfully.");
		       out.println("<br><br>Please waiting for analysis master files...");
               mastercandidatehddsn=srst.mastercandidate(product,txtsrstversion, v);    
			   
			   if (mastercandidatehddsn.equals("")==false){
			       out.print("<br><br>Master Candidate HDDSN is :: "+ mastercandidatehddsn);
			       out.print("<br><br>Analysis master files completed sucessfully.");
				   out.println("<br><br>Please waiting for filter srst rawdata..."); 
			       srst.filterRawdata("");
				   out.print("<br><br>Filter Rawdata completed sucessfully"); 			              
			   }else{
			       errmsg="Analysis master files has some error occur.";
			       out.print("<br><br>Analysis master files has some error occur.");
			   }
            }else{
			   errmsg="Create rawdata object has some error occur. , Please verify your process again.";
			   out.print("<br><br>Create rawdata object has some error occur.");
			}
 		    	 
    
     if(errmsg.equals("")==false){errflag="y";}	  
}catch(ErrException e){
	  errflag="y";
	  errmsg=e.toString();
}
%>

                  
 <input name="process" type="hidden" value="<%=process%>" />
 <input name="product" type="hidden" value="<%=product%>" />	
 <input name="errflag" type="hidden" value="<%=errflag%>" />
 <input name="errmsg" type="hidden" value="<%=errmsg%>" />	
 <input name="Filepathupload" type="hidden" value="<%=fileupload%>" />	
 <input name="rawdatamode" type="hidden" value="<%=rawdatamode%>" />	
 <input name="filename" type="hidden" value="<%=filename%>" />	
 <input name="txtsrstversion" type="hidden" value="<%=txtsrstversion%>" />
 <input name="mastercandidatehddsn" type="hidden" value="<%=mastercandidatehddsn%>" />
 <input type="hidden" name="srstcodeversionlist" value="<%=srstcodeversionlist%>"/>	
	      
<% 
 if (errflag!="y"){    
%>		
      
     <script language="JavaScript">
	   var frm = document.form1;   	  
       frm.action="testcode_srstseq_distribution_filedetail.jsp";	
	   frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){   
%>
    
    <script language="JavaScript">
      var frm = document.form1; 	  
	  frm.action="testcode_srstseq_distribution_srstversionselection.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
</form>

