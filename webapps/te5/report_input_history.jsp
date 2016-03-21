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
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="James Koster || www.sixshootermedia.com" />
    <meta name="copyright" content="" />
    <meta name="company" content="" />

    <meta name="revisit-after" content="7 days" />
	
	<%	
		String version="";
		String webname="";
		webname=IniFilesReader.getReturnProperties("Local.Application","Application Name");	
		version=InventoryReductionVersionControl.getVersion();
        
		String pn="";
		String supplier="";
		String shift="";
		String line="";
		String product="";
		String segment="";
		String inputType="";
		String invoice_on="";
		
		String dataDate="";
        String update_by="";
        Vector reportDataList=null;
		String showListFlag="clear";//request.getParameter("submitFlag").toString();
        String radioSelectStr="";

		int reportDatabeginRow=1;
		int numRowPerPage=10;
		int qty=0;
		int recordcount=0;

		if(request.getParameter("submitflag")==null){
     	   showListFlag="clear";
		}else{
			showListFlag=request.getParameter("submitflag");
	   }

	  if(request.getParameter("brownum")==null || request.getParameter("brownum").equals("")){
     	   reportDatabeginRow=1;
		}else{
			reportDatabeginRow=Integer.parseInt(request.getParameter("brownum"));
	  }
      // out.println("brownum : "+request.getParameter("brownum"));
	   


		//out.println("submitFlag1 : "+request.getParameter("submitflag"));

            
	if(showListFlag.equals("show")){  			
			supplier=request.getParameter("Supplier");
		    shift=request.getParameter("Shift");
		    line=request.getParameter("Line");
		    product=request.getParameter("Product");
		    segment=request.getParameter("Segment");
		    inputType=request.getParameter("InputType");
			invoice_on=request.getParameter("invoice");    
		    dataDate=request.getParameter("dataDate");
            update_by=request.getParameter("Update_by");
            
			Rawdata ra=new Rawdata();
		
			ra.setShift_id(shift);
			ra.setLine_id(line);
			ra.setSupplier_id(supplier);
			ra.setProduct_id(product);
			ra.setSegment_id(segment);
			if(dataDate.equals("all")){
			  ra.setTimestamp(null);
			}else{
			  ra.setTimestamp(InventoryReductionManager.covertStringToTimestamp(dataDate));
			}
			ra.setInput_Type(inputType);
			ra.setInvoice_no(invoice_on);
			ra.setUpdate_by(update_by);		
		  
		 reportDataList=InventoryReductionManager.getReportDataList(ra,((numRowPerPage)*reportDatabeginRow)-numRowPerPage+1,(numRowPerPage)*reportDatabeginRow); 
				  
         recordcount =InventoryReductionManager.getReportCountTotalRow(ra);
      //  out.println("sql : "+InventoryReductionManager.getReportSQL(ra,((numRowPerPage)*reportDatabeginRow)-numRowPerPage+1,(numRowPerPage)*reportDatabeginRow));
          /* out.println("supplier : "+supplier);
			out.println("shift : "+shift);
			out.println("line : "+line);
			out.println("product : "+product);
			out.println("segment : "+segment);
			out.println("inputType : "+inputType);
			out.println("dataDate : "+dataDate);
			out.println("update_by : "+update_by);*/
            					
             
		}
		
       	%>
	

	
	<title><% out.println(webname); %></title>
	
    <link href="DATA-INF/CSS/1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
<!--
.form-noindent {	BORDER-RIGHT: #c3d9ff 1px solid; BORDER-TOP: #c3d9ff 1px solid; BORDER-LEFT: #c3d9ff 1px solid; BORDER-BOTTOM: #c3d9ff 1px solid; BACKGROUND-COLOR: #ffffff
}
.style1 {font-size: 16px;
	font-weight: bold;
}
.style2 {font-size: 12px; font-family: Tahoma; color: #000000;}
.style3 {font-size: 36px}
-->
    </style>
</head>

<body onload="StartFocus()">
     
	<div id="header">
	  <div id="header-container">
			 <p>Version : <% out.println(version); %> | <a href="#Top">Logon: <% out.println(session.getAttribute("s_username").toString().trim()); %></a><br />
			</p> 
	  <img src="DATA-INF/Image/logo.jpg" alt="Your Logo" title="Your Logo" />
		  <h1><a name="Top" id="Top"></a><a href="#Top"><% out.println(webname); %> </a></h1>
		  <%@ include file="menu_report_process.jsp" %>
			<br class="clear" />
	  </div>
	</div>
	<table width="100%" height="100%" border="0">
      <tr>
        <td height="530" align="center" valign="top">
          <table class="form-noindent" cellspacing="3" cellpadding="5" width="98%" 
      border="0">
            <tbody>
               <tr>
                <td height="248" valign="top" nowrap="nowrap" bgcolor="#e8eefa" style="TEXT-ALIGN: center"><form   method="post" name="form1" target="_parent" id="form1">
                <table width="102%" border="0">
                  <tr> 
                    <td width="94%" height="30" align="left"><table width="100%" border="0">
                        <tr> 
                          <td width="3%">&nbsp;</td>
                          <td width="94%"><span class="style1">Data Input History</span></span>&nbsp;</td>
                          <td width="3%">&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="23" align="left" valign="top"><table width="100%" border="0">
                        <tr> 
                          <td width="22%" height="32"><table width="100%" border="0">
                              <tr> 
                                <td width="42%" height="26"><div align="right"><span class="style2 style1">Date 
                                    :</span></div></td>
                                <td width="58%"> <select name="dataDate" id="select9" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initDate=InventoryReductionManager.getReportInitDate();
										 
										for(int i=0 ; i<initDate.size();i++){	
											radioSelectStr="";
											if(initDate.get(i).equals(dataDate)){radioSelectStr="selected";}
										%>
                                    <option value="<%=initDate.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initDate.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select></td>
                              </tr>
                            </table></td>
                          <td width="27%"><table width="100%" border="0">
                              <tr> 
                                <td width="49%"><div align="right"><span class="style2 style1">Line 
                                    :</span></div></td>
                                <td width="51%"><select name="Line" id="select24" onkeypress="onEnterLine()">
                                    <option value="all" >--- ALL ---</option>
                                    <%
									     Vector initLine=InventoryReductionManager.getReportInitLine();
										
										for(int i=0 ; i<initLine.size();i++){	
											radioSelectStr="";
											if(initLine.get(i).equals(line)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initLine.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initLine.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                          <td width="24%"><table width="100%" border="0">
                              <tr> 
                                <td width="43%"><div align="right"><span class="style2 style1">Segment 
                                    :</span></div></td>
                                <td width="57%"><select name="Segment" id="select20" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initSegment=InventoryReductionManager.getReportInitSegment();
										
										for(int i=0 ; i<initSegment.size();i++){	
											radioSelectStr="";
											if(initSegment.get(i).equals(segment)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initSegment.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initSegment.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr> 
                          <td><table width="100%" border="0">
                              <tr> 
                                <td width="42%" height="26"><div align="right"><span class="style2 style1">Supplier 
                                    :</span></div></td>
                                <td width="58%"> <select name="Supplier" id="select2" onkeypress="">
                                    <option value="all">--- ALL ---</option>
                                    <%
							           Vector initSupplier=InventoryReductionManager.getReportInitSupplier();
										
										for(int i=0 ; i<initSupplier.size();i++){
											radioSelectStr="";
											if(initSupplier.get(i).equals(supplier)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initSupplier.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initSupplier.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select></td>
                              </tr>
                            </table></td>
                          <td><table width="100%" border="0">
                              <tr> 
                                <td width="48%" height="21"><div align="right"><span class="style2 style1">Shift 
                                    :</span></div></td>
                                <td width="52%"><select name="Shift" id="select" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initShift=InventoryReductionManager.getReportInitShift();
										
										for(int i=0 ; i<initShift.size();i++){	
											radioSelectStr="";
											if(initShift.get(i).equals(shift)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initShift.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initShift.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                          <td><table width="100%" border="0">
                              <tr> 
                                <td width="43%" height="27"><div align="right"><span class="style2 style1">Product 
                                    :</span></div></td>
                                <td width="57%"><select name="Product" id="select26" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initProduct=InventoryReductionManager.getReportInitProduct();
										
										for(int i=0 ; i<initProduct.size();i++){	
											radioSelectStr="";
											if(initProduct.get(i).equals(product)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initProduct.get(i)%>" <%=radioSelectStr%>>
                                    <%=initProduct.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr> 
                          <td><table width="100%" border="0">
                              <tr> 
                                <td width="42%"><div align="right"><span class="style2 style1">Update_by 
                                    :</span></div></td>
                                <td width="58%"><select name="Update_by" id="select27" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initUpdate_by=InventoryReductionManager.getReportInitUpdateby();
										for(int i=0 ; i<initUpdate_by.size();i++){	
											radioSelectStr="";
											if(initUpdate_by.get(i).equals(update_by)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initUpdate_by.get(i)%>" <%=radioSelectStr%>>
                                    <%=initUpdate_by.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                          <td><table width="100%" border="0">
                              <tr> 
                                <td width="49%" height="26"><div align="right"><span class="style2 style1">Input 
                                    Type :</span></div></td>
                                <td width="51%"><select name="InputType" id="select25" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initInputType=InventoryReductionManager.getReportInitInputType();
										for(int i=0 ; i<initInputType.size();i++){	
											radioSelectStr="";
											if(initInputType.get(i).equals(inputType)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initInputType.get(i)%>" <%=radioSelectStr%>>
                                    <%=initInputType.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                          <td><table width="100%" border="0">
                              <tr> 
                                <td width="43%" height="26"><div align="right"><span class="style2 style1">Invoice 
                                    no:</span></div></td>
                                <td width="57%"><select name="invoice" id="select3" onkeypress="onEnterLine()">
                                    <option value="all">--- ALL ---</option>
                                    <%
									     Vector initInvoice=InventoryReductionManager.getReportInitInvoiceno();
										for(int i=0 ; i<initInvoice.size();i++){	
											radioSelectStr="";
											if(initInvoice.get(i).equals(invoice_on)){radioSelectStr="selected";}									
										%>
                                    <option value="<%=initInvoice.get(i)%>" <%=radioSelectStr%>> 
                                    <%=initInvoice.get(i)%>
                                    </option>
                                    <%
									}
									%>
                                  </select> </td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr> 
                          <td>&nbsp;</td>
                          <td><div align="center"> 
                              <input name="showData" type="button" id="showData" value="Show List" onclick="ShowListClick()" />
                              <input name="deleteData" type="button" id="deleteData" value="Delete Data" onclick="deleteClick()" />
                              <input type="reset" name="Submit2" value="Clear" onclick="clearClick()" />
                            </div></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="30"><input type="hidden" name="submitflag"  value=""/> 
                    </td>
					<td height="30"><input type="hidden" name="brownum"  value=""/> 
                    </td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr>
                          <td width="22%" height="42"><div align="right"><span class="style1">Total Record 
                              Count :</span></div></td>
                          <td width="52%"><div align="left"><span class="style1">
                              <%=recordcount%>
                              </span></div></td>
                          <td width="26%">&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr> 
                          <td width="5%" >&nbsp;</td>
                          <td width="5%" align="center"><div align="center"><span class="style2 style1">PN</span></div></td>
                          <td width="10%" align="center"><div align="center"><span class="style2 style1">Supplier</span></div></td>
                          <td width="6%" align="center"><div align="center"><span class="style2 style1">Shift</span></div></td>
                          <td width="6%" ><div align="center"><span class="style2 style1">Line</span></div></td>
                          <td width="10%" ><div align="center"><span class="style2 style1">Product</span></div></td>
                          <td width="11%" ><div align="center"><span class="style2 style1">Segment</span></div></td>
                          <td width="13%" ><div align="center"><span class="style2 style1">Input 
                              Type</span></div></td>
						  <td width="13%" ><div align="center"><span class="style2 style1">Invoice No</span></div></td>
                          <td width="7%" ><div align="center"><span class="style2 style1">QTY</span></div></td>
                          <td width="13%" ><div align="center"><span class="style2 style1">Timestamp</span></div></td>
                          <td width="14%" ><div align="center"><span class="style2 style1">Update 
                              By</span></div></td>
                        </tr>
                        


<%                      
                        int roundofRow=recordcount/numRowPerPage;
						int roundofRemnant=recordcount%numRowPerPage;
						//out.println("roundofRow : "+roundofRow);
						//out.println("roundofRemnant : "+roundofRemnant);
						//out.println("recordcount : "+recordcount);
						  
						if (showListFlag.equals("show")){                      

                        for(int i=0 ; i<reportDataList.size();i++){				
						

								Rawdata tmpRA=(Rawdata)reportDataList.get(i);
					String optionValues=tmpRA.getPn()+"~~"+tmpRA.getSupplier_id()
+"~~"+tmpRA.getShift_id()+"~~"+tmpRA.getLine_id()+"~~"+tmpRA.getProduct_id()+"~~"+tmpRA.getSegment_id()
+"~~"+tmpRA.getInput_Type()+"~~"+tmpRA.getTimestamp().toString()+"~~"+tmpRA.getInvoice_no().toString();

						 %>
                        <tr> 
                          <td > <div align="right"> 
                              <input type="checkbox" name="reportData" value="<%=optionValues%>" />
                            </div></td>
                          <td align="center"><div align="center"><span class="style2"> 
                              <%=tmpRA.getPn()%>
                              </span></div></td>
                          <td align="center"><div align="center"><span class="style2"> 
                              <%=tmpRA.getSupplier_id()%>
                              </span></div></td>
                          <td align="center"><div align="center"><span class="style2"> 
                              <%=tmpRA.getShift_id()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getLine_id()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getProduct_id()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getSegment_id()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getInput_Type()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getInvoice_no()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getQty()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getTimestamp()%>
                              </span></div></td>
                          <td ><div align="center"><span class="style2"> 
                              <%=tmpRA.getUpdate_by()%>
                              </span></div></td>
                        </tr>
                        <%
						  } 
						
							
					
						  }
						 %>


                      </table></td>
                  </tr>
                  <tr> 
                    <td height="30"><table width="100%" border="0">
                        <tr>
                          
							  <%
							  if (roundofRemnant>0){roundofRow=roundofRow+1;}
							  if(roundofRow>1){
								%>
								<td width="22%"><div align="right"><span class="style2 style1">Record 
                              Count : </span></div></td>
								  
								  <td width="44%"> <div align="left">
								  <%
								    for(int i=1;i<=roundofRow;i++){
									 %><a href="javascript:querydata(<%=i%>)"><%=i%></a> &gt; <%  
								    }
								  %>
									  
									  </div></td>
								   <td width="34%">&nbsp;</td>
								<%
							  }
							  
							  %>
                          
                         
                        </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td height="30"></td>
                  </tr>
                </table>
                </form>

               
              
            </td>
              </tr>
            </tbody>
          </table>
    </td>
      </tr>
    </table>
<div id="footer">
		<div id="footercontent">
			&copy; Hitachi Global Storage Techonologies (Thailand) Ltd.All rigths reserved</div>
</div>

</body>
</html>

<script language="JavaScript" src="JSAX-INF/utilities.js"></script>
<script language="JavaScript" src="JSAX-INF/common.js"></script>
<script language="JavaScript">

function ShowListClick(){
  var frm = document.form1; 
  frm.submitflag.value="show";   
  frm.action="report_input_history.jsp";	
  frm.submit();
}

function deleteClick(){
  var frm = document.form1;  
 
  var alertmsg="Please select data for delete.";
  var count=frm.reportData.length;
  if(typeof count == 'undefined' ){
	  count=1;
  }
	if(count>=2){
		  for(i=0;i<count;i++){
		   if (frm.reportData[i].checked==true)
		   {
			   alertmsg="";
		   }	   
		}
	}else if(count<2){		
	   if (frm.reportData.checked==true)
	  {
		   alertmsg="";
	   }
	}
	    
	if(alertmsg == ""){
		frm.action="report_input_history_delete.jsp";		
		if(confirm("Confirmation?")){
			frm.submit();		
		}		
	}else{
		alert(alertmsg);
		frm.submitflag.value="show"; 
	} 	
  
}

function clearClick(){
  var frm = document.form1; 
  frm.submitflag.value="clear"; 
  frm.action="report_input_history.jsp";	
  frm.submit();
}


function StartFocus(){
  var frm = document.form1; 
  frm.showData.focus();	
	
}

function querydata(bRow){
 var frm = document.form1; 
 var bintRow=parseInt(bRow);
 frm.brownum.value=bintRow; 
 frm.submitflag.value="show";  
 frm.action="report_input_history.jsp";	
 frm.submit();
}


</script>