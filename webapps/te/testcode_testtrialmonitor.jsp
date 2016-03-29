



<%@page import="java.io.FileOutputStream"%>
<%@page import="java.nio.channels.FileChannel"%>
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
    <title> Test Engineer</title>
<head>
<%!
  String subjectshow="";  String ownershow=""; String emailshow="";  String productshow =""; 
  String showtrialid="";  String showtestcode=""; String showtestid=""; String showpfcode=""; 
  String showhddnum=""; String showprocess=""; String showstdate=""; String showendate=""; 
  String  showinorex="";int count=0;int val = 0; int j=0;String line;String addlist = "";
  String stdate="";String copylist = ""; String copylistfolder = ""; String copylistfolders = "";
  String enddate="";
%>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="author" content="Luka Cvrk (www.solucija.com)" />
<meta name="description" content="My Site" />
<meta name="keywords" content="key, words" />
<%  
String version=""; String webname="";
webname=IniFilesReader.getReturnProperties("Local.Application","Application Name"); 
version=TeWebVersionControl.getVersion();

String add = " "; String edit = " "; String run=" ";
add = request.getParameter("hidden_add");
edit = request.getParameter("hidden_edit");
run = request.getParameter("hidden_run");
    if(add==null&&edit==null&&run==null){
    
    add = "checked"  ;
    edit = " "  ;
    run = " " ;
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
    h1 { text-shadow:1px 1px #000000;}
    h4{ color: #000; background-color: #444; text-shadow: 3px 4px 5px #111; }
    body{ background-color:#fff; font-family:"Trebuchet MS", Arial, Verdana; font-size:13px; color:#444444; margin:0; }
    form{ width: 90px; padding-left: 150px; }
    form *{ background: transparent; }
    label{ display: block; width: 100px; margin: 0 auto; font-weight: bold; color: #666; padding-top: 15px;}
    input[type=checkbox]{background: none; -webkit-border-radius: 0; -moz-border-radius: 0; border-radius: 0; padding:0;
          margin: 0; width: 15px; }
    fieldset{ -webkit-border-radius: 8px; -moz-border-radius: 8px; border-radius: 8px; margin-top: 15px; color: #000; }
    input[ type=submit]{ width: 80px; padding: 10px; background: #999; color: white; border: none; float: bottom;
                         margin-bottom: 10px; margin-top: 5px; -webkit-border-radius: 10px; -moz-border-radius: 10px;
                         border-radius: 10px; font-size:13px; color: #ddd; background-color: #888; }
    input[type=button]{ width: 70px;padding: 10px;background: #999;color: white;border: none; float: bottom;
                        margin-bottom: 10px; margin-top: 5px; -webkit-border-radius: 10px; -moz-border-radius: 10px;
                        border-radius: 10px; font-size:13px; color: #ddd; background-color: #888; }
    .show { display: block;  }
    .hide { display: none; }
</style>
       
<script language="javascript" >
    function checkinex(){ document.getElementById("bycheck0").checked=false }
    function checkinclude(){ document.getElementById("bycheck0").checked=true }
    function checkexclude(){ document.getElementById("bycheck1").checked=true }
    function checkJBK(){ document.getElementById("JBK").selected=true; }
    function checkAR6(){ document.getElementById("AR6").selected=true; }
    function checkAR8(){ document.getElementById("AR8").selected=true; }
    function checkARH(){ document.getElementById("ARH").selected=true; }
    function checkARK(){ document.getElementById("ARK").selected=true; }
    function checkBRB(){ document.getElementById("BRB").selected=true; }
    function checkBRK(){ document.getElementById("BRK").selected=true; }
    function checkCBB(){ document.getElementById("CBB").selected=true; }
    function checkCBC(){ document.getElementById("CBC").selected=true; }
    function checkCBD(){ document.getElementById("CBD").selected=true; }
    function checkCBE(){ document.getElementById("CBE").selected=true; }
    function checkCBF(){ document.getElementById("CBF").selected=true; }
    function checkCEP(){ document.getElementById("CEP").selected=true; }
    function checkDPC(){ document.getElementById("DPC").selected=true; }
    function checkEB7(){ document.getElementById("EB7").selected=true; }
    function checkEC7(){ document.getElementById("EC7").selected=true; }
    function checkEGB(){ document.getElementById("EGB").selected=true; }
    function checkFB4(){ document.getElementById("FB4").selected=true; }
    function checkFB5(){ document.getElementById("FB5").selected=true; }
    function checkFB6(){ document.getElementById("FB6").selected=true; }
    function checkFLB(){ document.getElementById("FLB").selected=true; }
    function checkFLC(){ document.getElementById("FLC").selected=true; }
    function checkGMC(){ document.getElementById("GMC").selected=true; }
    function checkGMK(){ document.getElementById("GMK").selected=true; }
    function checkGMN(){ document.getElementById("GMN").selected=true; }
    function checkJ1B(){ document.getElementById("J1B").selected=true; }
    function checkJ1C(){ document.getElementById("J1C").selected=true; }
    function checkJGB(){ document.getElementById("JGB").selected=true; }
    function checkJGC(){ document.getElementById("JGC").selected=true; }
    function checkJPC(){ document.getElementById("JPC").selected=true; }
    function checkJPK(){ document.getElementById("JPK").selected=true; }
    function checkJPT(){ document.getElementById("JPT").selected=true; }
    function checkJTB(){ document.getElementById("JTB").selected=true; }
    function checkJTC(){ document.getElementById("JTC").selected=true; }
    function checkKCC(){ document.getElementById("KCC").selected=true; }
    function checkKCF(){ document.getElementById("KCF").selected=true; }
    function checkKRV(){ document.getElementById("KRV").selected=true; }
    function checkLB7(){ document.getElementById("LB7").selected=true; }
    function checkLKB(){ document.getElementById("LKB").selected=true; }
    function checkLNB(){ document.getElementById("LNB").selected=true; }
    function checkMKC(){ document.getElementById("MKC").selected=true; }
    function checkMKS(){ document.getElementById("MKS").selected=true; }
    function checkMNL(){ document.getElementById("MNL").selected=true; }
    function checkMNR(){ document.getElementById("MNR").selected=true; }
    function checkMPK(){ document.getElementById("MPK").selected=true; }
    function checkMPL(){ document.getElementById("MPL").selected=true; }
    function checkMPS(){ document.getElementById("MPS").selected=true; }
    function checkMRK(){ document.getElementById("MRK").selected=true; }
    function checkPFV(){ document.getElementById("PFV").selected=true; }
    function checkPTB(){ document.getElementById("PTB").selected=true; }
    function checkPTC(){ document.getElementById("PTC").selected=true; }
    function checkRB7(){ document.getElementById("RB7").selected=true; }
    function checkRC7(){ document.getElementById("RC7").selected=true; }
    function checkSHW(){ document.getElementById("SHW").selected=true; }
    function checkSRB(){ document.getElementById("SRB").selected=true; }
    function checkSTC(){ document.getElementById("STC").selected=true; }
    function checkSTN(){ document.getElementById("STN").selected=true; }
    function checkVNF(){ document.getElementById("VNF").selected=true; }
    function checkVPA(){ document.getElementById("VPA").selected=true; }
    function checkVPB(){ document.getElementById("VPB").selected=true; }
    function checkVPC(){ document.getElementById("VPC").selected=true; }
    function checkVPM(){ document.getElementById("VPM").selected=true; }
    function check6400(){ document.getElementById("6400").selected=true; }
    function check6600(){ document.getElementById("6600").selected=true; }
    function check6800(){ document.getElementById("6800").selected=true; }
    function check9000(){ document.getElementById("9000").selected=true; }
    function addSubmit(){ var frm = document.form1; frm.action="testcode_testtrialmonitor.jsp"; frm.submit();  }
    
    function addSubmit2(){ var select2 = document.getElementById("my_select"); select2.remove(select2.selectedIndex); }
    function showSelect() {
              var select = document.getElementById('my_select');
              var edit = document.getElementById('saved');
              var edits = document.getElementById('edits');
              var edits1 = document.getElementById('edits1');
              var text = document.getElementById('my_text');
       
              var runscript= document.getElementById('runscript');
       
              var showload= document.getElementById('showload');
              var showok= document.getElementById('showok');
              showload.className = 'hide';
              showok.className = 'hide';
        runscript.className='hide';
           
              var showload1= document.getElementById('showload1');
              var showok1= document.getElementById('showok1');
              showload1.className = 'hide';
              showok1.className = 'hide';
              select.className = 'show';
              edit.className = 'hide';
              edits.className = 'show';
              edits1.className = 'show';
              text.className = 'show';
         var state= document.getElementById('state');
    
               state.className='hide';
              document.getElementById("tsubject").value="";
              document.getElementById("oname").value="";
              document.getElementById("em").value="";
              document.getElementById("trialid1").value="";
              document.getElementById("testversion1").value="";
              document.getElementById("testid").value="";
              document.getElementById("pfcode").value="";
              document.getElementById("hddnum").value="";
              document.getElementById("inhdd").value="";
              document.getElementById("startdate").value="";
              document.getElementById("enddate").value="";
              document.getElementById("select").value="";
              document.getElementById("bycheck0").checked=false;
              document.getElementById("bycheck1").checked=false;
        document.getElementById('table1').style.visibility = "visible";
        document.getElementById('table2').style.visibility = "visible";
        document.getElementById('table3').style.visibility = "visible";
        document.getElementById('hideline1').style.visibility = "visible";
        document.getElementById('hideline2').style.visibility = "visible";
        document.getElementById('hidetext1').className='show';
        document.getElementById('hidetext2').className='show';
                            } 
    function hideSelect() {
              var select = document.getElementById('my_select');
              var edit = document.getElementById('saved');
              var edits = document.getElementById('edits');
              var edits1 = document.getElementById('edits1');
              var text = document.getElementById('my_text');
        
              var runscript= document.getElementById('runscript');
          
              var showload= document.getElementById('showload');
              var showok= document.getElementById('showok');
               var showload1= document.getElementById('showload1');
              var showok1= document.getElementById('showok1');
         var state= document.getElementById('state');
              showload1.className = 'hide';
              showload.className = 'hide';
              showok.className = 'hide';
        showok1.className = 'hide';
              select.className = 'hide';
              edit.className = 'show';
              edits.className = 'hide';
              edits1.className = 'hide';
              text.className = 'hide';
             state.className='hide';
              runscript.className='hide';
            
              document.getElementById("tsubject").value="";
              document.getElementById("oname").value="";
              document.getElementById("em").value="";
              document.getElementById("trialid1").value="";
              document.getElementById("testversion1").value="";
              document.getElementById("testid").value="";
              document.getElementById("pfcode").value="";
              document.getElementById("hddnum").value="";
              document.getElementById("inhdd").value="";
              document.getElementById("startdate").value="";
              document.getElementById("enddate").value="";
              document.getElementById("select").value="";
              document.getElementById("bycheck0").checked=true;
              document.getElementById("bycheck1").checked=false; 
        document.getElementById('table1').style.visibility = "visible";
        document.getElementById('table2').style.visibility = "visible";
        document.getElementById('table3').style.visibility = "visible";
        document.getElementById('hideline1').style.visibility = "visible";
        document.getElementById('hideline2').style.visibility = "visible";
        document.getElementById('hidetext1').className='show';
        document.getElementById('hidetext2').className='show';
                            }
    function RunSelect(){
   var select = document.getElementById('my_select');
   var text = document.getElementById('my_text');
   var runscript= document.getElementById('runscript');
 
   var edits = document.getElementById('edits');
         var edits1 = document.getElementById('edits1');
   var save = document.getElementById('saved');
   var showload1= document.getElementById('showload');
         var showok1= document.getElementById('showok');
   var state= document.getElementById('state');
   showload1.className = 'hide';
         showok1.className = 'hide';
   select.className = 'show';
   text.className = 'show';
   runscript.className='show';
   
   edits.className='hide';
         edits1.className='hide';
   save.className='hide';
   state.className='show';
  document.getElementById('table1').style.visibility = "hidden";
  document.getElementById('table2').style.visibility = "hidden";
  document.getElementById('table3').style.visibility = "hidden";
  document.getElementById('hidetext1').className='hide';
  document.getElementById('hidetext2').className='hide';
  
  document.getElementById('hideline1').style.visibility = "hidden";
  document.getElementById('hideline2').style.visibility = "hidden";
  
      }
    function load(){ var showload1= document.getElementById('showload'); showload1.className = 'show';  }
    function show(){ document.getElementById('my_select').className='hide'; 
         document.getElementById('my_text').className='hide'; alert("Successfully"); addSubmit(); } 
    function show2(){ alert(" Delete Successfully"); addSubmit(); } 
    function show3(){    var showok1= document.getElementById('showok');
                          showok1.className = 'show';
                        alert("Run Successfully");
                          addSubmit(); }
    function show4(){   
    
              var showok1= document.getElementById('showok1');
                          showok1.className = 'show';
                        alert("Run Successfully");
                          addSubmit(); }
    function wait(){  var runscript= document.getElementById('runscript');
              runscript.className='hide';
              var showload1= document.getElementById('showload');
                          showload1.className = 'show';
            }
     function wait1(){ var linkpage= document.getElementById('linkpage');
              linkpage.className='hide';
              var showload1= document.getElementById('showload1');
                          showload1.className = 'show';
            }
    function nullsFunc() { var x=document.getElementById("nulls"); alert(x.text); }
    
    function selectitem(){ 
         document.getElementById("byAdd").disabled=true;
                           document.getElementById("byEdit").disabled=true;
         document.getElementById('my_select').disabled=true;
        document.getElementById("byRun").disabled=true;
         
          }
  
    function checkOnly(stayChecked){
                    var group = document.form1.clude;
        for (var i=0; i<group.length; i++) {
            if (group[i] != stayChecked) {
                group[i].checked = false;
            }
        } 
    }  

     function checkEmail(email) {
      var regExp = /(^[a-z]([a-z_\.]*)@([a-z_\.]*)([.][a-z]{3})$)|(^[a-z]([a-z_\.]*)@([a-z_\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;
      return regExp.test(email);
      }      
        function chkdata(){
                  with(form1){
                        if(tsubject.value==""){
                          alert("Please insert Subject");
                                tsubject.focus();
                                  return false;
                          }else if(tsubject.value!=""&&tsubject.value.match(/[^A-Za-z0-9\" ""."\d]/)){
                           alert("Insert Subject Incorrect");     
                                tsubject.focus();     
                                return (false);    
                          }else if(oname.value==""){
                          alert("Please insert Owner");
                                oname.focus();
                                  return false;
                          }else if(em.value==""){
                          alert("Please insert Email");
                                em.focus();
                                  return false;
                          }else if(select.value==""){
                          alert("Please insert Product");
                                select.focus();
                                  return false;
                          }else if(hddnum.value==""){
                          alert("Please insert HDD Number");
                                hddnum.focus();
                                  return false;
                          }else if(inhdd.value==""){
                          alert("Please Select Start Process");
                                inhdd.focus();
                                  return false;
                          }else if(startdate.value==""){
                          alert("Please insert Startdate");
                                startdate.focus();
                                  return false;
                          }else if(enddate.value==""){
                          alert("Please insert Enddate");
                                enddate.focus();
                                  return false;
                          }else if(trialid1.value!=""&&trialid1.value.match(/[^A-Za-z0-9\";*"\d]/)){
                          alert("TrialID Incorect");
                                trialid1.focus();
                                  return false;
                          }else if(testversion1.value!=""&&testversion1.value.match(/[^A-Za-z0-9\".;*"\d]/)){
                         alert("TestCode Incorect");
                                testversion1.focus();
                                return false;
                          }else if(testid.value!=""&&testid.value.match(/[^A-Za-z0-9\";*"\d]/)){
                         alert("TesterID Incorect");
                                testid.focus();
                                return false;
                          }else if(pfcode.value!=""&&pfcode.value.match(/[^A-Za-z0-9\";*"\d]/)){
                         alert("PFcode Incorect");
                                pfcode.focus();
                                return false;
                          }else if(em.value!=""){
                                
                                var emails = document.getElementById("em").value;
                               var emailArray = emails.split(";");
                               var invEmails = "";
                               for(i = 0; i <= (emailArray.length - 1); i++){
                                 if(!checkEmail(emailArray[i])){
                                     invEmails += emailArray[i] + "\n";
                                if(invEmails != ""){
                                 alert("Invalid emails:\n" + invEmails);
                                  em.focus();
                                     return false;
                                   }
                                   } }} } addSubmit(); }
     function checkederror(){
        alert("Error!!! Run Unsuccessful");
         addSubmit();
      } 
                 
    function startTime(){
              var today = new Date();
              var h = today.getHours();
              var m = today.getMinutes();
              var s = today.getSeconds();
              m = checkTime(m);
              s = checkTime(s);
              document.getElementById("time").innerHTML=h+":"+m+":"+s;
              t = setTimeout(function(){startTime()},500);}
              function checkTime(i)
              {if (i<10){i="0" + i;}return i;}
              
              var isNS = (navigator.appName == "Netscape") ? 1 : 0;
          if(navigator.appName == "Netscape") document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP);
    function mischandler(){

            return false;
                }

    function mousehandler(e){

          var myevent = (isNS) ? e : event;

          var eventbutton = (isNS) ? myevent.which : myevent.button;

          if((eventbutton==2)||(eventbutton==3)) alert("Disabled Right Click"); return false;}

          document.oncontextmenu = mischandler;

          //document.onmousedown = mousehandler;

          document.onmouseup = mousehandler

        
</script>
</head>

<body  onload="startTime()" >

<!-- ----------------------Te Logo--------------------------- -->
<div id="Layer1" style="position:absolute; left:3px; top:3px; width:84px; height:70px; z-index:1"><img src="DATA-INF/Image/telogo.jpg" width="275" height="100%" /></div> 
<!-- -------------------------------------------------------- -->
<!--  <div id="Layer2" style="position:absolute; left:460px; top:255px; width:505px; height:46px; z-index:2"> </div>  -->
<%String menumode="testcode_testtrialmonitor.jsp";%>  
<!-- ---------------------------------Left Layout -------------- -->
<div id="contentleft">
  <div id="left"> 
  <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
  <div id="headerL"></div>  
   </div> 

<!-- ============================================Top Layout============================================================================== -->

<div id="right"> <%@ include file="PageLayout/testcode_righttoplayout.jsp" %></div> 

<!-- =============================================Center Layout========================================================================== -->
  


            <!-- ============================================Form Page============================================================================== -->
                 <form name="form1" id="form1" method="post" action="" target="_parent">
          
          <input type="hidden" name="hidden_add" />
      <input type="hidden" name="hidden_edit" />
      <input type="hidden" name="hidden_run" />
          <!-- ============================================Mode============================================================================== -->
      
  
    <h1>&nbsp;</h1>
  
  <fieldset >
  <legend >
    <h1>Mode</h1>
        </legend>
    <table width="1000" height="45" border="0" bordercolor="#00000">
      <tr> 
        <td width="124" height="41"><input type="radio" name="reportOption" id="byAdd" value="byAdd" onclick="hideSelect();"  <%=add%> />
          Add</td>
        <td width="57"><input type="radio" name="reportOption" id="byEdit" value="byEdit" onclick="showSelect();"  <%=edit%> />
          Edit </td>
        <td width="80"><input type="radio" name="reportOption" id="byRun" value="byRun" onclick="RunSelect();" <%=run%>    />
          Run</td>
        <td></td>
        <td width="70">&nbsp; </td>
        <td id="state" class="hide"><p>Status: </p></td>
        <td><p>&nbsp;</p></td>
        <td width="32"> <p><font color="#999999"><img border="0" id="showload" src="DATA-INF/Image/a.gif" class="hide"/></font><img border="0" 
          id="showok" src="DATA-INF/Image/ok.png" class="hide" /></p></td>
        <td width="32"> <p><font color="#999999"><img border="0" id="showload1" src="DATA-INF/Image/a.gif" class="hide"/></font><img border="0" 
          id="showok1" src="DATA-INF/Image/ok.png" class="hide" /></p></td>
        <td width="323"></td>
      </tr>
      <tr> 
        <td width="124" id="my_text" class="hide" ><p>Choose CSV File: </p></td>
        <td width="57"><select width="100%"  name="my_select" class="hide" id="my_select"  >
            <!-- ============================================Event Delete File in Folder============================================================================== -->
           
            <%
                            File appFolder = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition");
              
                            File[] list = appFolder.listFiles();
                            
                           
                          
                             for(int i=0;i<list.length;i++)
                        {
                                 File file = list[i];   
                            if (file.isFile() && file.getName().endsWith(".csv")) {
                           addlist = list[i].getName();
                                    
                              out.print("<option id=\"" +addlist+ "\"value=\"" +addlist+ "\">"+addlist+"</option>"); }
                                            
                               if(request.getParameter("del")!=null){
                            
                                   String selection=request.getParameter("my_select");
                                   
                              if(selection.equals(addlist)){
                        
                                list[i].delete();
                            
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
                                out.println("<script type='text/javascript'>");
                                out.println("show2();");
                                out.println("</script>"); }
//<!-- ============================================Event Edit File ============================================================================== -->                               
                            if(request.getParameter("del1")!=null&&request.getParameter("del")==null&&request.getParameter("saved")==null){
                               
                                   File editFolder = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\");
                                   File[] lists1 = editFolder.listFiles();
                                for(int h=0;h<lists1.length;h++)
                        {
                            
                         String editlist = lists1[h].getName();
                               String edition=request.getParameter("my_select");
                                if(edition.equals(editlist)){
                            
                            try {
                                    FileReader files = new FileReader(lists1[h]);
                                  
                                     BufferedReader reader = new BufferedReader(files);
                                          subjectshow = reader.readLine();
                                          ownershow = reader.readLine();
                                          emailshow= reader.readLine();
                                          productshow= reader.readLine();
                                          showtrialid = reader.readLine();
                                          showtestcode = reader.readLine();
                                          showtestid= reader.readLine();
                                          showpfcode= reader.readLine();
                                          showinorex= reader.readLine();
                                          showhddnum= reader.readLine();
                                          showprocess= reader.readLine();
                                          showstdate= reader.readLine();
                                          showendate= reader.readLine();
                               String[] strar = subjectshow.split(",");
                               String[] strar1 = ownershow.split(",");
                               String[] strar2 = emailshow.split(",");
                               String[] strar3 =   productshow.split(",");
                               String[] strar4 = showtrialid.split(",");
                               String[] strar5 = showtestcode.split(",");
                               String[] strar6 = showtestid.split(",");
                               String[] strar7 = showpfcode.split(",");
                               String[] strar12 = showinorex.split(",");
                               String[] strar8 =  showhddnum.split(",");
                               String[] strar9 = showprocess.split(",");
                               String[] strar10 = showstdate.split(",");
                               String[] strar11 = showendate.split(",");
                               for(String s:strar){ subjectshow=s; }
                               for(String s:strar1){ ownershow=s; }
                               for(String s:strar2){ emailshow=s; }
                               for(String s:strar3){ productshow=s; }
                               for(String s:strar4){ showtrialid=s; }
                               for(String s:strar5){ showtestcode=s; }
                               for(String s:strar6){ showtestid=s; }
                               for(String s:strar7){ showpfcode=s; }
                               for(String s:strar12){ showinorex=s; }
                               for(String s:strar8){ showhddnum=s; }
                               for(String s:strar9){ showprocess= s; }
                               for(String s:strar10){ showstdate=s; }
                               for(String s:strar11){ showendate=s; }
                               reader.close();
                               if(showstdate!=null){
                                    String date1=showstdate.substring(0,2);
                                    String slash3=showstdate.substring(2,3);
                                    String month=showstdate.substring(3,6);
                                    String slash4=showstdate.substring(6,7);
                                    String year1=showstdate.substring(7,9);
                                     String months1[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int mon1;
                                     
                                       if(month.equals("Jan")){
                                          mon1=1;
                                           stdate =20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Feb")){
                                       mon1=2;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Mar")){
                                       mon1=3;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Apr")){
                                       mon1=4;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("May")){
                                       mon1=5;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Jun")){
                                       mon1=6;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Jul")){
                                       mon1=7;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Aug")){
                                       mon1=8;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Sep")){
                                       mon1=9;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Oct")){
                                       mon1=10;
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;

                                      }else if(month.equals("Nov")){
                                       mon1=11; 
                                         stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Dec")){
                                       mon1=12;
                                        stdate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }
                                   }
                                  if(showendate!=null){
                                    String date1=showendate.substring(0,2);
                                    String slash3=showendate.substring(2,3);
                                    String month=showendate.substring(3,6);
                                    String slash4=showendate.substring(6,7);
                                    String year1=showendate.substring(7,9);

                                     String months1[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int mon1;
                                     
                                       if(month.equals("Jan")){
                                          mon1=1;
                                           enddate =20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Feb")){
                                       mon1=2;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Mar")){
                                       mon1=3;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Apr")){
                                       mon1=4;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("May")){
                                       mon1=5;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Jun")){
                                       mon1=6;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Jul")){
                                       mon1=7;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Aug")){
                                       mon1=8;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Sep")){
                                       mon1=9;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Oct")){
                                       mon1=10;
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;

                                      }else if(month.equals("Nov")){
                                       mon1=11; 
                                         enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }else if(month.equals("Dec")){
                                       mon1=12;
                                        enddate=20+year1+slash3+months1[mon1]+slash4+date1;
                                      }
                                   }
                               out.println("<script type='text/javascript'>");
                               out.println("selectitem();");
					             out.println("hidebutton();");
					             out.println("</script>");
                           } catch (FileNotFoundException e) { e.printStackTrace();
                           }catch (IOException e) { e.printStackTrace(); } 
                               } } } }
 //<!-- ============================================Event Save File============================================================================== -->
                                String clude=request.getParameter("clude");
                                if(clude==null){
                                clude="";
                                }
                               
                                String paraName =request.getParameter("tsubject");
                                String email =request.getParameter("em");
                                String name=request.getParameter("oname");
                                String num=request.getParameter("hddnum");
                                String inhd=request.getParameter("inhdd");
                                String start=request.getParameter("startdate");
                                String end=request.getParameter("enddate");
                                String select=request.getParameter("select");
                                String trialid1=request.getParameter("trialid1");
                                String testversion1=request.getParameter("testversion1");
                                String testid1=request.getParameter("testid");
                                String pfcode=request.getParameter("pfcode");
                              if(paraName!=""&&paraName!=null&&name!=""&&email!=""&&request.getParameter("del1")==null&&request.getParameter("del")==null){
                                if(trialid1==""){ trialid1="*";}
                                if(testversion1==""){testversion1="*";}
                                if(testid1==""){testid1="*";}
                                if(pfcode==""){pfcode="*";}

                                String strPath = ("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\"+(paraName)+".csv");
                                File strFile = new File(strPath);
                                Writer objWriter = new BufferedWriter(new FileWriter(strFile));
                                objWriter.write("TrialSubject"+","+(paraName)+"\n");
                                objWriter.write("OwnerName"+","+(name)+"\n");
                                objWriter.write("Email"+","+(email)+"\n");
                                objWriter.write("Product"+","+(select)+"\n");
                                objWriter.write("TrialID"+","+(trialid1)+"\n");
                                objWriter.write("TestCode"+","+(testversion1)+"\n");
                                objWriter.write("TesterID"+","+(testid1)+"\n");
                                objWriter.write("PFCode"+","+(pfcode)+"\n");
                                objWriter.write("Include"+","+(clude)+"\n");
                                objWriter.write("Drive input"+","+(num)+"\n");
                                objWriter.write("Process"+","+(inhd)+"\n");
                                  if(start!=null){
                                    String months[] = {"",
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                         "Sep", "Oct", "Nov", "Dec"};
  
                                    String date=start.substring(8,10).replaceAll("/", "-");
                                  
                                    String slash1=start.substring(4,5).replaceAll("/", "-");
                                   
                                    String month=start.substring(5,7).replaceAll("/", "-");
                                    int numss=Integer.parseInt(month);
                                    
                                    String slash2=start.substring(7,8).replaceAll("/", "-");
                                 
                                    String year=start.substring(2,4);
                                
                                    String  sdate=date+slash1+months[numss]+slash2+year;
                                    
                                    objWriter.write("StartDate"+","+(sdate)+"\n");
                                    
                                    }if(end!=null){
                                    String months1[] = {"",
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                         "Sep", "Oct", "Nov", "Dec"};
  
                                    String date1=end.substring(8,10).replaceAll("/", "-");
                                 
                                    String slash3=end.substring(4,5).replaceAll("/", "-");
                                 
                                    String month1=end.substring(5,7).replaceAll("/", "-");
                                    int numss1=Integer.parseInt(month1);
                                  
                                    String slash4=end.substring(7,8).replaceAll("/", "-");
                                 
                                    String year1=end.substring(2,4);
                                  
                                    String  edate=date1+slash3+months1[numss1]+slash4+year1; 
                                   
                                       
                                objWriter.write("EndDate"+","+(edate)+"\n");
                                 }
                                objWriter.flush();
                                objWriter.close();
                                out.println("<script type='text/javascript'>");
                                out.println("show();");
                                out.println("</script>");
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
                                  try{
                                      
                                     String pathoptionss = "C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\OneCondition\\OnlythisCoditiontion.csv";
                                        File optionfiles = new File(pathoptionss);
                                     Writer objWritersss = new BufferedWriter(new FileWriter(optionfiles));
                                       File copyFiless = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\OneCondition\\");
                                  File[] copylistfiless = copyFiless.listFiles();
                                            for(int f=0;f<copylistfiless.length;f++) {
                                             objWritersss.write("All"+"\n");
                                            
                                        }
                                        objWritersss.flush();
                                        objWritersss.close();
                                      }catch(IOException  e){  
                                          e.printStackTrace();  
                                       }    
                              if(request.getParameter("runscript")!=null&&request.getParameter("del1")==null&&request.getParameter("del")==null&&request.getParameter("saved")==null){
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
                                  
                              
                                
                                try{
                                   String pathoptions = "C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\OneCondition\\OnlythisCoditiontion.csv";
                                        File optionfiles = new File(pathoptions);
                                     Writer objWriterss = new BufferedWriter(new FileWriter(optionfiles));
                                       File copyFiles = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\");
                                  File[] copylistfiles = copyFiles.listFiles();
                                   File deleteFiles = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\OneCondition\\OnlythisCoditiontion.csv");
                                      if(deleteFiles.exists()){
                                    deleteFiles.delete();
                                     }
                                            for(int f=0;f<copylistfiles.length;f++) {
                                                           copylistfolders  = copylistfiles[f].getName();
                                                              
                                                             String copyselectionss=request.getParameter("my_select");
                                                 if(copyselectionss.equals(copylistfolders)){
                                             objWriterss.write("one"+"\n");
                                             objWriterss.write(copylistfiles[f].getName()+"\n");
                                            objWriterss.flush();
                                         objWriterss.close();
                                           
                                        }

                                      }
                 
            String pathcsv = "C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\MacroTrigger\\MacroTrigger.exe";
            File finishfiles = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\Condition\\OneCondition\\comp.bin");
            File finishfile = new File("C:\\Tomcat_9.0\\webapps\\TrialTrackerStatus\\");
            File[] checklistfiles = finishfile.listFiles();
            File filecsv = new File(pathcsv);
            filecsv.toURI();
            Process p = Runtime.getRuntime().exec("cmd /c start /wait " + filecsv );
            p.waitFor();
                    for(int c=0;c< checklistfiles.length;c++) {
                                            
                                          
                                              if (finishfiles.exists()) {
                                               out.println("<script type='text/javascript'>");
                                              out.println("show3();");
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
                                 if(request.getParameter("runscript")==null&&request.getParameter("del1")==null&&request.getParameter("del")==null&&request.getParameter("saved")==null){
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
          </select> </td>
        <td width="80"><input type="submit" id="edits1" name="del1"  value="EDIT" class="hide" /></td>
        <td width="80"><input type="submit" id="edits" name="del"  value="DELETE" class="hide"  /></td>
        <td width="70"><input type="button" id="saved" name="saved" value="SAVE" class="show" onclick="return chkdata();" /></td>
        <td width="80"><input type="submit" name="runscript" id="runscript" value="Run" class="hide" onclick="wait();" /></td>
        
      </tr>
    </table>
                 </fieldset>
    <fieldset id="hideline1" >
                <!-- ============================================Information============================================================================== -->
    <legend id="hidetext1" class="show">
      <h2>Infomation</h2>
        </legend>
    <table border="0" bordercolor="#00000" width="1000" id="table1" >
          <tr > 
            <td> <table  width="100%" border="0"id="table2"  >
                <tr > 
                  <td width="123">Subject:<font color="red">*</font></td>
                <td width="832"><input type="text" name="tsubject"  id="tsubject"   size="100" value="<%=subjectshow%>"/><font color="#999999"> No Special characters</font></td>
                </tr>
                <tr > 
                  <td>Owner:<font color="red">*</font></td>
                  
              <td> <input name="oname" type="text" id="oname"   size="100"value="<%=ownershow%>"/> 
                <font color="#999999"> Name of Owner</font></td>
                </tr>
                <tr> 
                  <td>Email:<font color="red">*</font></td>
                  <td> <input name="em" type="text" id="em" name="em" size="100" value="<%=emailshow%>"/>
                
                <font color="#999999">Example:a@hgst.com;b@hgst.com</font></td>
                  <td width="10">  </td>
                </tr>
             </table></td>
          </tr>
        </table>
     </fieldset>
    <fieldset id="hideline2" >
        <!-- ============================================Condition============================================================================== -->
  <legend id="hidetext2">
      <h2>Condition</h2>
        </legend>
        <table border="0" bordercolor="#00000" width="1000" id="table3" >
          <tr> 
            <td width="126">Product:<font color="red">*</font></td>
             <td><select name="select" id="select"/>
                
              <option id="pselect" value="">Please Select Product</option> 
                <option id="AR6" value='AR6'>AR6</option>
                <option id="AR8" value='AR8'>AR8</option>
                <option id="ARH" value='ARH'>ARH</option>
                <option id="ARK" value='ARK'>ARK</option>
                <option id="BRB" value='BRB'>BRB</option>
                <option id="BRK" value='BRK'>BRK</option>
                <option id="CBB" value='CBB'>CBB</option>
                <option id="CBC" value='CBC'>CBC</option>
                <option id="CBD" value='CBD'>CBD</option>
                <option id="CBE" value='CBE'>CBE</option>
                <option id="CBF" value='CBF'>CBF</option>
                <option id="CEP" value='CEP'>CEP</option>
                <option id="DPC" value='DPC'>DPC</option>
                <option id="EB7" value='EB7'>EB7</option>
                <option id="EC7" value='EC7'>EC7</option>
                <option id="EGB" value='EGB'>EGB</option>
                <option id="FB4" value='FB4'>FB4</option>
                <option id="FB5" value='FB5'>FB5</option>
                <option id="FB6" value='FB6'>FB6</option>
                <option id="FLB" value='FLB'>FLB</option>
                <option id="FLC" value='FLC'>FLC</option>
                <option id="GMC" value='GMC'>GMC</option>
                <option id="GMK" value='GMK'>GMK</option>
                <option id="GMN" value='GMN'>GMN</option>
                <option id="J1B" value='J1B'>J1B</option>
                <option id="J1C" value='J1C'>J1C</option>
                <option id="JBK" value='JBK'>JBK</option>
                <option id="JGB" value='JGB'>JGB</option>
                <option id="JGC" value='JGC'>JGC</option>
                <option id="JPC" value='JPC'>JPC</option>
                <option id="JPK" value='JPK'>JPK</option>
                <option id="JPT" value='JPT'>JPT</option>
                <option id="JTB" value='JTB'>JTB</option>
                <option id="JTC" value='JTC'>JTC</option>
                <option id="KCC" value='KCC'>KCC</option>
                <option id="KCF" value='KCF'>KCF</option>
                <option id="KRV" value='KRV'>KRV</option>
                <option id="LB7" value='LB7'>LB7</option>
                <option id="LKB" value='LKB'>LKB</option>
                <option id="LNB" value='LNB'>LNB</option>
                <option id="MKC" value='MKC'>MKC</option>
                <option id="MKS" value='MKS'>MKS</option>
                <option id="MNL" value='MNL'>MNL</option>
                <option id="MNR" value='MNR'>MNR</option>
                <option id="MPK" value='MPK'>MPK</option>
                <option id="MPL" value='MPL'>MPL</option>
                <option id="MPS" value='MPS'>MPS</option>
                <option id="MRK" value='MRK'>MRK</option>
                <option id="PFV" value='PFV'>PFV</option>
                <option id="PTB" value='PTB'>PTB</option>
                <option id="PTC" value='PTC'>PTC</option>
                <option id="RB7" value='RB7'>RB7</option>
                <option id="RC7" value='RC7'>RC7</option>
                <option id="SHW" value='SHW'>SHW</option>
                <option id="SRB" value='SRB'>SRB</option>
                <option id="STC" value='STC'>STC</option>
                <option id="STN" value='STN'>STN</option>
                <option id="VNF" value='VNF'>VNF</option>
                <option id="VPA" value='VPA'>VPA</option>
                <option id="VPB" value='VPB'>VPB</option>
                <option id="VPC" value='VPC'>VPC</option>
                <option id="VPM" value='VPM'>VPM</option>
                
          <!-- ============================================Event Show Edit Dropdown List============================================================================== -->
          <%
                  if(request.getParameter("del1")!=null&&productshow.equals("JBK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJBK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("AR6")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkAR6();");
                                out.println("</script>"); 
                  }else if(request.getParameter("del1")!=null&&productshow.equals("AR8")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkAR8();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("ARH")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkARH();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("ARK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkARK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("BRB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkBRB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("BRK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkBRK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("CBB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("CBC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("CBD")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBD();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("CBE")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBE();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("CBF")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBF();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("CEP")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCEP();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("DPC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkDPC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("EB7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkEB7();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("EC7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkEC7();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("EGB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkEGB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("FB4")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFB4();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("FB5")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFB5();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("FB6")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFB6();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("FLB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFLB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("FLC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFLC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("GMC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkGMC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("GMK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkGMK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("GMN")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkGMN();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("J1B")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJ1B();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("J1C")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJ1C();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JGB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJGB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JGC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJGC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JPC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJPC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JPK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJPK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JPT")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJPT();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JTB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJTB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("JTC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJTC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("KCC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkKCC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("KCF")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkKCF();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("KRV")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkKRV();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("LB7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkLB7();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("LKB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkLKB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("LNB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkLNB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MKC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMKC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MKS")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMKS();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MNL")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMNL();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MNR")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMNR();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MPK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMPK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MPL")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMPL();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MPS")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMPS();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("MRK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMRK();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("PFV")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkPFV();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("PTB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkPTB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("PTC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkPTC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("RB7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkRB7();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("RC7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkRC7();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("SHW")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSHW();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("SRB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSRB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("STC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSTC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("STN")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSTN();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("VNF")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVNF();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("VPA")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPA();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("VPB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPB();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("VPC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPC();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&productshow.equals("VPM")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPM();");
                                out.println("</script>");
                  }
              %>
        </td> 
       
           </tr>
          <tr > 
            <td>TrialID:</td>
            <td><input name="trialid1" type="text" id="trialid1" size="100" value="<%=showtrialid%>"/><font color="#999999"> Example: A497;A498</font></td>
          </tr>
          <tr > 
            <td>TestCode:</td>
            <td><input name="testversion1" type="text" id="testversion1" size="100"value="<%=showtestcode%>"/><font color="#999999"> Example: UMN2C10E;UMN1CB5A</font></td>
          </tr>
          <tr> 
            <td>TesterID:</td>
            <td><input name="testid" type="text" id="testid" size="100" value="<%=showtestid%>"/><font color="#999999"> Example: T084;T085</font></td>
          </tr>
          <tr> 
            <td>PFCode:</td>
            <td><input name="pfcode" type="text" id="pfcode" size="100" value="<%=showpfcode%>"/> 
                <input type="checkbox" id="bycheck0" value="0" name="clude"  checked="checked" onclick="checkOnly(this);" />Include 
              <input type="checkbox" id="bycheck1" value="1" name="clude" onclick="checkOnly(this);"/> Exclude
            <font color="#999999"> Example:0000</font> 
            </td>
 <!-- ============================================ Event Check box============================================================================== -->
              <%
                  if(request.getParameter("del1")!=null&&showinorex.equals("0")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkinclude();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&showinorex.equals("1")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkexclude();");
                                out.println("checkinex();");
                                out.println("</script>");
                  }
              %>
          </tr>
          <tr> 
            <td>Drive Input:<font color="red">*</font></td>
            <td><input type="text" id="hddnum" name="hddnum"value="<%=showhddnum%>"/><font color="#999999"> Example: 560</font></td>
          </tr>
          <tr> 
            <td>Start Process:<font color="red">*</font></td>
            <td><select name="inhdd" id="inhdd"/>
                <option id="selectpro" value="">Please Select Process</option> 
                <option id="6400" value="6400">6400</option>
                <option id="6600" value="6600">6600</option>
                <option id="6800" value="6800">6800</option>
                <option id="9000" value="9000">9000</option>
            </td>
            <%  if(request.getParameter("del1")!=null&&showprocess.equals("6400")){
                                out.println("<script type='text/javascript'>");
                                out.println("check6400();");
                                out.println("</script>");
                  }else if(request.getParameter("del1")!=null&&showprocess.equals("6600")){
                                out.println("<script type='text/javascript'>");
                                out.println("check6600();");
                                out.println("</script>"); 
                  }
            else if(request.getParameter("del1")!=null&&showprocess.equals("6800")){
                                out.println("<script type='text/javascript'>");
                                out.println("check6800();");
                                out.println("</script>"); 
                  }
            else if(request.getParameter("del1")!=null&&showprocess.equals("9000")){
                                out.println("<script type='text/javascript'>");
                                out.println("check9000();");
                                out.println("</script>"); 
                  }
            %>
         
          </tr>
          <tr > 
            <td >StartDate:<font color="red">*</font></td>
            <td> <input type="date" name="startdate" id="startdate" value="<%=stdate%>"/><font color="#999999"> Example: 29/10/2013</font></td>
          </tr>
          <tr> 
            <td>EndDate:<font color="red">*</font></td>
            <td> <input type="date" name="enddate" id="enddate" value="<%=enddate%>"/><font color="#999999"> Example: 31/10/2013</font></td>
          </tr>
         </table>
      </fieldset> 
  
        <div id="time" align="right"></div>
      </form> 
      </div>   
          <%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>
            