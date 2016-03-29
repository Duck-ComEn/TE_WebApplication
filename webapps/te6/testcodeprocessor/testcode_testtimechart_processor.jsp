<script type="text/JavaScript">

<%
 // ----------------- Create Chart by Process ----------------------------------
	Hashtable hashTesterType = new Hashtable<Integer,Vector>(); 
	Vector processID ;
	Vector mtype = new Vector();
	
	//Check process No. by Product.
		if((product.equals("CBE")) || (product.equals("CBF")) || (product.equals("KCF")) ){
			//There is no Process 6600
			processID = new Vector(3, 1);
			processID.addElement(new Integer(6400));
			processID.addElement(new Integer(6800));
			processID.addElement(new Integer(9000));
		}
		else{
			//There is Process 6600
			processID = new Vector(4, 1);
			processID.addElement(new Integer(6400));
			processID.addElement(new Integer(6600));
			processID.addElement(new Integer(6800));
			processID.addElement(new Integer(9000));
		}
	%>
	<%
	for (int procIndex = 0; procIndex < processID.size(); procIndex++){
		int procID = (Integer)processID.get(procIndex);
		mtype = ttMonitor.getMtype(product,procID);
		
		for ( int mtypeLoop = 0 ; mtypeLoop < mtype.size() ; mtypeLoop++){
			String mtypeName = (String)mtype.get(mtypeLoop);
			hashTesterType.put(procID, ttMonitor.getTesterType(mtypeName, procID));
			Vector testerType = (Vector)hashTesterType.get(procID);
			for ( int ttCount = 0 ; ttCount < testerType.size(); ttCount++){
				String testerTypeName = (String)testerType.get(ttCount);
				Vector vt   = ttMonitor.getTestTimeTrend(mtypeName,procID,testerTypeName,"ALL_PROD");
%>
		    var checkManualTesterType;
			var checkAutoTesterType;
			
			<%if (testerTypeName.equals("XCALIBRE") || testerTypeName.equals("NEPTUNE") || testerTypeName.equals("SATTERN")){%>
				checkManualTesterTypeHidden = true;
				checkAutoTesterTypeHidden = false;
			<%} else {%>
				checkManualTesterTypeHidden = false;
				checkAutoTesterTypeHidden = true;
			<%
			}
			%>
			var chartData = new Array();
			<% for (int vDataLoop = 0; vDataLoop < vt.size(); vDataLoop++) {%>
			

			chartData[<%=vDataLoop%>] = {
				weekDate				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getWeekDate()%>,
				proc					: <%=((TestTimeMonitor) vt.get(vDataLoop)).getProc()%>,
				mss						: <%=((TestTimeMonitor) vt.get(vDataLoop)).getMss()%>,
				
				//<%if (reportByAllDrives.equals("checked")){%>
					all_firstYield			: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_firstYield()%>,
					all_latestYield			: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_lastYield()%>,
					all_sDev				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_sDev()%>,
					all_count				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_count()%>,
					all_min					: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_min()%>,
					all_mean				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_mean()%>,
					all_max					: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_max()%>,
					all_meanMaxByTester		: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_meanMaxByTester()%>,
					all_99comp				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_99comp()%>,
					all_95comp				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_95comp()%>,
					all_100comp				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_100comp()%>,
					all_meanMaxByTester		: <%=((TestTimeMonitor) vt.get(vDataLoop)).getAll_meanMaxByTester()%>,
				//<%} else if (reportByPasserDrives.equals("checked")){%>
					passer_firstYield		: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_firstYield()%>,
					passer_latestYield		: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_latestYield()%>,
					passer_mean				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_mean()%>,
					passer_min				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_min()%>,
					passer_max				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_max()%>,
					passer_sDev				: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_sDev()%>,
					passer_95comp			: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_95comp()%>,
					passer_99comp			: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_99comp()%>,
					passer_100comp			: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_100comp()%>,
					passer_meanMaxByTester	: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_meanMaxByTester()%>,
					passer_count			: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_count()%>,
					passer_executeDate		: <%=((TestTimeMonitor) vt.get(vDataLoop)).getExecuteDate()%>,
					passer_meanMaxByTester	: <%=((TestTimeMonitor) vt.get(vDataLoop)).getPasser_meanMaxByTester()%>,
				//<%}%>
			};
				
				
<%				

			}
			%>
			generateChart("<%=procID%>_<%=mtypeName%>_<%=testerTypeName%>",chartData,"<%=(Integer)processID.get(procIndex)%> <%=(String)mtype.get(mtypeLoop)%> <%=(String)testerType.get(ttCount)%>", checkManualTesterTypeHidden, checkAutoTesterTypeHidden);
			<%
			
			}
		}
	}
	
	
%>
</script>



