
<!-- ============================================Top Layout============================================================================== -->	
 <div id="header">
      <table width="100%" border="0">
		<tr> 
		  <td width="33%"><img src="DATA-INF/Image/telogo.jpg" alt="Your Logo" title="Your Logo" /></td>
		  <td width="33%"><h1><a name="Top" id="Top"></a><a href="#"><%//out.println(webname); %> </a></h1></td>
		  <td width="34%"> <p>Version : <%out.println(version); %> | <a href="#Top">Logon: <%out.println(session.getAttribute("s_username").toString().trim());%></a><br /></p> </td>	  
		</tr>
		<tr> 
		  <td width="33%"></td>
		  <td width="33%"></td>
		  <td width="34%"></td>
		</tr>   	 
     </table>  
	  <div id="header-container">		  	
		  <ul>
			   <li><a href="home.jsp">Home</a></li>
			   <li><a href="myprofiles.jsp">My Profiles</a></li>
			   <li><a href="changepassword.jsp">Edit Password</a></li>
			   <li><a href="logon_screen.jsp">Logout</a></li>
			   <li><a href="#Top">Help</a></li>			   
		  </ul>
			<br class="clear" />
	  </div>
	</div>
<!-- ================================================================================================================================== -->

