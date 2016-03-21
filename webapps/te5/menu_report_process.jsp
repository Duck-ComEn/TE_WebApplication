
<%
	if (session.getAttribute("s_role").toString().trim().equals("admin")) {
    	%>
    	<%@ include file="menu_report_admin.html" %>
    	<%
	} else if (session.getAttribute("s_role").toString().trim().equals("system")) {
		%>
    	<%@ include file="menu_report_system.html" %>
    	<%
	} else {
	    %>
    	<%@ include file="menu_report_view.html" %>
    	<%
	}
%>
