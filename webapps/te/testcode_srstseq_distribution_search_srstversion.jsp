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
	out.print("Please waiting for upload rawdata to server...");
%>
<jsp:useBean id="up" scope="page" class="javazoom.upload.UploadBean">
<jsp:setProperty name="up" property="folderstore" value="<%=TeWebConfig.getAPPLICATION_PATH()+"/tca/rawdata/"+session.getAttribute("s_username").toString()%>" /></jsp:useBean>
 
<form action="" method="post" name="form1" target="_parent" id="form1">
<%
 String filename="";  
 String fileupload=""; 
 String process="";
 String product="";
 String errmsg="";
 String errflag="n";
 String rawdatamode="";
 //String txtsrstversion=""; 	
 //String mastercandidatehddsn="";
 String srstcodeversionlist="";				   
 try{
				   
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
	    MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
								  
		 if (mrequest.getParameter("filename")!=null){filename =mrequest.getParameter("filename").trim();  }						  
		//if (mrequest.getParameter("process")!=null){process =mrequest.getParameter("process").trim();  }						  
		 process="6600";
		 if (mrequest.getParameter("product")!=null){product =mrequest.getParameter("product").trim();  }		
	     if (mrequest.getParameter("Filepathupload")!=null){fileupload =mrequest.getParameter("Filepathupload").trim();  }		
		 if (mrequest.getParameter("rawdatamode")!=null){rawdatamode =mrequest.getParameter("rawdatamode").trim();  }	
		// if (mrequest.getParameter("txtsrstversion")!=null){txtsrstversion =mrequest.getParameter("txtsrstversion").trim().toUpperCase();  }
		 
								  
		  RawdataManager rd=new RawdataManager(session.getAttribute("s_username").toString());
		  rd.clearRawdata();
          up.setOverwrite(true);								  
    	  up.store(mrequest, "Fileupload");
		   
     	  out.print("Upload rawdata to server completed sucessfully.");  			  
		  out.println("<br><br>Please waiting for extract rawdata...");
		  SRSTSeqDistributionManager srst= new SRSTSeqDistributionManager(session.getAttribute("s_username").toString());		  
		  Vector v=srst.unziprawdata(filename);
		  out.print("<br><br>Extract rawdata completed sucessfully.");
		  out.print("<br><br>Please waiting for filter rawdata...");		  
		  if (v.size()!=0) {
               errmsg=srst.filterRawdata("");
			   out.print("<br><br>Filter rawdata completed sucessfully.");
			   if(errmsg.equals("")==true){
			       out.print("<br><br>Please waiting for read SRST version from rawdata...");
			       srstcodeversionlist=srst.readSRSTversionbyrawdata();
				   out.print("SRST Version :: "+ srstcodeversionlist);
			   }
            }
 		  out.print("<br><br>Read SRST version from rawdata completed sucessfully.");
		  //srst.setRawdatahddlist(v);
		 
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
 <input name="srstcodeversionlist" type="hidden" value="<%=srstcodeversionlist%>" />
	
				 	 
				 
            
<% 
 if (errflag!="y"){    
%>		
      
     <script language="JavaScript">
	   var frm = document.form1;   	  
       frm.action="testcode_srstseq_distribution_srstversionselection.jsp";	
	   frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){   
%>
    
    <script language="JavaScript">
      var frm = document.form1; 	  
	   frm.action="testcode_srstseq_distribution_uploadrawdata.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
</form>

