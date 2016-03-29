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

        String line="";
		String shift="";
		String selectStr="";
		
		if(request.getParameter("line")==null){
     	   line="";
		}else{
			line=request.getParameter("line");
	   }

	   if(request.getParameter("shift")==null){
     	   shift="";
		}else{
		   shift=request.getParameter("shift");
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
		  <%@ include file="menu_system.jsp" %>
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
                <td style="TEXT-ALIGN: center" valign="top" nowrap="nowrap" bgcolor="#e8eefa"><form action="record_process.jsp"  method="post" name="form1" target="_parent" id="form1">
                <table width="102%" border="0">
                  <tr> 
                    <td width="94%" align="left"><table width="100%" border="0">
                        <tr> 
                          <td width="1%">&nbsp;</td>
                          <td width="39%"><span class="style1">Input Data</span></td>
                          <td width="1%">&nbsp;</td>
                          <td width="1%">&nbsp;</td>
                          <td width="55%"><span class="style1">Data Recording 
                            History </span></td>
                          <td width="3%">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td valign="top"><table width="100%" height="100%" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#CCCCFF">
                              <tr> 
                                <td><table width="100%" border="0" align="center">
                                    <tr> 
                                      <td width="30%">&nbsp;</td>
                                      <td width="70%">&nbsp;</td>
                                    </tr>
                                    <tr> 
                                      <td><div align="right"><font size="2">Operator 
                                          ID :</font></div></td>
                                      <td><input name="OperatorID"  type="text" id="OperatorID6" size="20" value="<%=session.getAttribute("s_operator").toString()%>" onkeypress="onEnterOperatorID()"/></td>
                                    </tr>
                                    <tr> 
                                      <td><div align="right"><font size="2">Line 
                                          :</font></div></td>
                                      <td> 
                                        <%					  
					    Vector lineIDList=InventoryReductionManager.getLineIDList();			  
					 %>
                                        <select name="Line" id="Line" onkeypress="onEnterLine()">
                                          <%for(int i=0;i<lineIDList.size();i++){
											  selectStr="";
											if(lineIDList.get(i).equals(line)){selectStr="selected";}
                         %>
                                          <option value="<%=lineIDList.get(i)%>"  <%=selectStr%>> 
                                          <%=lineIDList.get(i)%>
                                          </option>
                                          <%
					   }
					   %>
                                        </select></td>
                                    </tr>
                                    <tr> 
                                      <td><div align="right"><font size="2">Shift 
                                          : </font></div></td>
                                      <td> 
                                        <%					  
					    Vector shiftIDList=InventoryReductionManager.getShiftIDList();			  
					 %>
                                        <select name="Shift" id="Shift" onkeypress="onEnterShift()">
                                          <%for(int i=0;i<shiftIDList.size();i++){
											   selectStr="";
											if(shiftIDList.get(i).equals(shift)){selectStr="selected";}
                         %>
                                          <option value="<%=shiftIDList.get(i)%>" <%=selectStr%>> 
                                          <%=shiftIDList.get(i)%>
                                          </option>
                                          <%
					   }
					   %>
                                        </select></td>
                                    </tr>
                                    <tr> 
                                      <td><div align="right"><font size="2">Input 
                                          Type :</font></div></td>
                                      <td><label> 
                                        <input name="inputType" onkeypress="onEnterInputType()" type="radio" value="VMI" checked="checked" />
                                        VMI</label> <label> 
                                        <input type="radio" name="inputType" onkeypress="onEnterInputType()" value="COI" />
                                        COI</label> </td>
                                    </tr>
                                    <tr> 
                                      <td align="right"><font size="2">Invoice 
                                        No:</font></td>
                                      <td><input name="Invoice"  type="text" id="Invoice" size="35" onkeypress="onEnterInvoice()"/></td>
                                    </tr>
                                    <tr> 
                                      <td width="30%" align="right"><font size="2">Barcode 
                                        :</font></td>
                                      <td><input name="Barcode" disabled  type="text" id="Barcode" size="35" onkeypress="onEnterBarcode()"/></td>
                                    </tr>
                                    <tr> 
                                      <td width="30%" align="right"><font size="2">Supplier 
                                        : </font></td>
                                      <td><input name="SupID" disabled type="text" id="SupID" size="20" /></td>
                                    </tr>
                                    <tr> 
                                      <td align="right"><font size="2">PN :</font></td>
                                      <td><input name="PN" disabled type="text" id="PN" size="20" /></td>
                                    </tr>
                                    <tr> 
                                      <td align="right"><font size="2">Segment 
                                        :</font></td>
                                      <td><input name="Segment" disabled type="text" id="Segment" size="20" /></td>
                                    </tr>
                                    <tr> 
                                      <td align="right"><font size="2">Product 
                                        : </font></td>
                                      <td><input name="Product" disabled type="text" id="Product" size="20" /> 
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td><div align="right"><font size="2">Quantity :</font></div></td>
                                      <td><input name="qty" type="text" disabled id="qty" size="10" onkeypress="onEnterQty()" />
                                        /<strong><font size="2">Lotsi</font>ze</strong> 										
                                        <input name="Lot" disabled type="text" id="Lot"  size="10" /></td>
                                    </tr>
                                    <tr> 
                                      <td>&nbsp;</td>
                                      <td width="70%" align="left" valign="middle">&nbsp; 
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td>&nbsp;</td>
									  <td><input name="Save" type="button" id="Save6" value="Save" onclick="clickSave()" />
                                        <input name="Clear" type="reset" id="Clear" value="Clear" /></td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
									  <td>&nbsp;</td>
                                    </tr>
                                  </table></td>
                              </tr>
                            </table>
                            <span class="style1"><br />
                            </span></td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td valign="top"><table width="100%" height="385" border="0" align="right"  cellpadding="0" cellspacing="0" bordercolor="#CCCCFF">
                              <tr> 
                                <td height="380" align="center" valign="top"> 
                                  <%
			     Vector sessionRecorddata = ( Vector )session.getAttribute( "s_dataRecording" ) ;				
				 Rawdata ra=null;
			   %>
                                  <p>&nbsp;</p>
                                  <table width="94%" border="1" cellspacing="0" cellpadding="0">
                                    <tr bgcolor="#CCCCCC"> 
									  <td><div align="center"><font size="1"><strong>No</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>PN</strong></font></div></td>
									  <td><div align="center"><font size="1"><strong>Supplier</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>Shift</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>Line</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>Product</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>Segment</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>Input 
                                          Type</strong></font></div></td>
									  <td><div align="center"><font size="1"><strong>Invoice_no</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>QTY</strong></font></div></td>
                                      <td><div align="center"><font size="1"><strong>TimeStamp</strong></font></div></td>
                                    </tr>
                                    <%
                   

                   int count=0;
                   int index=sessionRecorddata.size()-1;

				   if(index<0){
					   %>
                               <tr> 
									<td height="22"><div align="center"> &nbsp;</div></td>
                                      <td height="22"><div align="center">&nbsp;</div></td>
                                      <td><div align="center"> &nbsp;</div></td>
                                      <td><div align="center"> &nbsp;</div></td>
                                      <td><div align="center">&nbsp;</div></td>
                                      <td><div align="center"> &nbsp;</div></td>
                                      <td><div align="center">&nbsp;</div></td>
                                      <td><div align="center">&nbsp;</div></td>
                                      <td><div align="center"> &nbsp;</div></td>
                                    </tr>
								<%
				   }
				   while (count<10 && index>=0){

                     ra=(Rawdata)sessionRecorddata.get(index);
					 index--;
					 count++;
				%>
                                    <tr> 
									<td height="22"><div align="center"> <font size="1"> 
                                          <%=count%>
                                          </font></div></td>
                                      <td height="22"><div align="center"> <font size="1"> 
                                          <%=ra.getPn()%>
                                          </font></div></td>
									   <td height="22"><div align="center"> <font size="1"> 
                                          <%=ra.getSupplier_id()%>
                                          </font></div></td>	
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getShift_id()%>
                                          </font></div></td>
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getLine_id()%>
                                          </font></div></td>
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getProduct_id()%>
                                          </font></div></td>
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getSegment_id()%>
                                          </font></div></td>
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getInput_Type()%>
                                          </font></div></td>
									  <td><div align="center"> <font size="1"> 
                                          <%=ra.getInvoice_no()%>
                                          </font></div></td>
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getQty()%>
                                          </font></div></td>
                                      <td><div align="center"> <font size="1"> 
                                          <%=ra.getTimestamp()%>
                                          </font></div></td>
                                    </tr>
                                    <%
			   }	
				%>
                                  </table>
                                  <p>&nbsp;</p></td>
                              </tr>
                            </table></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                      
                    </td>
                  </tr>
                  <tr> 
                    <td></td>
                  </tr>
                  <tr> 
                    <td></td>
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



function clickSave(){
	var frm = document.form1;
	var alertmsg="";
	var jOperatorID=frm.OperatorID.value;
	var jLine=frm.Line.value;	
	var jShift=frm.Shift.value;	
	var jInvoice=frm.Invoice.value;
	var jBarcode=frm.Barcode.value;
	var jSupID=frm.SupID.value;	
	var jPN=frm.PN.value;
	var jSegment=frm.Segment.value;
	var jProduct=frm.Product.value;	
	var jLot=frm.Lot.value;
	var jQty=frm.qty.value;
	
	//Check Operator ID
	alertmsg=alertmsg+IsEmpty(jOperatorID,"Operator ID");
	alertmsg=alertmsg+CheckLength(jOperatorID,7 ,"Operator ID");
	
	//Check Line ID
	alertmsg=alertmsg+IsEmpty(jLine,"Line");
	alertmsg=alertmsg+CheckLength(jLine,4,"Line");

    //Check Shift ID
    alertmsg=alertmsg+IsEmpty(jShift,"Shift");
	alertmsg=alertmsg+CheckLength(jShift,2,"Shift");

//Check Invoice
    alertmsg=alertmsg+IsEmpty(jInvoice,"Invoice");	

//Check BarCode
    alertmsg=alertmsg+IsEmpty(jBarcode,"Barcode");
	alertmsg=alertmsg+CheckLength(jBarcode,18,"Barcode");

 //Check Supplier ID
    alertmsg=alertmsg+IsEmpty(jSupID,"Supplier ID");
	alertmsg=alertmsg+CheckLength(jSupID,3,"Supplier ID");

 // Check PN
    alertmsg=alertmsg+IsEmpty(jPN,"PN");
	alertmsg=alertmsg+CheckLength(jPN,7,"PN");

	//Check Segment
    alertmsg=alertmsg+IsEmpty(jSegment,"Segment");
	alertmsg=alertmsg+CheckLength(jSegment,2,"Segment");

	 //Check Product
    alertmsg=alertmsg+IsEmpty(jProduct,"Product");
	alertmsg=alertmsg+CheckLength(jProduct,3,"Product");

	//Check Quantity
    alertmsg=alertmsg+IsEmpty(jLot,"Lot Size");	
	alertmsg=alertmsg+ IsNumeric(jLot,"Lot Size");

	//Check Quantity
    alertmsg=alertmsg+IsEmpty(jQty,"Quantity");	
	alertmsg=alertmsg+ IsNumeric(jQty,"Quantity");	
	var nQty=parseInt(jQty);
	var nLot=parseInt(jLot);
	if(nQty>nLot ){
	   alertmsg=alertmsg+"The Quantity should less than or equal "+jLot+".";
	}
   
    
	if (alertmsg!="")
	{
        alert(alertmsg);
	}else{
       frm.SupID.disabled=false;	
	   frm.PN.disabled=false;
	   frm.Segment.disabled=false;
	   frm.Product.disabled=false;	
	   frm.Lot.disabled=false;
	   frm.qty.disabled=false;	  
	  
       frm.action = "record_process.jsp";		
	   frm.submit();		  
	}

}


function StartFocus(){
  var frm = document.form1; 
  //frm.OperatorID.focus();	
  frm.Invoice.focus();
	
}

function onEnterOperatorID(){
if(event.keyCode==13)
   var frm = document.form1;
   frm.Line.focus();

}

function onEnterLine(){
if(event.keyCode==13)

var frm = document.form1;
	frm.Shift.focus();

}

function onEnterShift(){
if(event.keyCode==13)

var frm = document.form1;
frm.Barcode.focus();
	
}

function onEnterInputType(){
if(event.keyCode==13)

var frm = document.form1;
	frm.Invoice.focus();

}

function onEnterInvoice(){
if(event.keyCode==13)
var frm = document.form1;
var jInvoice=frm.Invoice.value;
	
 
 if(jInvoice!=""){
     frm.Barcode.disabled=false;
	 frm.Barcode.focus();

 }

}

function onEnterQty(){
if(event.keyCode==13)

var frm = document.form1;
		frm.Save.focus();
}

function onEnterBarcode(){
if(event.keyCode==13){

var frm = document.form1;

var temp =frm.Barcode.value;
frm.Barcode.value =temp.substring(0,18).toUpperCase();
frm.SupID.value =temp.substring(0,3).toUpperCase();
frm.Segment.value =temp.substring(3,5).toUpperCase();
frm.Product.value =temp.substring(5,8).toUpperCase();
frm.PN.value =temp.substring(8,15).toUpperCase();
frm.Lot.value =temp.substring(15,18).toUpperCase();
frm.qty.value =temp.substring(15,18).toUpperCase();
if(frm.Barcode.value==""){
	frm.qty.disabled=true;
}else{
	frm.qty.disabled=false;	
	frm.qty.focus();
}


}
}

function IsNumeric(sText,filedName)
{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var alertmsg="";
   var Char;
 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   
   if (IsNumber==false)
	{
	   alertmsg="The " + filedName + " should be numeric.\n" ;	  
	}
	return alertmsg;    
}

function IsEmpty(sText,filedName){	
	var alertmsg=""; 
	  if (sText=="")
	  {         
          alertmsg="The " + filedName + " should not empty.\n" ;		  
	  }
	  return alertmsg;  
	}

function CheckLength(sText,strLength,filedName){	
	var alertmsg=""; 
    
	  if (sText.length!=strLength)
	  { 	      
	    alertmsg="The "+filedName + " should have "+strLength+ " digit.\n" ;

	  }
	  return alertmsg;  
}


/*
function checkOperatorID() {
	var ValidChars = "0123456789";
	var IsNumber=true;
	var Char;
	var frm = document.form1;
	var jOperatorID=frm.OperatorID.value;
	
	for (i = 0; i < jOperatorID.length && IsNumber == true; i++) 
	{ 
		Char = jOperatorID.charAt(i); 
		if (ValidChars.indexOf(Char) == -1 ) 
			IsNumber = false;
	}
	return IsNumber;
}
*/
</script>