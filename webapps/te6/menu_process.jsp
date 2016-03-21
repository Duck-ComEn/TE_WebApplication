
<%
	if (session.getAttribute("s_role").toString().trim().equals("admin")) {
    	%>
    	<%@ include file="menu_admin.html" %>
    	<%
	} else if (session.getAttribute("s_role").toString().trim().equals("viewer")) {
		%>
    	<%@ include file="menu_viewer.html" %>
    	<%
	} else if (session.getAttribute("s_role").toString().trim().equals("system")) {
		%>
    	<%@ include file="menu_system.html" %>
    	<%
	} else {
	    %>
    	<%@ include file="menu_viewer.html" %>
    	<%
	}
%>
