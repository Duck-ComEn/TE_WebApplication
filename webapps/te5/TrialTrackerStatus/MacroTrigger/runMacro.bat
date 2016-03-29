Dim xl
Set xl = CreateObject("Excel.Application")
xl.Workbooks.Open ("workbook.xlsx")
xl.Application.Run "MyMacro"
xl.Application.Quit
Set xl = Nothing 