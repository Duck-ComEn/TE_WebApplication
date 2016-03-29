<%
String customerID = request.getParameter("customerID");
alert("Test Next :: "+customerID);
if(customerID != null) {	 
    //System.out.println("before sending response");	
	response.setContentType("text/xml");	
	response.setHeader("Cache-Control", "no-cache");        
	// for plain text response:	
	//response.getWriter().write("John,Doe");        
	// Or for XML formatted response:	
	response.getWriter().write("<message>John,Doe</message>");            
	//System.out.println("after sending response");		
} else {	
   //nothing to show	
   response.setStatus(HttpServletResponse.SC_NO_CONTENT);
}
%>
 
 
 
 
