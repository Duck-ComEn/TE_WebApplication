echo on
rem ------------delete old result
del *.bin
cd StreamResult
echo Y | del *
cd ..
rem ===========set the user environment===========
set hostname=spssmdl.prb.hgst.com
set port=28052
rem ------------username is the user ID
set username= 2412655
rem ------------password is the password of clementine server(dmsrv4)
set password= 83BO9M
rem ------------log is the generated log path
set streamname=%cd%\getResult_Stream.str
rem %date:~7,2%%date:~4,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%.log
set date=%date%
set time1=%time%
set hour=%time1:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set logname= %cd%\log\%date:~10,4%%date:~4,2%%date:~7,2%.%hour%%time1:~3,2%%time1:~6,2%.log
clemb -server -hostname %hostname% -port %port%  -username %username% -password %password%  -script %cd%\script.txt -execute -log %logname%  
@echo on
echo Piyanan.K > finish.bin
exit
