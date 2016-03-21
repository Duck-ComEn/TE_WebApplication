<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>Customer ID to First and Last Name using XmlHttpRequest</title>
<script language="javascript" type="text/javascript">

var url = "getCustomerInfo.jsp?customerID="; // The server-side script

var http = getHTTPObject(); // We create the XMLHTTPRequest Object
  
function handleHttpResponse() {
    if (http.readyState == 4) {
	       alert("http.status : "+http.status); 
        if (http.status == 200) {
            alert("handleHTTPResponse");            
                    
            // Split the comma delimited response into an array.

            //For plain text response (not XML formatted),
            //results = http.responseText.split(",");                    
                    
            // Or for XML formatted response text:
            var message = http.responseXML.getElementsByTagName("message")[0];
            results = message.childNodes[0].nodeValue.split(",");
			alert("handleHTTPResponse ::" + results[0]);
            document.getElementById('firstname').value = results[0];
            document.getElementById('lastname').value = results[1];
        } else {
           alert ( "Not able to retrieve name" );
        }
    }    
}

   
  function updateFirstLastName() {
     //alert("updateFirstNameLastName");
        
    var customerIDValue = document.getElementById("customerID").value;
	alert("Test :: "+customerIDValue);
    http.open("GET", url + escape(customerIDValue), true);
    http.onreadystatechange = handleHttpResponse;
    http.send(null);
  }
  
  function getHTTPObject() {	
    var xmlhttp;	
    if (window.XMLHttpRequest) {	
       xmlhttp = new XMLHttpRequest();	
	}else if (window.ActiveXObject) {	    
	   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");	
    }	 	
    return xmlhttp;
  }
</script>
</head>
<body>
<form action="post"> 
<p> 
Customer ID: 
<input type="text" size="5" name="customer ID" id="customerID" onblur="updateFirstLastName();" /> 
</p> 
First Name: 
<input type="text" name="First Name" id="firstname" /> 
Last Name: 
<input type="text" size="2" name="Last Name" id="lastname" />
</form>
</body>
</html>