﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>amCharts examples</title>
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="JSAX-INF/amcharts.js" type="text/javascript"></script>        
        <script type="text/javascript">
            var chartData = [{
                date: new Date(2012, 0, 1),
                distance: 227,
                duration: 408
            }, {
                date: new Date(2012, 0, 2),
                distance: 371,
                duration: 482
            }, {
                date: new Date(2012, 0, 3),
                distance: 433,
                duration: 562
            }, {
                date: new Date(2012, 0, 4),
                distance: 345,
                duration: 379
            }, {
                date: new Date(2012, 0, 5),
                distance: 480,
                duration: 501
            }, {
                date: new Date(2012, 0, 6),
                distance: 386,
                duration: 443
            }, {
                date: new Date(2012, 0, 7),
                distance: 348,
                duration: 405
            }, {
                date: new Date(2012, 0, 8),
                distance: 238,
                duration: 309
            }, {
                date: new Date(2012, 0, 9),
                distance: 218,
                duration: 287
            }, {
                date: new Date(2012, 0, 10),
                distance: 349,
                duration: 485
            }, {
                date: new Date(2012, 0, 11),
                distance: 603,
                duration: 890
            }, {
                date: new Date(2012, 0, 12),
                distance: 534,
                duration: 810
            }];
            var chart;

            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = "date";
                chart.marginTop = 0;

                // AXES
                // category axis
                var categoryAxis = chart.categoryAxis;
                categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
                categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD                
                categoryAxis.autoGridCount = false;
                categoryAxis.gridCount = 50;
                categoryAxis.gridAlpha = 0;
                categoryAxis.gridColor = "#000000";
                categoryAxis.axisColor = "#555555";
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
                // Duration value axis            
                var durationAxis = new AmCharts.ValueAxis();
                durationAxis.title = "duration";
                durationAxis.gridAlpha = 0.05;
                durationAxis.axisAlpha = 0;
                durationAxis.inside = true;
                // the following line makes this value axis to convert values to duration
                // it tells the axis what duration unit it should use. mm - minute, hh - hour...                
                durationAxis.duration = "mm";
                durationAxis.durationUnits = {
                    DD: "d. ",
                    hh: "h ",
                    mm: "min",
                    ss: ""
                };
                chart.addValueAxis(durationAxis);

                // Distance value axis 
                var distanceAxis = new AmCharts.ValueAxis();
                distanceAxis.title = "distance";
                distanceAxis.gridAlpha = 0;
                distanceAxis.position = "right";
                distanceAxis.inside = true;
                distanceAxis.unit = "mi";
                distanceAxis.axisAlpha = 0;
                chart.addValueAxis(distanceAxis);

                // GRAPHS
                // duration graph
                var durationGraph = new AmCharts.AmGraph();
                durationGraph.title = "duration";
                durationGraph.valueField = "duration";
                durationGraph.type = "line";
                durationGraph.valueAxis = durationAxis; // indicate which axis should be used
                durationGraph.lineColor = "#CC0000";
                durationGraph.balloonText = "[[value]]";
                durationGraph.lineThickness = 1;
                durationGraph.legendValueText = "[[value]]";
                durationGraph.bullet = "square";
                chart.addGraph(durationGraph);

                // distance graph
                var distanceGraph = new AmCharts.AmGraph();
                distanceGraph.valueField = "distance";
                distanceGraph.title = "distance";
                distanceGraph.type = "column";
                distanceGraph.fillAlphas = 0.1;
                distanceGraph.valueAxis = distanceAxis; // indicate which axis should be used
                distanceGraph.balloonText = "[[value]] miles";
                distanceGraph.legendValueText = "[[value]] mi";
                distanceGraph.lineColor = "#000000";
                distanceGraph.lineAlpha = 0;
                chart.addGraph(distanceGraph);

                // CURSOR                
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonDateFormat = "DD";
                chartCursor.cursorAlpha = 0;
                chart.addChartCursor(chartCursor);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                legend.bulletType = "round";
                legend.equalWidths = false;
                legend.valueWidth = 120;
                legend.color = "#000000";
                chart.addLegend(legend);

                // WRITE                                
                chart.write("chartdi1v")
            });
        </script>
    </head>
    
    <body>
        <div id="chartdi1v" style="width:100%; height:400px;"></div>
    </body>

</html>