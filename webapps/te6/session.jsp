<%@ page language="java" import="java.util.*" pageEncoding="TIS-620"%>

<%
	if (session.getAttribute("s_username") == null) {
		%>
						<jsp:forward page="logon_screen.jsp">
						<jsp:param name="errormessage" value="<%=""%>" />
						</jsp:forward>
					<%
		
	}
%>