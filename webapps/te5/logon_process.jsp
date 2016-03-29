

<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="java.util.*"%>

<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import ="com.hitachigst.prb.itd.webservices.common.*"%>
<%@ page import ="com.hitachigst.prb.te.util.ErrException"%>


<%
try{
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	int locationid = 1;
         
    out.print("1. Username : " +username + " Password : " + password );
    if (username.equals("")==false && password.equals("")==false) {
	   if (username.equals("administrator") && password.equals("zaq1wsx")) {  
			  session.setAttribute("s_username", username);
			  //session.setAttribute("s_operator", "123456");		
			  //session.setAttribute("s_recordcount", "0");	
				
			//session.setAttribute("s_dataRecording", new Vector());
			
			//String rolename=service.getRoleName(username);
			session.setAttribute("s_role", "Admin");			
			session.setAttribute("s_locationid", "PRB");
			
			//int firstflag=user.getFirstflag();
			
			session.setMaxInactiveInterval(Integer.parseInt(IniFilesReader.getReturnProperties("Remote.Application","Session MaxInactiveInterval")));
			MonitorLog.setLog("User "+session.getAttribute("s_username").toString()+" Logon","");
			
			response.sendRedirect("home.jsp");

	   }
    }else {
	   response.sendRedirect("logon_screen.jsp");
	}	
}catch(Exception e){
	   out.print(e.toString());
	   //response.sendRedirect("logon_screen.jsp");
}
%>


