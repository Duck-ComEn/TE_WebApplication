<%@ page import="com.hitachigst.prb.itd.itdtools.datamaintain.*"%>
<%@ page import="java.util.Vector"%>
<ul>
	<li>
		<a href="home.jsp">Home</a>
	</li>
	<% 	 		
		Vector a = new DataMaintainanceManager().getDataMaintainList();		
		for (int i = 0; i < a.size(); i++) {	
	    
	%>
	<li>		
		<%
		   String str="<a href=\"datamaintain.jsp?datamaintain=" +a.get(i)+"\">"+a.get(i)+"</a>"; 
	       out.print(str);
		 %>		
	</li>
	<%
	}
	%>
	<li>
		<a href="home_admin.jsp">Admin</a>
	</li>
</ul>