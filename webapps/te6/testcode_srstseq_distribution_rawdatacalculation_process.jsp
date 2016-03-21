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
	String apppath=application.getRealPath("");
	String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
	new TeWebConfig(apppath,webpath);	
	//out.print("webpath :: "+ webpath);
%>

 
<form action="" method="post" name="form1" target="_parent" id="form1">
<%
  String process =""; 
  String product =""; 
  String txtsrstversion ="";
  String mastercandidatehddsn =""; 		
  String percentcomp =""; 
  String errmsg="";
  String errflag="";	  
  String htmoutput=""; 
  String srstcodeversionlist=""; 
 try{    
   	
	if (request.getParameter("process")!=null){process =request.getParameter("process").trim();  }	 	
	if (request.getParameter("product")!=null){product =request.getParameter("product").trim();  }	 	
	if (request.getParameter("txtsrstversion")!=null){txtsrstversion =request.getParameter("txtsrstversion").trim();  }	 	
	if (request.getParameter("mastercandidatehddsn")!=null){mastercandidatehddsn =request.getParameter("mastercandidatehddsn").trim();  }	
	if (request.getParameter("percentcomp")!=null){percentcomp =request.getParameter("percentcomp").trim();  }		
    if (request.getParameter("srstcodeversionlist")!=null){srstcodeversionlist =request.getParameter("srstcodeversionlist").trim();  }
	//out.print("Process :: "+ process);
   // out.print("product :: "+ product); 
	//out.print("txtsrstversion :: "+ txtsrstversion);
	//out.print("mastercandidatehddsn :: "+ mastercandidatehddsn);
	//out.print("percentcomp :: "+ percentcomp);
	
    SRSTSeqDistributionManager srst=new SRSTSeqDistributionManager(session.getAttribute("s_username").toString());
	htmoutput=srst.distributioncalculation(percentcomp,product,txtsrstversion);

	//out.print("htmoutput :: "+ htmoutput);
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
 <input name="txtsrstversion" type="hidden" value="<%=txtsrstversion%>" />
 <input name="mastercandidatehddsn" type="hidden" value="<%=mastercandidatehddsn%>" />
 <input name="percentcomp" type="hidden" value="<%=percentcomp%>" />
 <input name="htmoutput" type="hidden" value="<%=htmoutput%>" />
 <input type="hidden" name="srstcodeversionlist" value="<%=srstcodeversionlist%>"/>	
      
<% 
 if (errflag!="y"){    
%>		
      
     <script language="JavaScript">
	    

      var frm = document.form1; 	  
	  var htm=frm.htmoutput.value
	  //window.location="\\te\\tca\\rawdata\\phanuwat.jak\\GraphMacro.HTM";
	  window.open(htm, "blank"); 
	  frm.action="testcode_srstseq_distribution_showgraph.jsp";	
	  frm.submit();		
     </script> 
	
<%
   }else if(errflag.equals("y")){   
%>
    
    <script language="JavaScript">
      var frm = document.form1; 	  
	  frm.action="testcode_srstseq_distribution_filedetail.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
</form>

