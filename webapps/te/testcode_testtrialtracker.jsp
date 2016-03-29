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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   
<head>

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="author" content="Luka Cvrk (www.solucija.com)" />
<meta name="description" content="My Site" />
<meta name="keywords" content="key, words" />
<%!
  String subjectshow="";  String ownershow=""; String emailshow="";  String productshow =""; 
  String showtrialid="";  String showtestcode=""; String showtestid=""; String showpfcode=""; 
  String showhddnum=""; String showprocess=""; String showstdate=""; String showendate=""; 
  String  showinorex="";int count=0;int val = 0; int j=0;String line;String addlist = "";
  String stdate="";String copylist = ""; String copylistfolder = ""; String powerpointfolder="";
  String enddate=""; String allshow=""; String yieldshow=""; String testtimeshows="";
  String chisqaureshow=""; String testcodeAshow=""; String testcodeBshow="";String powerpointlink2="";
  String modeltypeshow=""; String samplingshow=""; String mfgidshows="";String powerpointlink1="";
  String testtimestracks1=""; String copylistfolders = "";

%>

<%  
String version=""; String webname="";
webname=IniFilesReader.getReturnProperties("Local.Application","Application Name"); 
version=TeWebVersionControl.getVersion();

 String tracker = request.getParameter("hidden_tracker");
 String summary = request.getParameter("hidden_summary");
 String add = request.getParameter("hidden_add");

     if(tracker==null&&summary==null){
    
    tracker = "checked"  ;
    summary  = ""  ;
      
    }
    if(add!=null){
    tracker = "checked"  ;
     summary = ""  ;
    }
   
 



    
%>
<title>
<% out.println(webname); %>
</title>
<link rel="stylesheet" type="text/css" href="DATA-INF/CSS/style.css" media="screen" />

<script src="JSAX-INF/amcharts.js" type="text/javascript"></script>
<script type="text/javascript">
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload(); }

MM_reloadPage(true);
</script>
<style type="text/css">
    h1 {text-shadow:0px 0px #000000;}
    h4{ color: #000; background-color: #444; text-shadow: 0px 0px 0px #000000; }
    body{ background-color:#fff; font-family:Arial, Verdana; font-size:12px; color:#444444; margin:0; }
    form{ width: 1000px; padding-left: 150px; }
    form *{ background: transparent; }
    label{ display: block; width: 100px; margin: 0 auto; font-weight: bold; color: #666; padding-top: 15px;}
    input[type=checkbox]{background: none; -webkit-border-radius: 0; -moz-border-radius: 0; border-radius: 0; padding:0;
          margin: 0; width: 15px; }
    fieldset{ -webkit-border-radius: 8px; -moz-border-radius: 8px; border-radius: 8px; margin-top: 15px; color: #000; }
    input[ type=submit]{
  border:1px solid #616261; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
   background-color: #7d7e7d; background-image: -webkit-gradient(linear, left top, left bottom, from(#7d7e7d), to(#0e0e0e));
   background-image: -webkit-linear-gradient(top, #7d7e7d, #0e0e0e);
   background-image: -moz-linear-gradient(top, #7d7e7d, #0e0e0e);
   background-image: -ms-linear-gradient(top, #7d7e7d, #0e0e0e);
   background-image: -o-linear-gradient(top, #7d7e7d, #0e0e0e);
   background-image: linear-gradient(to bottom, #7d7e7d, #0e0e0e);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#7d7e7d, endColorstr=#0e0e0e);
  }
  input[type=submit]:hover{
   border:1px solid #5ca6c4;
   background-color: #82bbd1; background-image: -webkit-gradient(linear, left top, left bottom, from(#82bbd1), to(#193b61));
   background-image: -webkit-linear-gradient(top, #82bbd1, #193b61);
   background-image: -moz-linear-gradient(top, #82bbd1, #193b61);
   background-image: -ms-linear-gradient(top, #82bbd1, #193b61);
   background-image: -o-linear-gradient(top, #82bbd1, #193b61);
   background-image: linear-gradient(to bottom, #82bbd1, #193b61);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#82bbd1, endColorstr=#193b61);
  }
    input[type=button]{
      border:1px solid #616261; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
       background-color: #7d7e7d; background-image: -webkit-gradient(linear, left top, left bottom, from(#7d7e7d), to(#0e0e0e));
       background-image: -webkit-linear-gradient(top, #7d7e7d, #0e0e0e);
       background-image: -moz-linear-gradient(top, #7d7e7d, #0e0e0e);
       background-image: -ms-linear-gradient(top, #7d7e7d, #0e0e0e);
       background-image: -o-linear-gradient(top, #7d7e7d, #0e0e0e);
       background-image: linear-gradient(to bottom, #7d7e7d, #0e0e0e);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#7d7e7d, endColorstr=#0e0e0e);
      }

  input[type=button]:hover{
   border:1px solid #5ca6c4;
   background-color: #82bbd1; background-image: -webkit-gradient(linear, left top, left bottom, from(#82bbd1), to(#193b61));
   background-image: -webkit-linear-gradient(top, #82bbd1, #193b61);
   background-image: -moz-linear-gradient(top, #82bbd1, #193b61);
   background-image: -ms-linear-gradient(top, #82bbd1, #193b61);
   background-image: -o-linear-gradient(top, #82bbd1, #193b61);
   background-image: linear-gradient(to bottom, #82bbd1, #193b61);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#82bbd1, endColorstr=#193b61);
  }
    .show { display: block;  }
    .hide { display: none; }
  
          .styled-select {
          width: 500px;
          height: 34px;
          overflow: hidden;
          <!--background: url(DATA-INF/Image/Select.png) no-repeat ;-->
          border-radius: 10px;
          }
          .styled-select select {
          background: transparent;
          width: 500px;
          padding: 5px;
          border: 1px solid #CCC;
          font-size: 14px;
          height: 34px;
          font-weight: bold;
          outline:0px;
          -webkit-appearance: none;
          border-radius: 10px;
          }
          .styled-select option {
          background: lightgrey;
          width: 500px;
          padding: 5px;
          border: 1px solid #CCC;
          font-size: 14px;
          height: 34px;
          outline:0px;
          -webkit-appearance: none;
          }

    .button[disabled], .button[disabled]:hover, .button[disabled]:active{
    border-color: #eaeaea;
    background: #fafafa;
    cursor: default;
    position: static;
    color: #999;
    /* Usually, !important should be avoided but here it's really needed :) */
    box-shadow: none !important;
    text-shadow: none !important;
        }
   




</style>

<script>
        function showtrack(){
  document.getElementById('table2').className='hide';
  document.getElementById('table1').className='show';
  document.getElementById('table3').className='hide';
  document.getElementById('powerpoint').className='hide';

    }
        function hidetrack(){
  document.getElementById('table2').className='show';
  document.getElementById('table1').className='hide';
  document.getElementById('table3').className='hide';
  document.getElementById('powerpoint').className='hide';
    }
   
   
      function addSubmits(){ var frm = document.form1; frm.action="testcode_testtrialtracker.jsp"; frm.submit();}
      function addSubmitss(){ var frm = document.form1; frm.action="testcode_testtrialtracker.jsp"; frm.submit();}
      function change1(){document.getElementById('runscript1').disabled=false;
       document.getElementById('del1').disabled=false;
          document.getElementById('edittracker').disabled=false;}
      function change2(){
         document.getElementById('runscript2').disabled=false;
           document.getElementById('del3').disabled=false;
       document.getElementById('editsummary').disabled=false;
             document.getElementById('powerpoint').className='show';
              document.getElementById('table3').className='show';
        var selectBox = document.getElementById("select");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
        var res = selectedValue.replace(".csv",".htm");
        var directories ="DATA-INF/Result_htm/"+res;
        var z="DATA-INF/Result_htm/No_Resultssss.html"
        document.getElementById('my_selec').value = document.getElementById('select').value
        var x= document.getElementById('my_selec').value;
        var y=document.getElementById('select').value;
        if(x==y){
              window.open(directories,'powerpoint');
           }else{
            window.open(z,'powerpoint');
          }
       
       }
      function checkederror(){
        alert("Error!!! Run Unsuccessful");
         addSubmits();
      } 
        function checkederror1(){
        alert("Error!!! Another User  Execute or Summary File");
         addSubmits();
      } 
    function wait(){  
              var showonload= document.getElementById('showinload');
              showonload.className = 'show';
                var save= document.getElementById('save');
              save.disabled=true;
                var del1= document.getElementById('del1');
              del1.disabled=true;
                var summary= document.getElementById('byEdit');
              summary.disabled=true;
        document.getElementById('editsummary').disabled=true;
                document.getElementById('edittracker').disabled=true;
            }
   function wait1(){  
              var showonload= document.getElementById('showonload');
                          showonload.className = 'show';
               var save1= document.getElementById('save1');
              save1.disabled=true;
                var del3= document.getElementById('del3');
              del3.disabled=true;
                var track= document.getElementById('track');
              track.disabled=true;
        document.getElementById('editsummary').disabled=true;
                document.getElementById('edittracker').disabled=true;
            }
       function show3s(){alert("Run Successfully");
      addSubmits();
                           }
      function show4s(){alert("Run Successfully");
      addSubmitss();
      
                           }
   
    function changeFunc1() {
        var selectBox = document.getElementById("select");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
        var res1 = selectedValue.replace(".csv",".ppt");
        var directoriess ="DATA-INF/Result_htm/"+res1;
       
    
        window.open(directoriess,'download2');
       
       }
    function changeFunc2() {
        var selectBox = document.getElementById("select");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
        var res2 = selectedValue.replace(".csv",".xls");
        var directoriesss ="DATA-INF/Result_htm/"+res2;
        window.open(directoriesss,'download1');
       }
       function status1(){
     
     document.forms[0].action = 'testcode_testrialtracker_codition.jsp'; return true;
       }
        function status2(){
     document.forms[0].action = 'testcode_testrialtracker_codition.jsp'; return true;
     
       }
          function statusedit1(){
   
         document.forms[0].action = 'testcode_testrialtracker_codition.jsp'; return true;
    
       }
        function statusedit2(){
     document.forms[0].action = 'testcode_testrialtracker_codition.jsp'; return true;
     
       }
       function show2s(){ 
          
        alert(" Delete Successfully"); 
        addSubmits();
      } 
</script>
</head>

<body  >

<!-- ----------------------Te Logo--------------------------- -->
<div id="Layer1" style="position:absolute; left:3px; top:3px; width:84px; height:70px; z-index:1"><img src="DATA-INF/Image/telogo.jpg" width="275" height="100%" /></div> 
<!-- -------------------------------------------------------- -->
<!--  <div id="Layer2" style="position:absolute; left:460px; top:255px; width:505px; height:46px; z-index:2"> </div>  -->
<%String menumode="testcode_testtrialtracker.jsp";%>  
<!-- ---------------------------------Left Layout -------------- -->
<div id="contentleft">
  <div id="left"> 
  <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
  <div id="headerL"></div>  
   </div> 

<!-- ============================================Top Layout============================================================================== -->

<div id="right"> <%@ include file="PageLayout/testcode_righttoplayout.jsp" %></div> 

<form name="form1" id="form1" method="post" action="" align="center" >
     <input type="hidden" name="hidden_tracker" />
      <input type="hidden" name="hidden_summary" />
      <input type="hidden" name="hidden_add" />
    
    
    <h1>&nbsp;</h1>

    <fieldset align="center"  >
  <legend >
    <h1>Mode</h1>
        </legend>
    <table  border="0" bordercolor="#00000">
      <tr> 
    <td width="200"></td>
    <td width="29" height="41"><input type="radio" name="reportOption" id="track" value="byAdd"<%=tracker%> onclick="showtrack();" /></td>
    <td width="60"><h4>Tracker</h4></td> 
    <td width="20"><input type="radio" name="reportOption" id="byEdit" value="Sum"  <%=summary%> onclick="hidetrack();" /></td>
          <td width="66"><h4>Summary</h4></td> 
    <td width="1000"></td>
      </tr>
    
    </table>
    </fieldset>

    <fieldset align="center" id="table1" class="show">
              
    <legend >
      <h1>Tracker</h1>
        </legend>
    <table border="0" bordercolor="#00000"   >
      <tr>
    <td></td>
         <td width="600" id="texture" ><h4>Select Tracker CSV File: 

    <div class="styled-select"> 
        <select width="1000"  name="my_select1" id="select1" class="select" onchange="change1();" >
            <option >Please Select Condition</option>
     <!--------------------------------Event show Condition File-------------------------------------------------------------------->
   <%

     File appFolder = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\");
                
                         File[] list = appFolder.listFiles();
                         
							 for(int i=0;i<list.length;i++)
							{
								  File file = list[i];   
								   if (file.isFile() && file.getName().endsWith(".csv")) {
			
								  addlist = list[i].getName();
				
								  out.print("<option id=\"\"value=\"" +addlist+ "\">"+addlist+"</option>");
											  }   
								   if(request.getParameter("del1")!=null&&request.getParameter("runscript1")==null&&request.getParameter("runscript2")==null&&request.getParameter("del3")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
								
									   String selection=request.getParameter("my_select1");
									   
									  if(selection.equals(addlist )){
								
										list[i].delete();
												  subjectshow ="";
												  ownershow ="";
												  emailshow="";
												  allshow="";
												  yieldshow="";
												  testtimeshows="";
												  chisqaureshow="";
												  productshow="";
												  modeltypeshow="";
												  showtrialid ="";
												  showtestcode="";
												  testcodeAshow="";
												  testcodeBshow="";
												  showtestid="";
												  showpfcode="";
												  showinorex="";
												  showhddnum="";
												  showprocess="";
												  showstdate="";
												  showendate="";
												  samplingshow="";
												  mfgidshows="";
												  stdate="";
												  enddate="";
										}
									}
							}  

              if(request.getParameter("del1")!=null&&request.getParameter("runscript1")==null&&request.getParameter("runscript2")==null&&
                request.getParameter("del3")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
                                out.println("<script type='text/javascript'>");
                                out.println("show2s();");
                                out.println("</script>"); 
                              }
 //  <!--------------------------------Event Write select All Condition File-------------------------------------------------------------------->
                              try{
                                      
                                String pathoptionss = "C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\OneCondition\\OnlythisCoditiontion.csv";
                                        File optionfiles = new File(pathoptionss);
                                     Writer objWritersss = new BufferedWriter(new FileWriter(optionfiles));
                                       File copyFiless = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\OneCondition\\");
                                  File[] copylistfiless = copyFiless.listFiles();
                                          //  for(int f=1;f<copylistfiless.length;f++) {
                                             objWritersss.write("All"+"\n");
                                            
                                        //}
                                        objWritersss.flush();
                                        objWritersss.close();
                                      }catch(IOException  e){  
                                          e.printStackTrace();  
                                       }    
   //  <!--------------------------------Event Check run One File -------------------------------------------------------------------->
                              if(request.getParameter("runscript1")!=null&&request.getParameter("runscript2")==null&&request.getParameter("del1")==null&&request.getParameter("del3")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
                                      subjectshow ="";
                                          ownershow ="";
                                          emailshow="";
                                          allshow="";
                                          yieldshow="";
                                          testtimeshows="";
                                          chisqaureshow="";
                                          productshow="";
                                          modeltypeshow="";
                                          showtrialid ="";
                                          showtestcode="";
                                          testcodeAshow="";
                                          testcodeBshow="";
                                          showtestid="";
                                          showpfcode="";
                                          showinorex="";
                                          showhddnum="";
                                          showprocess="";
                                          showstdate="";
                                          showendate="";
                                          samplingshow="";
                                          mfgidshows="";
                                          stdate="";
                                          enddate="";
                                  
                                          String lines;
                                          String pidInfos ="";
                                          Process k =Runtime.getRuntime().exec(System.getenv("windir") +"\\system32\\"+"tasklist.exe");
                                          BufferedReader inputs =  new BufferedReader(new InputStreamReader(k.getInputStream()));

                                          while ((lines = inputs.readLine()) != null) {
                                           pidInfos+=lines; 
                                          }

                                          inputs.close();

                                          if(pidInfos.contains("MacroTrigger.exe"))
                                          {
                                          
                                          out.println("<script>");
                                           out.println("checkederror1();");
                                          out.println("</script>");
                           
                                
                              }else{
                                try{
                                      String pathoptions = "C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\OneCondition\\OnlythisCoditiontion.csv";
                                      File optionfiles = new File(pathoptions);
                                      Writer objWriterss = new BufferedWriter(new FileWriter(optionfiles));
                                      File copyFiles = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\");
                                      File[] copylistfiles = copyFiles.listFiles();
                                      File deleteFiles = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\OneCondition\\OnlythisCoditiontion.csv");
                                      if(deleteFiles.exists()){
                                    deleteFiles.delete();
                                     }
                                            for(int f=0;f<copylistfiles.length;f++) {
                                                           copylistfolders  = copylistfiles[f].getName();
                                                              
                                                             String copyselectionss=request.getParameter("my_select1");
                                                 if(copyselectionss.equals(copylistfolders)){
                                             objWriterss.write("one"+"\n");
                                             objWriterss.write(copylistfiles[f].getName()+"\n");
                                            objWriterss.flush();
                                         objWriterss.close();
                                           
                                        }

                                      }
      //  <!--------------------------------Config path Run Trial Tracker-------------------------------------------------------------------->
                                  String pathcsv = "C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\MacroTrigger\\MacroTrigger.exe";
                                  File finishfiles = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\OneCondition\\comp.bin");
                                  File finishfile = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\");
                                  File[] checklistfiles = finishfile.listFiles();
                                  File filecsv = new File(pathcsv);
                                  filecsv.toURI();
                                  Process p = Runtime.getRuntime().exec("cmd /c start /wait "+filecsv);
                                  p.waitFor();

                    for(int c=0;c< checklistfiles.length;c++) {
                                            
                                          
                                              if (finishfiles.exists()) {
                                               out.println("<script type='text/javascript'>");
                                              out.println("show3s();");
                                              out.println("</script>");
                                           }else{
                                              out.println("<script type='text/javascript'>");
                                              out.println("checkederror();");
                                              out.println("</script>");
                                         }
                                         
             
                                  }
            
                                      }catch(IOException  e){  
                                          e.printStackTrace();  
                                       }    
                                 }

                               }

   if(request.getParameter("runscript1")==null&&request.getParameter("runscript2")==null&&request.getParameter("del1")==null&&request.getParameter("del3")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
                                subjectshow="";
                                ownershow=""; 
                                emailshow=""; 
                                productshow =""; 
                                showtrialid=""; 
                                showtestcode=""; 
                                showtestid=""; 
                                showpfcode=""; 
                                showhddnum=""; 
                                showprocess=""; 
                                showstdate=""; 
                                showendate=""; 
                                showinorex="";  
                                stdate="";
                                enddate="";
          }
         
           %>
        
          </select>
    </div>
        </h4></td>
        <td></td>
        <td><h4>Status: </h4></td>
      <td width="252"><p><font color="#999999"><img border="0" id="showinload" src="DATA-INF/Image/a.gif" class="hide"/></font><img border="0" 
          id="showinok" src="DATA-INF/Image/ok.png" class="hide" /></p></td>
      </tr>
       <tr id="showoptionchoose"> 
    <td width="121">&nbsp; </td>
        
    <td width="323"><input type="submit" id="save" name="save" value="ADD" class="button" <%=add%> onclick="status1();" />
        <input type="submit" id="edittracker" name="edittracker" value="EDIT" class="button" disabled onclick="statusedit1();" />
        <input type="submit" id="del1" name="del1"  value="DELETE" disabled class="button" />
        <input type="submit" id="runscript1" name="runscript1" value="ExcuteTracker" disabled class="button" onclick="wait();"/>
      </td>
        <td width="252">&nbsp;</td>
         
      <td width="136">&nbsp;</td>
      </tr>
    </table>
     </fieldset>
      <fieldset align="left"  id="table2" class="hide">

    <legend >
      <h1>Summary</h1>
        </legend>
    <table border="0" bordercolor="#00000"  >
      <tr>
    <td></td>
         <td width="324" id="texture" ><h4>Select Summary CSV File: 
     <div class="styled-select"> 
         <select width="100%"  name="my_selects" id="select" class="select" onchange="change2();">
            <option  value="No_Result.html">Please Select Condition</option>
            <!--------------------------------Event show Condition File-------------------------------------------------------------------->
      <%
                            File appFolderz = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\");
                
                            File[] listz = appFolderz.listFiles();
                          
                          
                          
                             for(int i=0;i<listz.length;i++)
                        {
                              File filez = listz[i];   
           if (filez.isFile() && filez.getName().endsWith(".csv")) {
        
                              addlist = listz[i].getName();
            
                              out.print("<option id=\"\"value=\"" +addlist+ "\">"+addlist+"</option>");
                                          }   
                              
                               if(request.getParameter("del3")!=null&&request.getParameter("runscript1")==null&&request.getParameter("runscript2")==null&&request.getParameter("del1")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
                            
                                   String selection=request.getParameter("my_selects");
                                   
                              if(selection.equals(addlist )){
                        
                                list[i].delete();
                              
                                          subjectshow ="";
                                          ownershow ="";
                                          emailshow="";
                                          allshow="";
                                          yieldshow="";
                                          testtimeshows="";
                                          chisqaureshow="";
                                          productshow="";
                                          modeltypeshow="";
                                          showtrialid ="";
                                          showtestcode="";
                                          testcodeAshow="";
                                          testcodeBshow="";
                                          showtestid="";
                                          showpfcode="";
                                          showinorex="";
                                          showhddnum="";
                                          showprocess="";
                                          showstdate="";
                                          showendate="";
                                          samplingshow="";
                                          mfgidshows="";
                                          stdate="";
                                          enddate="";
                                }
                              }
                            }
                 if(request.getParameter("del3")!=null&&request.getParameter("runscript1")==null&&request.getParameter("runscript2")==null&&
                request.getParameter("del1")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
                                out.println("<script type='text/javascript'>");
                                out.println("show2s();");
                                out.println("</script>"); 
                              }

                             if(request.getParameter("runscript2")!=null&&request.getParameter("runscript1")==null&&request.getParameter("del1")==null&&request.getParameter("del3")==null&&request.getParameter("save")==null&&request.getParameter("save1")==null){
            
                                          subjectshow ="";
                                          ownershow ="";
                                          emailshow="";
                                          yieldshow="";
                                          testtimeshows="";
                                          chisqaureshow="";
                                          productshow="";
                                          modeltypeshow="";
                                          showtrialid ="";
                                          showtestcode="";
                                          testcodeAshow="";
                                          testcodeBshow="";
                                          showtestid="";
                                          showpfcode="";
                                          showinorex="";
                                          showhddnum="";
                                          showprocess="";
                                          showstdate="";
                                          showendate="";
                                          samplingshow="";
                                          mfgidshows="";
                                          stdate="";
                                          enddate="";

                                          String line;
                                          String pidInfo ="";
                                          Process j =Runtime.getRuntime().exec(System.getenv("windir") +"\\system32\\"+"tasklist.exe");
                                          BufferedReader input =  new BufferedReader(new InputStreamReader(j.getInputStream()));

                                          while ((line = input.readLine()) != null) {
                                           pidInfo+=line; 
                                          }

                                          input.close();
                //  <!--------------------------------Event Check run One File -------------------------------------------------------------------->
                                          if(pidInfo.contains("MacroTrigger.exe"))
                                          {
                                          
                                          out.println("<script>");
                                           out.println("checkederror1();");
                                          out.println("</script>");
                           
                                
                     }else{
                                      try{    
        
                                  File deleteFile = new File("C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\OneSummary\\ConditionFileList.csv");
                                      if(deleteFile.exists()){
                                    deleteFile.delete();
                                     }
                                         String pathoption = "C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\Condition\\OneSummary\\ConditionFileList.csv";
                                        File optionfile = new File(pathoption);
                                    
                                        Writer objWriters = new BufferedWriter(new FileWriter(optionfile));
                                        
                                      File copyFile = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\");
                                      File[] copylistfile = copyFile.listFiles();
                                      for(int d=0;d<copylistfile.length;d++) {
                                                               copylistfolder  = copylistfile[d].getName();
                                                              
                                                             String copyselections=request.getParameter("my_selects");
                                                        
                                                        if(copyselections.equals(copylistfolder)){
                                         objWriters.write(copylistfile[d].getName()+","+"1"+"\n" );
                                         objWriters.flush();
                                        objWriters.close();
    //  <!--------------------------------Config path Run Trial Summary -------------------------------------------------------------------->
                                         String pathexcel = "C:\\Tomcat_9.0\\webapps\\te6\\TrialSummary\\MacroTrigger\\MacroTrigger.exe";
                                         File fileexcel = new File(pathexcel);
                                            fileexcel.toURI();
                                        Process runs = Runtime.getRuntime().exec("cmd /c start /wait " + fileexcel );
                                          runs.waitFor();
                                        }
                                        }
                                       out.println("<script type='text/javascript'>");
                                        out.println("show4s();");
                                        out.println("</script>");
                                       }catch(IOException e){  
                                          e.printStackTrace();  
           
                                       }         
                                          }
                                    }
                %>
          </select>
    </div>
        </h4></td>
         
       <td></td>
        <td><h4>Status: </h4></td>
      <td width="252"><p><font color="#999999"><img border="0" id="showonload" src="DATA-INF/Image/a.gif" class="hide"/></font><img border="0" 
          id="showonok" src="DATA-INF/Image/ok1.png" class="hide" /></p></td>
      </tr>
       <tr id="showoptionchoose"> 
    <td width="121">&nbsp; </td>
        
      <td width="324"><input type="submit" id="save1" name="save1" value="ADD" class="button" onclick="status2();" />
        <input type="submit" id="editsummary" name="editsummary" value="EDIT" class="button" disabled onclick="statusedit2();" />
    <input type="submit" id="del3" name="del3"  value="DELETE" disabled class="button"/>
    <input type="submit" id="runscript2" name="runscript2" value="GenerateReport" disabled class="button" onclick="wait1();" />
      </td>
        
      <td width="263">&nbsp;</td>
         
      <td width="124">&nbsp;</td>
      </tr>
  
        </table>
     </fieldset>
       <table width="997" height="26" border="0" id="table3" class="hide">
      <tr> 
        <td width="848"></td>
        <td width="63"><font id="download"  color="#0F366A">Download:</font></td>
    <td width="38"  align="right">  <a href='<%=powerpointlink2%>' id="download2" name="download2" target="_blank"  onclick="changeFunc1();"> 
          <font color="#0F366A">[.ppt]</font></a> 
        </td>
        <td width="30"><a href='<%=powerpointlink1%>' id="download1" name="download1" target="_blank"  onclick="changeFunc2();"> 
          <font color="#0F366A">[.xls]</font></a></td></tr></table>
    
     <iframe id="powerpoint" name="powerpoint" height="590" width="1020" src="<%=powerpointfolder%>" class="hide" ></iframe>
          <td width="53"><select width="100%"  name="my_selec" class="hide" id="my_selec" >
       
           <%
                   
        File showpowerpoints = new File("C:\\Tomcat_9.0\\webapps\\te6\\DATA-INF\\Result_htm\\");
      File[] powerpointlistfiles = showpowerpoints.listFiles();
      String powerpointselects=request.getParameter("my_selects");
    String checkpower3 =""; 
    for(int j=0;j<powerpointlistfiles.length;j++) {
          File file1 = powerpointlistfiles[j];   
          if(file1.isFile() && file1.getName().endsWith(".htm")){
        checkpower3=powerpointlistfiles[j].getName().replaceFirst(".htm", ".csv").replaceAll(" ", "_");
           out.print("<option id=\"\"value=\"" +checkpower3+ "\">"+checkpower3+"</option>");
          }
        }
           %>
    </select>
    <b><marquee direction="left"><h4>Support<font color="green"> Google Chrome / Firefox web browser </font>but not support<font color="red"> Internet Explorer web browser</font></h4></marquee></b>
	<a href="TrialTrackerStatus/userGuide/Trial_tracker_user_guild.pptx" title="How to use ?"><b><H3>Read me please.</H3></b></a>
</form> 
  
  </div>   
          <%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>


