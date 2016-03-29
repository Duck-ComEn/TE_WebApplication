echo off
rem set the user environment===========
set hostname=dmsrv4.prb.hgst.com
set port=28046

rem ------------username is the user ID
set username= 2412655

rem ------------password is the password of clementine server(dmsrv4)
set password= 83BO9M

echo on	

rem ------------log is the generated log path
set log=<DMLOG>
set script=<DMSCRIPT>
rem excute the stream/script===========

echo on


clemb -server -hostname %hostname% -port %port% -username %username% -password %password% -script %script% -execute  -log %log%
@echo off
exit