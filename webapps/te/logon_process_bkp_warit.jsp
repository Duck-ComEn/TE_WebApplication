

<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>

<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.log.*"%>
<%@ page import ="com.hitachigst.prb.itd.webservices.common.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.hitachigst.prb.te.util.ErrException"%>
<jsp:directive.page import="javax.xml.bind.JAXBElement;"/>


<%
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	//String username = "administrator";
	//String password = "zaq1wsx";
	int locationid = 1;
         
       // out.println("User Name : " + username );
	
	//UserManagerClient client = new UserManagerClient();
	//UserManagerPortType service = client.getUserManagerHttpPort();
	
	//User user=new User();
	//user.setUserID(username);
	//user.setPassword(password);
	
	
	
	/*if (service.isUser(username,password)) {
	
	//User user=new User();
	String operatorid="";
		user=service.getUserDetail(username);
		JAXBElement<String> x1 = (JAXBElement<String>)user.getSerial();
                                        		operatorid =x1.getValue();
		
		session.setAttribute("s_username", username);
		session.setAttribute("s_operator", operatorid);		
		session.setAttribute("s_recordcount", "0");	
		//session.setAttribute("s_allSN", new Vector());	
		session.setAttribute("s_dataRecording", new Vector());
		//String rolename=UserManager.getRoleName(user);
		String rolename=service.getRoleName(username);
		session.setAttribute("s_role", rolename);
		
		session.setAttribute("s_locationid", locationid);
		
		session.setMaxInactiveInterval(Integer.parseInt(IniFilesReader.getReturnProperties("Remote.Application","Session MaxInactiveInterval")));
		MonitorLog.setLog("User "+session.getAttribute("s_username").toString()+" Logon","");
		response.sendRedirect("home.jsp");
       
	}*/ 
	try{
	
	if (username.equals("")==false && password.equals("")==false) {
	   UserAccountManager userm= new UserAccountManager();
       UserAccount user=userm.getUserAccount(username,password);
		// if (username.equals("administrator") && password.equals("zaq1wsx")) {  
			  session.setAttribute("s_username", username);
			  //session.setAttribute("s_operator", "123456");		
			  //session.setAttribute("s_recordcount", "0");	
				
			//session.setAttribute("s_dataRecording", new Vector());
			
			//String rolename=service.getRoleName(username);
			session.setAttribute("s_role", user.getRole());			
			session.setAttribute("s_locationid", user.getSite());
			
			int firstflag=user.getFirstflag();
			
			session.setMaxInactiveInterval(Integer.parseInt(IniFilesReader.getReturnProperties("Remote.Application","Session MaxInactiveInterval")));
			MonitorLog.setLog("User "+session.getAttribute("s_username").toString()+" Logon","");
			
			if (firstflag==1){
			   response.sendRedirect("changepassword.jsp?prevpage=logon");
			}else{			
			   response.sendRedirect("home.jsp");
			}
		}else {
			response.sendRedirect("logon_screen.jsp");
		}
	}catch(Exception e){
	   out.print(e.toString());
	   response.sendRedirect("logon_screen.jsp");
	}
%>

