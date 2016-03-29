<table width="100%" border="1"  cellspacing="0">
  
   <% Vector v = new TestTimeTool().getTestTimeTrend(product,6400); 
	  
	  if (v.size()>0){
   %>
	  <div id="content-Process-header">Detail Table</div>
	  <!-- Header zone-->
	  <tr align="center">
		<td>WW</td>
		<!--<td>Year_Of_Week</td>-->
		<td>PROC</td>
		<td>MTYPE</td>
		<td>TESTTIMEGROUP</td>
		<td>YIELDFIRST_PASS</td>
		<td>LATEST_YIELD</td>
		<td>UNITQTY</td>
		<td>FROM_END_DATE</td>
		<td>TO_END_DATE</td>
		<td>UPDATE_DATE</td>
		<td>MSS</td>
		<td>TESTCODE</td>
		<td>PLAN</td>
		<td>YIELD_BD</td>
		<td>TT_BD_95</td>
		<td>TT_BD_99</td>
		<td>TT_BD_MEAN</td>
		<td>TT_BD_MIN</td>
		<td>TT_BD_MAX</td>
		<td>TT_BD_SDEV</td>
		<td>TT_BD_COUNT</td>
		<td>TT_BD_95_PASS</td>
		<td>TT_BD_99_PASS</td>
		<td>TT_BD_MEAN_PASS</td>
		<td>TT_BD_MIN_PASS</td>
		<td>TT_BD_MAX_PASS</td>
		<td>TT_BD_SDEV_PASS</td>
		<td>TT_BD_COUNT_PASS</td>
		<td>TT_BD_TC_95</td>
		<td>TT_BD_TC_99</td>
		<td>TT_BD_TC_MEAN</td>
		<td>TT_BD_TC_MIN</td>
		<td>TT_BD_TC_MAX</td>
		<td>TT_BD_TC_STDEV</td>
		<td>TT_BD_TC_COUNT</td>
		<td>TT_BT_95</td>
		<td>TT_BT_99</td>
		<td>TT_BT_MEAN</td>
		<td>TT_BT_MIN</td>
		<td>TT_BT_MAX</td>
		<td>TT_BT_STDEV</td>
		<td>TT_BT_COUNT</td>
		<td>MSS</td>
	   </tr>
  
     <!-- Data zone--> 
     <%
	   }
	   
	 	for (int q = 0; q < v.size(); q++) {
		  %><tr align="center">
			<td><%=((Testtimemorniter)v.get(q)).getWw()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getYearOfWeek()%></td>
	    	<td><%=((Testtimemorniter)v.get(q)).getProc()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getMType()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTestTimeGroup()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getYieldFirstPass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getLatestYield()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getUnitQty()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getFromEndDate()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getToEndDate()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getUpdateDate()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getMSS()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTestCode()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getPlan()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getYieldBd()%></td>
			
			<td><%=((Testtimemorniter)v.get(q)).getTtBd95()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBd99()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdMean()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdMin()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdMax()()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdSdev()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdCount()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBd95Pass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBd99Pass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdMeanPass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdMinPass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdMaxPass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdSdevPass()%></td>			
			<td><%=((Testtimemorniter)v.get(q)).getTtBdCountPass()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTc95()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTc99()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTcMean()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTcMin()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTcMax()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTcStdev()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBdTcCount()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBt95()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBt99()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtMean()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtMin()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtMax()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtSdev()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtCount()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTc95()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTc99()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTcMean()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTcMin()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTcMax()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTcStdev()%></td>
			<td><%=((Testtimemorniter)v.get(q)).getTtBtTcCount()%></td>
			
			</tr><%
		}
	//}catch(){
			
	//}	
	%>
		
</table>

