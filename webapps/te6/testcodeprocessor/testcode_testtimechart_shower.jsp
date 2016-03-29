<%       

//---------Create Header-----------

String[] commonHeader = {"WeekData", "MTYPE", "PROC", "TestPgmVer", "TesterType", "ExecuteDate", "MSS"};
//for (int loop = 0; loop < commonHeader.length ; loop++){
//	commonHeader[loop] = "<td>" + commonHeader[loop] + "</td>";
//}

String[] allDriveHeader = {"All_FirstYield", "All_LatestYield", "All_sDev", "All_Count", "AllMean", "All_Min", "All_Max", "All_MeanMaxByTeser", "All_99", "All_95", "All_100"};
//for (int loop = 0; loop < allDriveHeader.length ; loop++){
//	allDriveHeader[loop] = "<td>" + allDriveHeader[loop] + "</td>";
//}

String[] passerDriveHeader = {"Passer_FirstYield", "Passer_LatestYield", "Passer_sDev", "Passer_Count", "PasserMean", "Passer_Min", "Passer_Max", "Passer_MeanMaxByTeser", "Passer_99", "Passer_95", "Passer_100"};
//for (int loop = 0; loop < passerDriveHeader.length ; loop++){
//	passerDriveHeader[loop] = "<td>" + passerDriveHeader[loop] + "</td>";
//}
		
 int colCount = 2; 
 Hashtable hastt2Group = new Hashtable<Integer,Object>(); 
 Vector mtype2 = new Vector();
 
for (int processIndex = 0; processIndex < processID.size(); processIndex++){ 
	int procID2 = (Integer)processID.get(processIndex);
	mtype2 = ttMonitor.getMtype(product,procID2);
%>
<tr>
	<td width="100%" align="left">
		<div id = "content-Process-header">Process ID <%=(Integer)processID.get(processIndex)%></div>
	</td>
</tr>	

<%
for (int entryCount = 0 ; entryCount < mtype2.size(); entryCount++){
	String mtypeName2 = (String)mtype2.get(entryCount);
	  hashTesterType.put(processID.get(processIndex), ttMonitor.getTesterType(mtypeName2, (Integer)processID.get(processIndex)));
	  Vector vtTesterType = (Vector)hashTesterType.get((Integer)processID.get(processIndex));
	  for ( int ttCount = 0 ; ttCount < vtTesterType.size(); ttCount+=colCount){
		String tester2TypeName = (String)vtTesterType.get(ttCount);
%>
		  <tr>
			<td width="100%" align="center" >
				<table width="100%" border="0">
				  <tr>
			
				  <td width="50%"> <div id="<%=(Integer)processID.get(processIndex)%>_<%=(String)mtype2.get(entryCount)%>_<%=(String)vtTesterType.get(ttCount)%>" style="width:100%; height:500px;"></div></td>
                    <% if (((ttCount+1) < vtTesterType.size())){%>
					    <td width="50%"> <div id="<%=(Integer)processID.get(processIndex)%>_<%=(String)mtype2.get(entryCount)%>_<%=(String)vtTesterType.get(ttCount+1)%>" style="width:100%; height:500px;"></div></td>
				    <%}else {%>
					    <td width="50%" align="CENTER"></td>
					<%}%>
				  </tr>
				</table>
			</td>
		   </tr>

<%
	  }
	}
	%>
<!--**************************************************
********************* Show Table *********************
************ Show Table If box is ticked. ************
***************************************************-->

<%	if(showDataTable.equals("checked")){
	%>
	<table width = "100%" border="1" cellspacing="0" border color ="#AEAEAE" align = "center">


		<div id ="content-table-header">Detail Table</div>
		
		<!-- Header Zone -->
		<tr align = "center" >
		 <%for (int loop = 0 ; loop < commonHeader.length; loop++){%>
			
			<td><U><B><%=commonHeader[loop]%></B></U></td>
		<%} if (reportByAllDrives.equals("checked")){%>
			<%for (int loop = 0 ; loop < allDriveHeader.length; loop++){%>
			<td><U><B><%=allDriveHeader[loop]%></B></U></td>
		<%}
		} else if (reportByPasserDrives.equals("checked")){%>
			<%for (int loop = 0 ; loop < passerDriveHeader.length; loop++){%>
			<td><U><B><%=passerDriveHeader[loop]%></B></U></td>
		<%}
		}	
		%>
		</tr>
	<%
for (int entryCount = 0 ; entryCount < mtype2.size(); entryCount++){
	String mtypeName2 = (String)mtype2.get(entryCount);
	  hashTesterType.put(processID.get(processIndex), ttMonitor.getTesterType(mtypeName2, (Integer)processID.get(processIndex)));
	  Vector vtTesterType = (Vector)hashTesterType.get((Integer)processID.get(processIndex));
	  for ( int ttCount = 0 ; ttCount < vtTesterType.size(); ttCount+=colCount){
		String tester2TypeName = (String)vtTesterType.get(ttCount);	
	%>

	<% Vector vt = ttMonitor.getTestTimeTrend(mtypeName2,(Integer)processID.get(processIndex),tester2TypeName,"ALL_PROD");
		if (vt.size()>0){%>

		
		<!-- DATA ZONE -->
		<% for (int vDataLoop = 0; vDataLoop < vt.size(); vDataLoop++){%>
			<tr align="center">
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getWeekDate()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getMtype()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getProc()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getTestPgmVer()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getTesterType()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getExecuteDate()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getMss()%></td>
			
			<%if (reportByAllDrives.equals("checked")){%>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_firstYield()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_lastYield()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_sDev()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_count()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_mean()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_min()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_max()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_meanMaxByTester()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_95comp()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_99comp()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_100comp()%></td>
					
			<%} else if (reportByPasserDrives.equals("checked")){%>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_firstYield()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_latestYield()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_sDev()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_count()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_mean()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_min()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_max()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_meanMaxByTester()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_95comp()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_99comp()%></td>
			<td><%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_100comp()%></td>
		<!--END OF DATA ZONE-->
		<%}
		}%>
		</tr>


	
	<%
	  }
	  }
}
	  %>
	  
</table>
<p style="border-bottom:5px double black;"</p>	
<%
	  
}
}
%>





<!--**************************************************
*******************Show Header Field******************
***************************************************-->






