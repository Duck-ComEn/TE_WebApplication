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
		

    String operator = "";
	String line = "";
    String shift="";
	String inputType="";
	String supplierID="";
	String pn="";
	String segment="";
	String product="";
	String invoice_no="";
	
	int qty=0;
	int lotSize=0;
	int maxSize=0;
	String errormessage = "";
	String[] errormsg=new String[4];
	errormsg[0]="";errormsg[1]="";errormsg[2]="";errormsg[3]="";

	operator=request.getParameter("OperatorID");
	line=request.getParameter("Line");
	shift=request.getParameter("Shift");
	inputType=request.getParameter("inputType");
    invoice_no=request.getParameter("Invoice");
	supplierID=request.getParameter("SupID");				
	pn=request.getParameter("PN");
	segment=request.getParameter("Segment");
	product=request.getParameter("Product");
    qty=Integer.parseInt(request.getParameter("qty"));
	lotSize=Integer.parseInt(request.getParameter("Lot"));
    
    // Check information for supplier
	String tmp=InventoryReductionManager.getSupplierLotSize(supplierID);

	if(tmp.length()<10){
        maxSize=Integer.parseInt(tmp);
		// Check LotSize
		if(maxSize!=lotSize){
		  errormsg[1]="Lot size checking : "+"The Maximum of Lot size for " +supplierID+ " should be "+maxSize+".";
		}
	}else{
        errormsg[0]="Suppler checking : "+tmp;
	}
	
 
	// Check information for Segment
	tmp=InventoryReductionManager.segmentVerify(segment);
	if(tmp.equals("")==false){
        errormsg[2]="Segement checking : "+tmp;
	}

	// Check information for Product
	tmp=InventoryReductionManager.productVerify(product);
	if(tmp.equals("")==false){
        errormsg[3]="Product checking : "+tmp;
	}
    
	errormessage=errormsg[0]+errormsg[1]+errormsg[2]+errormsg[3];	
	
	if(errormessage.equals("") || errormessage==null ){
        Rawdata ra=new Rawdata();
		ra.setLine_id(line);
		ra.setPn(pn);		
        ra.setSupplier_id(supplierID);
		ra.setProduct_id(product);
		ra.setSegment_id(segment);
		ra.setShift_id(shift);		
		ra.setQty(qty);		
		ra.setInput_Type(inputType);
		ra.setInvoice_no(invoice_no);
		java.sql.Timestamp now=new java.sql.Timestamp( (new java.util.Date()).getTime() );
        ra.setTimestamp(now);


       
		
		errormessage=InventoryReductionManager.insertRawData(ra,session.getAttribute( "s_username" ).toString()); 
		
		if(errormessage!=""){
		   %>
		<jsp:forward page="error.jsp">
			<jsp:param name="errormessage" value="<%=errormessage%>" />
		</jsp:forward> 
		<%
		}else{			
            Vector sessionRecorddata = ( Vector )session.getAttribute( "s_dataRecording" ) ;
       sessionRecorddata.add(ra) ;   
	   session.removeAttribute( "s_dataRecording" ) ;
       session.setAttribute( "s_dataRecording" , sessionRecorddata ) ;
       
	
         //recordData.add(ra);
		// session.setAttribute("s_dataRecording", recordData);	
			%>
			<form name="form1" method="post" action="">
		  <input type="hidden" name="line" value="<%=line%>">
		  <input type="hidden" name="shift" value="<%=shift%>">
		 
			 <script language="JavaScript">
   			 var frm = document.form1; 
			  frm.action="record.jsp";	
	          frm.submit();		
          </script>           
		   </form>
		<%
	
		}	

            
 
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

<body>
     
	<div id="header">
	  <div id="header-container">
			<p>Version : <% out.println(version); %> | <a href="#Top">Logon: <% out.println(session.getAttribute("s_username").toString().trim()); %></a><br />
			</p>
	  <img src="DATA-INF/Image/logo.jpg" alt="Your Logo" title="Your Logo" />
		  <h1><a name="Top" id="Top"></a><a href="#Top"><% out.println(webname); %> </a></h1>
		  <%@ include file="menu_system.jsp" %>
			<br class="clear" />
	  </div>
	</div>
	<table width="100%" border="0">
      <tr>
        <td height="243" align="center" valign="top">



          <table class="form-noindent" cellspacing="3" cellpadding="5" width="91%" 
      border="0">
            <tbody>
               <tr>
                <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form action="record.jsp" method="post" name="form1" target="_parent" id="form1">
                <table width="102%" border="0">
                  <tr> 
                    <td colspan="5" align="left"><span class="style1">Insert Data 
                      Error<br />
                      </span></td>
                  </tr>
                 
				  <tr> 
                    <td width="28%" align="" valign="middle"> <table width="100%" border="0">
                        <tr> 
                          <td width="13%">&nbsp;</td>
                          <td width="78%">&nbsp;</td>
                          <td width="9%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="78%"><div align="left"><span class="style2 style1"><font color="#FF0000">Error 
                              Message ::</font><br />
                              </span></div></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td><font color="#FF0000"><span class="style1">Insert data not complete , Please verify your process again. <br /></font></td>
                          <td>&nbsp;</td>
                        </tr>

                        
                           <tr> 
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>

							<%
						for(int x=0;x<4;x++){
							
							if (errormsg[x]!="" && errormsg[x]!=null){ 						
								%>						
							<tr> 
							  <td>&nbsp;</td>
							  <td><span class="style2"><font color="#FF0000"> 
								<%=errormsg[x]%>
								</font></span></td>
							  <td>&nbsp;</td>
							</tr>                        
                         <%
							}
						}
						%>



					

                        <tr> 
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td><div align="center"> 
                              <input name="back" type="button" id="Back" value="Back" onclick="clickBack()" />
                            </div></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td width="28%" align="center" valign="middle">&nbsp;</td>
                  </tr>
                </table>
                </form>
              </td>
              </tr>
            </tbody>
          </table></td>
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

function clickBack(){
	var frm = document.form1;	
	frm.action = "record.jsp";		
	frm.submit();	
}

</script>
	
