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
          <!--background: url(DATA-INF/Image/Select.png) no-repeat ;-->
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
    body{ background-color:#fff; font-family:Arial, Verdana; font-size:14px; color:#444444; margin:0; }
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
	<body>
		<%
			String filepath = "C:\\Tomcat_9.0\\webapps\\te6\\TrialTrackerStatus\\MacroTrigger\\MacroTrigger.exe";
			Set Wb = Application.Workbooks.Open(filepath);
		%>
	</body>

</html>


