
<%
	if (session.getAttribute("s_role").toString().trim().equals("admin")) {
    	%>
    	<%@ include file="menu_managedata_admin.jsp" %>
    	<%
	} else if (session.getAttribute("s_role").toString().trim().equals("system")) {
		%>
    	<%@ include file="menu_managedata_system.jsp" %>
    	<%
	} else {
	    %>
    	<%@ include file="menu_managedata_admin.html" %>
    	<%
	}
%>
