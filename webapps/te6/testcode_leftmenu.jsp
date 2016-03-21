  <div id="lijeva_kolona">

    <div id="side_menuboxleft"> 

	  <%
	    if (menumode.equals("testcode_home.jsp")){
	  %>
	   <a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a>
	   <a href="testcode_testtimemonitor.jsp">Test Time Monitor</a>
	  <a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a>
	   <%
	    }else if (menumode.equals("testcode_testtimemonitor.jsp")){
	   %>
	   <a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a>
	   <a href="testcode_testtimemonitor.jsp">Test Time Monitor</a>    
 	<a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a>
		<%
	    }else if (menumode.equals("testcode_enterpriserelatedwebsite.jsp")){
	   %>
	   <a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a>
	   <a href="testcode_testtimemonitor.jsp">Test Time Monitor</a>    
	  <a href="testcode_testtrialtracker.jsp">Test Trial Trackerr</a>
		<%
	    }else if (menumode.equals("testcode_testtrialtracker.jsp")){
	   %>
	 <a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a>
	   <a href="testcode_testtimemonitor.jsp">Test Time Monitor</a>    
	  <a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a>

	
		<%		
		}else{

		}
		%>   
    </div>

</div>     





