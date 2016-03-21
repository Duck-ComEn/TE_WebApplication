<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.tca.*"%>
<%@ page import="com.hitachigst.prb.te.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>
						
<form name="form1" method="post" action="">		
<%@ include file="testcode_assurance_expression_commoninclude.jsp" %>				
<%
     String huserselectlist ="";
     if (request.getParameter("huserselectlist")!=null){huserselectlist =request.getParameter("huserselectlist").trim();  }	 	 
	 
	 String errflag="n";	
	  	 
	//out.println(huserselectlist+"\n");
	//out.println(product+"\n");  

     String errmsg="Test Expression completed sucessfully...No Error\n"; 
	
	try{    
	        MonitorLog.setLog("Start Monitor Rawdata calculation","");
	        Vector input=new Vector();
			String inputstr[]= huserselectlist.split(",");
			for(int in=0;in<inputstr.length;in++){
              input.add(inputstr[in]);              
			}
            MonitorLog.setLog("1 --> End Set Vector Criteria","");
			
            /// Get Exptression Input
            HashMap inputArg=new HashMap();
            TCAExpressionManager tcam=new TCAExpressionManager();
			
            for (int o=0;o<input.size();o++){
                String expinput = tcam.getExpInput(input.get(o).toString());
                inputArg.put(input.get(o).toString(),expinput);				
            }            
            MonitorLog.setLog("2 --> End Get Criteria Input","");
            //-----------------------------------------------------------------------------------
            
            RawdataManager rm=new RawdataManager(session.getAttribute("s_username").toString());            
            HashMap hm=(HashMap)rm.readRawDataDir(input);
            MonitorLog.setLog("3 --> End Get Rawdata Detail","");
			            
            TCAExecuteExpressionManager tem=new TCAExecuteExpressionManager(session.getAttribute("s_username").toString());
            HashMap endresult=tem.executeMultiExpression(hm,inputArg);
            MonitorLog.setLog("4 --> End Execute & Result Calculation","");			
            
			session.setAttribute(session.getAttribute("s_username")+"_tca_rawdatacalculationobject", endresult);
			
	 	/*
			
         Object objhm[]= endresult.values().toArray();
            
			out.println("Rawdata count :: "+objhm.length);
			
            for(int i=0;i<objhm.length;i++){
                Rawdata rd=(Rawdata)objhm[i];
                out.println("SN: "+rd.getUnitsn()+"\n");
				out.println("\n");
                out.println("STDID: "+rd.getUnitstdid()+"\n");
                out.println("PFCODE: "+rd.getPfcode()+"\n");
                out.println("PFStatus: "+rd.getPfstatus()+"\n");
                out.println("Head Num: "+rd.getHeadnum()+"\n");
                out.println("File Name: "+rd.getTxtfilename()+"\n");
                out.println("Err MSG: "+rd.getErrmsg()+"\n");
                HashMap hmrd=rd.getCirterialist();
                
                if(hmrd!=null){
                    Object obj[]= hmrd.values().toArray();
                    
                    for(int j=0;j<obj.length;j++){
                        CriteriaResult cresult=(CriteriaResult) obj[j];
                        out.println("   Criteria Name : "+cresult.getCriteriaName()+"\n");
                        out.println("   Criteria Keyword : "+cresult.getCriteriaKeyword()+"\n");
                        out.println("   Criteria Result : "+cresult.getCriteriaResult()+"\n");
                        out.println("   Criteria Msg Err : "+cresult.getMsgerr()+"\n");
                        out.println("   Criteria Head Num : "+cresult.getCriteriaHeadNum()+"\n");
                        HashMap para=cresult.getParaValueList();
                        
                        
                        if(para!=null){
                            Object objpara[]= para.values().toArray();
                            for(int k=0;k<objpara.length;k++){
                                ParametricResult presult=(ParametricResult)objpara[k];
                                out.println("      Para Name : "+presult.getParaname()+"\n");
                                out.println("      Para Type : "+presult.getParatype()+"\n");
                                out.println("      Para Value : "+presult.getValue()+"\n");
                            }
                        }
                    }
                }
            }
			*/
			
            
	    		  
		}catch(Exception e){
    	  errflag ="y";
		  errmsg=e.toString();
		  //out.print(errmsg);
		} 
   %>
    <input type="hidden" name="huserselectlist" value="<%=huserselectlist%>">
   <% 
    if (errflag!="y"){
%>		  
     <script language="JavaScript">
       var frm = document.form1; 
	   frm.action="testcode_assurance_rawdatacalculation.jsp";	
	   frm.submit();		
      </script> 
	
<%
   }else if(errflag.equals("y")){
%> 	 
	<input type="hidden" name="errmsg" value="<%=errmsg%>">
	<input type="hidden" name="errflag" value="<%=errflag%>">	  
	 
    <script language="JavaScript">
      var frm = document.form1; 
	  frm.action="testcode_assurance_filedetail.jsp";	
	  frm.submit();		
     </script> 
	
<%
}
%>
</form> 