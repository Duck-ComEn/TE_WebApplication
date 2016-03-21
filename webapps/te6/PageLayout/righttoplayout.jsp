
<!-- ============================================Top Layout============================================================================== -->	
 <div id="header">
      <table width="100%" border="0">
		<tr> 
		  <td width="33%"></td>		  
		  <td width="23%"><img src="DATA-INF/Image/telogoempty.jpg" alt="Your Logo" title="Your Logo" /></td>
		  <td width="40%"> <p>Version : <%out.println(version); %> | <a href="#Top">Logon: <%out.println(session.getAttribute("s_username").toString().trim());%></a><br /></p> </td>	  
		</tr>
		<tr> 
		  <td width="33%"></td>		  
		  <td width="23%"></td>
		  <td width="40%"></td>
		</tr>   	 
     </table>  
     <div id="header-container">		  	
		  <%@ include file="../menu_system.jsp" %>
			<br class="clear" />
					
	  </div>	 
	</div>
	 
<!-- ================================================================================================================================== -->


