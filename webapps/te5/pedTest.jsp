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
<head>
</head
<body>
<%

String pathcsv = "cmd.exe /c  echo H1tachi! | RUNAS /profile /user:administrator C:\\ExecuteTrialTracker.bat";
File filecsv = new File(pathcsv);
Process p = Runtime.getRuntime().exec("cmd /c "+filecsv);
out.println("start execute");
//p.waitFor();

String line;
String pidInfo ="";
Process j =Runtime.getRuntime().exec(System.getenv("windir") +"\\system32\\"+"tasklist.exe");
BufferedReader input =  new BufferedReader(new InputStreamReader(j.getInputStream()));
while ((line = input.readLine()) != null) {
pidInfo+=line;
out.println(line +"\n");
}
input.close();
//  <!--------------------------------Event Check run One File -------------------------------------------------------------------->
if(pidInfo.contains("ExecuteTrialTracker.bat"))
{}

%>
</body>
