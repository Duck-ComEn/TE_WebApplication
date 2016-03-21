
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>



<ul id ="nav">
	<li><a href="home.jsp">Home</a></li>
       <li><a href="testcode_home.jsp">Test Code</a>
            <ul>
                <li><a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a></li>
                <li><a href="testcode_testtimemonitor.jsp">Test Time Monitor</a></li>
	            <li><a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a></li>
				<li><a href="testcode_testtimeworkweek.jsp">Test Time by WW</a></li>
          </ul>
       </li>
            
       <li><a href="home.jsp">Maintenance</a></li>
       <li><a href="home.jsp">Process</a></li>
       <li><a href="home.jsp">About us</a></li>
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
     <li><a href="home.jsp">My Account</a></li>
     <li><a href="index.jsp">Logout</a></li>   
</ul>






