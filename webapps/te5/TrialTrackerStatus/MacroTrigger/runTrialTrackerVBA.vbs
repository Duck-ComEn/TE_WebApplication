Dim xl
Set xl = CreateObject("Excel.Application")
xl.Workbooks.Open ("C:\Tomcat_9.0\webapps\te5\TrialTrackerStatus\TrialTracker_V.1.3.xlsm")
xl.Application.Run "manualRun"
xl.Application.Quit
Set xl = Nothing 