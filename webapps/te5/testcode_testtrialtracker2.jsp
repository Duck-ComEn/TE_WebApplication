<%@ page language="java" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.nio.channels.FileChannel"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@ page import="java.awt.Desktop"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.Writer"%>
<%@ page import="java.io.FileWriter"%>
<%@ page import="java.io.BufferedWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.text.*"%>
<%@ page import ="com.hitachigst.prb.te.teweb.*"%>
<%@ page import="com.hitachigst.prb.itd.itdtools.util.*"%>
<%@ page import="com.hitachigst.prb.te.testtimetool.*"%>
<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page buffer="30kb"%>

<body>
<%//  <!--------------------------------Config path Run Trial Tracker-------------------------------------------------------------------->
	String pathcsv = "C:\\Tomcat_9.0\\webapps\\te\\TrialTrackerStatus\\MacroTrigger\\MacroTrigger.exe";
    File filecsv = new File(pathcsv);
    filecsv.toURI();
	out.print("Before "+filecsv.toURI());
	Process p = Runtime.getRuntime().exec("cmd /c start /wait" + filecsv);
	p.waitFor();
	out.print("After\n");
%>

</body>