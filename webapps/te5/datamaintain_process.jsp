<%@ include file="session.jsp"%>
<%@ page buffer="30kb"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %> 
<%@ page import="com.hitachigst.prb.itd.itdtools.datamaintain.*"%>
<%@ page import ="java.util.*"%>


<%

	String mainatainselect= request.getParameter("datamaintain");
	String maintainevent= request.getParameter("maintainevent");    
	 out.println("maintainevent : "+maintainevent);
	 out.println("mainatainselect : "+mainatainselect);

	DataMaintain dmaintain = new DataMaintainanceManager().getDataMaintain(mainatainselect.trim());

	Vector fieldList = dmaintain.getFieldList();   	     
	 DataMainTainFieldInfo fieldInfo = null;	  
  	 HashMap hm=new HashMap();
     String errormessage="";

    if(maintainevent.equals("adddata")){
		 for (int i = 0; i < fieldList.size(); i++) 
		  { 		 
			  fieldInfo = (DataMainTainFieldInfo) fieldList.get(i);	
			  hm.put(fieldInfo.getFieldName(), request.getParameter(fieldInfo.getFieldName()));
			  out.println(" ,"+fieldInfo.getFieldName() + " = " + String.valueOf(hm.get(fieldInfo.getFieldName())));
		  }

		  errormessage = new DataMaintainanceManager().insertDataMaintain(dmaintain, hm);

		  if (errormessage.equals("")) {
		%>
		<jsp:forward page="datamaintain.jsp">
			<jsp:param name="datamaintain" value="<%=mainatainselect.trim()%>" />
		</jsp:forward>
		<%
		} else {
		%>
		<jsp:forward page="error.jsp">
			<jsp:param name="errormessage" value="<%=errormessage%>" />
		</jsp:forward>
		<%
				}

     }else if(maintainevent.equals("deletedata")){
          String delete[]=request.getParameterValues("deleteData");
          String tmp[]=null;
		  String deleteDetail="";
		  
		  for(int j=0;j<delete.length;j++){            
              tmp=delete[j].split("~~");  		    
              hm.clear();
			  deleteDetail="";
             for (int i = 0; i < fieldList.size(); i++) 
			  { 					
				  fieldInfo = (DataMainTainFieldInfo) fieldList.get(i);	
				  hm.put(fieldInfo.getFieldName(), tmp[i]);

				  deleteDetail=deleteDetail+fieldInfo.getFieldName() + " = '" + String.valueOf(hm.get(fieldInfo.getFieldName()))+"' , ";
			   }
               
			   errormessage = new DataMaintainanceManager().deleteDataMaintain(dmaintain, hm);		
				
		  }	
		 	 if (errormessage.equals("")) {
				%>
				<jsp:forward page="datamaintain.jsp">
					<jsp:param name="datamaintain" value="<%=mainatainselect.trim()%>" />
				</jsp:forward>
				<%
				} else {
					errormessage=errormessage +"\n\n"+ deleteDetail.substring(0, 
                    deleteDetail.length() - 2);
				%>
				<jsp:forward page="error.jsp">
					<jsp:param name="errormessage" value="<%=errormessage%>" />
				</jsp:forward>
				<% 
				}
     }else if(maintainevent.equals("editdata")){
           String bfEdit[]=request.getParameter("beforeEdit").split("~~");		   		  
           HashMap preHm=new HashMap();                
              hm.clear();
			  
             for (int i = 0; i < fieldList.size(); i++) 
			  { 					
				  fieldInfo = (DataMainTainFieldInfo) fieldList.get(i);	
				  hm.put(fieldInfo.getFieldName(), request.getParameter(fieldInfo.getFieldName()));
				  preHm.put(fieldInfo.getFieldName(), bfEdit[i]);

				out.println(" ,"+fieldInfo.getFieldName() + " = " + String.valueOf(hm.get(fieldInfo.getFieldName())));
			   }
               
			  errormessage = new DataMaintainanceManager().updateDataMaintain(dmaintain,preHm, hm);		
				
		        if (errormessage.equals("")) {
		%>
		<jsp:forward page="datamaintain.jsp">
			<jsp:param name="datamaintain" value="<%=mainatainselect.trim()%>" />
		</jsp:forward>
		<%
		} else {
		%>
		<jsp:forward page="error.jsp">
			<jsp:param name="errormessage" value="<%=errormessage%>" />
		</jsp:forward>
		<%
				}
		 	
	 }
	 


%>
