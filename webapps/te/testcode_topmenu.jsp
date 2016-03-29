     <ul id="nav"> 
	  <%
	    if (menumode.equals("testcode_home.jsp")){
	  %>
		   <li><a href="home.jsp">Home</a><li>      
		   <li><a href="testcode_home.jsp">Test Code</a>
		   <ul>
                <li><a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a></li>
                <li><a href="testcode_testtimemonitor.jsp">Test Time Monitor</a></li>
                 <li><a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a></li>
				 <li><a href="testcode_testtimeworkweek.jsp">Test Time by WW</a></li>
          </ul>
		  </li>
		   <li><a href="Process Flow.html">About us</a></li>      
		   <li><a href="index.jsp">Logout</a></li>  
		   
	 
	   <%
	   } else if (menumode.equals("testcode_enterpriserelatedwebsite.jsp")) {
	   %>
	   	   <li><a href="home.jsp">Home</a><li>
		   <li><a href="testcode_home.jsp">Test Code</a>
		   <ul>
                <li><a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a></li>
                <li><a href="testcode_testtimemonitor.jsp">Test Time Monitor</a></li>
                 <li><a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a></li>
				 <li><a href="testcode_testtimeworkweek.jsp">Test Time by WW</a></li>
          </ul>
		  </li>
		   <li><a href="Process Flow.html">About us</a></li>      
		   <li><a href="index.jsp">Logout</a></li>    
	   <%
	    }else if (menumode.equals("testcode_testtimemonitor.jsp")) {
	   %>
	       <li><a href="home.jsp">Home</a><li>
		   <li><a href="testcode_home.jsp">Test Code</a> 
		  <ul>
                <li><a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a></li>
                <li><a href="testcode_testtimemonitor.jsp">Test Time Monitor</a></li>
                 <li><a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a></li>
				 <li><a href="testcode_testtimeworkweek.jsp">Test Time by WW</a></li>
          </ul>
		  </li>		   
		   <li><a href="Process Flow.html">About us</a></li>      
		   <li><a href="index.jsp">Logout</a></li>    
		<%
		}else if(menumode.equals("testcode_testtrialtracker.jsp")){
		%>
			<li><a href="home.jsp">Home</a><li>
		   <li><a href="testcode_home.jsp">Test Code</a> 
		  <ul>
                <li><a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a></li>
                <li><a href="testcode_testtimemonitor.jsp">Test Time Monitor</a></li>
                 <li><a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a></li>
				 <li><a href="testcode_testtimeworkweek.jsp">Test Time by WW</a></li>
          </ul>
		  </li>		   
		   <li><a href="Process Flow.html">About us</a></li>      
		   <li><a href="index.jsp">Logout</a></li>
	   <%
		}else if(menumode.equals("testcode_testtimeworkweek.jsp")){
		%>
			<li><a href="home.jsp">Home</a><li>
		   <li><a href="testcode_home.jsp">Test Code</a> 
		  <ul>
                <li><a href="testcode_enterpriserelatedwebsite.jsp">Enterprise Related Web site</a></li>
                <li><a href="testcode_testtimemonitor.jsp">Test Time Monitor</a></li>
                 <li><a href="testcode_testtrialtracker.jsp">Test Trial Tracker</a></li>
				 <li><a href="testcode_testtimeworkweek.jsp">Test Time by WW</a></li>
          </ul>
		  </li>		   
		   <li><a href="Process Flow.html">About us</a></li>      
		   <li><a href="index.jsp">Logout</a></li>
		   <%
		}
	   %>
</ul>






