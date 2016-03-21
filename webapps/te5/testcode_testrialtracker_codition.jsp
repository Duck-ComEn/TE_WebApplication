
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
   
<head>
<%!
  String subjectshow="";  String ownershow=""; String emailshow="";  String productshow =""; 
  String showtrialid="";  String showtestcode=""; String showtestid=""; String showpfcode=""; 
  String showhddnum=""; String showprocess=""; String showstdate=""; String showendate=""; 
  String  showinorex="";int count=0;int val = 0; int j=0;String line;String addlist = "";
  String stdate="";String stdate1="";String stdate2=""; String copylist = ""; String copylistfolder = ""; String powerpointfolder="";
  String enddate1=""; String enddate2="";  String allshow=""; String yieldshow=""; String testtimeshows="";
  String chisqaureshow=""; String testcodeAshow=""; String testcodeBshow="";String powerpointlink2="";
  String modeltypeshow=""; String samplingshow=""; String mfgidshows="";String powerpointlink1="";
  String testtimestracks1=""; String copylistfolders = "";String showstdate1; String dateend;
  String showendate1=""; String showstdate2=""; String showendate2=""; String mfgidshows1=""; 
  String mfgidshows2=""; String showtrialid1=""; String showtrialid2=""; 
%>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="author" content="Luka Cvrk (www.solucija.com)" />
<meta name="description" content="My Site" />
<meta name="keywords" content="key, words" />
<%  
String apppath=application.getRealPath("");


String version=""; String webname="";
webname=IniFilesReader.getReturnProperties("Local.Application","Application Name"); 
version=TeWebVersionControl.getVersion();

String yield; String testtime; String chisqaure; String trackers; String summarys;
String hyt=" "; String htchi=" "; String hychi=" "; String hytchi=" "; String oness=" "; 


yield = request.getParameter("hidden_yield");
testtime = request.getParameter("hidden_testtime");
chisqaure = request.getParameter("hidden_chisqaure");
trackers = request.getParameter("hidden_trackers");
summarys = request.getParameter("hidden_summarys");

hyt = request.getParameter("hidden_yt" );
htchi = request.getParameter("hidden_tchi");
hychi = request.getParameter("hidden_ychi");
hytchi = request.getParameter("hidden_ytchi" );
oness = request.getParameter("hidden_oness" );   

   
     if(yield==null&&testtime==null&&chisqaure==null&&request.getParameter("editsummary")==null&&request.getParameter("edittracker")==null){
    
    
    yield  = " "  ;
    testtime = " " ;
    chisqaure  = "checked" ;
    } 


     if(trackers==null&&summarys==null){
    
    trackers = " "  ;
    summarys  = "checked"  ;
      
    }

    if(hyt==null&&htchi==null&&hychi==null&&hytchi==null&&oness==null){
    
         hyt = " "  ;
        htchi = " "  ;
        hychi = " "  ;
        hytchi=" "  ;
        oness="checked";
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
  .selectContainerStyled {
    position: relative;
    border: 1px solid #b5b5b5;
    border-radius: 4px;
    background-clip: padding-box;
    background-color: #f1f1f1;
    display:inline-block;
    box-shadow: 0 1px 3px rgba(0,0,0,.13), inset 0 1px 0 #fff;
    color: 0 1px 3px rgba(0,0,0,.13), inset 0 1px 0 #fff;
    background-image: linear-gradient(bottom, #dcdcdc 0%, #dcdcdc 2%, #f3f3f3 100%);
        }
        .selectContainerStyled select {
    float: left;
    position: relative;
    z-index: 2;
    height: 30px;
    display: block;
    line-height: 14px;
    padding: 5px 25px 4px 5px;
    margin: 0;
    -moz-appearance: window;
    -moz-padding-end: 19px;
    background: transparent;
    background-color: transparent;
    border: none;
    -webkit-appearance: none;
    appearance: none;
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
   input[type="text"]:disabled
            {
            background:#dddddd;
            }
     input[type="date"]:disabled
            {
            background:#dddddd;
            }
  
</style>
   

       <script language="javascript" >
    function checkinex(){ document.getElementById("bycheck0").checked=false }
    function checkinclude(){ document.getElementById("bycheck0").checked=true }
    function checkexclude(){ document.getElementById("bycheck1").checked=true }
    function checkJBK(){ document.getElementById("JBK").selected=true; }
    function checkAR6(){ document.getElementById("AR6").selected=true; }
    function checkAR8(){ document.getElementById("AR8").selected=true; }
    function checkARH(){ document.getElementById("ARH").selected=true; }
    function checkARK(){ document.getElementById("APK").selected=true; }
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
    function checkno(){ document.getElementById("selectpro").selected=true; }
    function checkradioyield(){ document.getElementById("summarys").checked=true; document.getElementById("yieldselect").checked=true;
                                    document.getElementById('oneselects').checked=true; }
    function checkradiotesttime(){ document.getElementById("summarys").checked=true; document.getElementById("testtimeselect").checked=true; 
                                    document.getElementById('oneselects').checked=true;}
    function checkradiochisqaure(){document.getElementById("summarys").checked=true; document.getElementById("chisquareselect").checked=true;
                                    document.getElementById('oneselects').checked=true; }
     function checkradioyt(){document.getElementById("summarys").checked=true; document.getElementById("yieldselect").checked=true;
                             document.getElementById("testtimeselect").checked=true; document.getElementById("tyselect").checked=true;}
    function checkradiocht(){document.getElementById("summarys").checked=true; document.getElementById("chisquareselect").checked=true;
                             document.getElementById("testtimeselect").checked=true; document.getElementById("tchiselect").checked=true;}
    function checkradiochy(){document.getElementById("summarys").checked=true; document.getElementById("chisquareselect").checked=true;
                             document.getElementById("yieldselect").checked=true; document.getElementById("ychiselect").checked=true;}
    function checkradioychit(){  document.getElementById("summarys").checked=true; document.getElementById("chisquareselect").checked=true;
                              document.getElementById("yieldselect").checked=true; document.getElementById("testtimeselect").checked=true;
                              document.getElementById("ytchiselects").checked=true;}       
    function checkradiotrackerss(){  document.getElementById('hide1').style.visibility = "hidden";
                                    document.getElementById("trackers").checked=true;
                                     document.getElementById('oneselects').checked=true;
                                   }

    function addSubmit(){ var frm = document.form1; frm.action="testcode_testrialtracker_codition.jsp"; frm.submit();}
 
   
      function radiocheckallchi(){
        
         document.getElementById('yieldselect').style.visibility = "visible";
        document.getElementById('testtimeselect').style.visibility = "visible";
        document.getElementById('chisquareselect').style.visibility = "visible";
              document.getElementById('samplings').style.visibility = "visible";
              document.getElementById('samplingtext').style.visibility = "visible";
              document.getElementById('testcodeAs').style.visibility = "visible";
              document.getElementById('testcodeBs').style.visibility = "visible";
              document.getElementById('testcodeAtext').style.visibility = "visible";
              document.getElementById('testcodeBtext').style.visibility = "visible";
              document.getElementById('newdate1').style.visibility = "visible";
              document.getElementById('newdate2').style.visibility = "visible";
              document.getElementById('newdate3').style.visibility = "visible";
              document.getElementById('newdate4').style.visibility = "visible";
     
              
              document.getElementById('chi1').style.visibility = "visible";
              
              document.getElementById('chi3').style.visibility = "visible";
              document.getElementById('chi4').style.visibility = "visible";
              document.getElementById('chi5').style.visibility = "visible";
              document.getElementById('chi6').style.visibility = "visible";
              document.getElementById('hide1').style.visibility = "visible";
              document.getElementById('starx').style.visibility = "visible";
             
              document.getElementById('starz').style.visibility = "visible";
              document.getElementById('sampling').disabled=false;
              document.getElementById('enddate2').disabled=false;
              document.getElementById('enddate3').disabled=false;
              document.getElementById('startdate2').disabled=false;
              document.getElementById('startdate3').disabled=false;
              document.getElementById('trialid4').disabled=false;
              document.getElementById('trialid3').disabled=false;
          
              document.getElementById('mfgid2').disabled=false;
              document.getElementById('mfgid1').disabled=false;
              document.getElementById('mfgid').disabled=false;
              document.getElementById('testcodeB').disabled=false;
              document.getElementById('testcodeA').disabled=false;
          
              document.getElementById('starl').style.visibility = "visible";
              document.getElementById('starl1').style.visibility = "visible";
              document.getElementById('starl2').style.visibility  = "visible";
                } 
                  function radiocheckallchiss(){
        
          document.getElementById('oneselects').checked=true;
         document.getElementById('yieldselect').style.visibility = "visible";
        document.getElementById('testtimeselect').style.visibility = "visible";
        document.getElementById('chisquareselect').style.visibility = "visible";
              document.getElementById('samplings').style.visibility = "visible";
              document.getElementById('testcodeAs').style.visibility = "visible";
              document.getElementById('testcodeBs').style.visibility = "visible";
              document.getElementById('samplingtext').style.visibility = "visible";
              document.getElementById('testcodeAtext').style.visibility = "visible";
              document.getElementById('testcodeBtext').style.visibility = "visible";
              document.getElementById('newdate1').style.visibility = "visible";
              document.getElementById('newdate2').style.visibility = "visible";
              document.getElementById('newdate3').style.visibility = "visible";
              document.getElementById('newdate4').style.visibility = "visible";
           
              document.getElementById('chi1').style.visibility = "visible";
             
              document.getElementById('chi3').style.visibility = "visible";
              document.getElementById('chi4').style.visibility = "visible";
              document.getElementById('chi5').style.visibility = "visible";
              document.getElementById('chi6').style.visibility = "visible";
              document.getElementById('hide1').style.visibility = "visible";
              document.getElementById('starx').style.visibility = "visible";
            
               document.getElementById('starz').style.visibility = "visible";
                document.getElementById('sampling').disabled=false;
              document.getElementById('enddate2').disabled=false;
              document.getElementById('enddate3').disabled=false;
              document.getElementById('startdate2').disabled=false;
              document.getElementById('startdate3').disabled=false;
              document.getElementById('trialid4').disabled=false;
              document.getElementById('trialid3').disabled=false;
            
              document.getElementById('mfgid2').disabled=false;
              document.getElementById('mfgid1').disabled=false;
              document.getElementById('mfgid').disabled=false;
              document.getElementById('testcodeB').disabled=false;
              document.getElementById('testcodeA').disabled=false;
         
             document.getElementById('starl').style.visibility = "visible";
             document.getElementById('starl1').style.visibility = "visible";
             document.getElementById('starl2').style.visibility  = "visible";
                } 
    function radiocheckall(){
        
           document.getElementById('testtimeselect').checked=false;
           document.getElementById('chisquareselect').checked=true;
            document.getElementById('oneselects').checked=true;
         document.getElementById('yieldselect').style.visibility = "visible";
        document.getElementById('testtimeselect').style.visibility = "visible";
        document.getElementById('chisquareselect').style.visibility = "visible";
              document.getElementById('samplings').style.visibility = "visible";
              document.getElementById('testcodeAs').style.visibility = "visible";
              document.getElementById('testcodeBs').style.visibility = "visible";
              document.getElementById('samplingtext').style.visibility = "visible";
              document.getElementById('testcodeAtext').style.visibility = "visible";
              document.getElementById('testcodeBtext').style.visibility = "visible";
             document.getElementById('hide1').style.visibility = "visible";
             document.getElementById('newdate1').style.visibility = "visible";
              document.getElementById('newdate2').style.visibility = "visible";
              document.getElementById('newdate3').style.visibility = "visible";
              document.getElementById('newdate4').style.visibility = "visible";
       
              document.getElementById('chi1').style.visibility = "visible";
            
              document.getElementById('chi3').style.visibility = "visible";
              document.getElementById('chi4').style.visibility = "visible";
              document.getElementById('chi5').style.visibility = "visible";
              document.getElementById('chi6').style.visibility = "visible";
              document.getElementById('starx').style.visibility = "visible";
              
              document.getElementById('chi7').style.visibility = "visible";
              document.getElementById('starz').style.visibility = "visible";
              document.getElementById('starzz').style.visibility = "visible";
              document.getElementById('starzzz').style.visibility = "visible";
              document.getElementById('sampling').disabled=false;
              document.getElementById('enddate2').disabled=false;
              document.getElementById('enddate3').disabled=false;
              document.getElementById('startdate2').disabled=false;
              document.getElementById('startdate3').disabled=false;
              document.getElementById('trialid4').disabled=false;
              document.getElementById('trialid3').disabled=false;
              
              
              document.getElementById('mfgid2').disabled=false;
              document.getElementById('mfgid1').disabled=false;
              document.getElementById('mfgid').disabled=false;
              document.getElementById('testcodeB').disabled=false;
              document.getElementById('testcodeA').disabled=false;
              
         
                } 
     
      function radiochecktracker(){
        
        document.getElementById('testtimeselect').checked=true;
        document.getElementById('chisquareselect').checked=false;
        document.getElementById('oneselects').checked=true;
        document.getElementById('testtimeselect').style.visibility = "hidden";
        
        document.getElementById('yieldselect').style.visibility = "hidden";
        document.getElementById('chisquareselect').style.visibility = "hidden";
              document.getElementById('samplings').style.visibility = "hidden";
              document.getElementById('testcodeAs').style.visibility = "hidden";
              document.getElementById('testcodeBs').style.visibility = "hidden";
              document.getElementById('samplingtext').style.visibility = "hidden";
              document.getElementById('testcodeAtext').style.visibility = "hidden";
              document.getElementById('testcodeBtext').style.visibility = "hidden";
         document.getElementById('hide1').style.visibility = "hidden";
         document.getElementById("tyselect").style.visibility = "visible";
        document.getElementById("tchiselect").style.visibility = "visible";
        document.getElementById("ychiselect").style.visibility = "visible";
        document.getElementById("ytchiselects").style.visibility = "visible";
          document.getElementById('newdate1').style.visibility = "hidden";
              document.getElementById('newdate2').style.visibility = "hidden";
              document.getElementById('newdate3').style.visibility = "hidden";
              document.getElementById('newdate4').style.visibility = "hidden";
         
        
               document.getElementById('chi1').style.visibility = "hidden";
              
              document.getElementById('chi3').style.visibility = "hidden";
              document.getElementById('chi4').style.visibility = "hidden";
              document.getElementById('chi5').style.visibility = "hidden";
              document.getElementById('chi6').style.visibility = "hidden";
              document.getElementById('starx').style.visibility = "hidden";
              document.getElementById('chi7').style.visibility = "hidden";
              document.getElementById('starz').style.visibility = "hidden";
            document.getElementById('starzz').style.visibility = "hidden";
            document.getElementById('starzzz').style.visibility = "hidden";
     
            
              
          }
     function radiochecktesttimeyield(){
                  
              document.getElementById('oneselects').checked=true;
              document.getElementById('sampling').disabled=true;
              document.getElementById('enddate2').disabled=true;
              document.getElementById('enddate3').disabled=true;
             // document.getElementById('startdate').disabled=true;
            // document.getElementById('enddate').disabled=true;
              document.getElementById('startdate2').disabled=true;
              document.getElementById('startdate3').disabled=true;
              document.getElementById('trialid4').disabled=true;
              document.getElementById('trialid3').disabled=true;
         
              document.getElementById('mfgid2').disabled=true;
              document.getElementById('mfgid1').disabled=true;
              document.getElementById('mfgid').disabled=true;
              document.getElementById('testcodeB').disabled=true;
              document.getElementById('testcodeA').disabled=true;
              document.getElementById('samplings').style.visibility = "visible";
              document.getElementById('testcodeAs').style.visibility = "visible";
              document.getElementById('testcodeBs').style.visibility = "visible";
              document.getElementById('samplingtext').style.visibility = "visible";
              document.getElementById('testcodeAtext').style.visibility = "visible";
              document.getElementById('testcodeBtext').style.visibility = "visible";
               document.getElementById('newdate1').style.visibility = "visible";
              document.getElementById('newdate2').style.visibility = "visible";
              document.getElementById('newdate3').style.visibility = "visible";
              document.getElementById('newdate4').style.visibility = "visible";
              document.getElementById('chi1').style.visibility = "visible";
           
              document.getElementById('chi3').style.visibility = "visible";
              document.getElementById('chi4').style.visibility = "visible";
              document.getElementById('chi5').style.visibility = "visible";
              document.getElementById('chi6').style.visibility = "visible";
              document.getElementById('starx').style.visibility = "visible";
              document.getElementById('starz').style.visibility = "visible";
            
              document.getElementById('starl').style.visibility = "hidden";
             document.getElementById('starl1').style.visibility = "hidden";
             document.getElementById('starl2').style.visibility = "hidden";

          } 
      function radiochecktesttimeyieldss(){

              document.getElementById('oneselects').checked=true;
              document.getElementById('sampling').disabled=true;
              document.getElementById('enddate2').disabled=true;
              document.getElementById('enddate3').disabled=true;
              //document.getElementById('startdate').disabled=true;
              //document.getElementById('enddate').disabled=true;
              document.getElementById('startdate2').disabled=true;
              document.getElementById('startdate3').disabled=true;
              document.getElementById('trialid4').disabled=true;
              document.getElementById('trialid3').disabled=true;
        
              document.getElementById('mfgid2').disabled=true;
              document.getElementById('mfgid1').disabled=true;
              document.getElementById('mfgid').disabled=true;
              document.getElementById('testcodeB').disabled=true;
              document.getElementById('testcodeA').disabled=true;
              document.getElementById('samplings').style.visibility = "visible";
              document.getElementById('testcodeAs').style.visibility = "visible";
              document.getElementById('testcodeBs').style.visibility = "visible";
              document.getElementById('samplingtext').style.visibility = "visible";
              document.getElementById('testcodeAtext').style.visibility = "visible";
              document.getElementById('testcodeBtext').style.visibility = "visible";
               document.getElementById('newdate1').style.visibility = "visible";
              document.getElementById('newdate2').style.visibility = "visible";
              document.getElementById('newdate3').style.visibility = "visible";
              document.getElementById('newdate4').style.visibility = "visible";
              document.getElementById('chi1').style.visibility = "visible";
            
              document.getElementById('chi3').style.visibility = "visible";
              document.getElementById('chi4').style.visibility = "visible";
              document.getElementById('chi5').style.visibility = "visible";
              document.getElementById('chi6').style.visibility = "visible";
              document.getElementById('starx').style.visibility = "visible";
              document.getElementById('starz').style.visibility = "visible";
             
              document.getElementById('starl').style.visibility = "hidden";
             document.getElementById('starl1').style.visibility = "hidden";
             document.getElementById('starl2').style.visibility = "hidden";
          } 
            function acheck(){
        document.getElementById('tchiselect').checked=true;
        
      }
        function bcheck(){
        
        document.getElementById('ychiselect').checked=true;
       
      }
        function ccheck(){
       
         document.getElementById('tyselect').checked=true;
      
      }
        function ddcheck(){
       
        document.getElementById('ytchiselects').checked=true;
      }
        
          function allTchiY(){
        if(document.getElementById('testtimeselect').checked==true&& document.getElementById('chisquareselect').checked==true
          &&document.getElementById('yieldselect').checked==false){
                radiocheckallchi();   acheck();
      }else if( document.getElementById('yieldselect').checked==true&& document.getElementById('chisquareselect').checked==true
          &&document.getElementById('testtimeselect').checked==false){
                 radiocheckallchi();  bcheck();
      }else if( document.getElementById('yieldselect').checked==true&& document.getElementById('testtimeselect').checked==true
          &&document.getElementById('chisquareselect').checked==false){
           radiochecktesttimeyield();  ccheck();
      }else if( document.getElementById('yieldselect').checked==true&& document.getElementById('testtimeselect').checked==true
          &&document.getElementById('chisquareselect').checked==true){
           radiocheckallchi(); ddcheck();
      }else if( document.getElementById('yieldselect').checked==true&&document.getElementById('testtimeselect').checked==false
            &&document.getElementById('chisquareselect').checked==false){
           radiochecktesttimeyieldss();
      }else if( document.getElementById('testtimeselect').checked==true&&document.getElementById('yieldselect').checked==false
            &&document.getElementById('chisquareselect').checked==false ){
           radiochecktesttimeyieldss();
      }else if( document.getElementById('chisquareselect').checked==true&&document.getElementById('yieldselect').checked==false
                &&document.getElementById('testtimeselect').checked==false){
           radiocheckallchiss();
      }else if( document.getElementById('yieldselect').checked==false){
            radiocheckallchi();
      }else if( document.getElementById('testtimeselect').checked==false){
            radiocheckallchi();
      }else if( document.getElementById('chisquareselect').checked==false){
           radiocheckallchi();
      }         } 
    
 
    function show(){ alert("Successfully"); addSubmit(); } 
    function selectitem(){  
       
         document.getElementById('my_select').disabled=true;
  
  
          }
     function changeFunc() {
      document.getElementById('edits1').disabled=false;
     
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
      var regExp =/(^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$)/i;
      //var regExp = /(^[a-z]([a-z_\.]*)@([a-z_\.]*)([.][a-z]{3})$)|(^[a-z]([a-z_\.]*)@([a-z_\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;
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
                          }else if(sampling.value==""&&document.getElementById('chisquareselect').checked){
                          alert("Please insert Sampling");
                                sampling.focus();
                                  return false;
                          }else if(sampling.value!=""&&sampling.value.match(/[^0-9\"*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert Sampling Incorrect!");
                                sampling.focus();
                                  return false;
                          }else if(testversion1.value==""&&document.getElementById('chisquareselect').checked){
                          alert("Please insert Testcode");
                                testversion1.focus();
                                  return false;
                          }else if(testversion1.value!=""&&testversion1.value.match(/[^A-Za-z0-9\".*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert Testcode Incorect");
                                testversion1.focus();
                                  return false;
                          }else if(testcodeA.value==""&&document.getElementById('chisquareselect').checked){
                          alert("Please insert FormalCodeA");
                                testcodeA.focus();
                                  return false;
                          }else if(testcodeA.value!=""&&testcodeA.value.match(/[^A-Za-z0-9\".*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert FormalCodeA Incorect");
                                testcodeA.focus();
                                  return false;
                          }else if(modeltype.value!=""&&modeltype.value.match(/[^A-Za-z0-9\"*;"\d]/)){
                          alert("Insert ModelType  Incorect");
                                modeltype.focus();
                                  return false;
                          }else if(inhdd.value==""){
                          alert("Please Select Start Process");
                                inhdd.focus();
                                  return false;
                          }else if(hddnum.value==""){
                          alert("Please insert Drive Input");
                                hddnum.focus();
                                  return false;
                          }else if(hddnum.value==""&&hddnum.value.match(/[^0-9\"*;"\d]/)){
                          alert("Insert Drive Input  Incorect");
                                hddnum.focus();
                                  return false;
                          }else if(startdate.value==""){
                          alert("Please insert Startdate");
                                startdate.focus();
                                  return false;
                          }else if(enddate1.value==""){
                          alert("Please insert Enddate");
                                enddate1.focus();
                                  return false;
                          }else if(mfgid.value!=""&&mfgid.value.match(/[^A-Za-z0-9\"*;"\d]/)){
                          alert("Insert MFGID  Incorect");
                                mfgid.focus();
                                  return false;
                          }else if(mfgid.value!=""&&mfgid.value.match(/[^A-Za-z0-9\"*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert MFGID(Testcode)  Incorect");
                                mfgid.focus();
                                  return false;
                          }else if(mfgid1.value!=""&&mfgid1.value.match(/[^A-Za-z0-9\"*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert MFGID(FormalCodeA)  Incorect");
                                mfgid1.focus();
                                  return false;
                          }else if(mfgid2.value!=""&&mfgid2.value.match(/[^A-Za-z0-9\"*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert MFGID(FormalCodeB)  Incorect");
                                mfgid2.focus();
                                  return false;
                          }else if(testcodeB.value==""&&document.getElementById('chisquareselect').checked){
                          alert("Please insert FormalCodeB");
                                testcodeB.focus();
                                  return false;
                          }else if(testcodeB.value!=""&&testcodeB.value.match(/[^A-Za-z0-9\".*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("Insert FormalCodeB Incorect");
                                testcodeB.focus();
                                  return false;
                          }else if(trialid1.value!=""&&trialid1.value.match(/[^A-Za-z0-9\"*;"\d]/)){
                          alert("TrialID Incorect");
                                trialid1.focus();
                                  return false;
                          }else if(trialid3.value!=""&&trialid3.value.match(/[^A-Za-z0-9\"*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("TrialID Incorect");
                                trialid3.focus();
                                  return false;
                          }else if(trialid4.value!=""&&trialid4.value.match(/[^A-Za-z0-9\"*;"\d]/)&&document.getElementById('chisquareselect').checked){
                          alert("TrialID Incorect");
                                trialid4.focus();
                                  return false;
                          }else if(testversion1.value!=""&&testversion1.value.match(/[^A-Za-z0-9\".*;"\d]/)){
                         alert("TestCode Incorect");
                                testversion1.focus();
                                return false;
                          }else if(testid.value!=""&&testid.value.match(/[^A-Za-z0-9\"*;"\d]/)){
                         alert("TesterID Incorect");
                                testid.focus();
                                return false;
                          }else if(pfcode.value!=""&&pfcode.value.match(/[^A-Za-z0-9\"*;"\d]/)){
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
<%String menumode="testcode_testtrialtracker.jsp";%>  
<!-- ---------------------------------Left Layout -------------- -->
<div id="contentleft">
  <div id="left"> 
  <%@ include file="PageLayout/testcode_lefttoplayout.jsp" %>
  <div id="headerL"></div>  
   </div> 

<!-- ============================================Top Layout============================================================================== -->

<div id="right"> <%@ include file="PageLayout/testcode_righttoplayout.jsp" %></div> 

<!-- =============================================Center Layout========================================================================== -->
<ul>
     <%@ include file="testcode_testtrialtracker_backMenu.jsp" %> 
</ul>


            <!-- ============================================Form Page============================================================================== -->
                 <form name="form1" id="form1" method="post" action=""  >
          
    
    
      <input type="hidden" name="hidden_testtime" />
      <input type="hidden" name="hidden_chisqaure" />
      <input type="hidden" name="hidden_yield" />
      <input type="hidden" name="hidden_trackers" />
      <input type="hidden" name="hidden_summarys" />
      <input type="hidden" name="hidden_yt" />
      <input type="hidden" name="hidden_tchi" />
      <input type="hidden" name="hidden_ychi" />
       <input type="hidden" name="hidden_ytchi" />  
       <input type="hidden" name="hidden_oness" />  
     
          <!-- ============================================Mode============================================================================== -->
      
  
    <h1>&nbsp;</h1>
  
  <fieldset >
  <legend >
      <%
      String statusadd=request.getParameter("save");
       String statusadds=request.getParameter("save1");
       String statusedit=request.getParameter("edittracker");
       String statusedits=request.getParameter("editsummary");
       if(statusadd!=null||statusadds!=null){
           out.print("<h1>ADD</h1>");
       }else if(statusedit!=null||statusedits!=null){
     out.print("<h1>Edit</h1>");
       }
      %>

        </legend>
    <table width="1000" height="45" border="0" bordercolor="#00000">
    
      <tr id="showoptionchoose"> 
  <td></td>
        <td class="show"  id="my_text" >
      <div class="selectContainerStyled"> 

            <!-- ============================================Event Delete File in Folder Folder=========================================== -->
            <%
                            File appFolder = new File(apppath+"TrialTrackerStatus\\Condition\\");
                
                            File[] list = appFolder.listFiles();
                          
                          
                          
                             for(int i=0;i<list.length;i++)
                        {
                            
           
                         
//<!-- ============================================Event Edit File ===========================================================-->
                            if(request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null){
                               
                                   File editFolder = new File(apppath+"TrialTrackerStatus\\Condition\\");
                                   File[] lists1 = editFolder.listFiles();
                                for(int h=0;h<lists1.length;h++)
                        {
                            
                         String editlist = lists1[h].getName();
                               String edition=request.getParameter("my_select1");
             String editions=request.getParameter("my_selects");
                                if(edition.equals(editlist)||editions.equals(editlist)){
                            
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
                                          yieldshow= reader.readLine();
                                          testtimeshows= reader.readLine();
                                          chisqaureshow= reader.readLine();
                                          modeltypeshow=reader.readLine();
                                          samplingshow=reader.readLine();
                                          mfgidshows=reader.readLine();
                                          testcodeAshow=reader.readLine();
                                          mfgidshows1=reader.readLine();
                                          showtrialid1=reader.readLine();
                                          showstdate1=reader.readLine();
                                          showendate1=reader.readLine();
                                          testcodeBshow=reader.readLine();
                                          mfgidshows2=reader.readLine();
                                          showtrialid2=reader.readLine();
                                          showstdate2=reader.readLine();
                                          showendate2=reader.readLine();
                                          testtimestracks1=reader.readLine();
                                          reader.close();
                               String[] strar = subjectshow.split(",");
                               String[] strar1 = ownershow.split(",");
                               String[] strar2 = emailshow.split(",");
                               String[] strar14 = yieldshow.split(",");
                               String[] strar15 = testtimeshows.split(",");
                               String[] strar16 = chisqaureshow.split(",");
                               String[] strar3 =   productshow.split(",");
                               String[] strar17 = modeltypeshow.split(",");
                               String[] strar4 = showtrialid.split(",");
                               String[] strar5 = showtestcode.split(",");
                               String[] strar18 = testcodeAshow.split(",");
                               String[] strar19 = testcodeBshow.split(",");
                               String[] strar6 = showtestid.split(",");
                               String[] strar7 = showpfcode.split(",");
                               String[] strar12 = showinorex.split(",");
                               String[] strar8 =  showhddnum.split(",");
                               String[] strar9 = showprocess.split(",");
                               String[] strar10 = showstdate.split(",");
                               String[] strar11 = showendate.split(",");
                               String[] strar20 = samplingshow.split(",");
                               String[] strar21 = mfgidshows.split(",");
                               String[] strar23 =  mfgidshows1.split(",");
                               String[] strar24 =  showtrialid1.split(",");
                               String[] strar25 =   showstdate1.split(",");
                               String[] strar26 =   showendate1.split(",");
                               String[] strar27 =  mfgidshows2.split(",");
                               String[] strar28 =  showtrialid2.split(",");
                               String[] strar29 = showstdate2.split(",");
                               String[] strar30 =  showendate2.split(",");
                               String[] strar22 =  testtimestracks1.split(",");
                               for(String s:strar){ subjectshow=s; }
                               for(String s:strar1){ ownershow=s; }
                               for(String s:strar2){ emailshow=s; }
                               for(String s:strar14){ yieldshow=s; }
                               for(String s:strar15){ testtimeshows=s; }
                               for(String s:strar16){ chisqaureshow=s; }
                               for(String s:strar3){ productshow=s; }
                               for(String s:strar17){ modeltypeshow=s; }
                               for(String s:strar4){ showtrialid=s; }
                               for(String s:strar5){ showtestcode=s; }
                               for(String s:strar18){ testcodeAshow=s; }
                               for(String s:strar19){ testcodeBshow=s; }
                               for(String s:strar6){ showtestid=s; }
                               for(String s:strar7){ showpfcode=s; }
                               for(String s:strar12){ showinorex=s; }
                               for(String s:strar8){ showhddnum=s; }
                               for(String s:strar9){ showprocess= s; }
                               for(String s:strar10){ showstdate=s; }
                               for(String s:strar11){ showendate=s; }
                               for(String s:strar20){ samplingshow=s; }
                               for(String s:strar21){ mfgidshows=s; }
                               for(String s:strar22){ testtimestracks1=s; }
                               for(String s:strar23){ mfgidshows1=s; }
                               for(String s:strar24){ showtrialid1=s; }
                               for(String s:strar25){  showstdate1=s; }
                               for(String s:strar26){ showendate1=s; }
                               for(String s:strar27){ mfgidshows2=s; }
                               for(String s:strar28){  showtrialid2=s; }
                               for(String s:strar29){ showstdate2=s; }
                               for(String s:strar30){ showendate2=s; }
                           
                             if(showstdate!=""){
                                   
                                    String aadate1=showstdate.substring(0,2);
                                    String aaslash3=showstdate.substring(2,3);
                                    String aamonth=showstdate.substring(3,6);
                                    String aaslash4=showstdate.substring(6,7);
                                    String aayear1=showstdate.substring(7,9);
                                 

                                     String aamonths1[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int aamon1;
                                     
                                       if(aamonth.equals("Jan")){
                                          aamon1=1;
                                           stdate =20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                           
                                      }else if(aamonth.equals("Feb")){
                                       aamon1=2;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                         
                                      }else if(aamonth.equals("Mar")){
                                       aamon1=3;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                        
                                      }else if(aamonth.equals("Apr")){
                                       aamon1=4;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                      
                                      }else if(aamonth.equals("May")){
                                       aamon1=5;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                        
                                      }else if(aamonth.equals("Jun")){
                                       aamon1=6;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                        
                                      }else if(aamonth.equals("Jul")){
                                       aamon1=7;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                         
                                      }else if(aamonth.equals("Aug")){
                                       aamon1=8;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                       
                                      }else if(aamonth.equals("Sep")){
                                       aamon1=9;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                         
                                      }else if(aamonth.equals("Oct")){
                                       aamon1=10;
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                         

                                      }else if(aamonth.equals("Nov")){
                                       aamon1=11; 
                                         stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                      
                                      }else if(aamonth.equals("Dec")){
                                       aamon1=12;
                                        stdate=20+aayear1+aaslash3+aamonths1[aamon1]+aaslash4+aadate1;
                                        
                                      }
                        
                                   }else if(showstdate.equals("")){
                                  stdate="";
                               
                                } 
         if(showendate.equals("*")){
                                 dateend="";
                             }else if(showendate!=""&&showendate!=null){
                                     String d1=showendate.substring(0,2);
                                    String sl=showendate.substring(2,3);
                                    String mont=showendate.substring(3,6);
                                    String sla=showendate.substring(6,7);
                                    String yea=showendate.substring(7,9);


                                     String ms[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int mo;
                                     
                                       if(mont.equals("Jan")){
                                          mo=1;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                           
                                      }else if(mont.equals("Feb")){
                                       mo=2;
                                          dateend =20+yea+sl+ms[mo]+sla+d1;
                                         
                                      }else if(mont.equals("Mar")){
                                       mo=3;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                        
                                      }else if(mont.equals("Apr")){
                                            mo=4;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                      
                                      }else if(mont.equals("May")){
                                        mo=5;
                                          dateend =20+yea+sl+ms[mo]+sla+d1;
                                        
                                      }else if(mont.equals("Jun")){
                                      mo=6;
                                          dateend =20+yea+sl+ms[mo]+sla+d1;
                                        
                                      }else if(mont.equals("Jul")){
                                       mo=7;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                         
                                      }else if(mont.equals("Aug")){
                                      mo=8;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                       
                                      }else if(mont.equals("Sep")){
                                      mo=9;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                         
                                      }else if(mont.equals("Oct")){
                                       mo=10;
                                           dateend =20+yea+sl+ms[mo]+sla+d1;
                                         

                                      }else if(mont.equals("Nov")){
                                       mo=11; 
                                          dateend =20+yea+sl+ms[mo]+sla+d1;
                                      
                                      }else if(mont.equals("Dec")){
                                       mo=12;
                                          dateend =20+yea+sl+ms[mo]+sla+d1;
                                        
                                      }

                                }

                          
                                   if(showstdate1!=""&&showendate1!=""){
                                    String dates1=showstdate1.substring(0,2);
                                    String slashs3=showstdate1.substring(2,3);
                                    String months=showstdate1.substring(3,6);
                                    String slashs4=showstdate1.substring(6,7);
                                    String years1=showstdate1.substring(7,9);
                                     String monthss1[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int mons1;
                                     
                                       if(months.equals("Jan")){
                                          mons1=1;
                                           stdate1 =20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Feb")){
                                       mons1=2;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Mar")){
                                       mons1=3;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Apr")){
                                       mons1=4;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("May")){
                                       mons1=5;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Jun")){
                                       mons1=6;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Jul")){
                                       mons1=7;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Aug")){
                                       mons1=8;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Sep")){
                                       mons1=9;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Oct")){
                                       mons1=10;
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;

                                      }else if(months.equals("Nov")){
                                       mons1=11; 
                                         stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }else if(months.equals("Dec")){
                                       mons1=12;
                                        stdate1=20+years1+slashs3+monthss1[mons1]+slashs4+dates1;
                                      }
                                    String dates2=showendate1.substring(0,2);
                                    String slashs6=showendate1.substring(2,3);
                                    String months1=showendate1.substring(3,6);
                                    String slashs5=showendate1.substring(6,7);
                                    String years2=showendate1.substring(7,9);

                                     String monthss2[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int mons2;
                                     
                                       if(months1.equals("Jan")){
                                          mons2=1;
                                           enddate1 =20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Feb")){
                                       mons2=2;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Mar")){
                                       mons2=3;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Apr")){
                                       mons2=4;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("May")){
                                       mons2=5;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Jun")){
                                       mons2=6;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Jul")){
                                       mons2=7;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Aug")){
                                       mons2=8;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Sep")){
                                       mons2=9;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Oct")){
                                       mons2=10;
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;

                                      }else if(months1.equals("Nov")){
                                       mons2=11; 
                                         enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }else if(months1.equals("Dec")){
                                       mons2=12;
                                        enddate1=20+years2+slashs6+monthss2[mons2]+slashs5+dates2;
                                      }
                                   }else if(showstdate1.equals("")&&showendate1.equals("")){
                               stdate1="";
                               enddate1="";
                                }

                                 if(showstdate2!=""&&showendate2!=""){
                                    String datess1=showstdate2.substring(0,2);
                                    String slashss3=showstdate2.substring(2,3);
                                    String monthss=showstdate2.substring(3,6);
                                    String slashss4=showstdate2.substring(6,7);
                                    String yearss1=showstdate2.substring(7,9);
                                     String monthsss1[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int monss1;
                                     
                                       if(monthss.equals("Jan")){
                                          monss1=1;
                                           stdate2 =20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Feb")){
                                       monss1=2;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Mar")){
                                       monss1=3;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Apr")){
                                       monss1=4;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("May")){
                                       monss1=5;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Jun")){
                                       monss1=6;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Jul")){
                                       monss1=7;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Aug")){
                                       monss1=8;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Sep")){
                                       monss1=9;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Oct")){
                                       monss1=10;
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;

                                      }else if(monthss.equals("Nov")){
                                       monss1=11; 
                                         stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }else if(monthss.equals("Dec")){
                                       monss1=12;
                                        stdate2=20+yearss1+slashss3+monthsss1[monss1]+slashss4+datess1;
                                      }
                                    String datess2=showendate2.substring(0,2);
                                    String slashss6=showendate2.substring(2,3);
                                    String monthss1=showendate2.substring(3,6);
                                    String slashss5=showendate2.substring(6,7);
                                    String yearss2=showendate2.substring(7,9);

                                     String monthsss2[] = {"00", 
                                    "01", "02", "03", "04",
                                    "05", "06", "07", "08",
                                    "09", "10", "11", "12"};
                                    int monss2;
                                     
                                       if(monthss1.equals("Jan")){
                                          monss2=1;
                                           enddate2 =20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Feb")){
                                       monss2=2;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Mar")){
                                       monss2=3;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Apr")){
                                       monss2=4;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("May")){
                                       monss2=5;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Jun")){
                                       monss2=6;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Jul")){
                                       monss2=7;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Aug")){
                                       monss2=8;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Sep")){
                                       monss2=9;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Oct")){
                                       monss2=10;
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;

                                      }else if(monthss1.equals("Nov")){
                                       monss2=11; 
                                         enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }else if(monthss1.equals("Dec")){
                                       monss2=12;
                                        enddate2=20+yearss2+slashss6+monthsss2[monss2]+slashss5+datess2;
                                      }
                                   }else if(showstdate2.equals("")&&showendate2.equals("")){
                               stdate2="";
                               enddate2="";
                                }
                                out.println("<script type='text/javascript'>");
                               out.println("selectitem();");
                
                               out.println("</script>");
                           } catch (FileNotFoundException e) { e.printStackTrace();
                           }catch (IOException e) { e.printStackTrace(); } 
                               } } }else{
              subjectshow ="";
                                          ownershow ="";
                                          emailshow="";
                                          yieldshow="";
                                          testtimeshows="";
                                          chisqaureshow="";
                                          productshow="";
                                          modeltypeshow="";
                                          showtrialid ="";
                                          showtrialid1 ="";
                                          showtrialid2 ="";
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
                                          showstdate1="";
                                          showendate1="";
                                          showstdate2="";
                                          showendate2="";
                                          samplingshow="";
                                          mfgidshows="";
                                          mfgidshows1="";
                                          mfgidshows2="";
                                          stdate="";
                                          dateend="";
                                          stdate1="";
                                          enddate1="";
                                          stdate2="";
                                          enddate2="";

          
          } }
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
                                String end=request.getParameter("enddate1");
                                String start2=request.getParameter("startdate2");
                                String end2=request.getParameter("enddate2");
                                String start3=request.getParameter("startdate3");
                                String end3=request.getParameter("enddate3");
                                String select=request.getParameter("select");
                                String trialid1=request.getParameter("trialid1");
                                String trialid4=request.getParameter("trialid4");
                                String trialid3=request.getParameter("trialid3");
                                String testversion1=request.getParameter("testversion1");
                                String testid1=request.getParameter("testid");
                                String pfcode=request.getParameter("pfcode");
                                String modeltype=request.getParameter("modeltype");
                                String sampling=request.getParameter("sampling");
                                String testcodeA=request.getParameter("testcodeA");
                                String testcodeB=request.getParameter("testcodeB");
                                String mfgid=request.getParameter("mfgid");
                                String mfgid1=request.getParameter("mfgid1");
                                String mfgid2=request.getParameter("mfgid2");
                                String radioyield="";
                                String radiotesttime="";
                                String radiochisquare="";
                                String radiotesttimetrack="";
                              if(paraName!=""&&paraName!=null&&name!=""&&email!=""){
                        
                                if(request.getParameter("chooseoptionss").equals("one")) {
                          
                            
                              
                              if(request.getParameter("chooseoption").equals("Yield")) {
                          
                              radioyield="1";
                              radiotesttime="0";      
                               radiochisquare="0";    
                                radiotesttimetrack="0";  
                              }

                              if(request.getParameter("chooseoption").equals("TestTime")) {
                             
                                    
                                    radiotesttime="1";
                                    radioyield="0";
                                    radiochisquare="0";  
                                     radiotesttimetrack="0";  
                              }

                              if(request.getParameter("chooseoption").equals("ChiSquare")) {
                             
                                    radiochisquare="1";
                                   radiotesttime="0";
                                    radioyield="0";
                                     radiotesttimetrack="0";  
                              }
                              }
                              
                              if(request.getParameter("chooseoption").equals("TestTime")&&request.getParameter("chooseoptions").equals("tracker")) {
                             
                              radioyield="0";
                              radiotesttime="1";
                              radiochisquare="0";
                              radiotesttimetrack="1";
                              }
                               
                               if(request.getParameter("chooseoptionss").equals("tchi")) {
                             
                                     radiotesttimetrack="0";  
                                    radiotesttime="1";
                                    radiochisquare="1";
                                    radioyield="0";
                              }
                                if(request.getParameter("chooseoptionss").equals("ty")) {
                             
                                     radiotesttimetrack="0";  
                                    radiotesttime="1";
                                    radioyield="1";
                                    radiochisquare="0";
                                    
                              }
                                if(request.getParameter("chooseoptionss").equals("ychi")) {
                             
                                    radioyield="1";
                                    radiochisquare="1";
                                     radiotesttime="0";
                                      radiotesttimetrack="0";  
                              }
                                if(request.getParameter("chooseoptionss").equals("ytchi")) {
                             
                                     radiotesttimetrack="0";  
                                    radiotesttime="1";
                                    radioyield="1";
                                     radiochisquare="1";
                               }
                                       if(trialid1==""||trialid1==null){ trialid1="*";}
                                 if(trialid3==""||trialid3==null){ trialid3="*";}
                                  if(trialid4==""||trialid4==null){ trialid4="*";}
                                if(testversion1==""){testversion1="*";}
                                if(testid1==""){testid1="*";}
                                if(pfcode==""){pfcode="*";}
                               if(mfgid==""||mfgid==null){mfgid="*";}
                               if(mfgid1==""||mfgid1==null){mfgid1="*";}
                               if(mfgid2==""||mfgid2==null){mfgid2="*";}
                               if(inhd==""){inhd="";}
                               if(num==""){num="*";}
                               if(modeltype==""){modeltype="*";}
                               if(testcodeA==""||testcodeA==null){testcodeA="*";}
                               if(testcodeB==""||testcodeB==null){testcodeB="*";}
                               if(sampling==""||sampling==null){sampling="*";}
                        
                          
                                String namecondition=paraName.replaceAll(" ", "_");
                                String strPath = (apppath+"TrialTrackerStatus\\Condition\\"+(namecondition)+".csv");
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
                                 
                                  if(start!=null&&start!=""){
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
                                    
                                    }

                                    if(start==""||start==null){
                                  objWriter.write("StartDate"+","+""+"\n");
                                  
                                                            
                                  }

                                  if(end!=null&&end!=""){
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

                                  
                                   if(end==""||end==null){
                                  
                                  objWriter.write("EndDate"+","+"*"+"\n");
                                                            
                                  }
                                   
                                objWriter.write("Yield"+","+(radioyield)+"\n");
                                objWriter.write("TestTime"+","+(radiotesttime)+"\n");
                                objWriter.write("ChiSquare"+","+(radiochisquare)+"\n");
                                objWriter.write("ModelType"+","+(modeltype)+"\n");
                                objWriter.write("Sampling"+","+(sampling)+"\n");
                                objWriter.write("MFGID"+","+(mfgid)+"\n");
                                objWriter.write("TestCode_FA"+","+(testcodeA)+"\n");
                                objWriter.write("MFGID_FA"+","+(mfgid1)+"\n");
                                objWriter.write("TrialID_FA"+","+(trialid3)+"\n");
                                     if(start2!=null&&start2!=""){
                                    String monthss[] = {"",
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                         "Sep", "Oct", "Nov", "Dec"};
  
                                    String dates=start2.substring(8,10).replaceAll("/", "-");
                                  
                                    String slashs1=start2.substring(4,5).replaceAll("/", "-");
                                   
                                    String smonth=start2.substring(5,7).replaceAll("/", "-");
                                    int numsss=Integer.parseInt(smonth);
                                    
                                    String slashs2=start2.substring(7,8).replaceAll("/", "-");
                                 
                                    String years=start2.substring(2,4);
                                
                                    String  sdates=dates+slashs1+monthss[numsss]+slashs2+years;
                                    
                                    objWriter.write("StartDate_FA"+","+(sdates)+"\n");
                                    
                                    }
                                  if(end2!=null&&end2!=""){
                                    String monthss1[] = {"",
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                         "Sep", "Oct", "Nov", "Dec"};
  
                                    String dates1=end2.substring(8,10).replaceAll("/", "-");
                                 
                                    String slashs3=end2.substring(4,5).replaceAll("/", "-");
                                 
                                    String smonth1=end2.substring(5,7).replaceAll("/", "-");
                                    int numsss1=Integer.parseInt(smonth1);
                                  
                                    String slashs4=end2.substring(7,8).replaceAll("/", "-");
                                 
                                    String years1=end2.substring(2,4);
                                  
                                    String  sedate=dates1+slashs3+monthss1[numsss1]+slashs4+years1; 
                                   
                                       
                                  objWriter.write("EndDate_FA"+","+(sedate)+"\n");
                                  
                                  }

                                  if(start2==""||start2==null){
                                  objWriter.write("StartDate_FA"+","+""+"\n");
                                  
                                                            
                                  }
                                   if(end2==""||end2==null){
                                  
                                  objWriter.write("EndDate_FA"+","+""+"\n");
                                                            
                                  }
                                   
                               
                                objWriter.write("TestCode_FB"+","+(testcodeB)+"\n");
                                objWriter.write("MFGID_FB"+","+(mfgid2)+"\n");
                                objWriter.write("TrialID_FB"+","+(trialid4)+"\n");
                                           if(start3!=null&&start3!=""){
                                    String monthsss[] = {"",
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                         "Sep", "Oct", "Nov", "Dec"};
  
                                    String datess=start3.substring(8,10).replaceAll("/", "-");
                                  
                                    String slashss1=start3.substring(4,5).replaceAll("/", "-");
                                   
                                    String smonth=start3.substring(5,7).replaceAll("/", "-");
                                    int numsss=Integer.parseInt(smonth);
                                    
                                    String slashss2=start3.substring(7,8).replaceAll("/", "-");
                                 
                                    String yearss=start3.substring(2,4);
                                
                                    String  ssdates=datess+slashss1+monthsss[numsss]+slashss2+yearss;
                                    
                                    objWriter.write("StartDate_FB"+","+(ssdates)+"\n");
                                    
                                    }
                                  if(end2!=null&&end2!=""){
                                    String monthsss1[] = {"",
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                         "Sep", "Oct", "Nov", "Dec"};
  
                                    String datess1=end3.substring(8,10).replaceAll("/", "-");
                                 
                                    String slashss3=end3.substring(4,5).replaceAll("/", "-");
                                 
                                    String ssmonth1=end3.substring(5,7).replaceAll("/", "-");
                                    int numssss1=Integer.parseInt(ssmonth1);
                                  
                                    String slashss4=end3.substring(7,8).replaceAll("/", "-");
                                 
                                    String yearss1=end3.substring(2,4);
                                  
                                    String  ssedate=datess1+slashss3+monthsss1[numssss1]+slashss4+yearss1; 
                                   
                                       
                                  objWriter.write("EndDate_FB"+","+(ssedate)+"\n");
                                  
                                  }
                                   if(start3==""||start3==null){
                                  objWriter.write("StartDate_FB"+","+""+"\n");
                                  
                                                            
                                  }
                                   if(end3==""||end3==null){
                                  
                                  objWriter.write("EndDate_FB"+","+""+"\n");
                                                            
                                  }
                               
                                objWriter.write("Tracker"+","+(radiotesttimetrack)+"\n");
                                objWriter.flush();
                                objWriter.close();
                                out.println("<script type='text/javascript'>");
                                out.println("show();");
                                out.println("</script>");
                                          subjectshow ="";
                                          ownershow ="";
                                          emailshow="";
                                          yieldshow="";
                                          testtimeshows="";
                                          chisqaureshow="";
                                          productshow="";
                                          modeltypeshow="";
                                          showtrialid ="";
                                          showtrialid1 ="";
                                          showtrialid2 ="";
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
                                          showstdate1="";
                                          showendate1="";
                                          showstdate2="";
                                          showendate2="";
                                          samplingshow="";
                                          mfgidshows="";
                                          mfgidshows1="";
                                          mfgidshows2="";
                                          stdate="";
                                          dateend="";
                                          stdate1="";
                                          enddate1="";
                                          stdate2="";
                                          enddate2="";

                                                                 
                                                         }
      
                               %>
     </div> </td></tr>
    <td></td>
   <td >
       <input type="button" id="saved" name="saved" value="SAVE" class="button" onclick="return chkdata();" /></td>
      
      
  
    </table>
                 </fieldset>
    <table border="0" height="50">
     
       
    </table> 


    <fieldset id="hideline1" >
                <!-- ============================================Information============================================================================== -->
    <legend id="hidetext1" class="show">
      <h2>Infomation</h2>
        </legend>
    <table border="0" bordercolor="#00000" width="1000" id="table1" >
          
  <tr > 
            <td> <table  width="100%" border="0"id="table2"  >
     <tr>
        <td></td>
                   <td><input type="radio" id="trackers" name="chooseoptions" value="tracker"  checked onclick="radiochecktracker();" <%=trackers%>/>Tracker
                   <input type="radio" id="summarys" name="chooseoptions" value="summary" onclick="radiocheckall();" <%=summarys%>/>Summary
                   </td>
                  </tr>
                <tr > 
                  <td width="123">Subject:<font color="red">*</font></td>
                <td width="832"><input type="text" name="tsubject"  id="tsubject"   size="100" value="<%=subjectshow%>" 
                  placeholder="Example:MPSXD03 Trial"/><font color="#999999"> No Special characters</font></td>
                </tr>
                <tr > 
                  <td>Owner:<font color="red">*</font></td>
                  
              <td> <input name="oname" type="text" id="oname"   size="100"value="<%=ownershow%>" placeholder="Example: AAAA"/> 
                <font color="#999999"> Name of Owner</font></td>
                </tr>
                <tr> 
                  <td>Email:<font color="red">*</font></td>
                  <td> <input name="em" type="text" id="em" name="em" size="100" value="<%=emailshow%>"  placeholder=" A@hgst.com;B@hgst.com" />
                
                <font color="#999999"> Example:A@hgst.com</font></td>
                  <td width="31">  </td>
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
      <td></td>
      <td width="854" id="hide1">
          <input type="checkbox" id="yieldselect" name="chooseoption" value="Yield" onclick="allTchiY();" <%=yield%>/> Yield
          <input type="checkbox" id="testtimeselect" name="chooseoption"  value="TestTime" onclick="allTchiY();" <%=testtime%>/>Test Time 
          <input type="checkbox" id="chisquareselect" name="chooseoption"  value="ChiSquare" onclick="allTchiY();"<%=chisqaure%> />Chi Square
          <input type="radio" id="tchiselect" name="chooseoptionss"  value="tchi" class="hide"<%=htchi%>/>
          <input type="radio" id="tyselect" name="chooseoptionss"  value="ty" class="hide" <%=hyt%>/>
          <input type="radio" id="ychiselect" name="chooseoptionss"  value="ychi" class="hide"  <%=hychi%>/>
          <input type="radio" id="ytchiselects" name="chooseoptionss"  value="ytchi" class="hide" <%=hytchi%> />
          <input type="radio" id="oneselects" name="chooseoptionss"  value="one" class="hide" <%=oness%> />
          <%
            if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("1")&&testtimeshows.equals("1")&&chisqaureshow.equals("0")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkradioyt();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("1")&&testtimeshows.equals("0")&&chisqaureshow.equals("0")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkradioyield();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("0")&&testtimeshows.equals("1")&&chisqaureshow.equals("0")){
                                out.println("<script type='text/javascript'>");
                                out.println(" checkradiotesttime();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("0")&&testtimeshows.equals("0")&&chisqaureshow.equals("1")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkradiochisqaure();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("0")&&testtimeshows.equals("1")&&chisqaureshow.equals("1")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkradiocht();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("1")&&testtimeshows.equals("0")&&chisqaureshow.equals("1")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkradiochy();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&yieldshow.equals("1")&&testtimeshows.equals("1")&&chisqaureshow.equals("1")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkradioychit();");
                                out.println("</script>"); 
                  }
      
      
            if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&testtimestracks1.equals("1")&&yieldshow.equals("0")&&testtimeshows.equals("1")&&chisqaureshow.equals("0")){
                                out.println("<script type='text/javascript'>");
                                out.println(" checkradiotrackerss();");
                                out.println("</script>"); 
                  }
          %>
       </td>
        </tr>
          <tr> 
            <td width="131">Product:<font color="red">*</font></td>
             <td><select name="select" id="select"/>
                
              <option id="pselect" value="">Please Select Product</option> 
                <option id="AR6" value='AR6'>AR6</option>
                <option id="AR8" value='AR8'>AR8</option>
                <option id="ARH" value='ARH'>ARH</option>
                <option id="APK" value='APK'>APK</option>
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
                  if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JBK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJBK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("AR6")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkAR6();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("AR8")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkAR8();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("ARH")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkARH();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("APK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkARK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("BRB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkBRB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("BRK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkBRK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("CBB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("CBC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("CBD")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBD();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("CBE")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBE();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("CBF")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCBF();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("CEP")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkCEP();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("DPC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkDPC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("EB7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkEB7();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("EC7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkEC7();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("EGB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkEGB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("FB4")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFB4();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("FB5")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFB5();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("FB6")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFB6();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("FLB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFLB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("FLC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkFLC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("GMC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkGMC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("GMK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkGMK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("GMN")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkGMN();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("J1B")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJ1B();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("J1C")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJ1C();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JGB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJGB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JGC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJGC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JPC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJPC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JPK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJPK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JPT")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJPT();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JTB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJTB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("JTC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkJTC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("KCC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkKCC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("KCF")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkKCF();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("KRV")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkKRV();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("LB7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkLB7();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("LKB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkLKB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("LNB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkLNB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MKC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMKC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MKS")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMKS();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MNL")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMNL();");
                                out.println("</script>");
                  }else if(request.getParameter("edittracker")!=null&&productshow.equals("MNR")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMNR();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MPK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMPK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MPL")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMPL();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MPS")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMPS();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("MRK")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkMRK();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("PFV")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkPFV();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("PTB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkPTB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("PTC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkPTC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("RB7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkRB7();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("RC7")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkRC7();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("SHW")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSHW();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("SRB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSRB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("STC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSTC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("STN")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkSTN();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("VNF")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVNF();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("VPA")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPA();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("VPB")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPB();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("VPC")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPC();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&productshow.equals("VPM")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkVPM();");
                                out.println("</script>");
                  }
              %>
        </td> 
       
           </tr>
  
          <tr > 
            <td>TrialID:</td>
            <td><input name="trialid1" type="text" id="trialid1" size="100" value="<%=showtrialid%>" placeholder="Example: A497;A498"/><font color="#999999"> Example: A497;A498</font>
                <font color="red" > </font></td>
          </tr>
           <tr > 
            <td>TestCode:<font color="red" id="starx">*</font></td>
            <td><input name="testversion1" type="text" id="testversion1" size="100"value="<%=showtestcode%>" placeholder="Example: UMN2C10E;UMN1CB5A"/><font color="#999999"> Example: UMN2C10E;UMN1CB5A</font></td>
          </tr>
   
          <tr> 
            <td>TesterID:</td>
            <td><input name="testid" type="text" id="testid" size="100" value="<%=showtestid%>" placeholder="Example: T084;T085"/><font color="#999999"> Example: T084;T085</font></td>
          </tr>
          <tr> 
            <td>PFCode:</td>
            <td><input name="pfcode" type="text" id="pfcode" size="100" value="<%=showpfcode%>" placeholder="Example: 0000"/> 
                <input type="checkbox" id="bycheck0" value="0" name="clude"  checked="checked" onclick="checkOnly(this);" />Include 
              <input type="checkbox" id="bycheck1" value="1" name="clude" onclick="checkOnly(this);"/> Exclude
            <font color="#999999"> Example:0000</font> 
            </td>
 <!-- ============================================ Event Check box============================================================================== -->
              <%
                  if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showinorex.equals("0")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkinclude();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showinorex.equals("1")){
                                out.println("<script type='text/javascript'>");
                                out.println("checkexclude();");
        out.println("checkinex();");
        out.println("</script>");
                  }
              %>
          </tr>
          <tr> 
            <td>Drive Input:<font color="red" id="star1" >*</font></td>
            <td><input type="text" id="hddnum" name="hddnum"value="<%=showhddnum%>" placeholder="Example: 560"/><font color="#999999"> Example: 560 (Q'ty =? unit)</font></td>
          </tr>
      
          <tr> 
            <td>Start Process:<font color="red" id="star2">*</font></td>
            <td><select name="inhdd" id="inhdd"/>
                <option id="selectpro" value="">Please Select Process</option> 
                <option id="6400" value="6400">6400</option>
                <option id="6600" value="6600">6600</option>
                <option id="6800" value="6800">6800</option>
                <option id="9000" value="9000">9000</option>
            </td>
         
     <%  
      if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showprocess.equals("6400")){
                                out.println("<script type='text/javascript'>");
                                out.println("check6400();");
                                out.println("</script>");
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showprocess.equals("6600")){
                                out.println("<script type='text/javascript'>");
                                out.println("check6600();");
                                out.println("</script>"); 
                  }
            else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showprocess.equals("6800")){
                                out.println("<script type='text/javascript'>");
                                out.println("check6800();");
                                out.println("</script>"); 
                  }
            else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showprocess.equals("9000")){
                                out.println("<script type='text/javascript'>");
                                out.println("check9000();");
                                out.println("</script>"); 
                  }else if((request.getParameter("edittracker")!=null||request.getParameter("editsummary")!=null)&&showprocess.equals("")){
        out.println("<script type='text/javascript'>");
                                out.println("checkno();");
                                out.println("</script>"); 
      }
    
            %>
         
          </tr>
          <tr > 
            <td >StartDate:<font color="red" id="star3" >*</font></td>
            <td> <input type="date" name="startdate" id="startdate" value="<%=stdate%>"/><font color="#999999"> Example: 2015-01-31 (yyyy-mm-dd)</font>
             <font color="red" id="starzzz"> </font></td>
          </tr>
          <tr> 
            <td>EndDate:<font color="red" id="star4" >*</font></td>
            <td> <input type="date" name="enddate1" id="enddate1" value="<%=dateend%>"/><font color="#999999"> Example: 2015-01-31 (yyyy-mm-dd)</font>
             <font color="red" id="starzz"> </font></td>
          </tr>
    
    <tr id="chi7">
      <td>ModelType:</td>  
      <td>
    <input type="text" id="modeltype" name="modeltype" value="<%=modeltypeshow%>" placeholder="Example: CBF2;CBF5" size="100"/><font color="#999999"> Example: CBF2;CBF5</font></td>
      <td width="1"></td>
  </tr>
           <tr>
        <td id="samplingtext">Sampling:<font color="red" id="starl">*</font></td>
        <td id="samplings"><input type="text" id="sampling" name="sampling" value="<%=samplingshow%>" placeholder="Example: 100"/><font color="#999999">  Example: 100</font></td>
    </tr>
   
          <tr id="chi1">
        <td>MFGID:</td>
        <td><input type="text" id="mfgid" name="mfgid" value="<%=mfgidshows%>" size="100" placeholder="Example: CE2373"/> <font color="#999999"> Example: CE2373</font>
        <font color="red" id="starz">(Testcode)</font></td>
          </tr>
        <tr >
        <td id="testcodeAtext">FormalCodeA:<font color="red" id="starl2">*</font></td>
        <td id="testcodeAs"><input type="text" id="testcodeA" name="testcodeA" value="<%=testcodeAshow%>" size="100" placeholder="Example: CBFFF1JN;CBFFF1KN" /><font color="#999999"> Example: CBFFF1JN;CBFFF1KN</font></td>
    </tr>
    <tr id="chi3">
       <td>MFGID:</td>
        <td><input type="text" id="mfgid1" name="mfgid1" value="<%=mfgidshows1%>" size="100" placeholder="Example: CE2373"/> <font color="#999999"> Example: CE2373</font>
        <font color="red" >(FormalCodeA)</font></td>
          </tr>
       
            <tr id="chi4" > 
            <td>TrialID:</td>
            <td><input name="trialid3" type="text" id="trialid3" size="100" value="<%=showtrialid1%>" placeholder="Example: A497;A498"/><font color="#999999"> Example: A497;A498</font>
            <font color="red" >(FormalCodeA)</font></td>
          </tr>
      <tr id="newdate1"> 
            <td >StartDate:</td>
            <td> <input type="date" name="startdate2" id="startdate2" value="<%=stdate1%>"/><font color="#999999"> Example: 2015-01-31 (yyyy-mm-dd)
            <font color="red" >(FormalCodeA)</font></font></td>
          </tr>
          <tr id="newdate2"> 
            <td>EndDate:</td>
            <td> <input type="date" name="enddate2" id="enddate2" value="<%=enddate1%>"/><font color="#999999"> Example: 2015-01-31 (yyyy-mm-dd)</font></td>
          </tr>
     <tr >
        <td id="testcodeBtext">FormalCodeB:<font color="red" id="starl1">*</font></td>
        <td id="testcodeBs"><input type="text" id="testcodeB" name="testcodeB" value="<%=testcodeBshow%>" size="100" placeholder="Example: CBFFF1JN;CBFFF1KN" /><font color="#999999"> Example: CBFFF1JN;CBFFF1KN</font></td>
    </tr>
      <tr id="chi5">
       <td>MFGID:</td>
        <td><input type="text" id="mfgid2" name="mfgid2" value="<%=mfgidshows2%>" size="100" placeholder="Example: CE2373"/> <font color="#999999"> Example: CE2373</font>
        <font color="red" >(FormalCodeB)</font></td>
          </tr>
            <tr id="chi6" > 
            <td>TrialID:</td>
            <td><input name="trialid4" type="text" id="trialid4" size="100" value="<%=showtrialid2%>" placeholder="Example: A497;A498"/><font color="#999999"> Example: A497;A498</font>
            <font color="red" >(FormalCodeB)</font></td>
          </tr>
      <tr id="newdate3" > 
            <td >StartDate:</td>
            <td> <input type="date" name="startdate3" id="startdate3" value="<%=stdate2%>"/><font color="#999999"> Example: 2015-01-31 (yyyy-mm-dd)
            <font color="red" >(FormalCodeB)</font></font></td>
          </tr>
          <tr id="newdate4"> 
            <td>EndDate:</td>
            <td> <input type="date" name="enddate3" id="enddate3" value="<%=enddate2%>"/><font color="#999999"> Example: 2015-01-31 (yyyy-mm-dd)</font></td>
          </tr>
   

         </table>
      </fieldset> 
   

      </form> 
      </div>   
          <%@ include file="PageLayout/footerlayout.jsp" %>
</body>
</html>
