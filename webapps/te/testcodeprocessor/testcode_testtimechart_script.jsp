function generateChart(chartName, chartData , chartTitle, hiddenReportMean, testTimeAxisMinimum, testTimeAxisMaximum, testTimeGridCount){
            var chart;
			var defaultHidden;
			var colorIndex = new Array("#FF0000","#00FF00","#0000FF","#FAB800","#00B3FF","#EF00FF","#337F00","#A804C5");
			var i = 0;
			
            AmCharts.ready( function testTimeChart() {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = "weekDate";
				chart.addTitle(chartTitle, 15);

                // AXES
                // category axis
                var categoryAxis = chart.categoryAxis;
                //categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true

				//categoryAxis.gridPosition = "middle";  // Possible values are: "start" and "middle"
				categoryAxis.inside = false;              
                categoryAxis.autoGridCount = false;
				categoryAxis.startOnAxis = false;
                categoryAxis.gridCount = 50;
                categoryAxis.gridAlpha = 0.1;
                categoryAxis.gridColor = "#333333";
                categoryAxis.axisColor = "#555555";
				categoryAxis.title = "Week No."
				categoryAxis.addValueAxis = "50";
				categoryAxis.labelRotation = 90; // Show WeekData in Vertical side.
                // we want custom date formatting, so we change it in next line
                categoryAxis.dateFormats = [{
                    period: 'DD',
                    format: 'DD'
                }, {
                    period: 'WW',
                    format: 'MMM DD'
                }, {
                    period: 'MM',
                    format: 'MMM'
                }, {
                    period: 'YYYY',
                    format: 'YYYY'
                }];
			   
                // as we have data of different units, we create two different value axes
                // test time value axis            
                var testTimeAxis = new AmCharts.ValueAxis();
                testTimeAxis.title = "Test Time (hrs)"; // Y left axis title
                testTimeAxis.gridAlpha = 0.1;
                testTimeAxis.axisAlpha = 1;
				testTimeAxis.labelFrequency = 2;
				testTimeAxis.autoGridCount = false;
				testTimeAxis.gridCount = testTimeGridCount;
				testTimeAxis.minimum = testTimeAxisMinimum;
				testTimeAxis.maximum = testTimeAxisMaximum;
				testTimeAxis.gridColor = "#333333";
                testTimeAxis.axisColor = "#555555";
                testTimeAxis.inside = false;              
                chart.addValueAxis(testTimeAxis);
				
				// Check If Manual Tester Type: Hidden "Batch" = false; and Hidden "Mean" = true;
				 //  else if !(Manual Type): Hidden "Batch = True; and"
				
		        <%if (yaxisYield.equals("checked")){%>
					// Unit count value axis 
					var unitCount = new AmCharts.ValueAxis();
					unitCount.title = "First Pass Yield"; // Y right axis title
					unitCount.titleRotation = 0;
					unitCount.gridAlpha = 0;
					unitCount.position = "right";
					unitCount.inside = false;
					unitCount.unit = "%";
					unitCount.axisAlpha = 0;
					chart.addValueAxis(unitCount);
					
				<%}else if (yaxisQty.equals("checked")){%>				
				
					// Unit count value axis 
					var unitCount = new AmCharts.ValueAxis();
					unitCount.title = "QTY"; // Y right axis title
					unitCount.titleRotation = 0;
					unitCount.gridAlpha = 0;
					unitCount.position = "right";
					unitCount.inside = false;
					unitCount.unit = "unit";
					unitCount.axisAlpha = 0;
					chart.addValueAxis(unitCount);
								
				<%}else if (yaxisLatestYield.equals ("checked")){%>
					//Unit count value axis
					var unitCount = new AmCharts.ValueAxis();
					unitCount.title = "Latest Yield"; // Y right axis title
					unitCount.titleRotation = 0;
					unitCount.gridAlpha = 0;
					unitCount.position = "right";
					unitCount.inside = false;
					unitCount.unit = "%";
					unitCount.axisAlpha = 0 ;
					chart.addValueAxis(unitCount);
				<%}%>
				
				
				
				/************************
				*** All Drive  report ***
				*************************
				************************/
				<%if (reportByAllDrives.equals("checked")){%>
					// GRAPHS
					// 95% test time graph
					var tt95UnitGraph = new AmCharts.AmGraph();
					tt95UnitGraph.title = "All_95";
					tt95UnitGraph.valueField = "all_95comp";
					tt95UnitGraph.type = "line";
					tt95UnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					tt95UnitGraph.lineColor = colorIndex[i++] //#20B2AA;
					tt95UnitGraph.balloonText = "[[value]]";
					tt95UnitGraph.lineThickness = 1;
					tt95UnitGraph.legendValueText = "[[value]]";
					tt95UnitGraph.bullet = "square";
					tt95UnitGraph.hidden = true;
					chart.addGraph(tt95UnitGraph);
					
					
					// 99% test time graph
					var tt99UnitGraph = new AmCharts.AmGraph();
					tt99UnitGraph.title = "All_99";
					tt99UnitGraph.valueField = "all_99comp";
					tt99UnitGraph.type = "line";
					tt99UnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					tt99UnitGraph.lineColor =   colorIndex[i++]; //"#20B2AA";
					tt99UnitGraph.balloonText = "[[value]]";
					tt99UnitGraph.lineThickness = 1;
					tt99UnitGraph.legendValueText = "[[value]]";
					tt99UnitGraph.bullet = "square";
					tt99UnitGraph.hidden = true;
					chart.addGraph(tt99UnitGraph);
					

					// Mean_Unit test time graph
					var ttMeanUnitGraph = new AmCharts.AmGraph();
					ttMeanUnitGraph.title = "AllMean";
					ttMeanUnitGraph.valueField = "all_mean";
					ttMeanUnitGraph.type = "line";
					ttMeanUnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMeanUnitGraph.lineColor = colorIndex[i++]; //"#20B2AA";
					ttMeanUnitGraph.balloonText = "[[value]]";
					ttMeanUnitGraph.lineThickness = 1;
					ttMeanUnitGraph.legendValueText = "[[value]]";
					ttMeanUnitGraph.bullet = "square";
					ttMeanUnitGraph.hidden = hiddenReportMean;
					chart.addGraph(ttMeanUnitGraph);
					

					



					// Min_Unit test time graph
					var ttMinUnitGraph = new AmCharts.AmGraph();
					ttMinUnitGraph.title = "All_Min";
					ttMinUnitGraph.valueField = "all_min";
					ttMinUnitGraph.type = "line";
					ttMinUnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMinUnitGraph.lineColor = colorIndex[i++]; //"#20B2AA";
					ttMinUnitGraph.balloonText = "[[value]]";
					ttMinUnitGraph.lineThickness = 1;
					ttMinUnitGraph.legendValueText = "[[value]]";
					ttMinUnitGraph.bullet = "square";
					ttMinUnitGraph.hidden = true;
					chart.addGraph(ttMinUnitGraph);
					
					// Max_Unit test time graph
					var ttMaxUnitGraph = new AmCharts.AmGraph();
					ttMaxUnitGraph.title = "All_Max";
					ttMaxUnitGraph.valueField = "all_max";
					ttMaxUnitGraph.type = "line";
					ttMaxUnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMaxUnitGraph.lineColor = colorIndex[i++]; //"#20B2AA";
					ttMaxUnitGraph.balloonText = "[[value]]";
					ttMaxUnitGraph.lineThickness = 1;
					ttMaxUnitGraph.legendValueText = "[[value]]";
					ttMaxUnitGraph.bullet = "square";
					ttMaxUnitGraph.hidden = true;
					chart.addGraph(ttMaxUnitGraph);
					
					// Sdev_Unit test time graph
					var ttSdevUnitGraph = new AmCharts.AmGraph();
					ttSdevUnitGraph.title = "All_sDev";
					ttSdevUnitGraph.valueField = "all_sDev";
					ttSdevUnitGraph.type = "line";
					ttSdevUnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttSdevUnitGraph.lineColor = colorIndex[i++]; //"#20B2AA";
					ttSdevUnitGraph.balloonText = "[[value]]";
					ttSdevUnitGraph.lineThickness = 1;
					ttSdevUnitGraph.legendValueText = "[[value]]";
					ttSdevUnitGraph.bullet = "square";
					ttSdevUnitGraph.hidden = true;
					chart.addGraph(ttSdevUnitGraph);

					// MeanMax test time graph
					var ttMeanMaxUnitGraph = new AmCharts.AmGraph();
					ttMeanMaxUnitGraph.title = "All_Batch";
					ttMeanMaxUnitGraph.valueField = "all_meanMaxByTester";
					ttMeanMaxUnitGraph.type = "line";
					ttMeanMaxUnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMeanMaxUnitGraph.lineColor = colorIndex[i++]; //"#20B2AA";
					ttMeanMaxUnitGraph.balloonText = "[[value]]";
					ttMeanMaxUnitGraph.lineThickness = 1;
					ttMeanMaxUnitGraph.legendValueText = "[[value]]";
					ttMeanMaxUnitGraph.bullet = "square";
					ttMeanMaxUnitGraph.hidden = !hiddenReportMean;
					chart.addGraph(ttMeanMaxUnitGraph);
					
					
					
				<%if (yaxisQty.equals("checked")){%>
					//report QTY
					var qtyCountGraph = new AmCharts.AmGraph();
					qtyCountGraph.title = "QTY";
					qtyCountGraph.valueField = "all_count";
					qtyCountGraph.type = "column"; // type: "line", "column", "step", "smoothedLine", "candlestick", "ohlc"
					qtyCountGraph.fillAlphas = 0.5;
					qtyCountGraph.valueAxis = unitCount; // indicate which axis should be used
					qtyCountGraph.balloonText = "[[value]]";
					qtyCountGraph.legendValueText = "[[value]]";
					qtyCountGraph.lineColor = "#000000";
					qtyCountGraph.lineAlpha = 0;
					chart.addGraph(qtyCountGraph);
				<%}else if (yaxisYield.equals("checked")){%>
					//report First Yield
					var allFirstYieldGraph = new AmCharts.AmGraph();
					allFirstYieldGraph.title = "All_FirstYield";
					allFirstYieldGraph.valueField = "all_firstYield";
					allFirstYieldGraph.type = "column";
					allFirstYieldGraph.fillAlphas = 0.5;
					allFirstYieldGraph.valueAxis = unitCount; // indicate which axis should be used
					allFirstYieldGraph.balloonText = "[[value]]%";
					allFirstYieldGraph.legendValueText = "[[value]]%";
					allFirstYieldGraph.lineColor = "#000000";
					allFirstYieldGraph.lineAlpha = 0;
					chart.addGraph(allFirstYieldGraph);
				<%}else if (yaxisLatestYield.equals("checked")){%>
					//report Lastest Yield
					var allLatestYieldGraph = new AmCharts.AmGraph();
					allLatestYieldGraph.title = "All LatestYield";
					allLatestYieldGraph.valueField = "all_latestYield";
					allLatestYieldGraph.type = "column";
					allLatestYieldGraph.fillAlphas = 0.5;
					allLatestYieldGraph.valueAxis = unitCount; // indicate which axis should be used
					allLatestYieldGraph.balloonText = "[[value]]%";
					allLatestYieldGraph.legendValueText = "[[value]]%";
					allLatestYieldGraph.lineColor = "#000000";
					allLatestYieldGraph.lineAlpha = 0;
					chart.addGraph(allLatestYieldGraph);
				<%}%>				
				
				//--- End Of Report By All Drive
				
				/************************
				*** START Passer Drive  report ***
				*************************
				************************/
				<%} else if (reportByPasserDrives.equals("checked")){%>
				
					// 95%_pass test time graph
					var tt95PasserGraph = new AmCharts.AmGraph();
					tt95PasserGraph.title = "Passer_95";
					tt95PasserGraph.valueField = "passer_95comp";
					tt95PasserGraph.type = "line";
					tt95PasserGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					tt95PasserGraph.lineColor = colorIndex[i++];
					tt95PasserGraph.balloonText = "[[value]]";
					tt95PasserGraph.lineThickness = 1;
					tt95PasserGraph.legendValueText = "[[value]]";
					tt95PasserGraph.bullet = "square";
					tt95PasserGraph.hidden = true;
					chart.addGraph(tt95PasserGraph);
					
					// 99%_pass test time graph
					var tt99PasserGraph = new AmCharts.AmGraph();
					tt99PasserGraph.title = "Passer_99";
					tt99PasserGraph.valueField = "passer_99comp";
					tt99PasserGraph.type = "line";
					tt99PasserGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					tt99PasserGraph.lineColor = colorIndex[i++];
					tt99PasserGraph.balloonText = "[[value]]";
					tt99PasserGraph.lineThickness = 1;
					tt99PasserGraph.legendValueText = "[[value]]";
					tt99PasserGraph.bullet = "square";
					tt99PasserGraph.hidden = true;
					chart.addGraph(tt99PasserGraph);
					
					// Mean_passer test time graph
					var ttMeanPasserGraph = new AmCharts.AmGraph();
					ttMeanPasserGraph.title = "Passer_Mean";
					ttMeanPasserGraph.valueField = "passer_mean";
					ttMeanPasserGraph.type = "line";
					ttMeanPasserGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMeanPasserGraph.lineColor = colorIndex[i++];
					ttMeanPasserGraph.balloonText = "[[value]]";
					ttMeanPasserGraph.lineThickness = 1;
					ttMeanPasserGraph.legendValueText = "[[value]]";
					ttMeanPasserGraph.bullet = "square";
					ttMeanPasserGraph.hidden = hiddenReportMean;
					chart.addGraph(ttMeanPasserGraph);
					
					// Min_passer test time graph
					var ttMinPasserGraph = new AmCharts.AmGraph();
					ttMinPasserGraph.title = "Passer_Min";
					ttMinPasserGraph.valueField = "passer_min";
					ttMinPasserGraph.type = "line";
					ttMinPasserGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMinPasserGraph.lineColor = colorIndex[i++];//"#006400";
					ttMinPasserGraph.balloonText = "[[value]]";
					ttMinPasserGraph.lineThickness = 1;
					ttMinPasserGraph.legendValueText = "[[value]]";
					ttMinPasserGraph.bullet = "square";
					ttMinPasserGraph.hidden = true;
					chart.addGraph(ttMinPasserGraph);
					
					// Max_passer test time graph
					var ttMaxPasserGraph = new AmCharts.AmGraph();
					ttMaxPasserGraph.title = "Passer_Max";
					ttMaxPasserGraph.valueField = "passer_max";
					ttMaxPasserGraph.type = "line";
					ttMaxPasserGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMaxPasserGraph.lineColor = colorIndex[i++];//"#006400";
					ttMaxPasserGraph.balloonText = "[[value]]";
					ttMaxPasserGraph.lineThickness = 1;
					ttMaxPasserGraph.legendValueText = "[[value]]";
					ttMaxPasserGraph.bullet = "square";
					ttMaxPasserGraph.hidden = true;
					chart.addGraph(ttMaxPasserGraph);

					// Sdev_passer test time graph
					var ttSdevPasserGraph = new AmCharts.AmGraph();
					ttSdevPasserGraph.title = "Passer_sDev";
					ttSdevPasserGraph.valueField = "passer_sDev";
					ttSdevPasserGraph.type = "line";
					ttSdevPasserGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttSdevPasserGraph.lineColor = colorIndex[i++];//"#006400";
					ttSdevPasserGraph.balloonText = "[[value]]";
					ttSdevPasserGraph.lineThickness = 1;
					ttSdevPasserGraph.legendValueText = "[[value]]";
					ttSdevPasserGraph.bullet = "square";
					ttSdevPasserGraph.hidden = true;
					chart.addGraph(ttSdevPasserGraph);
					
					// MeanMax test time graph
					var ttMeanMaxUnitGraph = new AmCharts.AmGraph();
					ttMeanMaxUnitGraph.title = "Passer_Batch";
					ttMeanMaxUnitGraph.valueField = "passer_meanMaxByTester";
					ttMeanMaxUnitGraph.type = "line";
					ttMeanMaxUnitGraph.valueAxis = testTimeAxis; // indicate which axis should be used
					ttMeanMaxUnitGraph.lineColor = colorIndex[i++]; //"#20B2AA";
					ttMeanMaxUnitGraph.balloonText = "[[value]]";
					ttMeanMaxUnitGraph.lineThickness = 1;
					ttMeanMaxUnitGraph.legendValueText = "[[value]]";
					ttMeanMaxUnitGraph.bullet = "square";
					ttMeanMaxUnitGraph.hidden = !hiddenReportMean;
					chart.addGraph(ttMeanMaxUnitGraph);
					
					
					<%if (yaxisQty.equals("checked")){%>

					//report QTY
					var qtyCountGraph = new AmCharts.AmGraph();
					qtyCountGraph.title = "QTY";
					qtyCountGraph.valueField = "passer_count";
					qtyCountGraph.type = "column";
					qtyCountGraph.fillAlphas = 0.5;
					qtyCountGraph.valueAxis = unitCount; // indicate which axis should be used
					qtyCountGraph.balloonText = "[[value]]";
					qtyCountGraph.legendValueText = "[[value]]";
					qtyCountGraph.lineColor = "#000000";
					qtyCountGraph.lineAlpha = 0;
					chart.addGraph(qtyCountGraph);
				<%}else if (yaxisYield.equals("checked")){%>
					//report First Yield
					var passerFirstYieldGraph = new AmCharts.AmGraph();
					passerFirstYieldGraph.title = "Passer_FirstYield";
					passerFirstYieldGraph.valueField = "passer_firstYield";
					passerFirstYieldGraph.type = "column";
					passerFirstYieldGraph.fillAlphas = 0.5;
					passerFirstYieldGraph.valueAxis = unitCount; // indicate which axis should be used
					passerFirstYieldGraph.balloonText = "[[value]]%";
					passerFirstYieldGraph.legendValueText = "[[value]]%";
					passerFirstYieldGraph.lineColor = "#000000";
					passerFirstYieldGraph.lineAlpha = 0;
					chart.addGraph(passerFirstYieldGraph);
				<%}else if (yaxisLatestYield.equals("checked")){%>
					//report Lastest Yield
					var passerLatestYieldGraph = new AmCharts.AmGraph();
					passerLatestYieldGraph.title = "Passer LatestYield";
					passerLatestYieldGraph.valueField = "passer_latestYield";
					passerLatestYieldGraph.type = "column";
					passerLatestYieldGraph.fillAlphas = 0.5;
					passerLatestYieldGraph.valueAxis = unitCount; // indicate which axis should be used
					passerLatestYieldGraph.balloonText = "[[value]]%";
					passerLatestYieldGraph.legendValueText = "[[value]]%";
					passerLatestYieldGraph.lineColor = "#000000";
					passerLatestYieldGraph.lineAlpha = 0;
					chart.addGraph(passerLatestYieldGraph);
				<%}%>	
					
				<%}%>
				//End Of Report By Passer Drive

				// MSS test time graph
                var mssTestTimeGraph = new AmCharts.AmGraph();
                mssTestTimeGraph.title = "MSS TestTime";
                mssTestTimeGraph.valueField = "mss";
                mssTestTimeGraph.type = "line";
                mssTestTimeGraph.valueAxis = testTimeAxis; // indicate which axis should be used
                mssTestTimeGraph.lineColor = colorIndex[i++];
                mssTestTimeGraph.balloonText = "[[value]]";
                mssTestTimeGraph.lineThickness = 1;
                mssTestTimeGraph.legendValueText = "[[value]]";
                mssTestTimeGraph.bullet = "bubble";
				mssTestTimeGraph.hidden = false;
                chart.addGraph(mssTestTimeGraph);

				/************************************************************  
				*** Check Report QTY or First Pass Yield or Lastest Yield
				*** Seperate by All or Passer Yield
				*************************************************************/
		        
				
                // CURSOR                
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonDateFormat = "DD";
                chartCursor.cursorAlpha = 0;
                chart.addChartCursor(chartCursor);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                legend.bulletType = "square";
                legend.equalWidths = true;
				legend.valueWidth = 50;
				legend.textClickEnabled = true;
                legend.color = "#000000";
                chart.addLegend(legend);

                // WRITE                                
                chart.write(chartName);
				});       
     
}	