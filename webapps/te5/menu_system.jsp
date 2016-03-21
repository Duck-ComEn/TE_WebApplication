
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>



<ul>
	<li><a href="home.jsp">Home</a><li>
       <li><a href="record.jsp">Test Code</a></li>
       <li><a href="LeftMenutest.jsp">Maintenance</a></li>
       <li><a href="Process Flow.html">Process</a></li>
       <li><a href="Process Flow.html">About us</a></li>
    <%  
    if (session.getAttribute("s_role").toString().trim().equals("admin") || session.getAttribute("s_role").toString().trim().equals("system")) {
    	   String DataMaintainMode=IniFilesReader.getReturnProperties("Local.Application","Data Maintain Mode");	
			DataMaintainMode=DataMaintainMode.toUpperCase();
			if (DataMaintainMode.equals("ON")){	
		  %><li><a href="home_managedata.jsp">Data Maintian</a></li><%
		  }
		   %><li><a href="home_admin.jsp">Admin</a></li><%
	} 
   	%>
     <li><a href="home_myaccount.jsp">My Account</a></li>
     <li><a href="index.jsp">Logout</a></li>   
</ul>






