
<%
	if (session.getAttribute("s_role").toString().trim().equals("admin")) {
    	%>
    	<%@ include file="menu_admin_admin.html" %>
    	<%
	} else if (session.getAttribute("s_role").toString().trim().equals("system")) {
		%>
    	<%@ include file="menu_admin_system.html" %>
    	<%
	} else {
	    %>
    	<%@ include file="menu_admin_admin.html" %>
    	<%
	}
%>
