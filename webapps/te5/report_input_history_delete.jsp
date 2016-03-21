<%@ include file="session.jsp"%>
<%@ page buffer="30kb"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %> 
<%@ page import="com.hitachigst.prb.itd.itdtools.datamaintain.*"%>
<%@ page import ="com.hitachigst.prb.itd.inventoryreduction.*"%>
<%@ page import ="java.util.*"%>


<%

	      String delete[]=request.getParameterValues("reportData");
          String tmp[]=null;
		  String errorDetail="";
		  Rawdata ra=null;
          String errormessage="";

		 for(int j=0;j<delete.length;j++){            
              tmp=delete[j].split("~~"); 		               
              ra=new Rawdata();

              ra.setPn(tmp[0]); 
			  ra.setSupplier_id(tmp[1]);			  
			  ra.setShift_id(tmp[2]);
			  ra.setLine_id(tmp[3]);
			  ra.setProduct_id(tmp[4]);
			  ra.setSegment_id(tmp[5]);
			  ra.setInput_Type(tmp[6]);
			  ra.setStrTimestamp(tmp[7]);
			  ra.setInvoice_no(tmp[8]);
			  
              

			errormessage=InventoryReductionManager.deleteRawData(ra,session.getAttribute( "s_username" ).toString());
            
			if(errormessage.equals("")==false){
				errorDetail=errorDetail+" pn='" + ra.getPn()+"' , supplier_id='"+ra.getSupplier_id()
				+"' , shift_id='"+ra.getShift_id()+"' , line_id='"+ra.getLine_id()+"' , product_id='"+ra.getProduct_id()
				+"' , segment_id='"+ra.getSegment_id()+"' , input_type='"+ra.getInput_Type()+"' , invoice_on='"+ra.getInvoice_no()+"' , timestamp='"+ra.getStrTimestamp()+"' \n "+errormessage+"\n\n";
			}else{
				
				session.setAttribute("s_dataRecording", new Vector());
			}
             /* out.println(ra.getPn());
				out.println(ra.getSupplier_id());
				out.println(ra.getShift_id());
				out.println(ra.getLine_id());
				out.println(ra.getProduct_id());
				out.println(ra.getSegment_id());
				out.println(ra.getInput_Type());
				out.println(ra.getQty());
				out.println(ra.getTimestamp());
				out.println(ra.getUpdate_by()); */
			  // errormessage = new DataMaintainanceManager().deleteDataMaintain(dmaintain, hm);		
				
		  }	

		 
          if (errorDetail.equals("")) {

				 


				%>
				<jsp:forward page="report_input_history.jsp">
					<jsp:param name="submitflag" value="show" />
				</jsp:forward>
				<%
				} else {					
				%>
				<jsp:forward page="error.jsp">
					<jsp:param name="errormessage" value="<%=errorDetail%>" />
				</jsp:forward>
				<% 
				}    

%>
