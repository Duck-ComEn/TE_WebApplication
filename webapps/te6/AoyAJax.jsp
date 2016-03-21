<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>Customer ID to First and Last Name using XmlHttpRequest</title>
<script language="Javascript">
    // new for ajax
    function Inint_AJAX() {

            try { return new XMLHttpRequest();          } catch(e) {} //Native Javascript
            try { return new ActiveXObject("Msxml2.XMLHTTP");  } catch(e) {} //IE
            try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch(e) {} //IE
            alert("XMLHttpRequest not supported");
            return null;
    }
    
    function submitURL() {
             var req = Inint_AJAX();
             var consolidateno = document.form1.consolidateno.options[document.form1.consolidateno.selectedIndex].value;
             var caseno = document.form1.caseno.options[document.form1.caseno.selectedIndex].value;
             var pkgid = document.form1.pkgid.options[document.form1.pkgid.selectedIndex].value;
             var palletpn = document.form1.palletpn.options[document.form1.palletpn.selectedIndex].value;
             var available = document.form1.available.options[document.form1.available.selectedIndex].value;
             var date = document.form1.date.options[document.form1.date.selectedIndex].value;
             //alert(consolidateno);
             var url = "showdata.jsp?consolidateno=" + consolidateno + "&caseno=" + caseno + "&pkgid=" + pkgid 
                            + "&palletpn=" + palletpn + "&available=" + available + "&date=" + date 
                            + "&time=" + new Date().getTime();
             //create connection
             req.open("GET", url, true); 
             req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=tis-620"); // set Header

             req.onreadystatechange = function () {
                      if (req.readyState==4) {
                               if (req.status==200) {
                                            document.getElementById("showdata").innerHTML=req.responseText; //get return value
                               }
                      }
            };
             req.send(null); 
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